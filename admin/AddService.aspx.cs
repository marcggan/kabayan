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

public partial class admin_AddService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getCategories();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        addService();
        Response.Redirect("Services.aspx");

    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Services.aspx");
    }

    private void addService()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO services (serviceName,categoryID,serviceDescription,servicePrice,serviceCapacity) VALUES (@serviceName,@categoryID,@serviceDescription,@servicePrice,@serviceCapacity);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@serviceName", SqlDbType.VarChar).Value = txtServiceName.Text;
        com.Parameters.Add("@categoryID", SqlDbType.Int).Value = ddlCategory.SelectedValue;
        com.Parameters.Add("@serviceDescription", SqlDbType.VarChar).Value = txtDescription.Text;
        com.Parameters.Add("@servicePrice", SqlDbType.Decimal).Value = txtPrice.Text;
        com.Parameters.Add("@serviceCapacity", SqlDbType.Int).Value = txtCapacity.Text;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }
    private void getCategories()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT categoryID, categoryName FROM categories";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "categoryName";
        ddlCategory.DataValueField = "categoryId";
        ddlCategory.DataBind();
    }
}