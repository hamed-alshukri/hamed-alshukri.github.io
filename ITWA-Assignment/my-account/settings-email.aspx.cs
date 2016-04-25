using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class my_account_settings_email : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            cur_email.Text = Context.User.Identity.Name;
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
    bool update_error = false;
    private void updateemail()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("UPDATE UserDetails SET Email = @email WHERE Id = @id", con);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["user_id"]);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("settings.aspx?msg=Your email has been changed successfully.");
            }
            catch
            {
                lbl_msg.Text = "Error#1: Unknown error, contact webadmin!";
                lbl_msg.CssClass = "msg-notification failed";
                update_error = true;
            }
        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        updateemail();
        if (update_error == false)
        {
            Email.Text = "";
            cEmail.Text = "";
        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("settings.aspx");
    }
}