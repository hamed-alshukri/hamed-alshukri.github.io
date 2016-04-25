using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class support_ticket_submit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        name.Text = Request.QueryString["name"];
        if ( Convert.ToString((object)Request.QueryString["phone"]) == "" ) {
            phone.Text = "None";
        }
        else
        {
            phone.Text = Request.QueryString["phone"];
        }
        email.Text = Request.QueryString["email"];
        subject.Text = Request.QueryString["subject"];
        dept.Text = Request.QueryString["dept"];
        message.Text = Request.QueryString["message"];
    }
}