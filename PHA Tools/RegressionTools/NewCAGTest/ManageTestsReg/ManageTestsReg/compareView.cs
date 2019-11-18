using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
namespace ManageTestsReg
{
    public partial class compareView : Form
    {
        testItem TestCompare;
        public compareView(testItem test)
        {
            if (test == null)
                this.Close();
            TestCompare = test;
            InitializeComponent();
            dg_Actual.Scroll += new ScrollEventHandler(dg_Actual_Scroll);
        }

        private void createCSVExpectedByActual()
        {
            if (TestCompare.type == "Static")
            {
                StreamWriter sw = new StreamWriter(Properties.Settings.Default.pathPHA + @"\expected\" + TestCompare.script_Expected);
                string str = "";
                foreach (var item in TestCompare.Actual_DT.Columns)
                {
                    if (str == "")
                        str += item.ToString();
                    else
                        str += "," + item.ToString();
                }
                sw.WriteLine(str);
                foreach (System.Data.DataRow row in TestCompare.Actual_DT.Rows)
                {
                    str = "";
                    foreach (var item in row.ItemArray)
                    {
                        if (str == "")
                            str += item.ToString();
                        else
                            str += "," + item.ToString();
                    }
                    sw.WriteLine(str);
                }
                sw.Close();
                dg_Expected.DataSource = TestCompare.Actual_DT;
                dg_Expected.Refresh();
                ChangeColorDataGridCells_Actual();
                MessageBox.Show("The actual file was copied to expected file", "Copy Actual", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
                MessageBox.Show("It's a Dynamic test", "Error copy Actual", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void compareView_Load(object sender, EventArgs e)
        {
            this.Text += " - " + TestCompare.testName;
            this.dg_Actual.Scroll += new ScrollEventHandler(dg_Actual_Scroll);
            this.dg_Expected.Scroll += new ScrollEventHandler(dg_Expected_Scroll);
            LabelActul.Text += " - " + TestCompare.script_Actual;
            LabelExpected.Text += " - " + TestCompare.script_Expected;

            dg_Actual.DataSource = TestCompare.Actual_DT;
            dg_Expected.DataSource = TestCompare.Expected_DT;
            dg_Actual.ColumnHeadersVisible = true;
            ChangeColorDataGridCells_Actual();
            ChangeColorDataGridCells_Expected();
            toolStripDropDownButton2.DropDownItems.Add("Open Query");
            toolStripDropDownButton2.DropDownItems.Add("Message Error");
            toolStripDropDownButton2.DropDownItems.Add("Send By Email");
            if (TestCompare.Actual_DT.Rows.Count>0)
            toolStripDropDownButton2.DropDownItems.Add("Copy To Expected");
        }

        private void ChangeColorDataGridCells_Actual()
        {
            if (TestCompare.ResultCompare != null)
            {
                int maxC = dg_Actual.Columns.Count;
                int maxR = dg_Actual.Rows.Count;
                for (int r = 0; r < maxR; r++)
                {
                    for (int c = 0; c < maxC; c++)
                    {
                        var st = TestCompare.ResultCompare.Rows[r][c].ToString();
                        switch (st)
                        {
                            case "1":
                                dg_Actual.Rows[r].Cells[c].Style.BackColor = Color.Empty;
                                break;
                            case "0":
                                dg_Actual.Rows[r].Cells[c].Style.BackColor = Color.Red;
                                break;
                            case "2":
                                dg_Actual.Rows[r].Cells[c].Style.BackColor = Color.Yellow;
                                break;
                            case "-5":
                                dg_Actual.Rows[r].Cells[c].Style.BackColor = Color.Empty;
                                break;
                        }

                    }
                }
            }
        }



        private void ChangeColorDataGridCells_Expected()
        {
            if (TestCompare.ResultCompare != null)
            {
                int maxC = dg_Expected.Columns.Count;
                int maxR = dg_Expected.Rows.Count;
                for (int r = 0; r < maxR; r++)
                {
                    for (int c = 0; c < maxC; c++)
                    {
                        var st = TestCompare.ResultCompare.Rows[r][c].ToString();
                        switch (st)
                        {
                            case "1":
                                dg_Expected.Rows[r].Cells[c].Style.BackColor = Color.Empty;
                                break;
                            case "0":
                                dg_Expected.Rows[r].Cells[c].Style.BackColor = Color.Red;
                                break;
                            case "2":
                                dg_Expected.Rows[r].Cells[c].Style.BackColor = Color.Yellow;
                                break;
                            case "-5":
                                dg_Expected.Rows[r].Cells[c].Style.BackColor = Color.Empty;
                                break;
                        }

                    }
                }
            }
        }
        ScrollEventType mLastScroll = ScrollEventType.EndScroll;
        private void dg_Actual_Scroll(object sender, ScrollEventArgs e)
        {
            if (dg_Expected.FirstDisplayedScrollingRowIndex!=-1 && dg_Actual.FirstDisplayedScrollingRowIndex!=-1)
                this.dg_Expected.FirstDisplayedScrollingRowIndex = this.dg_Actual.FirstDisplayedScrollingRowIndex;

            if (dg_Expected.FirstDisplayedScrollingColumnIndex != -1 && dg_Actual.FirstDisplayedScrollingColumnIndex != -1)
                dg_Expected.FirstDisplayedScrollingColumnIndex = dg_Actual.FirstDisplayedScrollingColumnIndex;
            

        }

        private void dg_Expected_Scroll(object sender, ScrollEventArgs e)
        {
            if (dg_Expected.FirstDisplayedScrollingRowIndex != -1 && dg_Actual.FirstDisplayedScrollingRowIndex != -1)
                this.dg_Actual.FirstDisplayedScrollingRowIndex = this.dg_Expected.FirstDisplayedScrollingRowIndex;

            if (dg_Expected.FirstDisplayedScrollingColumnIndex != -1 && dg_Actual.FirstDisplayedScrollingColumnIndex != -1)
                dg_Actual.FirstDisplayedScrollingColumnIndex = dg_Expected.FirstDisplayedScrollingColumnIndex;
            //dg_Actual.HorizontalScrollingOffset = dg_Expected.HorizontalScrollingOffset;
        }

        private void OpenActual_Click(object sender, EventArgs e)
        {
            FileDisplay fl = new FileDisplay(TestCompare.script_Actual, Properties.Settings.Default.pathPHA + @"\scripts\");
            fl.ShowDialog();
        }

        private void toolStripDropDownButton2_DropDownItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            string click = e.ClickedItem.ToString();
                switch (click)
                {
                    case "Open Query":              
                    Process p = new Process();
                    p.StartInfo.FileName = Properties.Settings.Default.pathPHA + @"\scripts\" + TestCompare.script_Actual;
                    p.Start();
                    break;
                    case "Copy To Expected":              
                    createCSVExpectedByActual();
                    break;
                }
         }
    }    
}

           