using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class my_account_insurance_view : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            string queryString =
            "SELECT (u.FName +' '+ u.LName ) AS Name, u.Email, u.Gender, u.Dob, u.address, u.phone, i.policy_type, i.start_date, i.end_date, i.prev_claims, i.prev_insurer, i.add_info, i.value, i.status FROM UserDetails u INNER JOIN Insurance i ON u.ID = i.user_id WHERE i.id = @id";

            using (SqlConnection connection =
                       new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    name.Text = reader[0].ToString();
                    if (reader[2].ToString() == "F")
                        gender.Text = "Female";
                    else
                        gender.Text = "Male";

                    if (reader[5].ToString() == "")
                        phone.Text = "N/A";
                    else
                        phone.Text = reader[5].ToString();
                    email.Text = reader[1].ToString();
                    dob.Text = Convert.ToDateTime(reader[3].ToString()).ToString("dd/MM/yyyy");
                    address.Text = reader[4].ToString();
                    policy_type.Text = reader[6].ToString();
                    status.Text = reader[13].ToString();
                    if (reader[12].ToString() == "")
                        value.Text = "N/A";
                    else
                        value.Text = "OMR " + reader[12].ToString();
                    sdate.Text = Convert.ToDateTime(reader[7].ToString()).ToString("dd/MM/yyyy");
                    edate.Text = Convert.ToDateTime(reader[8].ToString()).ToString("dd/MM/yyyy");
                    if (reader[9].ToString() == "")
                        claims.Text = "N/A";
                    else
                        claims.Text = reader[9].ToString();
                    if (reader[10].ToString() == "")
                        insurer.Text = "N/A";
                    else
                        insurer.Text = reader[10].ToString();
                    if (reader[11].ToString() == "")
                        info.Text = "N/A";
                    else
                        info.Text = reader[11].ToString();
                }

                reader.Close();
            }
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
}