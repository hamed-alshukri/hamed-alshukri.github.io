using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class support_ticket_view : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            string queryString =
            "SELECT * FROM support WHERE tckt_id = @id";

            using (SqlConnection connection =
                       new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    name.Text = reader[1].ToString();
                    phone.Text = reader[2].ToString();
                    email.Text = reader[3].ToString();
                    subject.Text = reader[4].ToString();
                    page_title.InnerText = reader[4].ToString();
                    dept.Text = reader[5].ToString();
                    message.Text = reader[6].ToString();
                    status.Text = reader[7].ToString();
                    sdate.Text = reader[8].ToString();
                    //phone.Text = reader[2].ToString();
                }

                reader.Close();
            }
        }
        else
        {
            Response.Redirect("login.aspx?error=true");
        }
    }
}