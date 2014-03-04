using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        send();
    }
    private void send()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string cmdText = "INSERT INTO feedbacks (customerId, feedbacksubject,feedbackmessage) VALUES (@customerId,@feedbacksubject,@feedbackmessage);";
        SqlCommand com = new SqlCommand(cmdText,conn);
        com.Parameters.Add("@customerId", SqlDbType.Int).Value = 1;
        com.Parameters.Add("@feedbacksubject", SqlDbType.VarChar).Value = txtSubject.Text;
        com.Parameters.Add("@feedbackmessage", SqlDbType.VarChar).Value = txtMessage.Text;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }
}