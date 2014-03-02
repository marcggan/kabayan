using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getAllRooms();
        }
    }
    protected void btnRoom_Click(object sender, EventArgs e)
    {

    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        addCustomer();
    }
    private void getAllRooms()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomID,roomname FROM rooms";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlRoom.DataSource = dt;
        ddlRoom.DataTextField = "roomname";
        ddlRoom.DataValueField = "roomId";
        ddlRoom.DataBind();
    }
    private void suggestRoom()
    {

    }
    private void addCustomer()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO customers (customerLName,customerFName,customerGender,customerAddress,customerCellPhone,customerEmail) " +
            "VALUES (@LName,@FName,@Gender,@Address,@CellPhone,@Email);" +
            "SELECT SCOPE_IDENTITY() AS customerID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@LName", SqlDbType.VarChar).Value = txtLName.Text;
        com.Parameters.Add("@FName", SqlDbType.VarChar).Value = txtFName.Text;
        com.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;
        com.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
        com.Parameters.Add("@CellPhone", SqlDbType.VarChar).Value = txtCellPhone.Text;
        com.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            string customerId = dr["customerID"].ToString();
            addBooking(customerId);
        }
    }
    private void addBooking(string customerId)
    {
        DateTime checkin = DateTime.Parse(txtCheckIn.Text);
        DateTime checkout = DateTime.Parse(txtCheckOut.Text);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO bookings (customerID,roomID,bookingDate,bookingStart,bookingEnd,bookingStatus,bookingGuests,paymentmethodid,bookingPaid) VALUES (@customerID,@roomID,@bookingDate,@bookingStart,@bookingEnd,@bookingStatus,@bookingGuests,@paymentmethod,@bookingPaid);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = customerId;
        com.Parameters.Add("@roomID", SqlDbType.Int).Value = ddlRoom.SelectedValue;
        com.Parameters.Add("@bookingDate", SqlDbType.DateTime).Value = DateTime.Now;
        com.Parameters.Add("@bookingStart", SqlDbType.DateTime).Value = checkin;                                                                             //SQL SERVER
        com.Parameters.Add("@bookingEnd", SqlDbType.DateTime).Value = checkout;                                                                           //(@username,@Password,@LName,@FName,@Gender,@Address,@CellPhone,@Email,@roleID)
        com.Parameters.Add("@bookingStatus", SqlDbType.Int).Value = 1;
        com.Parameters.Add("@bookingGuests", SqlDbType.Int).Value = txtCapacity.Text;
        com.Parameters.Add("@paymentmethod", SqlDbType.Int).Value = ddlPayment.SelectedValue;
        com.Parameters.Add("@bookingPaid", SqlDbType.Int).Value = 0;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }
}