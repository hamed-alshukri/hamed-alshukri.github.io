using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class my_account : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    int uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            if (!this.IsPostBack)
            {
                /*
                 * Support Tickets
                **/
                //Populating a DataTable from database.
                DataTable sdt = this.SupportGetData();

                //Building an HTML string.
                StringBuilder SupportHTML = new StringBuilder();

                //Table start.
                SupportHTML.Append("<table class='full-width account-table'>");

                //Building the Header row.
                SupportHTML.Append("<tr>");
                foreach (DataColumn column in sdt.Columns)
                {
                    if (column.ColumnName != "tckt_id")
                    {
                        SupportHTML.Append("<th>");
                        SupportHTML.Append(column.ColumnName);
                        SupportHTML.Append("</th>");
                    }
                }
                SupportHTML.Append("</tr>");

                //Building the Data rows.
                if (sdt.Rows.Count > 0)
                {
                    foreach (DataRow row in sdt.Rows)
                    {
                        SupportHTML.Append("<tr>");
                        foreach (DataColumn column in sdt.Columns)
                        {
                            if (column.ColumnName != "tckt_id")
                            {
                                SupportHTML.Append("<td>");

                                if (column.ColumnName == "Subject")
                                    SupportHTML.Append("<a href='../support-ticket-view.aspx?id=" + row["tckt_id"] + "'>" + row[column.ColumnName] + "</a>");
                                else
                                    SupportHTML.Append(row[column.ColumnName]);

                                SupportHTML.Append("</td>");
                            }
                        }
                        SupportHTML.Append("</tr>");
                    }
                }
                else
                {
                    SupportHTML.Append("<tr><td colspan='4'>You have not submitted support tickets yet. <a href='../support-ticket.aspx'>Add a support ticket</a></td></tr>");
                }

                //Table end.
                SupportHTML.Append("</table>");

                //Append the HTML string to Placeholder.
                TicketsPlaceHolder.Controls.Add(new Literal { Text = SupportHTML.ToString() });


                /*
                 * Insurance Policies
                **/
                //Populating a DataTable from database.
                DataTable idt = this.InsuranceGetData();

                //Building an HTML string.
                StringBuilder InsuranceHTML = new StringBuilder();

                //Table start.
                InsuranceHTML.Append("<table class='full-width account-table list-table'>");

                //Building the Header row.
                InsuranceHTML.Append("<tr>");
                foreach (DataColumn column in idt.Columns)
                {
                    if (column.ColumnName != "Id")
                    {
                        InsuranceHTML.Append("<th>");
                        InsuranceHTML.Append(column.ColumnName);
                        InsuranceHTML.Append("</th>");
                    }
                }
                InsuranceHTML.Append("</tr>");

                if (idt.Rows.Count > 0)
                {
                    //Building the Data rows.
                    foreach (DataRow row in idt.Rows)
                    {
                        InsuranceHTML.Append("<tr>");
                        foreach (DataColumn column in idt.Columns)
                        {
                            if (column.ColumnName != "Id")
                            {
                                InsuranceHTML.Append("<td>");

                                if (column.ColumnName == "Policy Type")
                                    InsuranceHTML.Append("<a href='insurance-view.aspx?id=" + row["Id"] + "'>" + row[column.ColumnName] + "</a>");
                                else if (column.ColumnName == "End Date")
                                    InsuranceHTML.Append(Convert.ToDateTime(row[column.ColumnName]).ToString("dd/MM/yyyy"));
                                else
                                    InsuranceHTML.Append(row[column.ColumnName]);

                                InsuranceHTML.Append("</td>");
                            }
                        }
                        InsuranceHTML.Append("</tr>");
                    }
                }
                else
                {
                    InsuranceHTML.Append("<tr><td colspan='4'>No Insurance Policies Yet</td></tr>");
                }

                //Table end.
                InsuranceHTML.Append("</table>");

                //Append the HTML string to Placeholder.
                InsurancesPlaceHolder.Controls.Add(new Literal { Text = InsuranceHTML.ToString() });
            }

        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }

    private DataTable SupportGetData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand("WITH data AS ( SELECT tckt_id, subject AS Subject, sdate AS 'Submission Date', status AS Status FROM support WHERE email = @email ) SELECT TOP 5 * FROM data"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    cmd.Parameters.AddWithValue("@email", Context.User.Identity.Name);
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

    private DataTable InsuranceGetData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand("WITH data AS ( SELECT Id, policy_type AS 'Policy Type', end_date AS 'End Date', status AS Status FROM Insurance WHERE user_id = @id) SELECT TOP 5 * FROM data"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    getuserid();
                    cmd.Parameters.AddWithValue("@id", uid);
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

    private void getuserid()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Id from UserDetails where Email=@em", con);
            cmd.Parameters.AddWithValue("@em", Context.User.Identity.Name);
            uid = Convert.ToInt32(cmd.ExecuteScalar());
        }
    }

    protected int userid()
    {
        getuserid();
        return uid;
    }
}