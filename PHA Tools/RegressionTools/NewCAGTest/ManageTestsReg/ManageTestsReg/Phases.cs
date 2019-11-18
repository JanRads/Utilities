using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManageTestsReg
{
    public class Phases
    {
        public List<Phase> phaseItems;
        public string[] strTests;
        public Phases()
        {
           
           phaseItems = new List<Phase>();
           strTests = File.ReadLines(Properties.Settings.Default.pathPHA + "ManageRegTestTests.txt").ToArray();
           string[] PasesArr = strTests[0].Split(';');
           foreach (var item in PasesArr)
           {
               List<test> LS = new List<test>();
               var Arr = item.Split(',').ToArray();
               foreach (string item1 in Arr)
               {
                   LS.Add(new test(item1, true));
               }
               phaseItems.Add(new Phase(LS));
           }
        }
    }
}
