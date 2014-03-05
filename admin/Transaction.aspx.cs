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

public partial class Transaction : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            SqlDataSource.SelectParameters["bookingId"].DefaultValue = Request.QueryString["bookingId"];
            getServices();
            lblSum.Text = getSum().ToString();
            int total = getBooking() + getSum();
            lblServBook.Text = total.ToString();
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteTransaction();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Modal.Close(this, "OK");
    }
    protected void gvTransactions_SelectedIndexChanged(object sender, EventArgs e)
    {
        //btnUpdate.CssClass = btnUpdate.CssClass.Replace("disabled", "");
        btnDelete.CssClass = btnDelete.CssClass.Replace("disabled", "");
    }

    private void deleteTransaction()
    {
        
        String cmdtext = "DELETE FROM transactions WHERE transactionID = @transactionID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@transactionID", SqlDbType.Int).Value = gvTransactions.SelectedValue;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        gvTransactions.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String cmdtext = "INSERT INTO transactions (bookingId, serviceId) VALUES (@bookingId, @serviceId);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@bookingId", SqlDbType.Int).Value = Request.QueryString["bookingId"];
        com.Parameters.Add("@serviceId", SqlDbType.Int).Value = ddlService.SelectedValue;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        gvTransactions.DataBind();
    }
    private void getServices()
    {
        String cmdtext = "SELECT ServiceID,ServiceName FROM Services";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlService.DataSource = dt;
        ddlService.DataTextField = "ServiceName";
        ddlService.DataValueField = "ServiceId";
        ddlService.DataBind();
    }
    private int getBooking()
    {
        String cmdtext = "SELECT bookings.bookingId, customers.customerLName +', '+customers.customerFName AS customerName, "+
        "bookings.bookingStart, bookings.bookingEnd, DATEDIFF(DAY, bookings.bookingStart, bookings.bookingEnd) AS bookingDays, "+
        "rooms.roomName, rooms.roomPricePerNight, rooms.roomPricePerNight * DATEDIFF(DAY, bookings.bookingStart, bookings.bookingEnd) AS TotalPrice "+
        "FROM bookings "+
        "INNER JOIN customers ON customers.customerID = bookings.customerID "+
        "INNER JOIN rooms ON bookings.roomID = rooms.roomId " +
        "WHERE bookingId = 12;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        int bookprice = 0;
        while (dr.Read())
        {
            lblName.Text = dr["customerName"].ToString();
            lblStart.Text = dr["bookingStart"].ToString();
            lblEnd.Text = dr["bookingEnd"].ToString();
            lblDays.Text = dr["bookingDays"].ToString();
            lblRoom.Text = dr["roomName"].ToString();
            lblDays.Text = dr["bookingDays"].ToString();
            lblPrice.Text = dr["roomPricePerNight"].ToString();
            bookprice = Convert.ToInt32(dr["TotalPrice"]);
            lblTotal.Text = dr["TotalPrice"].ToString();
        }
        conn.Close();
        return bookprice;
    }
    private int getSum()
    {
        String cmdtext = "SELECT SUM(services.servicePrice) AS sum FROM transactions INNER JOIN services ON transactions.serviceId = services.serviceId WHERE bookingId = @bookingId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        conn.Open();
        com.Parameters.Add("@bookingId", SqlDbType.Int).Value = Request.QueryString["bookingId"];
        SqlDataReader dr = com.ExecuteReader();
        int sum = 0;
        while (dr.Read())
        {
            sum = Convert.ToInt32(dr["sum"]);
        }
        conn.Close();
        return sum;
    }
}