namespace ERP_SynchronizeTools
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.btnTest = new System.Windows.Forms.Button();
            this.txtTimerCount = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnClearError = new System.Windows.Forms.Button();
            this.labErrorCount = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.picErrorStatus = new System.Windows.Forms.PictureBox();
            this.labWorkText = new System.Windows.Forms.Label();
            this.picWorkStatus = new System.Windows.Forms.PictureBox();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.gView = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picErrorStatus)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picWorkStatus)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gView)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.btnTest);
            this.splitContainer1.Panel1.Controls.Add(this.txtTimerCount);
            this.splitContainer1.Panel1.Controls.Add(this.label1);
            this.splitContainer1.Panel1.Controls.Add(this.btnClearError);
            this.splitContainer1.Panel1.Controls.Add(this.labErrorCount);
            this.splitContainer1.Panel1.Controls.Add(this.label2);
            this.splitContainer1.Panel1.Controls.Add(this.picErrorStatus);
            this.splitContainer1.Panel1.Controls.Add(this.labWorkText);
            this.splitContainer1.Panel1.Controls.Add(this.picWorkStatus);
            this.splitContainer1.Panel1.Controls.Add(this.btnStop);
            this.splitContainer1.Panel1.Controls.Add(this.btnStart);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tabControl1);
            this.splitContainer1.Size = new System.Drawing.Size(564, 324);
            this.splitContainer1.SplitterDistance = 92;
            this.splitContainer1.TabIndex = 0;
            // 
            // btnTest
            // 
            this.btnTest.Location = new System.Drawing.Point(396, 65);
            this.btnTest.Name = "btnTest";
            this.btnTest.Size = new System.Drawing.Size(75, 23);
            this.btnTest.TabIndex = 10;
            this.btnTest.Text = "单向调试";
            this.btnTest.UseVisualStyleBackColor = true;
            // 
            // txtTimerCount
            // 
            this.txtTimerCount.Location = new System.Drawing.Point(461, 19);
            this.txtTimerCount.Name = "txtTimerCount";
            this.txtTimerCount.Size = new System.Drawing.Size(100, 21);
            this.txtTimerCount.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(414, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 8;
            this.label1.Text = "间隔：";
            // 
            // btnClearError
            // 
            this.btnClearError.Location = new System.Drawing.Point(477, 65);
            this.btnClearError.Name = "btnClearError";
            this.btnClearError.Size = new System.Drawing.Size(75, 23);
            this.btnClearError.TabIndex = 7;
            this.btnClearError.Text = "清空错误信息";
            this.btnClearError.UseVisualStyleBackColor = true;
            // 
            // labErrorCount
            // 
            this.labErrorCount.AutoSize = true;
            this.labErrorCount.Location = new System.Drawing.Point(37, 65);
            this.labErrorCount.Name = "labErrorCount";
            this.labErrorCount.Size = new System.Drawing.Size(11, 12);
            this.labErrorCount.TabIndex = 6;
            this.labErrorCount.Text = "0";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(33, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 12);
            this.label2.TabIndex = 5;
            this.label2.Text = "异常数据数：";
            // 
            // picErrorStatus
            // 
            this.picErrorStatus.BackColor = System.Drawing.SystemColors.GrayText;
            this.picErrorStatus.Location = new System.Drawing.Point(12, 49);
            this.picErrorStatus.Name = "picErrorStatus";
            this.picErrorStatus.Size = new System.Drawing.Size(14, 13);
            this.picErrorStatus.TabIndex = 4;
            this.picErrorStatus.TabStop = false;
            // 
            // labWorkText
            // 
            this.labWorkText.AutoSize = true;
            this.labWorkText.Location = new System.Drawing.Point(33, 22);
            this.labWorkText.Name = "labWorkText";
            this.labWorkText.Size = new System.Drawing.Size(29, 12);
            this.labWorkText.TabIndex = 3;
            this.labWorkText.Text = "停止";
            // 
            // picWorkStatus
            // 
            this.picWorkStatus.BackColor = System.Drawing.SystemColors.GrayText;
            this.picWorkStatus.Location = new System.Drawing.Point(12, 22);
            this.picWorkStatus.Name = "picWorkStatus";
            this.picWorkStatus.Size = new System.Drawing.Size(14, 13);
            this.picWorkStatus.TabIndex = 2;
            this.picWorkStatus.TabStop = false;
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(288, 22);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(100, 49);
            this.btnStop.TabIndex = 1;
            this.btnStop.Text = "停止";
            this.btnStop.UseVisualStyleBackColor = true;
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(116, 22);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(148, 49);
            this.btnStart.TabIndex = 0;
            this.btnStart.Text = "开始同步数据";
            this.btnStart.UseVisualStyleBackColor = true;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(564, 228);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.gView);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(556, 202);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "错误信息";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // gView
            // 
            this.gView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gView.Location = new System.Drawing.Point(3, 3);
            this.gView.Name = "gView";
            this.gView.RowTemplate.Height = 23;
            this.gView.Size = new System.Drawing.Size(550, 196);
            this.gView.TabIndex = 0;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(564, 324);
            this.Controls.Add(this.splitContainer1);
            this.Name = "MainForm";
            this.Text = "ERP_K3_多账套同步";
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picErrorStatus)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picWorkStatus)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.PictureBox picErrorStatus;
        private System.Windows.Forms.Label labWorkText;
        private System.Windows.Forms.PictureBox picWorkStatus;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Label labErrorCount;
        private System.Windows.Forms.Button btnClearError;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox txtTimerCount;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnTest;
        private System.Windows.Forms.DataGridView gView;
    }
}

