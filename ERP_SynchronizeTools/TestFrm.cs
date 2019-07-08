using Kingdee.K3.API.SDK;
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
    public partial class TestFrm : Form
    {
        TokenClazz testToken = null;
        //private static string txtUrl = @"http://193.1.11.159/K3API";

        public TestFrm()
        {
            InitializeComponent();
            btnGet.Click += BtnGet_Click;
            btnPost.Click += BtnPost_Click;
            btnCreateToken.Click += BtnCreateToken_Click;

            txtUrl.Text = @"http://193.1.11.159/K3API";
            txtAuthod.Text = @"9c1f17bc02ee5aa47c3329918a5b886403248862c7a8dae3";
            testToken = new TokenClazz(txtUrl.Text, "测试账套", "9c1f17bc02ee5aa47c3329918a5b886403248862c7a8dae3");
        }

        private void BtnCreateToken_Click(object sender, EventArgs e)
        {
            testToken = new TokenClazz(txtUrl.Text, "测试账套", txtAuthod.Text);
        }

        //Post
        private void BtnPost_Click(object sender, EventArgs e)
        {
            string url = txtUrl.Text + @"/" + txtModelUrl.Text + @"/" + txtOperate.Text 
                + "?Token=" + testToken.getToken();
            string httpResponse = string.Empty;
            byte[] data = System.Text.Encoding.UTF8.GetBytes(txtPostContext.Text);
            bool flag = HttpHelper.HttpPost(url, data, out httpResponse, 6000);
            txtResponse.Text = httpResponse;
        }


        //Get
        private void BtnGet_Click(object sender, EventArgs e)
        {
            string url = txtUrl.Text + @"/" + txtModelUrl.Text + @"/" + txtOperate.Text
                + "?Token=" + testToken.getToken();
            string httpResponse = string.Empty;
            byte[] data = System.Text.Encoding.UTF8.GetBytes(txtPostContext.Text);
            bool flag = HttpHelper.HttpGet(url,  out httpResponse, 6000);
            txtResponse.Text = httpResponse;
        }
    }
}
