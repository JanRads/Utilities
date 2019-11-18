using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManageTestsReg
{
    public partial class runForm : Form
    {
        string Server = null;
        List<string> PhasesName;
        public runForm(int phases, string server)
        {
            Server = server;
            PhasesName = new List<string>();
            for (int i = 0; i < phases; i++)
            {
                PhasesName.Add(string.Format("Phase {0}", (i + 1).ToString()));
            }
            InitializeComponent();
        }

        private void runForm_Load(object sender, EventArgs e)
        {
            lblServer.Text = Server;
            foreach (var item in PhasesName)
	            {
                    checkedListBox1.Items.Add(item,true);
	            }
            
        }



        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
        public List<int> ids;
        public string strParmExec;

        private void btnExecute_Click(object sender, EventArgs e)
        {
            strParmExec = null;
            ids = new List<int>();
            foreach (object itemChecked in checkedListBox1.CheckedItems)
            {
                ids.Add(checkedListBox1.Items.IndexOf(itemChecked) + 1);
            }

            foreach (var id in ids)
            {
                strParmExec += string.Format("%_%Phase{0}-Write.txt ", id.ToString());
                strParmExec += string.Format("%_%Phase{0}-Diff.txt ", id.ToString());
            }
            
            Process p = new Process();
            if (cbxPull.Checked == true)
            {
                getPull();
            }
            this.Hide();
        }

        private void getPull()
        {
            Process p = new Process();
            string path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            p.StartInfo.Arguments = @" C:\PHA";
            p.StartInfo.FileName = path + @"\..\..\pull.bat";
            p.Start();
            p.WaitForExit();
        }
    }
}
