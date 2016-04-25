using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class my_account_settings_personal : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            string ugender;
            string queryString =
            "SELECT * FROM UserDetails WHERE Id = @id";

            if (!IsPostBack)
            {
                using (SqlConnection connection = new SqlConnection(cs))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@id", Request.QueryString["user_id"]);
                    connection.Open();

                    System.Data.SqlClient.SqlDataReader reader;
                    reader = command.ExecuteReader(CommandBehavior.SingleRow);
                    bool viewstate = true;
                    if (reader.Read())
                    {
                        if (viewstate)
                        {
                            FName.Text = reader["FName"].ToString();
                            LName.Text = reader["LName"].ToString();
                            ugender = reader["Gender"].ToString();
                            if (ugender == "F")
                                Gender.Text = "Female";
                            else if (ugender == "M")
                                Gender.Text = "Male";
                            DoB.Text = Convert.ToDateTime(reader["Dob"]).ToString("dd/MM/yyyy");
                            address.Text = reader["address"].ToString();
                            pobox.Text = reader["pobox"].ToString();
                            pcode.Text = reader["pcode"].ToString();
                            phone.Text = reader["phone"].ToString();

                        }
                    }

                    reader.Close();
                    connection.Close();
                }

            }
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
    protected void updatepersonal(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                string update_query = "UPDATE UserDetails SET address = @uadd, pobox = @upo, pcode = @ucod, phone = @uph WHERE (Id = @id)";
                SqlCommand cmd = new SqlCommand(update_query, con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["user_id"]);
                if (address.Text == "")
                {
                    cmd.Parameters.AddWithValue("@uadd", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@uadd", address.Text);
                }

                if (pobox.Text == "")
                {
                    cmd.Parameters.AddWithValue("@upo", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@upo", pobox.Text);
                }

                if (pcode.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ucod", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ucod", pcode.Text);
                }

                if (phone.Text == "")
                {
                    cmd.Parameters.AddWithValue("@uph", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@uph", phone.Text);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("settings.aspx?msg=Personal Information has been updated successfully.");
            }
            catch
            {
                lbl_msg.Text = "Error#1: Unknown error, contact webadmin!";
                lbl_msg.CssClass = "msg-notification failed";
            }
        }
    }
    //protected void btn_update_Click(object sender, EventArgs e)
    //{
    //    updatepersonal();
    //}
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("settings.aspx");
    }
}