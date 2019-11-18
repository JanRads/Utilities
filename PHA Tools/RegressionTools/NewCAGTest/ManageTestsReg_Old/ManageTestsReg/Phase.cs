using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManageTestsReg
{
    public class Phase
    {
        public List<test> Items;
        
        public Phase(List<test> list)
        {
            Items = list;
        }
    }
    public class test
    {
        public string Item { get; set; }
        public bool Exec { get; set; }
        public test(string item, bool exec)
        {
            Exec = exec;
            Item = item;
        }
    }
}
