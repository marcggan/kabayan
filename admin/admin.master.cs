using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;//web.config
using System.Data;//Database
using System.Data.Sql;
using System.Data.SqlClient;//SqlServer
//using System.Data.Odbc;//MySql

public partial class admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            checklogin();
        }
        if (!(Request.QueryString["notifId"] == null || Request.QueryString["notifId"] == ""))
        {
            delete();
        }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Response.Redirect("Default.aspx");
    }
    private void checklogin()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT username FROM users WHERE username = @username;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["username"];

        if (Session["username"] != null)
        {
            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                string username = Session["username"].ToString();
                lblUsername.Text = "logged in as " + username;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    private void delete()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string cmdText = "UPDATE notifications SET notifNew='no' WHERE notifId = @notifId";
        SqlCommand com = new SqlCommand(cmdText, conn);
        com.Parameters.Add("@notifId", SqlDbType.Int).Value = Request.QueryString["notifId"];
        conn.Open();
        com.ExecuteNonQuery();
    }
    
}
