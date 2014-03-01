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

public partial class admin_EditRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["roomId"] == null)
        {
            Response.Redirect("Rooms.aspx");
        }
        if (!IsPostBack)
        {
            GetRoom();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        editRoom();
    }
    protected void btnCancel_Click(object seder, EventArgs e)
    {
        Response.Redirect("Rooms.aspx");
    }
    private void editRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "UPDATE rooms SET roomName=@roomName,roomDetails=@roomDetails,roomLyingCapacity=@roomLyingCapacity,roomMaxCapacity=@roomMaxCapacity,roomPricePerNight=@roomPricePerNight,roomExcessofMax=@roomExcessofMax,roomStatus=@roomStatus WHERE roomID=@ID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomName", SqlDbType.VarChar).Value = txtRoomName.Text;
        com.Parameters.Add("@roomDetails", SqlDbType.VarChar).Value = txtDetails.Text;
        com.Parameters.Add("@roomLyingCapacity", SqlDbType.Int).Value = txtLCapacity.Text;
        com.Parameters.Add("@roomMaxCapacity", SqlDbType.Int).Value = txtMCapacity.Text;
        com.Parameters.Add("@roomPricePerNight", SqlDbType.Decimal).Value = txtPrice.Text;
        com.Parameters.Add("@roomExcessofMax", SqlDbType.VarChar).Value = txtExcess.Text;
        com.Parameters.Add("@roomStatus", SqlDbType.VarChar).Value = ddlStatus.SelectedValue;
        com.Parameters.Add("@ID", SqlDbType.VarChar).Value = Request.QueryString["roomId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        conn.Close();
        Response.Redirect("Rooms.aspx");
    }
    private void GetRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT roomName,roomDetails,roomLyingCapacity,roomMaxCapacity,roomPricePerNight,roomExcessofMax,roomStatus FROM rooms WHERE roomID = @roomId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomId", SqlDbType.Int).Value = Request.QueryString["roomId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtRoomName.Text = dr["roomName"].ToString();
                txtDetails.Text = dr["roomDetails"].ToString();
                txtLCapacity.Text = dr["roomLyingCapacity"].ToString();
                txtMCapacity.Text = dr["roomMaxCapacity"].ToString();
                txtPrice.Text = dr["roomPricePerNight"].ToString();
                txtExcess.Text = dr["roomExcessofMax"].ToString();
                ddlStatus.SelectedValue = dr["roomStatus"].ToString();
            }
        }
    }
}