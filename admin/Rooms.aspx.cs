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


public partial class admin_Rooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddRoom.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteRoom();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditRoom.aspx?roomId=" + gvRooms.SelectedValue);
    }
    protected void btnImage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Image.aspx?roomId=" + gvRooms.SelectedValue);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void gvRooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.CssClass = btnUpdate.CssClass.Replace("disabled", "");
        btnDelete.CssClass = btnDelete.CssClass.Replace("disabled", "");
        btnImage.CssClass = btnImage.CssClass.Replace("disabled", "");
        //btnUpdate.Enabled = true;
        //btnDelete.Enabled = true;
    }

    private void deleteRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "DELETE FROM rooms WHERE roomID = @roomID;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomID", SqlDbType.Int).Value = gvRooms.SelectedValue;
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        conn.Close();
        Response.Redirect("~/Admin/Rooms.aspx");
    }
}