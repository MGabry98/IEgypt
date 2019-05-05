using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication6
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchOrgContent(object sender, EventArgs e)
        {
            string content_name = txt_name_org.Text;
            string content_category = txt_cat_org.Text;
            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; 
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Original_Content_Search", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@typename", content_name));
            cmd.Parameters.Add(new SqlParameter("@categoryname", content_category));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            cnn.Close();

            if (dt.Rows.Count==0)
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a correct Content name or Category type" + "');", true);


        }



        protected void SearchContributor(object sender, EventArgs e)
        {

            string contributor_name = txt_contributor_name.Text;
            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Contributor_Search", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@fullname", contributor_name));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid2.DataSource = dt;
            grid2.DataBind();
            cnn.Close();

            if (dt.Rows.Count == 0)
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a correct Contributor name" + "');", true);

        }



     /*   protected void Register(object sender, EventArgs e)
        {

            if (txt_user_type.Text == "Viewer")
                Response.Redirect("RegisterViewer");
            else if (txt_user_type.Text == "Contributor")
                Response.Redirect("RegisterContributor");
            else if (txt_user_type.Text == "Authorized Reviewer")
                Response.Redirect("RegisterReviewer");
            else if (txt_user_type.Text == "Content Manager")
                Response.Redirect("RegisterManager");
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('"+"Please enter a correct type"+ "');", true);

            //HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript'' > alert('Your message here') </SCRIPT>");




        }*/

        protected void Show_Contributor(object sender, EventArgs e)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Order_Contributor", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid3.DataSource = dt;
            grid3.DataBind();
            cnn.Close();



        }


        protected void Show_Org(object sender, EventArgs e)
        {
            string contributor_name = txt_cont_name.Text;

            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();


            SqlCommand cmd = new SqlCommand("Contributor_Search1", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@fullname", contributor_name));

            cmd.Parameters.Add("@cont_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int cont_id = 0;

            // execute the command
            try
            {
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    cont_id = Convert.ToInt32(cmd.Parameters["@cont_id"].Value);
                    rdr.Close();
                }



              
            }  catch(Exception e3)
                 {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid Contributor name" + "');", true);
            }


            SqlCommand cmd1 = new SqlCommand("Show_Original_Content", cnn);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;

            if (cont_id == -1)
            {
                if (contributor_name == "")
                {
                    cmd1.Parameters.Add(new SqlParameter("@contributor_id", "0"));
                    SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    grid4.DataSource = dt;
                    grid4.DataBind();
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid Contributor name" + "');", true);


            }
            else
            {
                cmd1.Parameters.Add(new SqlParameter("@contributor_id", cont_id));
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                grid4.DataSource = dt;
                grid4.DataBind();
            }


            




            cnn.Close();
        }


        protected void Login(object sender, EventArgs e)
        {

            string email = Txt_mail.Text;
            string password = txt_pass.Text;

            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("User_login", cnn);


            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            


            cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int user_id = 0;

            // execute the command
           try
         {
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    user_id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
                    rdr.Close();
                }


                Session["ID"] = user_id;
                if (user_id== -1)
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid email and password"+user_id + "nnnnnnn');", true);
                else if (user_id == -2)
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "your account is deactivateddfhsjhfkjsk" + "');", true);
                else
                {
                    SqlCommand cmd1 = new SqlCommand("Showtype", cnn);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("@user_id", user_id));
                    cmd1.Parameters.Add("@type", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
                    int type = 0;
                    using (SqlDataReader rdr1 = cmd1.ExecuteReader())
                    {
                        type = Convert.ToInt32(cmd1.Parameters["@type"].Value);
                        rdr1.Close();
                    }

                    if(type==1)
                        Response.Redirect("Viewer");
                    else if (type==2)
                        Response.Redirect("Contributor");
                    else if (type==3||type==4)
                        Response.Redirect("Staff");


                }

                

          }
           catch (Exception e1)
           {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a valid email and passwordkkkkkk" + "');", true);

            }


            cnn.Close();

        }
    }
}



