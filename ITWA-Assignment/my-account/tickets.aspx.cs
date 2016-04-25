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

public partial class my_account_tickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            if (!this.IsPostBack)
            {
                //Populating a DataTable from database.
                DataTable dt = this.GetData();

                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class='full-width account-table list-table'>");

                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    if (column.ColumnName != "tckt_id")
                    {
                        html.Append("<th>");
                        html.Append(column.ColumnName);
                        html.Append("</th>");
                    }
                }
                html.Append("</tr>");

                //Building the Data rows.
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        html.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            if (column.ColumnName != "tckt_id")
                            {
                                html.Append("<td>");

                                if (column.ColumnName == "Description")
                                    html.Append(Truncate(row[column.ColumnName].ToString(), 20));
                                else if (column.ColumnName == "Subject")
                                    html.Append("<a href='../support-ticket-view.aspx?id=" + row["tckt_id"] + "'>" + row[column.ColumnName] + "</a>");
                                else
                                    html.Append(row[column.ColumnName]);



                                html.Append("</td>");
                            }
                        }
                        html.Append("</tr>");
                    }
                }
                else
                {
                    html.Append("<tr><td colspan='4'>You have not submitted support tickets yet. <a href='../support-ticket.aspx'>Add a support ticket</a></td></tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                TicketsPlaceHolder.Controls.Add(new Literal { Text = html.ToString() });
                if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "solved")
                    TicketStatus.SelectedValue = Request.QueryString["status"];
            }
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
    private DataTable GetData()
    {
        string constr = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            string sqlcmd = "WITH data AS ( SELECT tckt_id, subject AS Subject, message AS 'Description', status AS Status, sdate AS 'Submission Date' FROM support WHERE email = @email";
            if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "solved")
                sqlcmd += " AND status = @status";
            sqlcmd += ") SELECT TOP 20 * FROM data";
            using (SqlCommand cmd = new SqlCommand(sqlcmd))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    cmd.Parameters.AddWithValue("@email", Context.User.Identity.Name);
                    if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "solved")
                        cmd.Parameters.AddWithValue("@status", Request.QueryString["status"]);
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
    public static string Truncate(string source, int length)
    {
        if (source.Length > length)
        {
            source = source.Substring(0, length) + "...";
        }
        return source;
    }

    protected void select_Click(object sender, EventArgs e)
    {
        string status = TicketStatus.SelectedValue;
        if(status != "all")
            Response.Redirect("tickets.aspx?status="+status);
        else
            Response.Redirect("tickets.aspx");
    }
}