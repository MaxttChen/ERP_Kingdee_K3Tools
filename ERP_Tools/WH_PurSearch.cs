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
    public partial class WH_PurSearch : Form
    {
        public WH_PurSearch()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            string strSql = string.Format(@"SELECT  P1.FBillNo [采购订单号], CONVERT(VARCHAR(10),P1.FDate,121) [日期]
                    , P2.FEntryID [订单序号], I.FNumber [物料号], I.FName [物料名称]
                    , I.FModel [物料规格], CONVERT(float,P2.FQty)  [采购数], CONVERT(float,P2.FCommitQty) [收料数]
                    ,CONVERT(float,P2.FStockQty)  [已入库数] , UN.FName [单位], PJ.FNumber [项目号], PJ.FName  [项目名称]
                    FROM POOrder P1
                    JOIN POOrderEntry P2 ON P1.FInterID = P2.FInterID
                    LEFT JOIN  t_Supplier S ON S.FItemID = P1.FSupplyID 
                    LEFT JOIN t_ICItem I ON I.FItemID = P2.FItemID 
                    LEFT JOIN t_MeasureUnit UN ON UN.FItemID = I.FUnitID
                    LEFT JOIN t_Item_3003 PJ ON PJ.FItemID = P2.FEntrySelfP0272
                    LEFT JOIN T_USER U ON U.FUSERID = P1.FBILLERID
                    WHERE 1=1 
                    AND P1.FCancellation = 0 
                    AND P1.FChangeMark = 0 
                    AND P1.FStatus IN (1, 2) 
                    AND P2.FMrpClosed = 0
                    AND P2.FQty > P2.FCommitQty 
                    AND P1.FBillNo LIKE '{0}'
                    AND S.FName LIKE '{1}'
                    AND  I.FNumber LIKE  '{2}'
                    AND  I.FName LIKE   '{3}'
                    AND  I.FModel LIKE   '{4}'
                    AND PJ.FNumber LIKE '{5}'
                    AND PJ.FNAME LIKE '{6}'
                    ORDER BY P1.FDate DESC,P1.FBillNo DESC,FEntryID
                    ",textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, textBox5.Text
                    , textBox6.Text, textBox7.Text);

            DataTable dt = DBCONN.Fill(strSql);

            dataGridView1.DataSource = dt;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;


        }
    }
}
