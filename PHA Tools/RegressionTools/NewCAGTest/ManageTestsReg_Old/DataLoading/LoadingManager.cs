using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLoding
{
    public class LoadingManager
    {
        public LoadingManager(string Table_Name,string Excel_Sheet_Name,string Innit_Command)
        {
            TableName=Table_Name;
            ExcelSheetName = Excel_Sheet_Name;
            InnitCommand = Innit_Command;
        }
        public string TableName { get; set; }
        public string ExcelSheetName { get; set; }
        public string InnitCommand { get; set; }
    }
}
