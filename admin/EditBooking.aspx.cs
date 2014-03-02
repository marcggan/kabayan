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

public partial class admin_EditBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            //Modal.Close(this, "OK");
            Response.Redirect("Bookings.aspx");
        }
        if (!IsPostBack)
        {
            getBooking();
            /*
            txtStart.Text = Convert.ToDateTime(Request.QueryString["start"]).ToShortDateString();
            txtEnd.Text = Convert.ToDateTime(Request.QueryString["end"]).ToShortDateString();*/
            getCustomers();
            getRooms();
            getPayment();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        
        int id = int.Parse(Request.QueryString["id"]);
        DateTime bstart = DateTime.Parse(txtStart.Text);
        DateTime bend = DateTime.Parse(txtEnd.Text);
        int guests = Convert.ToInt32(txtGuests.Text);
        if (!dbIsFree(id))
        {
            lblError.Text = "Date is already reserved";
        }
        else if (bstart > bend)
        {
            lblError.Text = "End date must be later than start date";
        }
        else if (checkCap() < guests)
        {
            lblError.Text = "Guests exceed maximum capacity of "+checkCap();
        }
        else
        {
            editBooking();
            Modal.Close(this, "OK");
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteBooking();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        //Response.Redirect("Users.aspx");
        Modal.Close(this, "OK");
    }
    private void editBooking()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE bookings SET customerID=@customerID,roomID=@roomID,bookingDate=@bookingDate,bookingStart=@bookingStart"+
        ",bookingEnd=@bookingEnd,bookingStatus=@bookingStatus,bookingGuests=@bookingGuests,paymentmethodid=@paymentmethod"+
        ",bookingPaid=@bookingPaid WHERE bookingId = @bookingId;";
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
        com.Parameters.Add("@bookingId", SqlDbType.Int).Value = Request.QueryString["id"];
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        //Response.Redirect("Bookings.aspx");
        
    }

    private void getBooking()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT customerID,roomID,bookingDate,bookingStart = CONVERT(VARCHAR(22),bookingStart,101), bookingEnd = CONVERT(VARCHAR(22),bookingEnd,101),bookingStatus,bookingGuests,paymentmethodid,bookingPaid FROM bookings WHERE BookingID = @bookingID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@bookingID", SqlDbType.Int).Value = Request.QueryString["Id"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                ddlCustomer.SelectedValue = dr["customerID"].ToString();
                ddlRoom.SelectedValue = dr["roomID"].ToString();
                txtStart.Text = dr["bookingStart"].ToString();
                txtEnd.Text = dr["bookingEnd"].ToString();
                ddlStatus.SelectedValue = dr["bookingStatus"].ToString();
                txtGuests.Text = dr["BookingGuests"].ToString();
                ddlPayment.SelectedValue = dr["paymentmethodId"].ToString();
                ddlPaid.SelectedValue = dr["bookingPaid"].ToString();
            }
        }
        
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
    private void deleteBooking()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "DELETE FROM bookings WHERE bookingID = @id;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@id", SqlDbType.Int).Value = Request.QueryString["Id"];
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        Modal.Close(this, "OK");
    }
    
    private bool dbIsFree(int id)
    {
        DateTime start = DateTime.Parse(txtStart.Text);
        DateTime end = DateTime.Parse(txtEnd.Text);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE NOT ((bookingEnd <= @start) OR (bookingStart >= @end)) AND roomId = @resource;";
        String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE (((@start >= bookingStart) AND (@start < bookingEnd)) OR ((@end > bookingStart) AND (@end <= bookingEnd)) OR ((@start < bookingStart) AND (@end > bookingEnd))) AND (roomID = @resource) AND (bookingID <> @id);";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@start", start);
        da.SelectCommand.Parameters.AddWithValue("@end", end);
        da.SelectCommand.Parameters.AddWithValue("@resource", ddlRoom.SelectedValue);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
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