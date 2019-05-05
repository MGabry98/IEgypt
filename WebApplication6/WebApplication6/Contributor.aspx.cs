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
    public partial class Contributor : System.Web.UI.Page
    {

        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["ID"]);
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

            if (dt.Rows.Count == 0)
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




            }
            catch (Exception e3)
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
        protected void Deactivate(object sender, EventArgs e)
        {
            // int userid =Convert.ToInt32(Session["user_id="].ToString());
            int userid = Convert.ToInt32(Session["ID"].ToString());
            string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString; ;
            SqlConnection cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Deactivate_Profile", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_id", userid));
            cmd.ExecuteNonQuery();

            cnn.Close();

            Response.Redirect("User");



        }
    }
}