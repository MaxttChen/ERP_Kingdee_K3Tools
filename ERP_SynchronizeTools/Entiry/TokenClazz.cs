using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Kingdee.K3.API.SDK;

namespace ERP_SynchronizeTools
{
    class TokenClazz
    {

        public string CompanyName;
        public string AuthCode;
        public string CreateDateTime;
        public string Url;
        public int Validity;

        public string ErrorMsg = "";
        private string Token;

        public TokenClazz(string Url,string CompanyName, string AuthCode)
        {
            this.AuthCode = AuthCode;
            this.CompanyName = CompanyName;
            this.Url = Url;
        }

        //刷新Token
        public void ReflushToken()
        {
            string httpResponse = string.Empty;
            string url = Url + "/Token/Create?authorityCode=" + AuthCode;
            bool flag = HttpHelper.HttpGet(url, out httpResponse, 6000);
            JObject jo = (JObject)JsonConvert.DeserializeObject(httpResponse);
            
            if (string.IsNullOrEmpty(jo["Data"]["Token"].ToString()))
            {
                ErrorMsg = @"获取Token失败";
            }
            else
            {
                Token = jo["Data"]["Token"].ToString();
                CreateDateTime = jo["Data"]["Create"].ToString();
                Validity = Convert.ToInt32(jo["Data"]["Validity"].ToString());
            }
                
        }

        public string getToken()
        {

            DateTime createTime = Convert.ToDateTime(CreateDateTime);

            if (string.IsNullOrEmpty(Token) || 
                DateTimeDiff(System.DateTime.Now, createTime) > (Validity - 120)  )
                ReflushToken();
            return Token;
        }


        private int DateTimeDiff(DateTime dateBegin, DateTime dateEnd)
        {
            TimeSpan ts1 = new TimeSpan(dateBegin.Ticks);
            TimeSpan ts2 = new TimeSpan(dateEnd.Ticks);
            TimeSpan ts3 = ts1.Subtract(ts2).Duration();
            return Convert.ToInt32(ts3.TotalSeconds);
        }
    }
}
