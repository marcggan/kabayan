using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;//Hash
using System.Configuration;//web.config
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Data.Odbc;//MySql

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT username, userPassword, roleID FROM users WHERE username = @username;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUsername.Text;

        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                if (pwd == dr["userPassword"].ToString())
                {
                    Session["username"] = dr["username"].ToString();
                    Session["role"] = dr["roleID"].ToString();
                    conn.Close();
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    lblCheck.Text = "Password is not correct";
                }
            }
            else
            {
                lblCheck.Text = "User does not exist";
            }

            conn.Close();
        }
    }
}