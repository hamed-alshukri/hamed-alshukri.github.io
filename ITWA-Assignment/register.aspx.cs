using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class register : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["datastring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void validateCheckBoxes_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (confirmterms.Checked)
            args.IsValid = true;
        else
            args.IsValid = false;

    }
    bool reg_error = false;
    private void createuser()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into UserDetails (FName,LName,Email,Gender,Dob,Password) values (@fname,@lname,@email,@gender,@dob,@password)", con);
                cmd.Parameters.AddWithValue("@fname", FName.Text.ToString());
                cmd.Parameters.AddWithValue("@lname", LName.Text.ToString());
                cmd.Parameters.AddWithValue("@email", Email.Text.ToString());
                cmd.Parameters.AddWithValue("@gender", Gender.SelectedItem.Value.ToString());
                cmd.Parameters.AddWithValue("@dob", DoB.Text.ToString());
                cmd.Parameters.AddWithValue("@password", Password.Text.ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //lbl_msg.Text = "User has been registered successfully! <a href='login.aspx'>Click to Login</a>";
                //lbl_msg.CssClass = "msg-notification success";
                Response.Redirect("register-success.aspx");
            }
            catch
            {
                lbl_msg.Text = "Error#1: Unknown error, contact webadmin!";
                lbl_msg.CssClass = "msg-notification failed";
                reg_error = true;
            }
        }
    }

    //Function to Check User Already Exist
    int count;
    private void checkuser()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from UserDetails where Email=@em", con);
                cmd.Parameters.AddWithValue("@em", Email.Text);
                count = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch
            {
                lbl_msg.Text = "Error#2: Unknown error, contact webadmin.";
                lbl_msg.CssClass = "msg-notification failed";
                reg_error = true;
            }
        }
    }

    protected void btn_reg_Click(object sender, EventArgs e)
    {
        checkuser();
        if (count > 0)
        {
            lbl_msg.Text = "User already exist with same email, <a href='login.aspx'>Click to Login</a> or use another email.";
            lbl_msg.CssClass = "msg-notification";
        }
        else
        {
            createuser();
            if (reg_error == false)
            {
                FName.Text = "";
                LName.Text = "";
                Email.Text = "";
                cEmail.Text = "";
                Password.Text = "";
                cPassword.Text = "";
                Gender.SelectedIndex = 0;
                DoB.Text = "";
                confirmterms.Checked = false;
            }
        }
    }
}