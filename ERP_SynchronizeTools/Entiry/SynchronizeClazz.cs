using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Kingdee.K3.API.SDK;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ERP_SynchronizeTools
{
    class SynchronizeClazz
    {
        private static string txtUrl = @"http://193.1.11.159/K3API";
        //4个账套对应的授权码：测试账套、广东宏工、湖南宏工、无锡宏拓

        public TokenClazz Token_test;
        //public TokenClazz Token_GDHG;
        public TokenClazz Token_HNHG;
        public TokenClazz Token_WXHT;

        //错误表
        //public DataTable dt_error;

        public SynchronizeClazz()
        {
            Token_test = new TokenClazz(txtUrl,"测试账套", "9c1f17bc02ee5aa47c3329918a5b886403248862c7a8dae3");
            Token_WXHT = new TokenClazz(txtUrl, "无锡宏拓", "3bfc737f19b0432d3fbf8036e48331af817ff2c5596701cd");
            Token_HNHG = new TokenClazz(txtUrl, "湖南宏工", "6e7280885f4cfa95d2c412263431ddf3ef786d058e4ba00c");
            //dt_error = new DataTable();
            //dt_error.Columns.Add("ID", typeof(Int32));
            //dt_error.Columns.Add("JsonText", typeof(string));
        }

        public void SendData(DataTable dt)
        {
            if (dt.Rows.Count <= 0)
                return;

            string dataType = "";
            string jsonText = "";
            string operatType = "";
            string id = "";
            string remark = "";
            for(int i = 0 , len = dt.Rows.Count; i < len; i++)
            {
                dataType = dt.Rows[i]["DataType"].ToString();
                jsonText = dt.Rows[i]["JsonText"].ToString();
                operatType = dt.Rows[i]["SynType"].ToString();
                id = dt.Rows[i]["ID"].ToString();
                remark = dt.Rows[i]["Remark"].ToString();
                sendDetailData(dataType, jsonText, operatType, id, remark);
            }
        }



        private void sendDetailData(string DataType, string jsonText
            , string operatType,string id,string remark)
        {
            string appendUrl = @"/" + DataType + @"/" + operatType;
            string urlModel = txtUrl + appendUrl + @"?Token=";

            //测试账套
            //sendData2Db(urlModel , Token_test, jsonText, id);

            //无锡宏拓
            if(remark.Contains(Token_WXHT.CompanyName) || string.IsNullOrEmpty(remark))
                sendData2Db(urlModel , Token_WXHT, jsonText , id);

            //湖南宏工
            if (remark.Contains(Token_HNHG.CompanyName) || string.IsNullOrEmpty(remark))
                sendData2Db(urlModel, Token_HNHG, jsonText, id);
            
            //根据id更新推送状态
            string updateSql = string.Format(@"
                    UPDATE TESTDB.DBO.Synchronize_DataTable
                    SET isFinish = 1
                    WHERE ID={0}
                    ", id);
            DBCONN.Query(updateSql);
        }


        public void sendData2Db(string urlModel, TokenClazz Token, string jsonText, string id)
        {
            //湖南宏工账套项目号不一致
            if( Token.CompanyName.Equals("湖南宏工") )
            {
                urlModel = urlModel.Replace("ItemClass3003", "ItemClass3002");
            }


            string url = urlModel + Token.getToken();
            string httpResponse = string.Empty;
            byte[] data = System.Text.Encoding.UTF8.GetBytes(jsonText);
            bool flag = HttpHelper.HttpPost(url, data, out httpResponse, 6000);


            JObject jo = new JObject();
            try
            {
                jo = (JObject)JsonConvert.DeserializeObject(httpResponse);
            }catch(Exception e)
            {
                return;
            }

            string StatusCode = "";
            string Message = "";
            string Data = "";
            StatusCode = null == jo["StatusCode"] ? "" : jo["StatusCode"].ToString();
            Message = null == jo["Message"] ? "" : jo["Message"].ToString();
            Data = null == jo["Data"] ? "" :  jo["Data"].ToString() ;

            //根据id更新推送状态
            string updateSql = string.Format(@"
                    INSERT INTO Synchronize_Log 
                    (DbName,SynID,JsonText_Msg,InsDate,SuccessCode,MsgText,DataText)
                    VALUES ( '{0}', {1} , '{2}',CONVERT(VARCHAR(23),GETDATE(),121), '{3}', '{4}', '{5}' )
                    ", Token.CompanyName, id , jo.ToString(), StatusCode, Message, Data);
            DBCONN.Query(updateSql);
        }


    }
}
