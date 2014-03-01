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

public partial class admin_Notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        alert();
        getNotifications();
        
    }
    private void alert()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    private void getNotifications()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT q.* FROM (SELECT TOP 5 * FROM notifications WHERE notifNew='yes' ORDER BY notifID DESC) q ORDER BY q.notifID DESC";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Response.Write(dr["notifMessage"] + "<a class='btn' style='float:right' href='?notifId=" + dr["notifId"] + "'>Delete</a><br /><hr />");
        }
    }
    
}