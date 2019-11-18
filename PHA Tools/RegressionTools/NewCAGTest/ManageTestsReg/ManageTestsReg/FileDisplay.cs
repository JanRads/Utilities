using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManageTestsReg
{
    public partial class FileDisplay : Form
    {
        private string fileName;
        private string pathName;
        public FileDisplay(string FileName, string PathName)
        {
            fileName = FileName;
            pathName = PathName;
            InitializeComponent();
        }

        private void FileDisplay_Load(object sender, EventArgs e)
        {
            StreamReader file =null;
            if (fileName!=null && pathName!=null)
            {
                    
                if (File.Exists(pathName + fileName))
                   file = new StreamReader(pathName + fileName);       
            }
            if (file!=null)
            {
                string str = file.ReadToEnd();
                // Close the StreamReader
                file.Close();
                // Show the text in the rich textbox rtbMain
                rtFile.Text = str;
            }
            else
            {
                this.Close();
            }
        }

        private void copy_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Clipboard.SetText(rtFile.Text);
        }

        private void open_Click(object sender, EventArgs e)
        {
            Process p = new Process();
            p.StartInfo.FileName = pathName + fileName;
            p.Start();
        }

        private void cancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
