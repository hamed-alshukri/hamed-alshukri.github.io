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

public partial class my_account_insurances : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    int uid;
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
                    if (column.ColumnName != "Id")
                    {
                        html.Append("<th>");
                        html.Append(column.ColumnName);
                        html.Append("</th>");
                    }
                }
                html.Append("</tr>");

                if (dt.Rows.Count > 0)
                {
                    //Building the Data rows.
                    foreach (DataRow row in dt.Rows)
                    {
                        html.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            if (column.ColumnName != "Id")
                            {
                                html.Append("<td>");

                                if (column.ColumnName == "Policy Type")
                                    html.Append("<a href='../insurance-view.aspx?id=" + row["Id"] + "'>" + row[column.ColumnName] + "</a>");
                                else if (column.ColumnName == "Start Date" || column.ColumnName == "End Date")
                                    html.Append(Convert.ToDateTime(row[column.ColumnName]).ToString("dd/MM/yyyy"));
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
                    html.Append("<tr><td colspan='4'>There is no insurance policies registered to your account. <a href='insurance-add.aspx'>Apply for new insurance policy</a></td></tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                InsurancesPlaceHolder.Controls.Add(new Literal { Text = html.ToString() });

                //Set Status Dropdown menu from URL query
                if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "active" || Request.QueryString["status"] == "expired" || Request.QueryString["status"] == "rejected")
                    PolicyStatus.SelectedValue = Request.QueryString["status"];

                //Change new insurance button's link to add the user ID
                getuserid();
                newInsurance.HRef = "insurance-add.aspx?user_id=" + uid;



            }
        }
        else
        {
            Response.Redirect("../login.aspx?error=true");
        }
    }
    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string sqlcmd = "WITH data AS ( SELECT Id, policy_type AS 'Policy Type', start_date AS 'Start Date', end_date AS 'End Date', status AS Status FROM Insurance WHERE user_id = @id";
            if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "active" || Request.QueryString["status"] == "expired" || Request.QueryString["status"] == "rejected")
                sqlcmd += " AND status = @status";
            sqlcmd += ") SELECT TOP 20 * FROM data";
            using (SqlCommand cmd = new SqlCommand(sqlcmd))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    getuserid();
                    cmd.Parameters.AddWithValue("@id", uid);
                    if (Request.QueryString["status"] == "pending" || Request.QueryString["status"] == "active" || Request.QueryString["status"] == "expired" || Request.QueryString["status"] == "rejected")
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

    private void getuserid()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Id from UserDetails where Email=@em", con);
                cmd.Parameters.AddWithValue("@em", Context.User.Identity.Name);
                uid = Convert.ToInt32( cmd.ExecuteScalar());
            }
            catch
            {
                //lbl_msg.Text = "Error#2: Unknown error, contact webadmin.";
                //lbl_msg.CssClass = "msg-notification failed";
                //reg_error = true;
            }
        }
    }

    protected void select_Click(object sender, EventArgs e)
    {
        string status = PolicyStatus.SelectedValue;
        if (status != "all")
            Response.Redirect("insurances.aspx?status=" + status);
        else
            Response.Redirect("insurances.aspx");
    }

}