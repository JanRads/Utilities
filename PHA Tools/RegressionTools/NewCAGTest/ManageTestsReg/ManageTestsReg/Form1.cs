using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Office.Interop;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.IO;
using Microsoft.VisualStudio.Data;
using DataLoding;
using Outlook = Microsoft.Office.Interop.Outlook;
using RegProcess;
using System.Threading;
namespace ManageTestsReg
{    
    public partial class ManageRegTests : Form
    {
        bool selectAllExec;
        bool changed;
        int lastNumPhase;
        bool isLoad = false;
        List<string> PhaseNum;
        List<testItem> PhaseTests;
        Phases P2;
        List<testItem> It;
        List<string> servers;
        string strPathPHA;
        List<List<testItems>> ListTestsChecked;

        public ManageRegTests()
        {
            if (!Directory.Exists(Properties.Settings.Default.pathPHA))
            {
                BrowserFolder();
            }

            InitializeComponent();
            DataLoading();
        }
        public void BrowserFolder()
        {
            FolderBrowserDialog dl = new FolderBrowserDialog();
            dl.SelectedPath = @"c:\";
            DialogResult result = dl.ShowDialog();
            if (result == DialogResult.Cancel)
                MessageBox.Show("The path has not been set!");
            else
            {
                Properties.Settings.Default.pathPHA = dl.SelectedPath + @"\";
                Properties.Settings.Default.Save();
            }
        }
        public void DataLoading()
        {
            try
            {
                StatusLabelDataLoading.ForeColor = Color.Red;
                StatusLabelDataLoading.Text = "Loading Excel Date...";
                DataLoadingByExcel.CreateDataLoading(Properties.Settings.Default.pathPHA + @"scripts\input\");
                StatusLabelDataLoading.ForeColor = Color.Green;
                StatusLabelDataLoading.Text = "Data Loaded Successfully - " + DateTime.Now.ToString();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            lastNumPhase = 1;
            ListTestsChecked = new List<List<testItems>>();
            strPathPHA = Properties.Settings.Default.pathPHA;
            tabControl1.TabPages[0].Text = "Test - Phase 1";

            tabControl1.TabPages[0].BackColor = Color.Yellow;
            tabControl1.TabPages[0].ForeColor = Color.DarkBlue;

            testsArr = new List<string>();
            
            PhaseTests = new List<testItem>();
            testItems ITS = new testItems(strPathPHA);            

            
            P2 = new Phases();
            int numPhases = P2.phaseItems.Count;
            It = ITS.Items;
            ITS.excel_init(P2.strTests);
            PhaseNum = new List<string>();

            for (int i = 0; i < P2.phaseItems.Count; i++)
            {
                PhaseNum.Add("Phase " + (1 + i).ToString());
            }
            PhaesesList.Items.AddRange(PhaseNum.ToArray());
           
            getTestsByPhase(1, false);

            PhaesesList.SelectedIndex = 0;
            
            servers = Properties.Settings.Default.servers.Split(';').ToList();
            if (servers == null) 
                servers = new List<string>();
           
            updateServersList();
            cbxServers.SelectedText = Properties.Settings.Default.lastServer;
            dataGridView1.Columns[0].Width = 70;
            dataGridView1.Columns[1].Width = 40;
            dataGridView1.Columns[2].Width = 130;
            dataGridView1.Columns[3].Width = 50;
            dataGridView1.Columns[4].Width = 200;
            dataGridView1.Columns[5].Width = 200;
            dataGridView1.Columns[6].Width = 70;
        }

        private void updateServersList()
        {
            cbxServers.Items.Clear();
            cbxServers.Items.AddRange(servers.ToArray());
            cbxServers.SelectedItem = Properties.Settings.Default.lastServer;
        }

        private void getTestsByPhase(int phaseId, bool isSaved)
        {
            if (isSaved)
                saveChanges(lastNumPhase);

            isLoad = true;
            PhaseTests = new List<testItem>();
            var aa = P2.phaseItems[phaseId - 1].Items;
            foreach (var item in aa)
            {
                if ((It.Where(x => x.id == item.Item).ToArray()).Count() > 0)
                {
                    PhaseTests.Add(It.First(x => x.id == item.Item));
                    PhaseTests.First(x => x.id == item.Item).Exec = item.Exec;
                }
                //MessageBox.Show(item.Item);
            }
            tabControl1.TabPages[0].Text = string.Format("Test - Phase {0}", phaseId);
            var bindingList = PhaseTests;

            dataGridView1.DataSource = bindingList;
            cbxFilterTags.Items.Clear();
            cbxFilterTags.Items.AddRange(PhaseTests.Select(x => x.tag).Distinct().ToArray());
            lastNumPhase = phaseId;
            isLoad = false;
            changed = false;
            selectAllExec = true;
            dataGridView1.Columns[0].HeaderText = "Execute";
            dataGridView1.Columns[1].HeaderText = "ID";
            dataGridView1.Columns[2].HeaderText = "Test Name";
            dataGridView1.Columns[3].HeaderText = "Tag";
            dataGridView1.Columns[4].HeaderText = "Script Actual";
            dataGridView1.Columns[5].HeaderText = "Script Expected";
            dataGridView1.Columns[6].HeaderText = "Type";
            //dataGridView1.Columns[8].HeaderText = "Type";
            //dataGridView1.ColumnHeadersDefaultCellStyle.BackColor = Color.LightBlue;
            //dataGridView1.ColumnHeadersDefaultCellStyle.SelectionBackColor = Color.Yellow;
            //dataGridView1.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            int indTests = TestsList.SelectedIndex != -1 ? TestsList.SelectedIndex : ListTestsChecked.Count - 1;
            if (indTests!=-1)
            ChangeColorDataGridRows(ListTestsChecked[indTests]);
            
            
            dataGridView1.EnableHeadersVisualStyles = false;
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void cmbTags_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected;
            string ItemValue;
            if (!isLoad)
            {
                int r;
                foreach (DataGridViewRow item in dataGridView1.Rows)
                {
                    r = item.Index;
                    dataGridView1.Rows[r].Cells["Exec"].Value = false;
                    ItemValue = item.Cells["tag"].Value.ToString();
                    selected = cbxFilterTags.SelectedItem.ToString();
                    if (ItemValue == selected)
                        dataGridView1.Rows[r].Cells["Exec"].Value = true;

                    changed = true;
                }
            }

        }

        private void updateListPhasesCbx()
        {
            PhaseNum = new List<string>();
            PhaesesList.Items.AddRange(PhaseNum.ToArray());
            for (int i = 0; i < P2.phaseItems.Count; i++)
            {
                PhaseNum.Add("Phase " + (1 + i).ToString());
            }
            PhaesesList.Items.Clear();
            PhaesesList.Items.AddRange(PhaseNum.ToArray());
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lastNumPhase = (PhaesesList.SelectedIndex!=-1)?PhaesesList.SelectedIndex + 1:1;
            getTestsByPhase(PhaesesList.SelectedIndex + 1, true);
        }

        private void saveChanges(int PhaseID)
        {
            if (changed)
            {
                List<testItem> f = (List<testItem>)dataGridView1.DataSource;
                foreach (var item in f)
                {
                    if (P2.phaseItems[PhaseID - 1].Items.Exists(x => x.Item == item.id))
                    P2.phaseItems[PhaseID - 1].Items.First(x => x.Item == item.id).Exec = item.Exec;
                }
            }

        }

        private void dataGridView1_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            string idRow = null;
            if (dataGridView1.Columns[e.ColumnIndex].Name.Equals("Exec"))
            {
                if (e.RowIndex != -1)
                {
                    var ch = (bool)dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
                    changed = true;
                    idRow = (string)dataGridView1.Rows[e.RowIndex].Cells[1].Value;
                    if (P2.phaseItems[lastNumPhase - 1].Items.Count >= e.RowIndex)
                        if (P2.phaseItems[lastNumPhase - 1].Items[e.RowIndex].Exec != ch)
                            P2.phaseItems[lastNumPhase - 1].Items[e.RowIndex].Exec = ch;
                }
            }

        }

        private void selectAll_Click(object sender, EventArgs e)
        {
            bool c = false;
            if (!selectAllExec)
            {
                c = true;
                selectAllExec = true;
            }
            else
            {
                c = false;
                selectAllExec = false;
            }

            int r;
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                r = item.Index;
                dataGridView1.Rows[r].Cells["Exec"].Value = c;
                changed = true;
            }
        }

        private void newRegTestCSV(List<int> PhasesForRun)
        {
            saveChanges(PhaesesList.SelectedIndex != -1 ? PhaesesList.SelectedIndex + 1 : 1);


            int id = 1;
            foreach (var item in P2.phaseItems)
            {
                var res = PhasesForRun.Exists(x => x == id);
                if (res)
                {
                    List<string> rowsTest = new List<string>();
                    rowsTest.Add("Test_Name, Tag,Script_Actual,Script_Expected,Name_Actual,Name_Expected,Type");


                    var Rows = P2.phaseItems[id - 1].Items.Where(x => x.Exec == true).ToArray();

                    foreach (var row in Rows)
                    {
                        if (It.Exists(x => x.id == row.Item))
                        {
                            testItem testX = It.First(x => x.id == row.Item);
                            rowsTest.Add(testX.testName + "," +
                            testX.tag + "," +
                            testX.script_Actual + "," +
                            testX.script_Expected + "," +
                            testX.type);
                            
                            
                        }
                    }

                    TextWriter tw = new StreamWriter(strPathPHA + @"TestFiles\Phase" + id.ToString() + ".csv");

                    foreach (var line in rowsTest)
                    {
                        tw.WriteLine(line);
                    }

                    tw.Close();

                }
                id++;
            }
            GC.Collect();
        }

        private void saveTests()
        {
            saveChanges(PhaesesList.SelectedIndex != -1 ? PhaesesList.SelectedIndex + 1 : 1 + 1);
            Microsoft.Office.Interop.Excel.Application xlApp;
            Microsoft.Office.Interop.Excel.Workbook xlWorkBook;
            Microsoft.Office.Interop.Excel.Worksheet xlWorkSheet;
            object misValue = System.Reflection.Missing.Value;
            xlApp = new Microsoft.Office.Interop.Excel.Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = null;

            xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);


            xlWorkSheet.Cells[1, 1] = "ID";
            xlWorkSheet.Cells[1, 2] = "Test_Name";
            xlWorkSheet.Cells[1, 3] = "Tag";
            xlWorkSheet.Cells[1, 4] = "Script_Actual";
            xlWorkSheet.Cells[1, 5] = "Script_Expected"; 
            xlWorkSheet.Cells[1, 6] = "Type";



            int rowSheet = 2;
            foreach (var row in It)
            {
                xlWorkSheet.Cells[rowSheet, 1] = row.id;
                xlWorkSheet.Cells[rowSheet, 2] = row.testName;
                xlWorkSheet.Cells[rowSheet, 3] = row.tag;
                xlWorkSheet.Cells[rowSheet, 4] = row.script_Actual;
                xlWorkSheet.Cells[rowSheet, 5] = row.script_Expected;
                xlWorkSheet.Cells[rowSheet, 6] = row.type;

                rowSheet++;
            }


            xlWorkBook.SaveAs(strPathPHA + @"testItems.xlsx",
            Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookDefault, Type.Missing, Type.Missing, true, false,
            XlSaveAsAccessMode.xlNoChange, XlSaveConflictResolution.xlLocalSessionChanges, Type.Missing, Type.Missing);
            xlApp.Quit();
            GC.Collect();
            GC.WaitForPendingFinalizers();
            if (xlApp != null)
            {
                xlApp.Quit();
                int hWnd = xlApp.Application.Hwnd;
                uint processID; GetWindowThreadProcessId((IntPtr)hWnd, out processID);
                Process[] procs = Process.GetProcessesByName("EXCEL");
                foreach (Process p in procs)
                {
                    if (p.Id == processID)
                        p.Kill();
                }
                Marshal.FinalReleaseComObject(xlApp);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int id = 0;
            List<int> pArr = new List<int>();
            foreach (var item in PhaseNum)
            {
                pArr.Add(id);
                id++;
            }
            newRegTestCSV(pArr);
            saveStructure();
            //saveTests();
        }

        List<string> testsArr;
        List<testItems> TestforRun;
        runForm rf;
        private void Run_Click(object sender, EventArgs e)
        {
            rf = new runForm(P2.phaseItems.Count, Properties.Settings.Default.lastServer);
            TestforRun = new List<testItems>();

            rf.ShowDialog();


            if (rf.strParmExec != null)
            {
               // var x = new {int id, testItem testI};
                int id = 1;
                foreach (var item in P2.phaseItems)
                {
                   // saveChanges(PhaesesList.SelectedIndex != -1 ? PhaesesList.SelectedIndex + 1 : 1);

                    var res = rf.ids.Exists(x => x == id);
                    if (res)
                    {
                        var tempTests = new List<testItem>();
                        var ts = P2.phaseItems[id - 1].Items.Where(x => x.Exec == true).ToArray();
                        foreach (var idTest in ts)
                        {
                            if (It.Exists(x => x.id == idTest.Item))
                                tempTests.Add(It.First(x => x.id == idTest.Item));
                        }
                        TestforRun.Add(new testItems(tempTests.ToList(), id));
                         

                    }
                    id++;
                }

                Regrassion reg = new Regrassion(Properties.Settings.Default.lastServer, TestforRun, strPathPHA + @"scripts\");
                reg.UpdateView += this.updatedListView;
                reg.start();     
            //Thread thr = new Thread(runRegression);
            //thr.Start();
            ListTestsChecked.Add(TestforRun);            
                        
                DateTime now = DateTime.Now;
                testsArr.Add(now.ToString("MM'/'dd'/'yyyy HH':'mm':'ss"));             
	                    
            TestsList.DataSource = testsArr.ToArray();
            getTestsByPhase(PhaesesList.SelectedIndex + 1, true);
            TestsList.SelectedIndex = testsArr.Count - 1;
            reportTest();
            }
            rf = null;
            
        }

        private void  reportTest()
        {
           
                var myTest = ListTestsChecked[TestsList.SelectedIndex];
              
                testReportView rep = new testReportView(myTest);
                rep.ShowDialog();
            
        }

        static void runRegression()
        {
            //Regrassion reg = new Regrassion(Properties.Settings.Default.lastServer, TestforRun, strPathPHA + @"scripts\");
            //reg.start();     
        }

        private void ChangeColorDataGridRows(List<testItems> TestforRun)
        {
            testItems testsByPhaase=null;
            if (TestforRun.Exists(x=> x.ID==PhaesesList.SelectedIndex+1))
            {
                testsByPhaase = TestforRun.First(x => x.ID == PhaesesList.SelectedIndex + 1);
            }            

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                int st = -5;
                var idR = row.Cells[1].Value.ToString();


                if (testsByPhaase.Items.Exists(x => x.id == idR))
                    st = testsByPhaase.Items.First(x => x.id == idR).staus;

                switch (st)
                {
                    case 1:
                        row.DefaultCellStyle.BackColor = Color.LightGreen;
                        break;
                    case 0:
                        row.DefaultCellStyle.BackColor = Color.Red;
                        break;
                    case 2:
                        row.DefaultCellStyle.BackColor = Color.Yellow;
                        break;
                    case -5:
                        row.DefaultCellStyle.BackColor = Color.Empty;
                        break;
                }
            }
        }

        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode.Equals(Keys.Up))
            {
                moveUp();
            }
            if (e.KeyCode.Equals(Keys.Down))
            {
                moveDown();
            }
            if (e.KeyCode.Equals(Keys.Delete))
            {
                deleteRow();
            }
            if (e.KeyCode.Equals(Keys.F3))
            {
                Compare();
            }
            //if (e.KeyCode.Equals(Keys.Space))
            //{
            //    foreach (DataGridViewRow item in dataGridView1.SelectedRows)
            //    {
            //        var id=item.Index;
            //        if (id > -1)
            //        {
            //            dataGridView1.Rows[id].Cells[0].Value = ((bool)dataGridView1.Rows[id].Cells["Exec"].Value==true) ? false : true;
            //        }
            //    }
            //}
            
            //if (e.KeyCode.Equals(Keys.F11))
            //{
            //    if(File.Exists(@"C:\Program Files (x86)\Beyond Compare 4\BCompare.exe"))
            //    {
            //        int r1=(dataGridView1.SelectedRows)[0].Index;
                    
            //        if (r1!=-1)                   
            //        if (dataGridView1.Rows[r1].Cells[6].Value!=null && dataGridView1.Rows[r1].Cells[7].Value!=null 
            //            && File.Exists(Properties.Settings.Default.pathPHA + @"actual\" + dataGridView1.Rows[r1].Cells[6].Value)
            //            && File.Exists(Properties.Settings.Default.pathPHA + @"expected\" + dataGridView1.Rows[r1].Cells[7].Value))
            //        {
            //            Process pr = new Process();
            //            pr.StartInfo.WorkingDirectory = @"C:\Program Files (x86)\Beyond Compare 4";
            //            pr.StartInfo.FileName="BCompare.exe " + Properties.Settings.Default.pathPHA + @"actual\" +
            //                dataGridView1.Rows[r1].Cells[6].Value + " " + Properties.Settings.Default.pathPHA + @"expected\" + dataGridView1.Rows[r1].Cells[7].Value;
            //            pr.Start();
            //        }
                
            //    }
            //}
            e.Handled = true;


        }

        private void moveUp()
        {
            if (dataGridView1.RowCount > 0)
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    int rowCount = dataGridView1.Rows.Count;
                    int index = dataGridView1.SelectedCells[0].OwningRow.Index;

                    if (index == 0)
                    {
                        return;
                    }
                    int returnIdRow = 0;
                    List<test> lastPhaseTests = new List<test>(P2.phaseItems[lastNumPhase - 1].Items);
                    P2.phaseItems[lastNumPhase - 1].Items.Clear();
                    bool isAdded = false;
                    for (int il = 0; il < lastPhaseTests.Count; il++)
                    {

                        if (il == (index - 1) && !isAdded)
                        {
                            P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[index]);
                            returnIdRow = il;
                            P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[il]);
                            isAdded = true;
                            il++;
                        }

                        else
                            P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[il]);
                    }
                    updatedListView(this, null);
                    dataGridView1.ClearSelection();
                    dataGridView1.Rows[returnIdRow].Selected = true;
                }
            }
        }
        public void updatedListView(object o, testItem e)
        {
            getTestsByPhase(lastNumPhase, true);
        }
        private void moveDown()
        {
            if (dataGridView1.RowCount > 0)
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    int rowCount = dataGridView1.Rows.Count;
                    int index = dataGridView1.SelectedCells[0].OwningRow.Index;

                    if (index == rowCount - 1)
                    {
                        return;
                    }
                    int returnIdRow = 0;
                    List<test> lastPhaseTests = new List<test>(P2.phaseItems[lastNumPhase - 1].Items);
                    P2.phaseItems[lastNumPhase - 1].Items.Clear();
                    bool isAdded = false;
                    for (int il = 0; il < lastPhaseTests.Count; il++)
                    {
                        if (il != index)
                        {
                            if (il == (index + 1) && !isAdded)
                            {
                                P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[il]);

                                P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[index]);

                                isAdded = true;

                                returnIdRow = il;
                            }

                            else
                                P2.phaseItems[lastNumPhase - 1].Items.Add(lastPhaseTests[il]);
                        }

                    }
                    updatedListView(this, null);
                    dataGridView1.ClearSelection();
                    dataGridView1.Rows[returnIdRow].Selected = true;
                }
            }
        }

        private void deleteRow()
        {
            int index = dataGridView1.SelectedCells[0].OwningRow.Index;
            P2.phaseItems[lastNumPhase - 1].Items.RemoveAt(index);
            updatedListView(this,null);
            dataGridView1.ClearSelection();
            if (index < dataGridView1.Rows.Count)
                dataGridView1.Rows[index].Selected = true;
            else
                dataGridView1.Rows[0].Selected = true;

        }

        private void saveStructure()
        {
            string Structure = null;
            foreach (var phase in P2.phaseItems)
            {
                if (Structure != null)
                    Structure += ";";
                bool isFirst = true;
                foreach (var test in phase.Items)
                {
                    if (isFirst)
                    {
                        Structure += test.Item;
                        isFirst = false;
                    }
                    else
                        Structure += "," + test.Item;
                }
            }
            //Properties.Settings.Default.phases = Structure;
            //Properties.Settings.Default.Save();
            StreamWriter sw = new StreamWriter(strPathPHA + "ManageRegTestTests.txt");
            sw.WriteLine(Structure);
            string lineStr;
            foreach (var row in It)
            {
                lineStr = "";
                lineStr += row.id;
                lineStr += "," + row.testName;
                lineStr += "," + row.tag;
                lineStr += "," + row.script_Actual;
                lineStr += "," + row.script_Expected;
                lineStr += "," + row.type;

                sw.WriteLine(lineStr);
            }


            sw.Close();
            //File.WriteAllText(strPathPHA + "OrderTests.txt", Structure);
            //File.wirit
           
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            createNewTest cnt = new createNewTest(PhaseNum, It, P2, PhaesesList.SelectedIndex);
            cnt.ShowDialog();
            getTestsByPhase(lastNumPhase, true);
            updateListPhasesCbx();
            PhaesesList.Text = "Phase " + (cnt.lastPhase + 1).ToString();
            //DataConnectionDialog dcd = new DataConnectionDialog();
            //DataConnectionConfiguration dcs = new DataConnectionConfiguration(null);
            //dcs.LoadConfiguration(dcd);

            //if (DataConnectionDialog.Show(dcd) == DialogResult.OK)
            //{
            //    DataConnectionDialog dcd = new DataConnectionDialog();

            //dcs.LoadConfiguration(dcd);

            //if (DataConnectionDialog.Show(dcd) == DialogResult.OK)
            //{
            //}

        }



        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void splitContainer2_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cbxServers_SelectedIndexChanged(object sender, EventArgs e)
        {
            Properties.Settings.Default.lastServer = cbxServers.SelectedItem.ToString();
            Properties.Settings.Default.Save();
            updateFileText(strPathPHA + "ConnectionString.py", strPathPHA + "CS.py", "CS_Server", cbxServers.SelectedItem.ToString());
            serverName.Text = cbxServers.SelectedItem.ToString();

        }



        //private System.Data.DataTable loadCSv(string csvPath)
        //{
        //    //TextReader tr = new StreamReader(csvPath);
        //    string[] tr = File.ReadAllLines(csvPath);

        //    System.Data.DataTable dt = new System.Data.DataTable();

        //    foreach (string c in tr)
        //    {
        //        dt.Columns.Add(c);
        //    }
        //    string newline;
        //    while ((newline = file.ReadLine()) != null)
        //    {
        //        DataRow dr = dt.NewRow();
        //        string[] values = newline.Split(' ');
        //        for (int i = 0; i < values.Length; i++)
        //        {
        //            dr[i] = values[i];
        //        }
        //        dt.Rows.Add(dr);
        //    }

        //}
        static void updateFileText(string pahtRunFile, string pathOrgFile, string oldString, string newString)
        {
            System.IO.File.Delete(pahtRunFile);

            if (File.Exists(pathOrgFile))
            {
                StreamReader SR = new StreamReader(pathOrgFile);
                string strFileText = SR.ReadToEnd();
                SR.Close();
                SR.Dispose();
                strFileText = strFileText.Replace(oldString, newString);
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(pahtRunFile, true))
                {
                    file.Write(strFileText);
                }
            }
        }

        private void cbxServers_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode.Equals(Keys.Enter))
            {
                if (cbxServers.Text != "" && cbxServers.Text != Properties.Settings.Default.lastServer)
                {
                    string sel = cbxServers.Text;
                    if (!servers.Exists(x => x == sel))
                    {
                        servers.Add(sel);
                        Properties.Settings.Default.lastServer = cbxServers.Text;
                        Properties.Settings.Default.Save();
                        updateServersList();
                        cbxServers.SelectedText = sel;
                    }
                    updateFileText(strPathPHA + "ConnectionString.py", strPathPHA + "CS.py", "CS_Server", sel);
                    DialogResult result = MessageBox.Show("Woud you like to send email about the regression?", "Change servers", MessageBoxButtons.OKCancel);

                    if (result == DialogResult.OK)
                        sendEMailThroughOUTLOOK(sel);

                }

                if (e.KeyCode.Equals(Keys.Delete))
                {

                }
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            string pathF;            
            if (e.RowIndex != -1 && e.ColumnIndex != -1)
            {
                string value = null;
                if (dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
                    value = dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value.ToString();

                StreamReader file = null;
                if (e.ColumnIndex == 4 || e.ColumnIndex == 5)
                {
                    pathF = Properties.Settings.Default.pathPHA + @"scripts\";
                    FileDisplay fd = new FileDisplay(value, pathF);
                    if (fd!=null)
                    fd.Show();
                }
                    
                        

                if (e.ColumnIndex == 6)
                {
                    pathF = Properties.Settings.Default.pathPHA + @"actual\";
                    FileDisplay fd = new FileDisplay(value, pathF);
                    if (fd != null)
                        fd.Show();
                }

                if (e.ColumnIndex == 7)
                {
                    pathF = Properties.Settings.Default.pathPHA + @"expected\";
                    FileDisplay fd = new FileDisplay(value, pathF);
                    if (fd != null)
                        fd.Show();
                }

            }
        }

        private void btnDataLoading_Click(object sender, EventArgs e)
        {
            DataLoading();
        }

        private void saveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            BrowserFolder();
        }



        private void showCSF_Click(object sender, EventArgs e)
        {
            try
            {
                StreamReader file = new StreamReader(Properties.Settings.Default.pathPHA + @"ConnectionString.py");
                string str = file.ReadToEnd();
                file.Close();
                MessageBox.Show(str, "ConnectionString.py");
            }
            catch
            {
                MessageBox.Show("File not exist", "ConnectionString.py");
            }

        }
        public void sendEMailThroughOUTLOOK(string server)
        {
            DialogResult result = MessageBox.Show("Woud you like to send email about the regression?", "Change servers", MessageBoxButtons.OKCancel);

            if (result == DialogResult.OK)
                try
                {
                    // Create the Outlook application.
                    Outlook.Application oApp = new Outlook.Application();
                    // Create a new mail item.
                    Outlook.MailItem oMsg = (Outlook.MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem);
                    // Set HTMLBody. 
                    //add the body of the email
                    oMsg.HTMLBody = "Any objection?";

                    //Subject line
                    oMsg.Subject = "Regression Test On " + server;
                    // Add a recipient.
                    Outlook.Recipients oRecips = (Outlook.Recipients)oMsg.Recipients;
                    // Change the recipient in the next line if necessary.

                    Outlook.Recipient oRecip = (Outlook.Recipient)oRecips.Add("dbOrg_Analytics@allscripts.com");
                    oRecip.Resolve();
                    // Send.
                    oMsg.Send();
                    // Clean up.
                    oRecip = null;
                    oRecips = null;
                    oMsg = null;
                    oApp = null;
                }//end of try block
                catch (Exception ex)
                {
                }//end of catch
        }//end of Email Method

        private void KillExcelApps()
        {
            Process[] procs = Process.GetProcessesByName("EXCEL");
            foreach (Process p in procs)
            {
                p.Kill();
            }
        }

        [DllImport("user32.dll")]
        private static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);

        private void killAllExeclFiles_Click(object sender, EventArgs e)
        {            
                KillExcelApps();
        }


    

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            dataGridView1.CommitEdit(DataGridViewDataErrorContexts.Commit);
        }

        private void toolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            Compare();
        }

        private void Compare ()
        {
            testItems testsByLastPhase = null;
            int r1;
            int indTests = TestsList.SelectedIndex != -1 ? TestsList.SelectedIndex : ListTestsChecked.Count - 1;
            if (indTests != -1)
            {
                if (dataGridView1.CurrentCell.RowIndex != -1)
                {
                    r1 = dataGridView1.CurrentCell.RowIndex;
                    if (r1 != -1)
                    {
                        var id = dataGridView1.Rows[r1].Cells[1].Value.ToString();
                        if (ListTestsChecked[indTests].Exists(x => x.ID == lastNumPhase))
                        {
                            testsByLastPhase = ListTestsChecked[indTests].First(x => x.ID == lastNumPhase);
                            if (testsByLastPhase.Items.Exists(x => x.id == id))
                            {
                                var test = testsByLastPhase.Items.First(x => x.id == id);
                                compareView cv = new compareView(test);
                                cv.ShowDialog();
                            }
                        }
                    }
                }
            }
        }
        private void TestsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indTests = TestsList.SelectedIndex != -1 ? TestsList.SelectedIndex : ListTestsChecked.Count - 1;
            if (indTests != -1)
                ChangeColorDataGridRows(ListTestsChecked[indTests]);
        }

        private void TestsList_DoubleClick(object sender, EventArgs e)
        {
            reportTest();
        }



        private void serverName_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                StreamReader file = new StreamReader(Properties.Settings.Default.pathPHA + @"ConnectionString.py");
                string str = file.ReadToEnd();
                file.Close();
                MessageBox.Show(str, "ConnectionString.py");
            }
            catch
            {
                MessageBox.Show("File not exist", "ConnectionString.py");
            }
        } 




    }

}
