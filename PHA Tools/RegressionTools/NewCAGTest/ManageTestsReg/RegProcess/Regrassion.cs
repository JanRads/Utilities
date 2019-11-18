using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ManageTestsReg;
using DALL;
using System.Data;
using System.IO;
using System.Drawing;
using System.Windows.Forms;

namespace RegProcess
{

    public class Regrassion
    {
        public delegate void dalUpdateTests(object o , testItem e);
        public event dalUpdateTests UpdateView;

        List<testItems> regTestsList;
        string server;
        string path;
        
        protected virtual void onChangeView(object o,testItem e)
        {
            if (UpdateView != null)
                UpdateView(o,e);
        }

        public Regrassion(string Server, List<testItems> list, string Path)
        {            
            regTestsList = list;
            server = Server;
            path = Path;
        }

        public void start ()
        {            
            if(regTestsList.Count>0)
            {
                foreach (var tests in regTestsList)
                {
                    
                    foreach (var item in tests.Items)
                    {
                        switch (item.tag)
                        {
                            case "Setup":
                                item.startTime = DateTime.Now;
                                setup(item);
                                item.EndTime = DateTime.Now;
                                onChangeView(this, item);
                                break;
                            case "Test":
                                item.startTime = DateTime.Now;
                                Test(item);
                                item.EndTime = DateTime.Now;
                                break;
                            default:
                                item.startTime = DateTime.Now;
                                item.EndTime = DateTime.Now;
                                break;
                        }
                    }
                }
            }
        }

        public string cleanStreamReader(StreamReader fileQ)
        {
            string query="";
            string line =null ;
            while ( (line=fileQ.ReadLine()) !=null)
            {
                int rid = line.IndexOf("--");
                if (line.IndexOf("--") > -1)
                    line = line.Substring(0, line.IndexOf("--")) + " ";

                    //line = line.Replace("GO ", " ");
                    //line = line.Replace("Go ", " ");
                    //line = line.Replace("go ", " ");
                    line = line.Replace("N'", "'");
                    line = line.Replace("'$(OlapServer)'", "@@SERVERNAME");
                    query += " " + line;
            }

            return query;
        }
        public async Task Test(testItem test)
        {
            dbConn conn=null;
            string ActualQuery=null;
            string ExcpectedQuery = null;
            
            try
            {
                if (File.Exists(path + test.script_Actual))
                {
                    string pathActual = path + test.script_Actual;
                    string pathExpected = path  + test.script_Expected;
                    conn = new dbConn(server, "dbmSemanticAnalytics");
                    StreamReader fileA = new StreamReader(pathActual);
                    ActualQuery = cleanStreamReader(fileA);
                    fileA.Close();
                    //ActualQuery = ActualQuery.Replace(@"/n", " ");
                    //ActualQuery = ActualQuery.Replace("GO", " ");
                    var acA = await conn.Read(ActualQuery);
                    test.Actual_DT = acA.test;
                    test.MessageErrorActual = acA.message;  

                    if (test.type=="Dynamic")
                    {
                        StreamReader fileE = new StreamReader(pathExpected);
                        ExcpectedQuery = cleanStreamReader(fileE);
                        fileE.Close();
                        //ExcpectedQuery = ExcpectedQuery.Replace(@"/n", " ");
                        //ExcpectedQuery = ExcpectedQuery.Replace("GO", " ");
                        var acE = await conn.Read(ExcpectedQuery);
                        test.Expected_DT = acE.test;
                        test.MessageErrorExpected = acA.message; 
                    }
                    else
                    {
                        //StreamReader csvFile = new StreamReader(path + @"expected\" + test.Items[0].name_Expected);
                        test.Expected_DT = new DataTable();
                        string[] columns = null;
                        
                        var lines = File.ReadAllLines(path + @"\..\expected\" + test.script_Expected);
                        
                        if (lines.Count() > 0)
                        {
                            columns = lines[0].Split(new char[] { ',' });

                            foreach (var column in columns)
                                test.Expected_DT.Columns.Add(column);
                        }
                        for (int i = 1; i < lines.Count(); i++)
                        {
                            DataRow dr = test.Expected_DT.NewRow();
                            string[] values = lines[i].Split(new char[] { ',' });

                            for (int j = 0; j < values.Count() && j < columns.Count(); j++)
                                dr[j] = values[j];

                            test.Expected_DT.Rows.Add(dr);
                        }
                        
                    }
                   
                    //test.ResultCompare = ct.getDifferentRecords(test.Actual_DT, test.Expected_DT);
                    Compare(test);
                    
                }
            }
            catch
            {
                test.staus = 0;
            }
        }
        public async Task setup(testItem test)
        {
            
            try
            {
                if (File.Exists(path  + test.script_Actual))
                {
                    string query = path + test.script_Actual;
                    dbConn con;
                    if (File.Exists(query))
                    {
                        con = new dbConn(server, "dbmSemanticAnalytics");
                        StreamReader fileText = new StreamReader(query);
                        query = cleanStreamReader(fileText);
                        var acS = await con.Read(query);
                        DataTable dtbl = acS.test;
                        test.MessageErrorActual = acS.message; 
                        if (dtbl != null)
                            test.staus = 1;
                    }
                }
            }

            catch
            {
                test.staus = 0;
            }
        }
        public void Compare(testItem test)
        {
            int status = -5;
            int maxR= test.Actual_DT.Rows.Count>test.Expected_DT.Rows.Count?test.Actual_DT.Rows.Count:test.Expected_DT.Rows.Count;
            int maxC= test.Actual_DT.Columns.Count>test.Expected_DT.Columns.Count?test.Actual_DT.Columns.Count:test.Expected_DT.Columns.Count;
            test.ResultCompare = new DataTable();
            for (int i = 0; i < maxC; i++)
            {
                test.ResultCompare.Columns.Add("Column " + i.ToString());
            }
            for (int r = 0; r <maxR; r++)
            {
                DataRow dr = test.ResultCompare.NewRow();
                for (int c = 0; c < maxC; c++)
                {
                    try
                    {
                        if (test.Actual_DT.Rows.Count > r && test.Expected_DT.Rows.Count > r
                            && test.Actual_DT.Columns.Count > c && test.Expected_DT.Columns.Count > c)
                        {
                            var str1 = test.Actual_DT.Rows[r][c].ToString();
                            var str2 = test.Expected_DT.Rows[r][c].ToString();
                            if (str1.ToLower() != str2.ToLower())
                            {
                                float t1Num, t2Num;
                                
                                bool t1_isNumeric = float.TryParse(test.Actual_DT.Rows[r][c].ToString(), out t1Num);
                                bool t2_isNumeric = float.TryParse(test.Expected_DT.Rows[r][c].ToString(), out t2Num);
                                if (t1_isNumeric && t2_isNumeric)
                                {
                                    if (str1.IndexOf(".") > -1)
                                    {
                                        var ind = str1.IndexOf(".");
                                        var f = str1.Substring(0, ind);
                                        var l= (str1.Length - (ind + 1) >= 4) ? 4 : (str1.Length - (ind + 1))<=0?0:str1.Length - (ind + 1);
                                        var s = str1.Substring(ind + 1, l);
                                        str1 = f  + "." + s;
                                    }
                                    if (str2.IndexOf(".") > -1)
                                    {
                                        var ind = str2.IndexOf(".");
                                        var f = str2.Substring(0, ind);
                                        var l = (str2.Length - (ind + 1) >= 4) ? 4 : (str2.Length - (ind + 1)) <= 0 ? 0 : str2.Length - (ind + 1);
                                        var s = str2.Substring(ind + 1, l);
                                        str2 = f + "." + s;
                                    }

                                    var n1 = decimal.Parse(str1);
                                    var n2 = decimal.Parse(str2);
                                    if (n1 == n2)
                                        dr[c] = 2;

                                    else
                                        dr[c] = 0;

                                }
                                else
                                    dr[c] = 0;
                            }
                            else
                                dr[c] = 1;
                        }
                        else
                            dr[c] = 0;
                    } //end try
                    catch (Exception e)
                    {
                        dr[c] = 0;
                    }
                }
                test.ResultCompare.Rows.Add(dr);
            }

            for (int r = 0; r < maxR; r++)
            {
                for (int c = 0; c < maxC; c++)
                {
                    if (test.ResultCompare.Rows[r][c].ToString()=="0")
                    {
                        test.staus = 0;
                        return;
                    }
                    else if (test.ResultCompare.Rows[r][c].ToString() == "2")
                    {
                        status = 2;
                    }
                }
            }
            if (test.Actual_DT.Rows.Count == 0 || test.Expected_DT.Rows.Count == 0)
                test.staus = 0;

            if (status != -5)
            {

                switch (status)
                {
                    case 2:
                        test.staus = 2;
                        break;

                    default:
                        test.staus = 1;
                        break;
                }
            }
            else
                test.staus = 1;

        }

    }

}
