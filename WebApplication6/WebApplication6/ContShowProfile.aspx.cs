using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContShowProfile : System.Web.UI.Page
{
   
    string temppass;
    protected void Page_Load(object sender, EventArgs e)
    {
        //int userid = 1;
        int userid = Convert.ToInt32(Session["ID"].ToString());
        string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
        SqlConnection cnn = new SqlConnection(connetionString);

        cnn.Open();

        SqlCommand cmd = new SqlCommand("Show_Profile", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@user_id", userid));
        cmd.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@password", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@firstname", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@middlename", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@lastname", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@birth_date", System.Data.SqlDbType.Date).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@working_place_name", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@working_place_type", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@wokring_place_description", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@specilization", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@portofolio_link", System.Data.SqlDbType.VarChar, 50).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@years_experience", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@hire_date", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@working_hours", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add("@payment_rate", System.Data.SqlDbType.Decimal).Direction = System.Data.ParameterDirection.Output;




        cmd.ExecuteNonQuery();
        lbl_firstname.Text = Convert.ToString(cmd.Parameters["@firstname"].Value);
        lbl_middlename.Text = Convert.ToString(cmd.Parameters["@middlename"].Value);
        lbl_lastname.Text = Convert.ToString(cmd.Parameters["@lastname"].Value);
        string temp = Convert.ToString(cmd.Parameters["@birth_date"].Value);
        temp = temp.Substring(0, temp.Length - 12);

        lbl_birthdate.Text = temp;
        lbl_mail.Text = Convert.ToString(cmd.Parameters["@email"].Value);
        temppass = Convert.ToString(cmd.Parameters["@password"].Value);
        lbl_specilization.Text = Convert.ToString(cmd.Parameters["@specilization"].Value);
        lbl_link.Text = Convert.ToString(cmd.Parameters["@portofolio_link"].Value);
        lbl_years_experience.Text = Convert.ToString(cmd.Parameters["@years_experience"].Value);
        cnn.Close();

    }

    protected void Showpass(object sender, EventArgs e)
    {
        if (showpass.Text == "Show Password")
        {
            lbl_password.Text = temppass;
            showpass.Text = "Hide password";
        }
        else
        {
            lbl_password.Text = "*****";
            showpass.Text = "Show Password";
        }
    }
}