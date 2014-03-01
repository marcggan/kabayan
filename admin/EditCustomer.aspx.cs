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

public partial class admin_EditCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["customerId"] == null)
        {
            Response.Redirect("Customers.aspx");
        }
        if (!IsPostBack)
        {
            GetCustomer();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        editCustomer();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Customers.aspx");
    }
    private void editCustomer()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE customers SET customerLName=@LName,customerFName=@FName,customerGender=@Gender,customerAddress=@Address,customerCellPhone=@CellPhone,customerEmail=@Email WHERE customerID=@ID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@LName", SqlDbType.VarChar).Value = txtLName.Text;
        com.Parameters.Add("@FName", SqlDbType.VarChar).Value = txtFName.Text;
        com.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;
        com.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
        com.Parameters.Add("@CellPhone", SqlDbType.VarChar).Value = txtCellPhone.Text;
        com.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
        com.Parameters.Add("@ID", SqlDbType.VarChar).Value = Request.QueryString["customerId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        conn.Close();
        Response.Redirect("Customers.aspx");
    }
    private void GetCustomer()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT customerLName,customerFName,customerGender,customerAddress,customerCellPhone,customerEmail FROM customers WHERE customerID = @customerId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@customerId", SqlDbType.Int).Value = Request.QueryString["customerId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtLName.Text = dr["customerLname"].ToString();
                txtFName.Text = dr["customerFname"].ToString();
                ddlGender.SelectedValue = dr["customerGender"].ToString();
                txtAddress.Text = dr["customerAddress"].ToString();
                txtCellPhone.Text = dr["customerCellPhone"].ToString();
                txtEmail.Text = dr["customerEmail"].ToString();
            }
        }


    }
}