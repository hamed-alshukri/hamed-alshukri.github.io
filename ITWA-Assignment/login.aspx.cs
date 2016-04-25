using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["error"] == "true")
            msg_section.Visible = true;

    }
    private bool Authenticateuser(string uemail, string pass)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select count(*) from UserDetails where email = @email and password = @pass", con);
            cmd.Parameters.AddWithValue("@email", email.Text.ToString());
            cmd.Parameters.AddWithValue("@pass", password.Text.Trim());
            con.Open();
            int ReturnCode = (int)cmd.ExecuteScalar();
            return ReturnCode == 1;
        }
    }
    protected void btn_log_Click(object sender, EventArgs e)
    {
        if (Authenticateuser(email.Text, password.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(email.Text, rememberme.Checked);
        }
        else
        {
            login_msg.Text = "<i class='fa fa-times'></i> Invalid Email and/or Password";
            msg_section.Visible = true;
        }
    }
}