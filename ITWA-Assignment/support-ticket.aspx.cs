using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class support_ticket : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            name.Text = user_name(Context.User.Identity.Name);
            name.ReadOnly = true;
            name.CssClass = "disabled";

            email.Text = Context.User.Identity.Name;
            email.ReadOnly = true;
            email.CssClass = "disabled";

            cemail.Text = Context.User.Identity.Name;
            cemail.ReadOnly = true;
            cemail.CssClass = "disabled";
        }
    }
    private String user_name(string uemail)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select (fname + ' ' + lname) as name_combo from UserDetails where email = @email", con);
            cmd.Parameters.AddWithValue("@email", uemail);
            con.Open();
            return Convert.ToString(cmd.ExecuteScalar());

        }
    }

    bool reg_error = false;
    private void submit_ticket()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into support (name,phone,email,subject,dept,message,status,sdate) values (@name,@phone,@email,@subject,@dept,@message,'Pending',getdate())", con);
                cmd.Parameters.AddWithValue("@name", name.Text);
                if (phone.Text == "")
                {
                    cmd.Parameters.AddWithValue("@phone", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@phone", phone.Text);
                }
                
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@subject", subject.Text);
                cmd.Parameters.AddWithValue("@dept", dept.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@message", message.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("support-ticket-submit.aspx?name=" + name.Text.ToString() + "&phone=" + phone.Text.ToString() + "&email=" + email.Text.ToString() + "&subject=" + subject.Text.ToString() + "&dept=" + dept.SelectedItem.Text + "&message=" + message.Text.ToString());
            }
            catch
            {
                lbl_msg.Text = "Error: Unknown error, contact webadmin!";
                lbl_msg.CssClass = "msg-notification failed";
                reg_error = true;
            }
        }
    }
    protected void btn_tckt_Click(object sender, EventArgs e)
    {
        submit_ticket();
        if (reg_error == false)
        {
            name.Text = "";
            phone.Text = "";
            email.Text = "";
            subject.Text = "";
            dept.SelectedIndex = 0;
            message.Text = "";
        }
    }
}