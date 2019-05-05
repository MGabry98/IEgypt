using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class RegisterContributor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterCont(object sender, EventArgs e)
        {

            try
            {
                string user_type = "Contributor";
            string email = txt_email.Text;
            string password = txt_password.Text;

             if (email == "" || password == "")      
               throw new Exception();


            string first_name = txt_first_name.Text;
            string middle_name = txt_middle_name.Text;
            string last_name = txt_last_name.Text;
            string birthdate = txt_birthdate.Text;
            string spec = txt_specialization.Text;
            int years_exp;
            string portofolio_link = txt_portofolio_link.Text;

            if (txt_years_exp.Text == "")
                years_exp = 0;
            else
                years_exp = Convert.ToInt32(txt_years_exp.Text);


            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Register_User", cnn);


            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@usertype", user_type));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@firstname", first_name));
            cmd.Parameters.Add(new SqlParameter("@middlename", middle_name));
            cmd.Parameters.Add(new SqlParameter("@lastname", last_name));
            cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", ""));
            cmd.Parameters.Add(new SqlParameter("@wokring_place_description", ""));
            cmd.Parameters.Add(new SqlParameter("@specilization", spec));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", portofolio_link));
            cmd.Parameters.Add(new SqlParameter("@years_experience", years_exp));
            cmd.Parameters.Add(new SqlParameter("@hire_date", ""));
            cmd.Parameters.Add(new SqlParameter("@working_hours", ""));
            cmd.Parameters.Add(new SqlParameter("@payment_rate", "0.0"));


            cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int user_id = 0;

            // execute the command
             
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                user_id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
                rdr.Close();
            }
                Session["ID"] = user_id;
                Response.Redirect("Staff.aspx?user_id=" + user_id);
            cnn.Close();

        }
          catch (Exception e1)
          {
              ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid email and password" + "');", true);
  }

    
            
        }
        /*  protected void Back(object sender, EventArgs e)
         {
             Response.Redirect("User");

         }*/
    }
}