using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class EmailTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        SendMail();
    }
    protected void SendMail()
    {
        MailMessage msg = new MailMessage();
        string subject = txtSubject.Text;
        string body = txtMessage.Text;
        string from = "kabayanthesis@gmail.com";
        string to = "marcggan@gmail.com";
        Attachment data = new Attachment(Server.MapPath("test/adelfa1.jpg"));
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        try
        {
            msg.Subject = subject;
            msg.Body = body;
            msg.From = new MailAddress(from);
            msg.To.Add(to);
            msg.IsBodyHtml = true;
            msg.Attachments.Add(data);
            client.Host = "smtp.gmail.com";
            System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential(from, "kabayan2014");
            client.Port = int.Parse("587");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicauthenticationinfo;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(msg);
        }
        catch (Exception ex)
        {
            //log.Error(ex.Message);
        }
    }


}