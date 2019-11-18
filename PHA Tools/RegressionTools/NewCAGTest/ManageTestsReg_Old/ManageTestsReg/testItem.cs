using System;
using System.Collections.Generic;
using System.Text;


namespace ManageTestsReg
{
    public class testItem
    {
        public testItem()
        {
        }

        public testItem(string ID, string TestName, string Tag, string Script_Actual, string Script_Expected, string Name_Actual, string Name_Expected, string Type)
        {            
            id = ID;
            testName=TestName;
            tag=Tag;
            script_Actual = Script_Actual;
            script_Expected = Script_Expected;
            name_Actual=Name_Actual;
            name_Expected=Name_Expected;
            type=Type;
        }
        public bool Exec { get; set; }
        public string id { get; set; }
        public string testName { get; set; }
        public string tag { get; set; }
        public string script_Actual { get; set; }
        public string script_Expected { get; set; }
        public string name_Actual { get; set; }
        public string name_Expected { get; set; }
        public string type { get; set; }
    }
}
