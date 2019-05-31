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
    public partial class DS_PurScheduleFrm : Form
    {
        public DS_PurScheduleFrm()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            string strSql = string.Format(@"
                        SELECT P.FDate [采购日期], P.FCheckDate [采购审核日期] ,PE.FDATE [采购交货日期], P.FBILLNO [采购订单号], U.FName [采购员] 
                        ,PE.FEntryID [采购序号]
                        ,  I.FNumber [物料代码] ,I.FName [物料名称] ,I.FModel [物料规格]
                        ,PE.FQty [采购数量] , PE.FCommitQty [收料数量] , PE.FStockQty [入库数量]
                        ,PE.FQty - PE.FStockQty [未入库数量]
                        ,PD.MIN_DATE [入库日期] , R.FDate [申请单日期], R.FCheckTime [申请单审核日期] , U2.FName [申请人]
                        ,CASE WHEN DATEDIFF(DD,R.FCheckTime,P.FDate) < 0 THEN 0 ELSE DATEDIFF(DD,R.FCheckTime,P.FDate) END 
                         [采购停留（天）]
                         ,CASE WHEN DATEDIFF(DD,PE.FDate , ISNULL(PD.MIN_DATE , PE.FDate) ) < 0 THEN 0 ELSE DATEDIFF(DD,PE.FDate , ISNULL(PD.MIN_DATE , PE.FDate) ) END  [延期到货（天）]
                         --, DATEDIFF(DD,PE.FDate , ISNULL(PD.MIN_DATE , PE.FDate) ) DIFF_DATE_SKT
                        , PJ.FNumber [项目代码] , PJ.FName [项目名称]
                        FROM POOrder P 
                        JOIN POOrderEntry PE ON P.FInterID = PE.FInterID
                        JOIN t_Supplier S ON S.FITEMID = P.FSupplyID
                        JOIN T_User U ON U.FUserID = P.FBillerID
                        LEFT JOIN po_instock_date PD ON PD.FOrderInterID = P.FInterID AND PD.FOrderEntryID = PE.FEntryID
                        JOIN PORequest R ON R.FInterID = PE.FSourceInterId
                        JOIN t_User U2 ON U2.FUserID = R.FBillerID 
                        JOIN t_ICItem I ON I.FItemID = PE.FItemID 
                        JOIN t_Item_3003 PJ ON PJ.FItemID = PE.FEntrySelfP0272
                        WHERE 1=1 
                        AND  PJ.FName LIKE  '{3}'
                        AND  PJ.FNumber LIKE   '{4}'
                        AND  I.FNumber LIKE  '{0}'
                        AND  I.FName LIKE   '{1}'
                        AND  I.FModel LIKE   '{2}'
                        ORDER BY PJ.FNumber", textBox1.Text, textBox2.Text, textBox3.Text
                        , textBox4.Text, textBox5.Text);

            DataTable dt = DBCONN.Fill(strSql);

            dataGridView1.DataSource = dt;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

        }
    }
}
