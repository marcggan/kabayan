using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;//web.config
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
//using System.Data.Odbc;

public partial class admin_AddBooking : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["start"] == null || Request.QueryString["end"] == null || Request.QueryString["r"] == null)
        {
            //Modal.Close(this, "OK");
            Response.Redirect("Bookings.aspx");
        }
        if (!IsPostBack)
        {
            txtStart.Text = Convert.ToDateTime(Request.QueryString["start"]).ToShortDateString();
            txtEnd.Text = Convert.ToDateTime(Request.QueryString["end"]).ToShortDateString();
            getCustomers();
            getRooms();
            getPayment();
            txtGuests.Text = "1";
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //string start = Request.QueryString["start"];
        //string end = Request.QueryString["end"];
        DateTime bstart = DateTime.Parse(txtStart.Text);
        DateTime bend = DateTime.Parse(txtEnd.Text);
        string resource = Request.QueryString["r"];
        int guests = Convert.ToInt32(txtGuests.Text);
        if (!dbIsFree(bstart, bend, resource))
        {
            lblError.Text = "Date is already reserved";
        }
        else if (bstart > bend)
        {
            lblError.Text = "End date must be later than start date";
        }
        else if (checkCap() < guests){
            lblError.Text = "Guests exceed maximum capacity of " + checkCap();
        }
        else
        {
            addBooking();
            Modal.Close(this, "OK");
        }
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Modal.Close(this, "OK");
    }

    private void addBooking()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO bookings (customerID,roomID,bookingDate,bookingStart,bookingEnd,bookingStatus,bookingGuests,paymentmethodid,bookingPaid) VALUES (@customerID,@roomID,@bookingDate,@bookingStart,@bookingEnd,@bookingStatus,@bookingGuests,@paymentmethod,@bookingPaid);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = ddlCustomer.SelectedValue;
        com.Parameters.Add("@roomID", SqlDbType.Int).Value = ddlRoom.SelectedValue;
        com.Parameters.Add("@bookingDate", SqlDbType.DateTime).Value = DateTime.Now;
        com.Parameters.Add("@bookingStart", SqlDbType.DateTime).Value = txtStart.Text;                                                                             //SQL SERVER
        com.Parameters.Add("@bookingEnd", SqlDbType.DateTime).Value = txtEnd.Text;                                                                           //(@username,@Password,@LName,@FName,@Gender,@Address,@CellPhone,@Email,@roleID)
        com.Parameters.Add("@bookingStatus", SqlDbType.Int).Value = ddlStatus.SelectedValue;
        com.Parameters.Add("@bookingGuests", SqlDbType.Int).Value = txtGuests.Text;
        com.Parameters.Add("@paymentmethod", SqlDbType.Int).Value = ddlPayment.SelectedValue;
        com.Parameters.Add("@bookingPaid", SqlDbType.Int).Value = ddlPaid.SelectedValue;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        conn.Close();
    }
    private void getCustomers()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT customerID,customerLName + ', ' + customerFname AS customerName FROM customers";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlCustomer.DataSource = dt;
        ddlCustomer.DataTextField = "customerName";
        ddlCustomer.DataValueField = "customerId";
        ddlCustomer.DataBind();
    }
    private void getRooms()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomID,roomName FROM rooms";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlRoom.DataSource = dt;
        ddlRoom.DataTextField = "RoomName";
        ddlRoom.DataValueField = "RoomId";
        ddlRoom.SelectedValue = Request.QueryString["r"];
        ddlRoom.DataBind();
    }
    private void getPayment()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT paymentmethodID,paymentmethod FROM paymentmethods";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlPayment.DataSource = dt;
        ddlPayment.DataTextField = "paymentmethod";
        ddlPayment.DataValueField = "paymentmethodId";
        ddlPayment.DataBind();
    }
    private bool dbIsFree(DateTime bstart, DateTime bend, string resource)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE NOT ((bookingEnd <= @start) OR (bookingStart >= @end)) AND roomId = @resource;";
        String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE (((@start >= bookingStart) AND (@start < bookingEnd)) OR ((@end > bookingStart) AND (@end <= bookingEnd)) OR ((@start < bookingStart) AND (@end > bookingEnd))) AND (roomID = @resource);";

        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@start", bstart);
        da.SelectCommand.Parameters.AddWithValue("@end", bend);
        da.SelectCommand.Parameters.AddWithValue("@resource", ddlRoom.SelectedValue);
        DataTable dt = new DataTable();
        da.Fill(dt);

        int count = Convert.ToInt32(dt.Rows[0]["count"]);
        return count == 0;
    }
    private int checkCap()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomMaxCapacity+roomExcessofMax AS cap FROM rooms WHERE roomID = @roomId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.AddWithValue("@roomId", ddlRoom.SelectedValue);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        int cap = 0;
        if (dr.Read())
        {
            cap = Convert.ToInt32(dr["cap"]);
            conn.Close();
        }
        else
        {
            cap = 0;
        }
        return cap;
    }
}