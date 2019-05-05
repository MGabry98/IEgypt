using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Session["ID"]);
        SqlConnection cnn = new SqlConnection();

        cnn.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn.Open();
        SqlCommand cmd1 = new SqlCommand("select specified , information,id from New_Request", cnn);

        SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        cmd1.ExecuteNonQuery();
        DataTable dt = new DataTable();
        sda.Fill(dt);
        Grid1.DataSource = dt;
        Grid1.DataBind();
        cnn.Close();
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_Content", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@content_id", Content1.Text));

            if (Content1.Text == "")
            {


                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Enter Content')</SCRIPT>");

            }
            else
            {
                cmd.ExecuteNonQuery();
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Deleted Succesfully')</SCRIPT>");
            }
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");

        }
        con.Close();
    }
    //Show Events .........................................................................................................................................
    protected void BtnEvents_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Show_Event", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@event_id", Events1.Text));

            if (Events1.Text == "" | Convert.ToInt32(Events1.Text)>2) 
            {


                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Enter A Valid Event')</SCRIPT>");

            }
            else
            {
                cmd.ExecuteNonQuery();

                //cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                //cnn.Open();
                try
                {
                    SqlCommand cmd1 = new SqlCommand("Show_Event", con);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("@event_id", Events1.Text));

                    SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                    cmd1.ExecuteNonQuery();
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    Grid10.DataSource = dt1;
                    Grid10.DataBind();
                }
                catch (Exception e1)
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('SQl Query Fail')</SCRIPT>");

                }
                try
                {


                }
                catch (Exception e1)
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Table creation Failed')</SCRIPT>");

                }
                //cnn.Close();
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Events are here!!')</SCRIPT>");
            }
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");

        }
        con.Close();
    }
    //Notifications ...................................................................................................................................
    protected void BtnNotify_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Show_Notification", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //cmd.Parameters.Add(new SqlParameter("@content_id", Notifications.Text));
            cmd.Parameters.Add(new SqlParameter("@user_id", id));
            cmd.ExecuteNonQuery();

            //cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            //cnn.Open();
            try
            {
                SqlCommand cmd1 = new SqlCommand("Show_Notification", con);
                cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                //cmd1.Parameters.Add(new SqlParameter("@content_id", Notifications.Text));
                cmd1.Parameters.Add(new SqlParameter("@user_id", id));

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd1);
                cmd1.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                GridView1.DataSource = dt2;
                GridView1.DataBind();
            }
            catch (Exception e1)
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('SQl Query Fail')</SCRIPT>");

            }
            //cnn.Close();
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('HAPPY NOTIFICATIONSSS!!')</SCRIPT>");

        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");

        }
        con.Close();
    }
    //Respond .........................................................................................................................................
    protected void BtnRespond_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            string value = R.SelectedItem.Value.ToString();

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Respond_New_Request", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@accept_status", value));
            cmd.Parameters.Add(new SqlParameter("@request_id", Request_ID.Text));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", id));
            cmd.ExecuteNonQuery();
            if (value.Equals("1"))
            {
                Status.Text = "Accepted";
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Accepted!!')</SCRIPT>");
            }
            else
            {
                Status.Text = "Rejected";
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Rejected!!')</SCRIPT>");
            }

            con.Close();
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");
        }

    }
    //Send Message ..................................................................................................
    protected void BtnSendMsg_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Send_Message", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@msg_text", txtMsg.Text));
            cmd.Parameters.Add(new SqlParameter("@viewer_id", txtVID.Text));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", id));
            cmd.Parameters.Add(new SqlParameter("@sender_type", 1));
            cmd.Parameters.Add(new SqlParameter("@sent_at", DateTime.Now));
            cmd.ExecuteNonQuery();

            //cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            //cnn.Open();
            try
            {
                /*   SqlCommand cmd1 = new SqlCommand("Show_Notification", con);
                   cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                   //cmd1.Parameters.Add(new SqlParameter("@content_id", Notifications.Text));
                   cmd1.Parameters.Add(new SqlParameter("@user_id", id));

                   SqlDataAdapter sda2 = new SqlDataAdapter(cmd1);
                   cmd1.ExecuteNonQuery();
                   DataTable dt2 = new DataTable();
                   sda2.Fill(dt2);
                   Grid1.DataSource = dt2;
                   Grid1.DataBind();*/
            }
            catch (Exception e1)
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('SQl Query Fail')</SCRIPT>");

            }
            //cnn.Close();
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('HAPPY Day Your Message Was Sent!!')</SCRIPT>");

        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");

        }
        con.Close();
    }
    //Show Messages..................................................................................................
    protected void BtnShowMsg_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();




        con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        con.Open();

        SqlCommand cmd = new SqlCommand("Show_Message", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@contributor_id", id));

        //if (Events.Text == "")
        //{


        //    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Enter Event')</SCRIPT>");

        //}
        //else
        //{
        cmd.ExecuteNonQuery();

        //cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        //cnn.Open();
        try
        {
            SqlCommand cmd1 = new SqlCommand("Show_Message", con);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("@contributor_id", id));

            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            cmd1.ExecuteNonQuery();
            DataTable dt5 = new DataTable();
            sda1.Fill(dt5);
            GridView2.DataSource = dt5;
            GridView2.DataBind();
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('SQl Query Fail')</SCRIPT>");

        }
        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Messages!!!')</SCRIPT>");
        con.Close();
        //cnn.Close();




    }


    /*protected void btnReceive_Click(object sender, EventArgs e)
           {
               SqlConnection con = new SqlConnection();
               SqlDataAdapter sda = new SqlDataAdapter();
               DataSet ds = new DataSet();




               con.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
               con.Open();

               SqlCommand cmd2 = new SqlCommand("select id from New_Request where contributer_id=2", con);
               cmd2.ExecuteNonQuery();
               SqlCommand cmd = new SqlCommand("Receive_New_Requests", con);
               String X = cmd2.ToString();

               cmd.CommandType = System.Data.CommandType.StoredProcedure;
               cmd.Parameters.Add(new SqlParameter("@request_id", ));
               cmd.Parameters.Add(new SqlParameter("@contributor_id", id));

               //if (Events.Text == "")
               //{


               //    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Enter Event')</SCRIPT>");

               //}
               //else
               //{
               cmd.ExecuteNonQuery();

               //cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
               //cnn.Open();
               try
               {
                   SqlCommand cmd1 = new SqlCommand("Receive_New_Requests", con);
                   cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                   cmd1.Parameters.Add(new SqlParameter("@request_id", cmd2));
                   cmd1.Parameters.Add(new SqlParameter("@contributor_id", id));

                   SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                   cmd1.ExecuteNonQuery();
                   DataTable dt6 = new DataTable();
                   sda1.Fill(dt6);
                   Grid3.DataSource = dt6;
                   Grid3.DataBind();
               }
               catch (Exception e1)
               {
                   HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('SQl Query Fail')</SCRIPT>");

               }
               HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Messages!!!')</SCRIPT>");
               con.Close();
               //cnn.Close();




           }*/




    protected void btnUpLoadNewContent_Click(object sender, EventArgs e)
    {




        SqlConnection con = new SqlConnection();
        //  SqlDataAdapter sda = new SqlDataAdapter();
        //DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();
            //"select specified , information from New_Request"
            //SqlCommand cmd1 = new SqlCommand("Order_Contributor", con);
            SqlCommand cmd = new SqlCommand("Upload_New_Content", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@new_request_id", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", id));
            cmd.Parameters.Add(new SqlParameter("@subcategory_name ", SCN.Text));
            cmd.Parameters.Add(new SqlParameter("@category_id", CN.Text));
            cmd.Parameters.Add(new SqlParameter("@link", txtContent.Text));

            if (SCN.Text == "" | CN.Text == "" | txtContent.Text == "")
            {


                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Error')</SCRIPT>");

            }
            else
            {
                cmd.ExecuteNonQuery();

                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Upload Succesful')</SCRIPT>");

            }

            /*   cmd.CommandText = "Upload_Original_Content @type_id='" + txtType.Text + "'and @link='" + txtContent.Text + "'and @new_request_id not null and @contributor_id not null and @subcategory_name not null and @category_id not null";
               cmd.Connection = con;
               sda.SelectCommand = cmd;
               sda.Fill(ds, "Content");
               if (ds.Tables[0].Rows.Count > 0)
               {
                   Label1.Text = "Upload Success";
               }
               else
               {
                   Label1.Text = "Invalid Input";
               }*/
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again')</SCRIPT>");

        }
        con.Close();
    }

    /* protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
     {
         SqlConnection cnn = new SqlConnection();

         cnn.ConnectionString = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=IEgypt_64;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
         cnn.Open();
         SqlCommand cmd1 = new SqlCommand("select specified , information from New_Request", cnn);

         SqlDataAdapter sda = new SqlDataAdapter(cmd1);
         cmd1.ExecuteNonQuery();
         DataTable dt = new DataTable();
         sda.Fill(dt);
         Grid1.DataSource = dt;
         Grid1.DataBind();
         cnn.Close();
         //WebPageTraceListener.ReferenceEquals(cmd1, cnn);

     }*/


    protected void btnUpLoad_Click(object sender, EventArgs e)
    {




        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        try
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Upload_Original_Content", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@type_id", txtType.Text));
            cmd.Parameters.Add(new SqlParameter("@subcategory_name ", SCN1.Text));
            cmd.Parameters.Add(new SqlParameter("@category_id", CN1.Text));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", id));
            cmd.Parameters.Add(new SqlParameter("@link", txtLink.Text));
            if (txtType.Text == "" | SCN1.Text == "" | CN1.Text == "" | txtLink.Text == "")
            {


                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Error')</SCRIPT>");

            }
            else
            {
                cmd.ExecuteNonQuery();
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('Upload Succesful')</SCRIPT>");
            }

            /*   cmd.CommandText = "Upload_Original_Content @type_id='" + txtType.Text + "'and @link='" + txtContent.Text + "'and @new_request_id not null and @contributor_id not null and @subcategory_name not null and @category_id not null";
               cmd.Connection = con;
               sda.SelectCommand = cmd;
               sda.Fill(ds, "Content");
               if (ds.Tables[0].Rows.Count > 0)
               {
                   Label1.Text = "Upload Success";
               }
               else
               {
                   Label1.Text = "Invalid Input";
               }*/
        }
        catch (Exception e1)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=''JavaScript''> alert('OOps an Error Has Occured Try Again Later :)')</SCRIPT>");

        }
        con.Close();
    }

}