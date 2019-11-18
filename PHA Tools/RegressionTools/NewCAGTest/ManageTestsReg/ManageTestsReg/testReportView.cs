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
    public partial class testReportView : Form
    {
        List<testItems> Report;
        public testReportView(List<testItems> report)
        {
            Report = report;
            InitializeComponent();
        }

        private void testReportView_Load(object sender, EventArgs e)
        {

            int idTreeNode = 0;
                foreach (testItems item in Report)
                {
                    treeReportTests.Nodes.Add("Phase " + item.ID.ToString());
                    if (item.Items.Count(x => x.staus == 0)>0)
                        treeReportTests.Nodes[idTreeNode].BackColor = Color.Red;
                    else if (item.Items.Count(x => x.staus == 2)>0)
                        treeReportTests.Nodes[idTreeNode].BackColor = Color.Yellow;
                    else
                        treeReportTests.Nodes[idTreeNode].BackColor = Color.Green;

                    treeReportTests.Nodes[idTreeNode].Nodes.Add("Error Message: " + item.Items.Count(x => x.MessageErrorActual != null || x.MessageErrorExpected != null).ToString());
                    treeReportTests.Nodes[idTreeNode].Nodes[0].BackColor = Color.White;
                    treeReportTests.Nodes[idTreeNode].Nodes.Add("Time: " + item.Items.Sum(x => (x.EndTime.Millisecond - x.startTime.Millisecond)).ToString() + " (Millisecond)");
                    treeReportTests.Nodes[idTreeNode].Nodes[1].BackColor = Color.White;
                    treeReportTests.Nodes[idTreeNode].Nodes.Add("Success: " + item.Items.Count(x => x.staus == 1).ToString());
                    treeReportTests.Nodes[idTreeNode].Nodes[2].BackColor = Color.Green;
                    treeReportTests.Nodes[idTreeNode].Nodes.Add("Failed: " + item.Items.Count(x => x.staus == 0).ToString());
                    treeReportTests.Nodes[idTreeNode].Nodes[3].BackColor = Color.Red;
                    treeReportTests.Nodes[idTreeNode].Nodes.Add("Warning: " + item.Items.Count(x => x.staus == 2).ToString());
                    treeReportTests.Nodes[idTreeNode].Nodes[4].BackColor = Color.Yellow;
     
                    idTreeNode++;
                }

            //dataGridView1.DataSource = Report;

            //dataGridView1.Columns[1].DefaultCellStyle.BackColor = Color.LightGreen;
            //dataGridView1.Columns[2].DefaultCellStyle.BackColor = Color.Red;
            //dataGridView1.Columns[3].DefaultCellStyle.BackColor = Color.Yellow;
            //this.Select();
            //int loc = 1;
            //foreach (var item in Report)
            //{
            //    System.Windows.Forms.Label pid = new System.Windows.Forms.Label();
            //    this.Controls.Add(pid);
            //    pid.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            //    pid.Text = "Phase " + item.phaseId;
            //    pid.Top = loc * 25;
            //    pid.Left = 50;
            //    System.Windows.Forms.Label suc = new System.Windows.Forms.Label();
            //    suc.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            //    this.Controls.Add(suc);
            //    suc.Text = "gggg";// item.Success;
            //    suc.Top = loc * 25;
            //    suc.Left = 75;
            //    loc++;
            //}
            //System.Windows.Forms.Label le = new System.Windows.Forms.TextBox();
            //this.Controls.Add(txt);
            //txt.Top = cLeft * 25;
            //txt.Left = 100;
            //txt.Text = "TextBox " + this.cLeft.ToString();
            //cLeft = cLeft + 1;
            
        
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
    public class report
    {
        public string  phaseId { get; set; }
        public string Success { get; set; }
        public string Failed { get; set; }
        public string Warning { get; set; }
    }
}
