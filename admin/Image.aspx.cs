using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;
using System.Configuration;//web.config
using System.Data;//MySql
using System.Data.Sql;
using System.Data.SqlClient;

public partial class admin_Image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["roomId"] == null || Request.QueryString["roomId"] == "")
        {
            Response.Redirect("Rooms.aspx");
        }
        if (!IsPostBack)
        {
            lblRoom.Text = getRoom();
            txtImagename.Text = getRoom();
            getImages();
            /*
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Images/"));
            List<ListItem> files = new List<ListItem>();
            foreach (string filePath in filePaths)
            {
                string fileName = Path.GetFileName(filePath);
                files.Add(new ListItem(fileName, "~/Images/" + fileName));
            }
            GridView1.DataSource = files;
            GridView1.DataBind();
             * */
        }
    }

    protected void Upload(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName);
            string path = "~/images/" + fileName;
            addImage(path);
            Response.Redirect(Request.Url.AbsoluteUri);
            
        }
    }
    private void addImage(string path)
    {
        string roomId = Request.QueryString["roomId"];
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "INSERT INTO images (imageName,imagePath,imageBest,roomId) VALUES (@imagename,@imagepath,@imageBest,@roomId);";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@imagename", SqlDbType.VarChar).Value = txtImagename.Text;
        com.Parameters.Add("@imagepath", SqlDbType.VarChar).Value = path;
        com.Parameters.Add("@imageBest", SqlDbType.Int).Value = ddlImage.SelectedValue;
        com.Parameters.Add("@roomId", SqlDbType.Int).Value = roomId;
        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();
        lblImagename.Text = "Image Uploaded";
    }
    private void getImages()
    {
        DataTable dt = new DataTable();
        string roomId = Request.QueryString["roomId"];
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdtext = "SELECT imageName,imagePath FROM images WHERE roomID = @roomId;";
        SqlCommand com = new SqlCommand(cmdtext, conn);
        com.Parameters.Add("@roomId", SqlDbType.Int).Value = roomId;
        SqlDataAdapter da = new SqlDataAdapter();
        conn.Open();
        da.SelectCommand = com;
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private string getRoom()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String cmdText = "SELECT roomname FROM rooms WHERE roomId = @roomId";
        SqlCommand com = new SqlCommand(cmdText, conn);
        com.Parameters.Add("@roomId", SqlDbType.Int).Value = Request.QueryString["roomId"];
        conn.Open();
        SqlDataReader dr = com.ExecuteReader();
        
        if (dr.Read())
        {
            string roomname = dr["roomname"].ToString();
            conn.Close();
            return roomname;
        }
        return "void";
    }
}