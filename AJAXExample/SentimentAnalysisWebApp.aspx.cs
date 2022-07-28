using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Http;
using System.IO;

namespace AJAXExample
{
    public partial class AJAXExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //For C#
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
            string url = "http://127.0.0.1:12345/predict";
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            httpWebRequest.ContentType = "application/json; charset=utf-8";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{" + "\"body\":\"" + txtName.Text + "\"}";
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }
            using (var response = httpWebRequest.GetResponse() as HttpWebResponse)
            {
                if (httpWebRequest.HaveResponse && response != null)
                {
                    using (var reader = new StreamReader(response.GetResponseStream()))
                    {
                        string strOutput = reader.ReadToEnd();
                        strOutput = strOutput.Replace(@"""", @"");
                        strOutput = strOutput.Replace(@",", @"");
                        string[] strarrOP = strOutput.Split(new char[] { '\r', '\n' });
                        this.lblMsgBert.Text = strarrOP[1].ToString();
                        this.lblMsgNLTK.Text = strarrOP[2].ToString();
                        this.lblMsgRNN.Text = strarrOP[3].ToString();

                    }
                }
            }
        }
      //  lblMsg.Text = "You typed '" + txtName.Text + "' in above textbox";
        }

        //For Vb.net
        //Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        //    Threading.Thread.Sleep(5000)
        //    lblMsg.Text = "You typed '" & txtName.Text & "' in above textbox"
        //End Sub
    
}