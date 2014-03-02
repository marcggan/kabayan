using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;//web.config
using System.Data;//MySql
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Data.Odbc;

public partial class admin_EditUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["userId"] == null)
        {
            Response.Redirect("Users.aspx");
        }
        if (!IsPostBack)
        {
            GetUser();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        editUser();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Users.aspx");
    }
    private void editUser()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE users SET username=@username,userLName=@LName,userFName=@FName,userGender=@Gender,userAddress=@Address,userCellPhone=@CellPhone,userEmail=@Email,roleID=@Role WHERE userID=@ID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUsername.Text;
        com.Parameters.Add("@LName", SqlDbType.VarChar).Value = txtLName.Text;
        com.Parameters.Add("@FName", SqlDbType.VarChar).Value = txtFName.Text;                                                                             //SQL SERVER
        com.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;                                                                           //(@username,@Password,@LName,@FName,@Gender,@Address,@CellPhone,@Email,@roleID)
        com.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
        com.Parameters.Add("@CellPhone", SqlDbType.VarChar).Value = txtCellPhone.Text;
        com.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
        com.Parameters.Add("@Role", SqlDbType.VarChar).Value = ddlRole.Text;
        com.Parameters.Add("@ID", SqlDbType.VarChar).Value = Request.QueryString["userId"];
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("Users.aspx");
    }
    private void GetUser()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT username,userPassword,userLName,userFName,userGender,userAddress,userCellPhone,userEmail,roleID FROM users WHERE userID = @userId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@userId", SqlDbType.Int).Value = Request.QueryString["userId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtUsername.Text = dr["username"].ToString();
                txtLName.Text = dr["userLname"].ToString();
                txtFName.Text = dr["userFname"].ToString();
                ddlGender.SelectedValue = dr["userGender"].ToString();
                txtAddress.Text = dr["userAddress"].ToString();
                txtCellPhone.Text = dr["userCellPhone"].ToString();
                txtEmail.Text = dr["userEmail"].ToString();
                ddlRole.SelectedValue = dr["roleID"].ToString();
            }
        }


    }
}