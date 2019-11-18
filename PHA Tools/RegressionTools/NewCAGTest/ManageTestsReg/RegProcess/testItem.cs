using System;
using System.Collections.Generic;
using System.Text;


namespace ManageTestsReg
{
    public class testItem : EventArgs
    {
        public testItem()
        {
        }

        public testItem(string ID, string TestName, string Tag, string Script_Actual, string Script_Expected, string Type)
        {            
            id = ID;
            testName=TestName;
            tag=Tag;
            script_Actual = Script_Actual;
            script_Expected = Script_Expected;
            type = Type;            
        }
        public bool Exec { get; set; }
        public string id { get; set; }
        public string testName { get; set; }
        public string tag { get; set; }
        public string script_Actual { get; set; }
        public string script_Expected { get; set; }
        public string type { get; set; }

        public string MessageErrorActual;
        public string MessageErrorExpected;
        public System.Data.DataTable Actual_DT;
        public System.Data.DataTable Expected_DT;
        public System.Data.DataTable ResultCompare;
        public int staus;
        public DateTime startTime;
        public DateTime EndTime;
        public int TotalActual;
        public int TotalExpected;        
    }
}
