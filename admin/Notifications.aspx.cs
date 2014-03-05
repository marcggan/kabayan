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
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            checklogin();
        }
        getNotifications();
        
    }
    private string getMessage()
    {
        String cmdtext = "SELECT q.* FROM (SELECT TOP 5 * FROM notifications WHERE notifNew='yes' ORDER BY notifID DESC) q ORDER BY q.notifID DESC";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        string msg = "";
        while (dr.Read())
        {
            msg += dr["notifMessage"] + "<a class='btn' style='float:right' href='?notifId=" + dr["notifId"] + "'>Delete</a><br /><hr />";
        }
        conn.Close();
        return msg;
    }
    private int count()
    {
        String cmdtext = "SELECT count(notifId) AS count FROM notifications WHERE notifNew = 'yes';";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        int count = 0;
        while (dr.Read())
        {
            count = Convert.ToInt32(dr["count"]);
        }
        conn.Close();
        return count;
    }

    private void getNotifications()
    {
        Response.Write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Notifications"+count()+"<b class='caret'></b></a>"+
                      "<ul id='notifications' class='notif dropdown-menu'>"+getMessage()+"</ul>");
    }

    private void checklogin()
    {
        String cmdtext = "SELECT username FROM users WHERE username = @username;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"];

        if (Session["username"] != null)
        {
            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (!dr.HasRows)
            {
                conn.Close();
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            conn.Close();
            Response.Redirect("Default.aspx");
        }
        conn.Close();
    }
}