using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContEditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // int userid = 54;
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

        txt_first_name.Text = Convert.ToString(cmd.Parameters["@firstname"].Value);
        txt_middle_name.Text = Convert.ToString(cmd.Parameters["@middlename"].Value);
        txt_last_name.Text = Convert.ToString(cmd.Parameters["@lastname"].Value);
        string temp = Convert.ToString(cmd.Parameters["@birth_date"].Value);
        temp = temp.Substring(0, temp.Length - 12);
        txt_birthdate.Text = temp;
        txt_email.Text = Convert.ToString(cmd.Parameters["@email"].Value);
        txt_password.Text = Convert.ToString(cmd.Parameters["@password"].Value);
        txt_specialization.Text = Convert.ToString(cmd.Parameters["@specilization"].Value);
        txt_link.Text = Convert.ToString(cmd.Parameters["@portofolio_link"].Value);
        txt_yof.Text = Convert.ToString(cmd.Parameters["@years_experience"].Value);
        cnn.Close();
    }
    protected void firstnamechanged(object sender, EventArgs e)
    {
        if (Txt_newfirstname.Visible == true)
        {
            btn_firstname.Text = "Edit First name";
            Txt_newfirstname.Visible = false;
        }
        else
        {
            btn_firstname.Text = "Leave current First name";
            Txt_newfirstname.Visible = true;
        }
    }

    protected void EmailChanged(object sender, EventArgs e)
    {
        if (txt_newemail.Visible == true)
        {
            btn_email.Text = "Edit Email";
            txt_newemail.Visible = false;
        }
        else
        {
            btn_email.Text = "Leave current Email";
            txt_newemail.Visible = true;
        }
    }

    protected void passchanged(object sender, EventArgs e)
    {
        if (txt_newpass.Visible == true)
        {
            btn_pass.Text = "Edit Password";
            txt_newpass.Visible = false;
        }
        else
        {
            btn_pass.Text = "Leave current Password";
            txt_newpass.Visible = true;
        }
    }

    protected void middlenamechanged(object sender, EventArgs e)
    {
        if (txt_newmiddle.Visible == true)
        {
            btn_middle.Text = "Edit middle name";
            txt_newmiddle.Visible = false;
        }
        else
        {
            btn_middle.Text = "Leave current middle name";
            txt_newmiddle.Visible = true;
        }

    }

    protected void lastnamechanged(object sender, EventArgs e)
    {
        if (txt_newlast.Visible == true)
        {
            btn_last.Text = "Edit Last name";
            txt_newlast.Visible = false;
        }
        else
        {
            btn_last.Text = "Leave current Last name";
            txt_newlast.Visible = true;
        }

    }

    protected void birthdaychanged(object sender, EventArgs e)
    {
        if (txt_newbirthdate.Visible == true)
        {
            btn_bd.Text = "Edit Birthdate";
            txt_newbirthdate.Visible = false;
        }
        else
        {
            btn_bd.Text = "Leave current Birthdate";
            txt_newbirthdate.Visible = true;
        }

    }
    protected void specchanged(object sender, EventArgs e)
    {
        if (txt_newspec.Visible == true)
        {
            btn_spec.Text = "Edit Specialization";
            txt_newspec.Visible = false;
        }
        else
        {
            btn_spec.Text = "Leave current Specialization";
            txt_newspec.Visible = true;
        }


    }
    protected void linkChanged(object sender, EventArgs e)
    {
        if (txt_newlink.Visible == true)
        {
            btn_link.Text = "Edit Portofolio link";
            txt_newlink.Visible = false;
        }
        else
        {
            btn_link.Text = "Leave current Link";
            txt_newlink.Visible = true;
        }


    }

    protected void yearsChanged(object sender, EventArgs e)
    {
        if (txt_newyof.Visible == true)
        {
            btn_yof.Text = "Edit Years of experience";
            txt_newyof.Visible = false;
        }
        else
        {
            btn_yof.Text = "Leave current Years of experience";
            txt_newyof.Visible = true;
        }


    }


    protected void Update(object sender, EventArgs e)
    {

        // int userid = 54;
        int userid = Convert.ToInt32(Session["ID"].ToString());
        string connetionString1 = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
        SqlConnection cnn1 = new SqlConnection(connetionString1);

        cnn1.Open();


        SqlCommand cmd = new SqlCommand("Edit_Profile", cnn1);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Clear();
        cmd.Parameters.Add(new SqlParameter("@user_id", userid));

        if (txt_newemail.Visible == true)
            cmd.Parameters.Add(new SqlParameter("@email", txt_newemail.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@email", txt_email.Text));


        if (txt_newpass.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@password", txt_password.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@password", txt_newpass.Text));


        if (Txt_newfirstname.Visible == true)
            cmd.Parameters.Add(new SqlParameter("@firstname", Txt_newfirstname.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@firstname", txt_first_name.Text));

        if (txt_newmiddle.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@middlename", txt_middle_name.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@middlename", txt_newmiddle.Text));



        if (txt_newlast.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@lastname", txt_last_name.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@lastname", txt_newlast.Text));

        if (txt_newbirthdate.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@birth_date", txt_birthdate.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@birth_date", txt_newbirthdate.Text));

       
            cmd.Parameters.Add(new SqlParameter("@working_place_name", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_description", ""));

        if (txt_newspec.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@specilization", txt_specialization.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@specilization", txt_newspec.Text));


        if (txt_newlink.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", txt_link.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", txt_newlink.Text));


        if (txt_newyof.Visible == false)
            cmd.Parameters.Add(new SqlParameter("@years_experience", txt_yof.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@years_experience", txt_newyof.Text));


        cmd.Parameters.Add(new SqlParameter("@hire_date", ""));
        cmd.Parameters.Add(new SqlParameter("@working_hours", ""));
        cmd.Parameters.Add(new SqlParameter("@payment_rate", "0"));

        try
        {
            if (txt_newemail.Text == "" && txt_newemail.Visible == true)
                throw new Exception();

            if (txt_newpass.Text == "" && txt_newpass.Visible == true)
                throw new Exception();

        
        cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cnn1.Close();

            
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Info updated" + "');", true);

    }
       catch (Exception e1)
        {
           ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid email or password" + "');", true);
        }
    }


}