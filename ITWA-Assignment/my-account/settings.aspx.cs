using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class my_account_settings : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    int user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select Id from UserDetails where email = @email", con);
                cmd.Parameters.AddWithValue("@email", Context.User.Identity.Name);
                con.Open();
                user_id = Convert.ToInt32(cmd.ExecuteScalar());
                settings_personal.HRef = "settings-personal.aspx?user_id=" + user_id;
                settings_email.HRef = "settings-email.aspx?user_id=" + user_id;
                settings_password.HRef = "settings-password.aspx?user_id=" + user_id;
                con.Close();
                settings_msg.Text = "<i class='fa fa-check-circle'></i> " + Request.QueryString["msg"];
                if (Request.QueryString["msg"] != null)
                    msg_section.Visible = true;
            }
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
}