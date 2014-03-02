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

public partial class admin_EditService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["serviceId"] == null)
        {
            Response.Redirect("Services.aspx");
        }
        if (!IsPostBack)
        {
            GetService();
            getCategories();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        editService();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Services.aspx");
    }
    private void editService()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE services SET serviceName=@serviceName,categoryID=@categoryID,serviceDescription=@serviceDescription,servicePrice=@servicePrice,serviceCapacity=@serviceCapacity WHERE serviceID=@ID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@serviceName", SqlDbType.VarChar).Value = txtServiceName.Text;
        com.Parameters.Add("@categoryID", SqlDbType.Int).Value = ddlCategory.SelectedValue;
        com.Parameters.Add("@serviceDescription", SqlDbType.VarChar).Value = txtDescription.Text;
        com.Parameters.Add("@servicePrice", SqlDbType.Decimal).Value = txtPrice.Text;
        com.Parameters.Add("@serviceCapacity", SqlDbType.Int).Value = txtCapacity.Text;
        com.Parameters.Add("@ID", SqlDbType.VarChar).Value = Request.QueryString["serviceId"];
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("Services.aspx");
    }
    private void GetService()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT serviceName,categoryID,serviceDescription,servicePrice,serviceCapacity FROM services WHERE serviceID = @serviceId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@serviceId", SqlDbType.Int).Value = Request.QueryString["serviceId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtServiceName.Text = dr["serviceName"].ToString();
                ddlCategory.SelectedValue = dr["categoryID"].ToString();
                txtDescription.Text = dr["serviceDescription"].ToString();
                txtPrice.Text = dr["servicePrice"].ToString();
                txtCapacity.Text = dr["serviceCapacity"].ToString();
            }
        }
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