using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class my_account_insurance_add : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Context.User.Identity.IsAuthenticated)
            Response.Redirect("../login.aspx?error=true");

    }
    bool reg_error = false;
    private void submit_insurance()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into Insurance (policy_type, start_date, end_date, prev_claims, prev_insurer, add_info, status, user_id) values (@type, @start, @end, @claim, @insur, @info, 'pending', @user_id)", con);
                cmd.Parameters.AddWithValue("@type", PolicyType.Text);
                cmd.Parameters.AddWithValue("@start", StartDate.Text);
                cmd.Parameters.AddWithValue("@end", EndDate.Text);
                if (PrevClaim.Text == "")
                {
                    cmd.Parameters.AddWithValue("@claim", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@claim", PrevClaim.Text);
                }

                if (PrevInsurer.Text == "")
                {
                    cmd.Parameters.AddWithValue("@insur", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@insur", PrevInsurer.Text);
                }

                if (AddInfo.Text == "")
                {
                    cmd.Parameters.AddWithValue("@info", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@info", AddInfo.Text);
                }

                cmd.Parameters.AddWithValue("@user_id", Request.QueryString["user_id"]);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("insurances.aspx");
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
        submit_insurance();
        if (reg_error == false)
        {
            PolicyType.SelectedIndex = 0;
            StartDate.Text = "";
            EndDate.Text = "";
            PrevClaim.Text = "";
            PrevInsurer.Text = "";
            AddInfo.Text = "";
        }
    }
}