using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;
using System.Linq;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace ManageTestsReg
{
    public class testItems
    {

        public List<testItem> Items;
        private List<string> TI;
        bool toStop;
        int id_out;
        public testItems()
            
        {
            Items = new List<testItem>();            
            
        }
        [DllImport("user32.dll")]
        private static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);
        public void excel_init()
        {
            string excelFilePath = Properties.Settings.Default.pathPHA + "testItems.xlsx";
            Microsoft.Office.Interop.Excel.Workbook workbook;
            Microsoft.Office.Interop.Excel.Application excelApp;
            try
            {
                excelApp = new Microsoft.Office.Interop.Excel.Application();
                workbook = excelApp.Workbooks.Open(excelFilePath, ReadOnly: true);
            }
            catch (Exception e)
            {
                return;
            }
            List<string> yourList = new List<string>();
            Microsoft.Office.Interop.Excel.Worksheet worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Worksheets[1];
            Microsoft.Office.Interop.Excel.Range rangeSelection = worksheet.UsedRange;
            object[,] values = (object[,])rangeSelection.get_Value();
            int maxR = values.GetLength(0);
            int maxc = 9;
            for (int i = 2; i <= maxR; i++)
            {
                TI = new List<string>();
                for (int c = 1; c < maxc; c++)
                {
                    if (values[i, c] != null)
                        TI.Add(values[i, c].ToString());
                    else
                        TI.Add(null);
                }
                Items.Add(new testItem(TI[0], TI[1], TI[2], TI[3], TI[4], TI[5], TI[6], TI[7]));
            }
            //foreach (Microsoft.Office.Interop.Excel.Range row in rangeSelection.Rows)
            //{
            //    toStop = false;
            //    TI = new List<string>();
                
            //    for (int i = 1; i < 9; i++)
            //    {
            //    Microsoft.Office.Interop.Excel.Range cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, i];
            //    if (cell.Row > 1)
            //    {
            //        if (i==1 && cell.Value2 == null)
            //        {
            //            toStop = true;
            //            break;
            //        }
            //        var p = cell.Value2;
            //        string str_p = null;
            //        if (p!=null)
            //        str_p = string.Format("{0}", p);

            //        TI.Add(str_p);
            //    }
            //    }
            //    if (toStop == true) { break; }
            //    if (TI.Count!=0)
            //    {
            //        bool isParse=false;                    
            //        isParse = int.TryParse(TI[0], out id_out);
            //        if(isParse)
            //            Items.Add(new testItem(id_out.ToString(), TI[1], TI[2], TI[3], TI[4], TI[5], TI[6], TI[7]));
            //    }
            //}
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
        

    }
}
