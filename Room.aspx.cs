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

public partial class Room : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String cmdText = "SELECT rooms.roomId,rooms.roomname,rooms.roomDetails,rooms.roomLyingCapacity,rooms.roomMaxCapacity,rooms.roomExcessofMax,rooms.roomPricePerNight,images.imagepath FROM images INNER JOIN rooms ON images.roomId = rooms.roomId WHERE images.imageBest = 1;";
            getAllRooms(cmdText);
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        divRooms.InnerHtml = null;
        string c = txtCapacity.Text;
        String cmdText = "SELECT rooms.roomId,rooms.roomname,rooms.roomDetails,rooms.roomLyingCapacity,rooms.roomMaxCapacity,rooms.roomExcessofMax,rooms.roomPricePerNight,images.imagepath FROM images INNER JOIN rooms ON images.roomId = rooms.roomId WHERE images.imageBest = 1 AND rooms.roomLyingCapacity >= " + c + " ORDER BY roomLyingCapacity;";
        getAllRooms(cmdText);
    }
    private void getAllRooms(string cmdText)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand com = new SqlCommand(cmdText, conn);
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {//<div class="col-xs-3 divimg"><div class="show"></div><img class="image" src="test/adelfa1.jpg"/></div>
            string imageurl = dr["imagePath"].ToString();
            imageurl = imageurl.Substring(2, imageurl.Length - 2);
            string html =
    "    <div class='col-xs-6 col-md-3 divimg'>" +
    "        <div class='show'>"+
    "            Description: <b>" + dr["roomDetails"] + "</b><br />" +
    "            Lying Capacity: <b>" + dr["roomLyingCapacity"] + "</b><br />" +
    "            Maximum Capacity without charge: <b>" + dr["roomMaxCapacity"] + "</b><br />" +
    "            Excess to the max allowed: <b>" + dr["roomExcessofMax"] + "</b><br />" +
    "            Price Per Night: <b>" + dr["roomPricePerNight"] + "</b><br />" +
    "            <a href='Book.aspx?roomId="+dr["roomId"]+"' class='btn btn-primary btn-block button' >Book Now</a>"+
    "        </div>"+
    "        <div>"+
    "            <img class='image' src='" + imageurl + "'/>" +
    "        </div>"+
    "        <div class='head'>"+
    "            <h4>"+dr["roomname"]+"</h4>"+
    "        </div>"+
    "    </div>";
            divRooms.InnerHtml += html;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        
        divRooms.InnerHtml = null;
        String cmdText = "SELECT rooms.roomId,rooms.roomname,rooms.roomDetails,rooms.roomLyingCapacity,rooms.roomMaxCapacity,rooms.roomExcessofMax,rooms.roomPricePerNight,images.imagepath FROM images INNER JOIN rooms ON images.roomId = rooms.roomId WHERE images.imageBest = 1;";
        getAllRooms(cmdText);
    }
}