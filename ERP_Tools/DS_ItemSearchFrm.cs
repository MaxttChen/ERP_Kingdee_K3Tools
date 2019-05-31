using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ERP_Tools
{
    public partial class DS_ItemSearchFrm : Form
    {
        public DS_ItemSearchFrm()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            //连接条件 -- 将'替换成''
            string strFilter = "";
            strFilter = strFilter + " AND I.FNumber " + "like '" + textBox1.Text.Replace("'","''") +"'";
            strFilter = strFilter + " AND I.FName "  + "like '" + textBox2.Text.Replace("'", "''") + "'";
            strFilter = strFilter + " AND I.FModel " + "like '" + textBox3.Text.Replace("'", "''") + "'";

            string strSql = string.Format(@"SELECT I.FNumber [物料代码], I.FName [物料名称], I.FModel [物料规格], CONVERT(FLOAT,ISNULL(SUM(FQty),0)) [库存汇总]
                             FROM t_ICItem I
                            LEFT JOIN ICInventory INV ON INV.FItemID = I.FItemID
                            WHERE I.FDeleted = 0
                            AND I.FNumber <> '0002'
                            {0}
                            GROUP BY I.FNumber , I.FName , I.FModel ", strFilter);

            DataTable dt = DBCONN.Fill(strSql);
            dataGridView1.DataSource = dt;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
        }
    }
}
