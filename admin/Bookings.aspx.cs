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
using System.Drawing;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Data;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events.Scheduler;


public partial class admin_Bookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Browser.Browser == "Firefox") Response.Cache.SetNoStore();

        DayPilotScheduler1.Separators.Clear();
        DayPilotScheduler1.Separators.Add(DateTime.Today, Color.Red);
        LoadResources();
        if (!IsPostBack)
        {

            DayPilotScheduler1.StartDate = new DateTime(DateTime.Today.Year, 1, 1);
            DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
            DayPilotScheduler1.DataBind();

            // scroll to this month
            DateTime firstOfMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            DayPilotScheduler1.SetScrollX(firstOfMonth);
        }
    }


    protected void DayPilotScheduler1_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
    {
        string id = e.Value;
        DateTime start = e.NewStart;
        DateTime end = e.NewEnd;
        string resource = e.NewResource;

        string message = null;

        if (!dbIsFree(id, start, end, resource))
        {
            message = "The reservation cannot overlap with an existing reservation.";
        }
        else if (e.OldEnd <= DateTime.Today)
        {
            message = "This reservation cannot be changed anymore.";
        }
        else if (e.OldStart < DateTime.Today)
        {
            if (e.OldResource != e.NewResource)
            {
                message = "The room cannot be changed anymore.";
            }
            else
            {
                message = "The reservation start cannot be changed anymore.";
            }
        }
        else if (e.NewStart < DateTime.Today)
        {
            message = "The reservation cannot be moved to the past.";
        }
        else
        {
            dbUpdateEvent(id, start, end, resource);
            //message = "Reservation moved.";
        }

        DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
        DayPilotScheduler1.DataBind();
        DayPilotScheduler1.UpdateWithMessage(message);
    }
    private DataTable dbGetEvents(DateTime start, int days)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        String cmdtext = "SELECT bookings.bookingID, bookings.customerID, bookings.roomID , customers.customerLName,', ' , customers.customerFName AS customerName,rooms.roomName,bookings.bookingDate,bookings.bookingStart,bookings.bookingEnd,bookings.bookingStatus,bookings.bookingGuests,paymentmethods.paymentmethod,bookings.bookingPaid FROM bookings " +
        "INNER JOIN customers ON bookings.customerID = customers.customerID " +
        "INNER JOIN rooms ON bookings.roomID = rooms.roomID " +
        "INNER JOIN paymentmethods ON bookings.paymentmethodID = paymentmethods.paymentmethodID WHERE NOT ((bookingEnd <= @start) OR (bookingStart >= @end));";
        
        //String cmdtext = "SELECT bookingID, customerID,roomID,bookingDate,bookingStart,bookingEnd,bookingStatus,bookingGuests,paymentmethodId,bookingPaid FROM bookings WHERE NOT ((bookingEnd <= ?) OR (bookingStart >= ?));";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@start", start);
        da.SelectCommand.Parameters.AddWithValue("@end", start.AddDays(days));
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    private void dbUpdateEvent(string id, DateTime start, DateTime end, string resource)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE bookings SET bookingStart = @start, bookingEnd=@end, roomId=@resource WHERE bookingId = @id;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.AddWithValue("@start", start);
        com.Parameters.AddWithValue("@end", end);
        com.Parameters.AddWithValue("@resource", resource);
        com.Parameters.AddWithValue("@id", id);
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }

    private bool dbIsFree(string id, DateTime start, DateTime end, string resource)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT count(bookingId) as count FROM bookings WHERE NOT ((bookingEnd <= @start) OR (bookingStart >= @end)) AND roomId = @resource AND bookingId <> @id;";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@start", start);
        da.SelectCommand.Parameters.AddWithValue("@end", end);
        da.SelectCommand.Parameters.AddWithValue("@resource", resource);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        DataTable dt = new DataTable();
        da.Fill(dt);

        int count = Convert.ToInt32(dt.Rows[0]["count"]);
        return count == 0;
    }


    private void LoadResources()
    {
        DayPilotScheduler1.Resources.Clear();

        string roomFilter = "0";
        if (DayPilotScheduler1.ClientState["filter"] != null)
        {
            roomFilter = (string)DayPilotScheduler1.ClientState["filter"]["room"];
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomId, roomName, roomLyingCapacity, roomStatus FROM rooms WHERE roomLyingCapacity = @rooms or @rooms = 0;";
        SqlDataAdapter da = new SqlDataAdapter(cmdtext, conn);
        da.SelectCommand.Parameters.AddWithValue("@rooms", roomFilter);
        DataTable dt = new DataTable();
        da.Fill(dt);

        foreach (DataRow r in dt.Rows)
        {
            string name = (string)r["roomName"];
            string id = Convert.ToString(r["roomId"]);
            string status = (string)r["roomStatus"];
            int beds = Convert.ToInt32(r["roomLyingCapacity"]);
            //string bedsFormatted = (beds == 1) ? "1 bed" : String.Format("{0} beds", beds);

            Resource res = new Resource(name, id);
            res.DataItem = r;
            //res.Columns.Add(new ResourceColumn(bedsFormatted));
            res.Columns.Add(new ResourceColumn(status));

            DayPilotScheduler1.Resources.Add(res);
        }

    }

    protected void DayPilotScheduler1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
    {
        switch (e.Command)
        {
            case "refresh":
                DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
                DayPilotScheduler1.DataBind();
                DayPilotScheduler1.Update();
                break;
            case "filter":
                LoadResources();
                DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
                DayPilotScheduler1.DataBind();
                DayPilotScheduler1.Update();
                break;
        }
    }

    protected void DayPilotScheduler1_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
    {
        string id = e.Value;
        DateTime start = e.NewStart;
        DateTime end = e.NewEnd;
        string resource = e.Resource;

        string message = null;

        if (!dbIsFree(id, start, end, resource))
        {
            message = "The reservation cannot overlap with an existing reservation.";
        }
        else if (e.OldEnd <= DateTime.Today)
        {
            message = "This reservation cannot be changed anymore.";
        }
        else if (e.OldStart != e.NewStart)
        {
            if (e.OldStart < DateTime.Today)
            {
                message = "The reservation start cannot be changed anymore.";
            }
            else if (e.NewStart < DateTime.Today)
            {
                message = "The reservation cannot be moved to the past.";
            }
            else
            {
                dbUpdateEvent(id, start, end, resource);
            }

        }
        else
        {
            dbUpdateEvent(id, start, end, resource);
            //message = "Reservation updated.";
        }

        DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
        DayPilotScheduler1.DataBind();
        DayPilotScheduler1.UpdateWithMessage(message);
    }
    protected void DayPilotScheduler1_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.Scheduler.BeforeEventRenderEventArgs e)
    {
        //e.InnerHTML
        e.Html = String.Format("{0} ({1:d} - {2:d})", e.Text, e.Start, e.End);
        int status = Convert.ToInt32(e.Tag["bookingStatus"]);

        switch (status)
        {
            case 0: // new
                if (e.Start < DateTime.Today.AddDays(2)) // must be confirmed two day in advance
                {
                    e.DurationBarColor = "red";
                    e.ToolTip = "Expired (not confirmed in time)";
                }
                else
                {
                    e.DurationBarColor = "orange";
                    e.ToolTip = "New";
                }
                break;
            case 1:  // confirmed
                if (e.Start < DateTime.Today || (e.Start == DateTime.Today && DateTime.Now.TimeOfDay.Hours > 18))  // must arrive before 6 pm
                {
                    e.DurationBarColor = "#f41616";  // red
                    e.ToolTip = "Late arrival";
                }
                else
                {
                    e.DurationBarColor = "green";
                    e.ToolTip = "Confirmed";
                }
                break;
            case 2: // arrived
                if (e.End < DateTime.Today || (e.End == DateTime.Today && DateTime.Now.TimeOfDay.Hours > 11))  // must checkout before 10 am
                {
                    e.DurationBarColor = "#f41616"; // red
                    e.ToolTip = "Late checkout";
                }
                else
                {
                    e.DurationBarColor = "#1691f4";  // blue
                    e.ToolTip = "Checked In";
                }
                break;
            case 3: // checked out
                e.DurationBarColor = "gray";
                e.ToolTip = "Checked Out";
                break;
            default:
                throw new ArgumentException("Unexpected status.");
        }
        //e.InnerHTML
        e.Html = e.Html + String.Format("<br /><span style='color:gray'>{0}</span>", e.ToolTip);


        int paid = Convert.ToInt32(e.DataItem["bookingPaid"]);
        string paidColor = "#aaaaaa";

        e.Areas.Add(new Area().Bottom(10).Right(4).Html("<div style='color:" + paidColor + "; font-size: 8pt;'>Paid: " + paid + "%</div>").Visibility(AreaVisibility.Visible));
        e.Areas.Add(new Area().Left(4).Bottom(8).Right(4).Height(2).Html("<div style='background-color:" + paidColor + "; height: 100%; width:" + paid + "%'></div>").Visibility(AreaVisibility.Visible));
    }

    protected void DayPilotScheduler1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs e)
    {
        if (e.IsBusiness)
        {
            e.BackgroundColor = "#ffffff";
        }
        else
        {
            e.BackgroundColor = "#f8f8f8";
        }
    }

    protected void DayPilotScheduler1_BeforeResHeaderRender(object sender, BeforeResHeaderRenderEventArgs e)
    {
        
        string status = (string)e.DataItem["roomStatus"];
        switch (status)
        {
            case "Dirty":
                e.CssClass = "status_dirty";
                break;
            case "Maintenance":
                e.CssClass = "status_maintenance";
                break;
        }
         
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}