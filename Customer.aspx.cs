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

public partial class Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["customerName"] != null)
        {
            lblWelcome.Text = "Welcome back, " + Session["customerName"].ToString();
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {
            getAllRooms();
        }
    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        DateTime bstart = DateTime.Parse(txtCheckIn.Text);
        DateTime bend = DateTime.Parse(txtCheckOut.Text);
        string room = ddlRoom.SelectedValue;
        int guests = Convert.ToInt32(txtCapacity.Text);
        if (!dbIsFree(bstart, bend, room))
        {
            lblErrorCap.Text = null;
            lblError.Text = "Date is already reserved";
            lblErrorDate.Text = "Date is already reserved";
        }
        else if (bstart > bend)
        {
            lblErrorCap.Text = null;
            lblError.Text = "End date must be later than start date";
            lblErrorDate.Text = "End date must be later than start date";
        }
        else if (checkCap() < guests)
        {
            lblError.Text = null;
            lblErrorDate.Text = null;
            lblError.Text = "Guests exceeds maximum capacity of " + checkCap();
            lblErrorCap.Text = "Guests exceeds maximum capacity of " + checkCap();
        }
        else
        {
            lblErrorCap.Text = null;
            lblErrorDate.Text = null;
            lblError.Text = "Booking Successful";
            addBooking();
        }
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
    private void addBooking()
    {
        DateTime checkin = DateTime.Parse(txtCheckIn.Text);
        DateTime checkout = DateTime.Parse(txtCheckOut.Text);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO bookings (customerID,roomID,bookingDate,bookingStart,bookingEnd,bookingStatus,bookingGuests,paymentmethodid,bookingPaid) VALUES (@customerID,@roomID,@bookingDate,@bookingStart,@bookingEnd,@bookingStatus,@bookingGuests,@paymentmethod,@bookingPaid);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@customerID", SqlDbType.Int).Value = Session["customerId"].ToString();
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
    private bool dbIsFree(DateTime bstart, DateTime bend, string room)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE NOT ((bookingEnd <= @start) OR (bookingStart >= @end)) AND roomId = @resource;";
        String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE (((@start >= bookingStart) AND (@start < bookingEnd)) OR ((@end > bookingStart) AND (@end <= bookingEnd)) OR ((@start < bookingStart) AND (@end > bookingEnd))) AND (roomID = @room);";

        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@start", bstart);
        da.SelectCommand.Parameters.AddWithValue("@end", bend);
        da.SelectCommand.Parameters.AddWithValue("@room", ddlRoom.SelectedValue);
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