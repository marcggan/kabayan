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

public partial class admin_AddCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        addCustomer();
        Response.Redirect("Customers.aspx");
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Customers.aspx");
    }
    private void addCustomer()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO customers (customerLName,customerFName,customerGender,customerAddress,customerCellPhone,customerEmail) " +
            "VALUES (@LName,@FName,@Gender,@Address,@CellPhone,@Email);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@LName", SqlDbType.VarChar).Value = txtLName.Text;
        com.Parameters.Add("@FName", SqlDbType.VarChar).Value = txtFName.Text;
        com.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;
        com.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
        com.Parameters.Add("@CellPhone", SqlDbType.VarChar).Value = txtCellPhone.Text;
        com.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
    }
}