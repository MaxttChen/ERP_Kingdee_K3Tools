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
    public partial class WH_Inventory : Form
    {
        public WH_Inventory()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            string strSql = string.Format(@"SELECT I.FNumber [物料代码], I.FName [物料名称], I.FModel [物料规格]
                    --, S.FNumber [仓库代码]
                    , S.FName [仓库名称]
                    --, SP.FNumber [仓位代码]
                    , SP.FName [仓位名称], U.FName [单位], CONVERT(FLOAT,INV.FQty) [库存数量]  FROM ICInventory AS INV 
                    LEFT JOIN t_ICItem AS I ON I.FItemID = INV.FItemID 
                    JOIN t_Stock AS S ON S.FItemID = INV.FStockID 
                    JOIN t_StockPlace AS SP ON SP.FSPID = INV.FStockPlaceID
                    JOIN t_MeasureUnit U ON U.FItemID = I.FUnitID
                    WHERE S.FDeleted = 0 
                    AND SP.FDeleted = 0 
                    AND  I.FNumber LIKE  '{0}'
                    AND  I.FName LIKE   '{1}'
                    AND  I.FModel LIKE   '{2}'
                    AND  SP.FName LIKE   '{3}'
                    AND INV.FQty > {4}", textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text
                    , chkInv.Checked ? 0 : -1);

            DataTable dt = DBCONN.Fill(strSql);

            dataGridView1.DataSource = dt;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
        }
    }


}
