using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class contact_us : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            if (!this.IsPostBack)
            {
                string queryString =
                "select fname, lname from UserDetails where email = @email";

                using (SqlConnection connection =
                           new SqlConnection(cs))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@email", Context.User.Identity.Name);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        fname.Text = reader[0].ToString();
                        fname.ReadOnly = true;
                        fname.CssClass = "disabled";

                        lname.Text = reader[1].ToString();
                        lname.ReadOnly = true;
                        lname.CssClass = "disabled";

                        email.Text = Context.User.Identity.Name;
                        email.ReadOnly = true;
                        email.CssClass = "disabled";
                    }

                    reader.Close();
                }
            }
        }

    }
    protected void btnsend_click(object sender, EventArgs e)
    {
        try
        {
            sendmail();
            Response.Redirect("contact-us-sent.aspx?email=" + email.Text.ToString() + "&fname=" + fname.Text.ToString() + "&lname=" + lname.Text.ToString() + "&subject=" + subject.Text.ToString() + "&message=" + message.Text.ToString());
        }
        catch
        {
            lbl_msg.Text = "Error#1: Unknown error, contact webadmin!";
            lbl_msg.CssClass = "msg-notification failed";
        }
    }

    public void sendmail()
    {
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(email.Text);
        mail.To.Add("speed1248@gmail.com");
        mail.Subject = subject.Text;
        mail.Body = "<b>Name:</b> " + fname.Text.ToString() + " " + lname.Text.ToString() +
                      "<br/><b>Email ID:</b> " + email.Text +
                      "<br/><br/><b>Message:</b> <br/>" + message.Text;
        mail.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        //smtp.UseDefaultCredentials = false;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.Credentials = new System.Net.NetworkCredential("goodgamer9876@gmail.com", "731542973697");
        smtp.Port = 587;
        smtp.Send(mail);
    }
}