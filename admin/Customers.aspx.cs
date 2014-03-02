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

public partial class admin_Customers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCustomer.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteCustomer();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditCustomer.aspx?customerId=" + gvCustomers.SelectedValue);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.CssClass = btnUpdate.CssClass.Replace("disabled", "");
        btnDelete.CssClass = btnDelete.CssClass.Replace("disabled", "");
        //btnUpdate.Enabled = true;
        //btnDelete.Enabled = true;
    }

    private void deleteCustomer()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "DELETE FROM customers WHERE customerID = @customerID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = gvCustomers.SelectedValue;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("~/Admin/Customers.aspx");
    }
}