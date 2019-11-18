using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ManageTestsReg;
using DALL;
using System.Data;

namespace RegProcess
{
    public class Regrassion
    {
        List<testItem> regTestsList;
        string server;
        string instance;
        public Regrassion(string Server, string Instance,List<testItem> list)
        {
            regTestsList = list;
            server = Server;
            instance = Instance;
        }

        public void start ()
        {
            
            if(regTestsList.Count>0)
            {
                foreach (var item in regTestsList)
                {
                    switch (item.tag)
                    {
                        case "setup":                            
                               setup(item.type, item.script_Actual);
                               break;
                        default:
                            break;
                    }
                }
            }
        }

        public void setup(string db , string query)
        {
            dbConn con = new dbConn(server, db);
            con.Read(query);
        }
        public bool Compare(DataTable t1, DataTable t2)
        {
            for (int i = 0; i < t1.Rows.Count; i++)
            {
                for (int c = 0; c < t1.Columns.Count; c++)
                {
                    if (!Equals(t1.Rows[i][c], t2.Rows[i][c]))
                    {
                        int t1Num, t2Num;
                        bool t1_isNumeric = int.TryParse(t1.Rows[i][c].ToString(), out t1Num);
                        bool t2_isNumeric = int.TryParse(t2.Rows[i][c].ToString(), out t2Num);
                        if (t1_isNumeric && t2_isNumeric)
                        {
                            if (t1Num/t2Num< (1+ (t2Num*0.01)) && t1Num/t2Num> (1- (t2Num*0.01)))
                             return true;
                            else
                             return false;
                        }
                        else
                        return false;

                    }
                }
            }
            return true;
        }
        private void setup()
        {

        }
    }
}
