using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;//Hash
using System.Configuration;//web.config
using System.Data;//MySql
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Data.Odbc;

public partial class admin_AddEmployees : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        checkUser();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Users.aspx");
    }

    private void checkUser()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT username FROM users WHERE username = @username";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUsername.Text;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblCheck.Text = "Username " + dr["username"].ToString() + " already exists";
                }
            }
            else
            {
                addUser();
                Response.Redirect("Users.aspx");
                conn.Close();
            }
            
        
        
    }

    private void addUser()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO users (username,userPassword,userLName,userFName,userGender,userAddress,userCellPhone,userEmail,roleID) "+
            "VALUES (@username,@password,@LName,@FName,@Gender,@Address,@CellPhone,@Email,@Role);";
        string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUsername.Text;
        com.Parameters.Add("@password", SqlDbType.VarChar).Value = pwd;
        com.Parameters.Add("@LName", SqlDbType.VarChar).Value = txtLName.Text;
        com.Parameters.Add("@FName", SqlDbType.VarChar).Value = txtFName.Text;                                                                             //SQL SERVER
        com.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;                                                                           //(@username,@Password,@LName,@FName,@Gender,@Address,@CellPhone,@Email,@roleID)
        com.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
        com.Parameters.Add("@CellPhone", SqlDbType.VarChar).Value = txtCellPhone.Text;
        com.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
        com.Parameters.Add("@Role", SqlDbType.VarChar).Value = ddlRole.Text;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }
}