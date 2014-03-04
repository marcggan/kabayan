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

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        login();
    }
    private void login()
    {
        string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT customerId, customerFName + ' ' + customerLName AS customerName,customerEmail,customerPassword FROM customers WHERE customerEmail = @Email;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;

        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            if (pwd == dr["customerPassword"].ToString())
            {
                Session["customerId"] = dr["customerId"].ToString();
                Session["customerEmail"] = dr["customerEmail"].ToString();
                Session["customerName"] = dr["customerName"].ToString();
                conn.Close();
                Response.Redirect("Customer.aspx");
            }
            else
            {
                lblCheck.Text = "Email or password is incorrect";
            }
        }
        conn.Close();
        
    }
}