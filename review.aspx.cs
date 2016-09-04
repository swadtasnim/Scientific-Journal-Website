using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using AjaxControlToolkit;


using System.Web.Script.Services;
public partial class review : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("home.aspx");
            }

            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-control", "no-cache,no-store,max-age=0,must-revalidate");
                Response.AddHeader("Pragma", "no-cache");


            }
        }




        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        string insertsql = "Select * from login where (username='" + Session["Login"].ToString() + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = insertsql;
        SqlDataReader reader = cmd2.ExecuteReader();
        reader.Read();





        if (reader["status"].ToString() == "admin")
        {
            // btnsubmit.Visible = false;
            // btnreview.Visible = false;
            lblsubmit.Visible = false;
            lblreview.Visible = false;
        }
        else if (reader["status"].ToString() == "reviewer")
        {
            // btnsubmit.Visible = false;
            // btnfiles.Visible = false;
            // btnpublish.Visible = false;
            // btnmember.Visible = false;
            Vwfiles.Visible = false;
            lblpublish.Visible = false;
            lblmember.Visible = false;

        }
        else
        {
            //btnfiles.Visible = false;
            // btnreview.Visible = false;
            //btnpublish.Visible = false;
            //btnmember.Visible = false;
            Vwfiles.Visible = false;
            lblpublish.Visible = false;
            lblmember.Visible = false;
            lblreview.Visible = false;
        }


        reader.Close();
        con.Close();

        SqlConnection con2 = new SqlConnection();
        con2.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con2.Open();

        SqlCommand com = new SqlCommand();
        com.Connection = con2;
        com.CommandText = "Select * from login where(username='" + Session["Login"].ToString() + "')";

        SqlDataReader readerr1 = com.ExecuteReader();
        readerr1.Read();
        name.Text = readerr1["username"].ToString();


        readerr1.Close();
        con2.Close();
    }

    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        /*con.Open();
        SqlCommand cmd = new SqlCommand("insert into RatingDetails(Rate)values(@Rating)",con);
        cmd.Parameters.AddWithValue("@Rating", ratingControl.CurrentRating);
        cmd.ExecuteNonQuery();
        con.Close();*/
        Label1.Text = Rating1.CurrentRating.ToString();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int rating=Rating1.CurrentRating;

            string review = TextBox1.Text;
            string visited = "New!!";
            string pub = "Publish";
            string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand c2 = new SqlCommand())
                {
                    c2.Connection = con;
                    con.Open();
                    c2.CommandText = "UPDATE Publication SET review='" + review + "',rating='" + rating + "',visited='" + visited + "',published='"+pub+"' where id='" + Session["idb"] + "'";
                    c2.ExecuteNonQuery();
                    // SqlDataReader s = c2.ExecuteReader();



                    //fetchdata();
                    //visited = s["visited"].ToString();

                }
                con.Close();

            }

           Response.Write("Sent to admin");
           Response.Redirect("reviewlist.aspx");
        }

        catch
        {
            Response.Write("Did not reach to admin");
        }



    }


    protected void btnreview_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        string insertsql = "Select * from login where (username='" + Session["Login"].ToString() + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = insertsql;
        SqlDataReader reader = cmd2.ExecuteReader();
        reader.Read();
        Session["rv"] = reader["fullname"];
        Response.Redirect("reviewlist.aspx");
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie cookie = new HttpCookie("swad");
        cookie.Expires = DateTime.Now.AddMonths(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("home.aspx");
    }

   
}