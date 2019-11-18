using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Management;
using System.Threading;



namespace DataLoding
{

    public  class DataLoadingByExcel
    {
        static string excelFilePath;
              
        static Microsoft.Office.Interop.Excel.Application excelApp;
        static Microsoft.Office.Interop.Excel.Workbook workbook;
        static Microsoft.Office.Interop.Excel.Worksheet worksheet;
        static Microsoft.Office.Interop.Excel.Range rangeSelection;
        static List<LoadingManager> Lm;
        static List<Query> Queries;
        static double MD = 0;
        public static void CreateDataLoading(string DL_path)
        {           

            excelFilePath = DL_path + @"RegressionDataLoading.xlsx";
            try
            {
                Queries = new List<Query>();
                excelApp = new Microsoft.Office.Interop.Excel.Application();
                workbook = excelApp.Workbooks.Open(excelFilePath, ReadOnly: true);
            }
            catch (Exception e)
            {
                return;
            }
                DataLoadingManager();
                foreach (var item in Lm)
                {
                   //Console.WriteLine(item.TableName);
                    List<Query> newQuery = DomainQuery(item);
                    if (newQuery!=null)
                        Queries.AddRange(newQuery);  
                }
                string[] filesDataLoading = Directory.GetFiles(DL_path, @"*.sql");
                foreach (var item in filesDataLoading)
                {
                    if (item.IndexOf("DataLoadingPhase") > -1)
                    {
                        File.Delete(item);
                    }

                }   
                var phases = Queries.Select(x => x.Phase).GroupBy(x => x).ToArray();                                        
                foreach (var item in phases)                                        
                {

                    System.IO.StreamWriter file = new System.IO.StreamWriter(DL_path + string.Format("DataLoadingPhase{0}.SQL", item.Key));
                    StringBuilder str = new StringBuilder();
                    var queriesByPhase = Queries.Where(x => x.Phase == item.Key).ToArray();
                    str.AppendLine("USE dbmClinicalAnalyticsGateway ");
                    str.AppendLine("SET QUOTED_IDENTIFIER ON");
                    foreach (var queryForBuild in queriesByPhase)
                    {
                        str.Append(" \n" + queryForBuild.Query_Text);

                    } 
                    file.Write(str);
                    file.Close();
                }

                GC.Collect();
                GC.WaitForPendingFinalizers();
                if (excelApp != null)
                {
                    excelApp.Quit();
                    int hWnd = excelApp.Application.Hwnd;
                    uint processID; GetWindowThreadProcessId((IntPtr)hWnd, out processID);
                    Process[] procs = Process.GetProcessesByName("EXCEL");
                    foreach (Process p in procs)
                    {
                        if (p.Id == processID)

                            p.Kill();
                    }
                    Marshal.FinalReleaseComObject(excelApp);
                }                
          
        }
        [DllImport("user32.dll")]
        private static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);
        static void DataLoadingManager() 
       {
           worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Worksheets["DataLoadingParams"];
           Microsoft.Office.Interop.Excel.Range rangeSelection = worksheet.UsedRange;
        Lm=new List<LoadingManager>();
           string[] ArrayInsert = new string[rangeSelection.Rows.Count];

           
           
           bool isFirst=true;
           foreach (Microsoft.Office.Interop.Excel.Range item in rangeSelection.Rows)
           {
               if (!isFirst)
               {
                   var p1 = (Microsoft.Office.Interop.Excel.Range)item.Cells[1, 1];
                   var p2 = (Microsoft.Office.Interop.Excel.Range)item.Cells[1, 2];
                   var p3 = (Microsoft.Office.Interop.Excel.Range)item.Cells[1, 3];
                   var p4 = (Microsoft.Office.Interop.Excel.Range)item.Cells[1, 4];
                   Lm.Add(new LoadingManager(p1.Value, p2.Value, p3.Value, p4.Value));
               }
               isFirst = false;
           }
       }

        static List<Query> DomainQuery(LoadingManager LM_item)
        {
            try
            {
                string ColumnsInsert = null;

                worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Worksheets[LM_item.ExcelSheetName];
                rangeSelection = worksheet.UsedRange;

                string Phase = null;
                string Desc = null;
                string q = null;
                ColumnsInsert = "(";
                List<Query> Queries = new List<Query>();
                List<Query> Queries_by_Phases = new List<Query>();
                //object[,] values = (object[,])rangeSelection.Value;
                object[,] values = (object[,])rangeSelection.get_Value();
                if (values == null)
                    return null;
                int maxC = values.GetLength(1);
                for (int c = 3; c <= maxC; c++)
                {
                    if (c > 3)
                    {
                        ColumnsInsert += ',';
                    }
                    ColumnsInsert += values[1, c];
                }
                ColumnsInsert += ")";
                int maxR = values.GetLength(0);
                for (int r = 2; r <= maxR; r++)
                {
                    if (values[r, 1] != null) { Phase = values[r, 1].ToString(); }

                    for (int c = 3; c <= maxC; c++)
                    {
                        if (values[r, c] != null)
                        {
                            if (c > 3)
                            {
                                q += ',';
                                q += values[r, c].ToString().Trim();
                            }
                            else
                                q = "(" + values[r, c].ToString().Trim();
                        }
                    }
                    if (q != null)
                    {
                        q += ")";
                        Queries.Add(new Query(LM_item.ExcelSheetName, q, Desc, Phase));
                    }
                    q = null;
                    Desc = null;
                    Phase = null;
                }

                var phases = Queries.Select(x => x.Phase).GroupBy(x => x).ToArray();
                foreach (var item in phases)
                {
                    var c = Queries.Where(x => x.Phase == item.Key).ToArray();
                    string Query_P = null;
                    foreach (var q1 in c)
                    {
                        if (Query_P != null)
                            Query_P += (',' + q1.Query_Text);
                        else
                            Query_P = q1.Query_Text;

                    }
                    Queries_by_Phases.Add(new Query(LM_item.ExcelSheetName, LM_item.InnitCommand + " insert Into " + LM_item.TableName + ColumnsInsert + " Values " + Query_P + " " + LM_item.FinalCommand, null, item.Key));
                }

                return Queries_by_Phases;
            }
            catch
            {
                return null;
            }
         }        
    }
}
