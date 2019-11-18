using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManageTestsReg
{
    public partial class createNewTest : Form
    {
        List<testItem> tests;
        List<string> phasesArr;
        testItem t;
        Phases p;
        int currectPhaseIndex;
        string[] tags;
        string[] types;
        public int lastPhase=0;
        public createNewTest(List<string> phasesList, List<testItem> testsList, Phases phaseClass,int currectPhases)
        {            
            InitializeComponent();
            phasesArr = phasesList;
            tests = testsList;
            p = phaseClass;
            currectPhaseIndex = currectPhases;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            t = new testItem();
            updatecbxPhases();
            selectPhase("Phase " + (currectPhaseIndex + 1));
            tags = Properties.Settings.Default.tags.Split(',').OrderBy(x => x).ToArray();
            types = Properties.Settings.Default.types.Split(',').OrderBy(x => x).ToArray();
            cbxTag.Items.AddRange(tags);
            cbxType.Items.AddRange(types);
            updateTestCbx();
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string newPhase = "Phase " + (phasesArr.Count + 1).ToString();
            phasesArr.Add(newPhase);
            updatecbxPhases();            
             List<test> lt= new List<test>();
             p.phaseItems.Add(new Phase(lt));
             updatecbxPhases();
             selectPhase(newPhase);             
        }

        public void selectPhase(string phase)
        {
            cbxPhase.SelectedItem = phase;
        }
        public void updatecbxPhases()
        {
            cbxPhase.Items.Clear();
            cbxPhase.Items.AddRange(phasesArr.ToArray());
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            test res=null;
            string idSelected=null;
           
            if (cbxTests.SelectedItem == null)
            {

                string newID = (tests.Count + 1).ToString();
                tests.Add(new testItem(newID, testNameText.Text, cbxTag.Text, scriptActualText.Text,
                    scriptExpectedText.Text, fileNameActualText.Text, fileNameExpectedText.Text, cbxType.Text));
                p.phaseItems[cbxPhase.SelectedIndex].Items.Add(new test(newID, true));
                MessageBox.Show("Added " + newID + " " + testNameText.Text);
                resInsert.Text = "Added " + testNameText.Text;
            }
            else
            {
                idSelected=cbxTests.SelectedItem.ToString().Split(' ')[0];

                tests.First(x => x.id == idSelected).testName = testNameText.Text;
                tests.First(x => x.id == idSelected).tag = cbxTag.Text;
                tests.First(x => x.id == idSelected).script_Actual = scriptActualText.Text;
                tests.First(x => x.id == idSelected).script_Expected = scriptExpectedText.Text;
                tests.First(x => x.id == idSelected).name_Actual = fileNameActualText.Text;
                tests.First(x => x.id == idSelected).name_Expected = fileNameExpectedText.Text;
                tests.First(x => x.id == idSelected).type = cbxType.Text;
                if (checkBox1.Checked == true)
                {
                    p.phaseItems[cbxPhase.SelectedIndex].Items.Add(new test(idSelected,true));
                }
                MessageBox.Show("Updated " + cbxTests.SelectedItem.ToString().Split(' ')[1]);
                resInsert.Text = "Updated " + cbxTests.SelectedItem.ToString().Split(' ')[1];
            }

        }
        private void updateTestCbx()
        {
            string[] testsArr = p.phaseItems[cbxPhase.SelectedIndex].Items.Select(x => x.Item).ToArray();
            var a = (from Item1 in testsArr
                        join Item2 in tests
                        on Item1 equals Item2.id 
                        select new { Item2.id ,Item2.testName }).ToArray();
            testsArr = a.Select(x => x.id + " " + x.testName).Distinct().ToArray();
            cbxTests.Items.Clear();
            cbxTests.Items.AddRange(testsArr);
        }

        private void cbxPhase_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateTestCbx();
            lastPhase = cbxPhase.SelectedIndex;
        }

        private void cbxTests_SelectedIndexChanged(object sender, EventArgs e)
        {
            groupBox1.Text = "Edit Test:";
            string testID = cbxTests.SelectedItem.ToString().Split(' ')[0];
            t = tests.First(x => x.id == testID);
            testNameText.Text = t.testName;
            cbxTag.SelectedText=t.tag;
            scriptActualText.Text = t.script_Actual;
            scriptExpectedText.Text = t.script_Expected;
            fileNameActualText.Text = t.name_Actual;
            fileNameExpectedText.Text=t.name_Expected;
            cbxType.SelectedText = t.type;

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

            string[] testsArr = tests.Select(x => x.id + " " + x.testName).Distinct().ToArray();
            if (checkBox1.Checked)
            {
                cbxTests.Items.Clear();
                cbxTests.Items.AddRange(testsArr);
            }
            else
            {
                updateTestCbx();
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void btnRemovePhase_Click(object sender, EventArgs e)
        {

            var s = MessageBox.Show("Would you like to remove " + cbxPhase.SelectedItem + " ?", "Remove Phase", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
            if (s == System.Windows.Forms.DialogResult.OK && cbxPhase.SelectedIndex != -1)
            {
                p.phaseItems.RemoveAt(cbxPhase.SelectedIndex);
                phasesArr.RemoveAt(cbxPhase.SelectedIndex);
            }

            updatecbxPhases();
            cbxPhase.SelectedIndex = 0;
        }

        private void scriptActualText_DoubleClick(object sender, EventArgs e)
        {
            scriptActualText.Text = getFileFromFolder();
        }

        private string getFileFromFolder()
        {
            openFileDialog1.InitialDirectory = Properties.Settings.Default.pathPHA + @"scripts\";
            DialogResult result = openFileDialog1.ShowDialog();
	        if (result == DialogResult.OK) // Test result.
	        {
                return openFileDialog1.FileName.Replace(Properties.Settings.Default.pathPHA + @"scripts\", "");
            }

            return null;

        }

        private void scriptExpectedText_TextChanged(object sender, EventArgs e)
        {
            scriptExpectedText.Text = getFileFromFolder();
        }

        private void btnCancel_Click_1(object sender, EventArgs e)
        {
            this.Hide();
        }


        private void fileNameExpectedText_DoubleClick(object sender, EventArgs e)
        {
            openFileDialog1.InitialDirectory = Properties.Settings.Default.pathPHA + @"expected\";
            DialogResult result = openFileDialog1.ShowDialog();
            if (result == DialogResult.OK) // Test result.
            {
                fileNameExpectedText.Text = openFileDialog1.FileName.Replace(Properties.Settings.Default.pathPHA + @"scripts\", "");
            }
        }
    }
}
