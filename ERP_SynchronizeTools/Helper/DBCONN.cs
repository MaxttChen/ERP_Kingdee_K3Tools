using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ERP_SynchronizeTools
{
    class DBCONN
    {
        private const string conn = "Data Source=193.1.11.159;Initial Catalog=TESTDB;User ID=sa;Password=123.a";
        private static SqlConnection connection = new SqlConnection(conn);

        /// <summary>
        /// 返回数据集
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static DataTable Fill(string sql)
        {
            string tableName = "_tempTable";
            try
            {
                connection.Open();  //打开连接
                //创建数据适配器对象
                SqlDataAdapter sda = new SqlDataAdapter(sql, connection);
                //创建数据集
                DataSet ds = new DataSet();
                sda.Fill(ds, tableName); //填充数据集

                return ds.Tables[tableName];
            }
            catch (Exception e)
            {
                //将异常引发出现
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public static int Query(string sql)
        {
            try
            {
                connection.Open();  //打开连接

                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.Connection = connection;
                sqlcommand.CommandType = CommandType.Text;
                sqlcommand.CommandText = sql;
                return sqlcommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                //将异常引发出现
                return 0;
                throw new Exception(e.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public static void InsertTable(String RealTableName, DataTable InsertTable)
        {
            String ColunmsName = "";
            foreach (DataColumn dc in InsertTable.Columns)
            {
                ColunmsName += ColunmsName.Length > 0 ? "," : "" + dc.ColumnName;
            }

            String Str_Valus = "";


            String sql = @"INSERT INTO " + RealTableName + "(" + ColunmsName + ")" + "VALUES (" + Str_Valus + " )";
        }
    }
}
