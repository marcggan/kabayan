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

public partial class admin_Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddService.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteService();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditService.aspx?serviceId=" + gvServices.SelectedValue);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void gvServices_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.CssClass = btnUpdate.CssClass.Replace("disabled", "");
        btnDelete.CssClass = btnDelete.CssClass.Replace("disabled", "");
        //btnUpdate.Enabled = true;
        //btnDelete.Enabled = true;
    }

    private void deleteService()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "DELETE FROM services WHERE serviceID = @serviceID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@serviceID", SqlDbType.Int).Value = gvServices.SelectedValue;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        conn.Close();
        Response.Redirect("~/Admin/Services.aspx");
    }
}