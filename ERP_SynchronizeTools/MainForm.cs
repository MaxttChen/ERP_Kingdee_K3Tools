using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ERP_SynchronizeTools
{
    public partial class MainForm : Form
    {

        System.Windows.Forms.Timer timer = new Timer();
        SynchronizeClazz syc;
        

        public MainForm()
        {
            InitializeComponent();

            //默认300s定时器取数
            txtTimerCount.Text = "300";
            timer.Enabled = false;

            btnStart.Click += BtnStart_Click;
            btnStop.Click += BtnStop_Click;
            btnClearError.Click += BtnClearError_Click;

            btnTest.Click += BtnTest_Click;

            timer.Tick += Timer_Tick;

            syc = new SynchronizeClazz();

            //gView.DataSource = syc.dt_error;
        }

        private void BtnTest_Click(object sender, EventArgs e)
        {
            Form testFrm = new TestFrm();
            testFrm.Show();
        }

        //清除错误信息
        private void BtnClearError_Click(object sender, EventArgs e)
        {
            picErrorStatus.BackColor = Color.Gray;
            //syc.dt_error.Clear();
        }

        //定时器触发事件
        private void Timer_Tick(object sender, EventArgs e)
        {
            //查询
            //DataTable sendTable = DBCONN.Fill("select * from Testdb..Synchronize_DataTable where IsFinish = 0 ");
            //and remark = '无锡物料'
            DataTable sendTable = DBCONN.Fill(@"
select top 100 * 
from Testdb..Synchronize_DataTable 
where IsFinish = 0 
            ");
            
            syc.SendData(sendTable);

            //if (syc.dt_error.Rows.Count > 0)
            //{
            //    picErrorStatus.BackColor = Color.Red;
            //}
        }

        //停止同步
        private void BtnStop_Click(object sender, EventArgs e)
        {
            //设置同步状态
            picWorkStatus.BackColor = Color.Gray;
            labWorkText.Text = @"停止";
            timer.Enabled = false;
            timer.Stop();
        }

        //开始同步
        private void BtnStart_Click(object sender, EventArgs e)
        {
            //设置同步状态
            picWorkStatus.BackColor = Color.Lime;
            labWorkText.Text = @"正在同步";

            //设置定时器
            timer.Interval = Convert.ToInt32(txtTimerCount.Text) * 1000;
            timer.Enabled = true;
            timer.Start();

        }
    }
}
