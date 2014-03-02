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

public partial class admin_AddRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        checkRoom();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Rooms.aspx");
    }

    private void checkRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomname FROM rooms WHERE roomname = @roomname";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomname", SqlDbType.VarChar).Value = txtRoomName.Text;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                lblCheck.Text = "Roomname " + dr["roomname"].ToString() + " already exists";
            }
        }
        else
        {
            addRoom();
            Response.Redirect("Rooms.aspx");
            conn.Close();
        }



    }

    private void addRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO rooms (roomName,roomDetails,roomLyingCapacity,roomMaxCapacity,roomPricePerNight,roomExcessofMax,roomStatus) VALUES (@roomName,@roomDetails,@roomLyingCapacity,@roomMaxCapacity,@roomPricePerNight,@roomExcessofMax,@roomStatus);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomName", SqlDbType.VarChar).Value = txtRoomName.Text;
        com.Parameters.Add("@roomDetails", SqlDbType.VarChar).Value = txtDetails.Text;
        com.Parameters.Add("@roomLyingCapacity", SqlDbType.Int).Value = txtLCapacity.Text;
        com.Parameters.Add("@roomMaxCapacity", SqlDbType.Int).Value = txtMCapacity.Text;
        com.Parameters.Add("@roomPricePerNight", SqlDbType.Decimal).Value = txtPrice.Text;
        com.Parameters.Add("@roomExcessofMax", SqlDbType.VarChar).Value = txtExcess.Text;
        com.Parameters.Add("@roomStatus", SqlDbType.VarChar).Value = ddlStatus.SelectedValue;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
    }
}