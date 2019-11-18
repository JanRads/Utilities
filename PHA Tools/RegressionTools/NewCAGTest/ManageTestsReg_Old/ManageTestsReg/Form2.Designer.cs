namespace ManageTestsReg
{
    partial class createNewTest
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbxPhase = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbxType = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.fileNameExpectedText = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.fileNameActualText = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.scriptExpectedText = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.scriptActualText = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbxTag = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.testNameText = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnCreate = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.cbxTests = new System.Windows.Forms.ComboBox();
            this.Remove = new System.Windows.Forms.Button();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.resInsert = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbxPhase
            // 
            this.cbxPhase.FormattingEnabled = true;
            this.cbxPhase.Location = new System.Drawing.Point(187, 21);
            this.cbxPhase.Name = "cbxPhase";
            this.cbxPhase.Size = new System.Drawing.Size(109, 21);
            this.cbxPhase.TabIndex = 15;
            this.cbxPhase.SelectedIndexChanged += new System.EventHandler(this.cbxPhase_SelectedIndexChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(26, 24);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(82, 13);
            this.label9.TabIndex = 16;
            this.label9.Text = "Select Phase";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.groupBox1.Controls.Add(this.cbxType);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.fileNameExpectedText);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.fileNameActualText);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.scriptExpectedText);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.scriptActualText);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.cbxTag);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.testNameText);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(22, 97);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(517, 324);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "New Test : ";
            // 
            // cbxType
            // 
            this.cbxType.FormattingEnabled = true;
            this.cbxType.Location = new System.Drawing.Point(165, 250);
            this.cbxType.Name = "cbxType";
            this.cbxType.Size = new System.Drawing.Size(330, 21);
            this.cbxType.TabIndex = 28;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(19, 256);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(31, 13);
            this.label8.TabIndex = 27;
            this.label8.Text = "Type";
            // 
            // fileNameExpectedText
            // 
            this.fileNameExpectedText.Location = new System.Drawing.Point(165, 213);
            this.fileNameExpectedText.Name = "fileNameExpectedText";
            this.fileNameExpectedText.Size = new System.Drawing.Size(330, 20);
            this.fileNameExpectedText.TabIndex = 26;
            this.fileNameExpectedText.DoubleClick += new System.EventHandler(this.fileNameExpectedText_DoubleClick);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(19, 216);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(102, 13);
            this.label7.TabIndex = 25;
            this.label7.Text = "File Name Expected";
            // 
            // fileNameActualText
            // 
            this.fileNameActualText.Location = new System.Drawing.Point(165, 175);
            this.fileNameActualText.Name = "fileNameActualText";
            this.fileNameActualText.Size = new System.Drawing.Size(330, 20);
            this.fileNameActualText.TabIndex = 24;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(19, 178);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(87, 13);
            this.label6.TabIndex = 23;
            this.label6.Text = "File Name Actual";
            // 
            // scriptExpectedText
            // 
            this.scriptExpectedText.Location = new System.Drawing.Point(165, 138);
            this.scriptExpectedText.Name = "scriptExpectedText";
            this.scriptExpectedText.Size = new System.Drawing.Size(330, 20);
            this.scriptExpectedText.TabIndex = 22;
            this.scriptExpectedText.DoubleClick += new System.EventHandler(this.scriptExpectedText_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(19, 141);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(82, 13);
            this.label5.TabIndex = 21;
            this.label5.Text = "Script Expected";
            // 
            // scriptActualText
            // 
            this.scriptActualText.Location = new System.Drawing.Point(165, 103);
            this.scriptActualText.Name = "scriptActualText";
            this.scriptActualText.Size = new System.Drawing.Size(330, 20);
            this.scriptActualText.TabIndex = 20;
            this.scriptActualText.DoubleClick += new System.EventHandler(this.scriptActualText_DoubleClick);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(19, 106);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 13);
            this.label4.TabIndex = 19;
            this.label4.Text = "Script Actual";
            // 
            // cbxTag
            // 
            this.cbxTag.FormattingEnabled = true;
            this.cbxTag.Location = new System.Drawing.Point(165, 66);
            this.cbxTag.Name = "cbxTag";
            this.cbxTag.Size = new System.Drawing.Size(330, 21);
            this.cbxTag.TabIndex = 18;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(19, 72);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(26, 13);
            this.label3.TabIndex = 17;
            this.label3.Text = "Tag";
            // 
            // testNameText
            // 
            this.testNameText.Location = new System.Drawing.Point(165, 33);
            this.testNameText.Name = "testNameText";
            this.testNameText.Size = new System.Drawing.Size(330, 20);
            this.testNameText.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(19, 36);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 13);
            this.label2.TabIndex = 15;
            this.label2.Text = "Test Name";
            // 
            // btnCreate
            // 
            this.btnCreate.Location = new System.Drawing.Point(22, 438);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(75, 23);
            this.btnCreate.TabIndex = 18;
            this.btnCreate.Text = "Create";
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(465, 438);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 19;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click_1);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(380, 21);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(74, 21);
            this.button1.TabIndex = 20;
            this.button1.Tag = "";
            this.button1.Text = "Create New";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(26, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(132, 13);
            this.label1.TabIndex = 22;
            this.label1.Text = "Select Test  For Edit :";
            // 
            // cbxTests
            // 
            this.cbxTests.FormattingEnabled = true;
            this.cbxTests.Location = new System.Drawing.Point(187, 57);
            this.cbxTests.Name = "cbxTests";
            this.cbxTests.Size = new System.Drawing.Size(267, 21);
            this.cbxTests.TabIndex = 21;
            this.cbxTests.SelectedIndexChanged += new System.EventHandler(this.cbxTests_SelectedIndexChanged);
            // 
            // Remove
            // 
            this.Remove.Location = new System.Drawing.Point(474, 21);
            this.Remove.Name = "Remove";
            this.Remove.Size = new System.Drawing.Size(65, 21);
            this.Remove.TabIndex = 23;
            this.Remove.Tag = "";
            this.Remove.Text = "Remove";
            this.Remove.UseVisualStyleBackColor = true;
            this.Remove.Click += new System.EventHandler(this.btnRemovePhase_Click);
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(474, 60);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(66, 17);
            this.checkBox1.TabIndex = 24;
            this.checkBox1.Text = "All Tests";
            this.checkBox1.UseVisualStyleBackColor = true;
            this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // resInsert
            // 
            this.resInsert.AutoEllipsis = true;
            this.resInsert.AutoSize = true;
            this.resInsert.Location = new System.Drawing.Point(117, 444);
            this.resInsert.Name = "resInsert";
            this.resInsert.Size = new System.Drawing.Size(0, 13);
            this.resInsert.TabIndex = 25;
            // 
            // createNewTest
            // 
            this.AccessibleRole = System.Windows.Forms.AccessibleRole.Window;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.Color.LightSteelBlue;
            this.ClientSize = new System.Drawing.Size(558, 483);
            this.Controls.Add(this.resInsert);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.Remove);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbxTests);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnCreate);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.cbxPhase);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "createNewTest";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Create/Edit Test";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbxPhase;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbxType;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox fileNameExpectedText;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox fileNameActualText;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox scriptExpectedText;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox scriptActualText;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbxTag;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox testNameText;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnCreate;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbxTests;
        private System.Windows.Forms.Button Remove;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Label resInsert;

    }
}