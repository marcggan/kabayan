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


public partial class admin_Employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddUser.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteUser();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditUser.aspx?userId=" + gvUsers.SelectedValue);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.CssClass = btnUpdate.CssClass.Replace("disabled", "");
        btnDelete.CssClass = btnDelete.CssClass.Replace("disabled", "");
        //btnUpdate.Enabled = true;
        //btnDelete.Enabled = true;
    }

    private void deleteUser()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "DELETE FROM users WHERE userID = @userID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@userID", SqlDbType.Int).Value = gvUsers.SelectedValue;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("~/Admin/Users.aspx");
    }
}