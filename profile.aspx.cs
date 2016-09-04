using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class profile : System.Web.UI.Page
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
                Label1.Text = DateTime.Now.ToLongDateString();
                Label2.Text = DateTime.Now.ToLongTimeString();
               
            }
        }


        
        
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        
        string insertsql = "Select * from login where (username='"+ Session["Login"].ToString() + "')" ;

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = insertsql;
        SqlDataReader reader = cmd2.ExecuteReader();
        reader.Read();


        
        
            lblusername.Text = Session["Login"].ToString();
            string s = reader["status"].ToString();
           // Response.Write(s);


            //if (reader["fullname"].ToString() == "-1")
            //lblfullname.Text = "";
            // else
            lblfullname.Text = reader["fullname"].ToString();
            //if (reader["biography"].ToString() == "-1")
            // txtbio.Text = "";
            lblbio.Text = reader["biography"].ToString();
            //else
           // txtbio.Text = reader["biography"].ToString();

            //if (reader["research"].ToString() == "-1")
            //  txtresearch.Text = "";
            //else
            lblresearch.Text = reader["research"].ToString();
            //if (reader["contact"].ToString() == "-1")
            //lblcontact.Text = "";

            // else
            lblcontact.Text = reader["contact"].ToString();
            Image1.ImageUrl = ("Handler.ashx?username=" + Session["Login"]);

            if (reader["status"].ToString() == "admin" )
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
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie cookie = new HttpCookie("swad");
        cookie.Expires = DateTime.Now.AddMonths(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("home.aspx");
    }
    
    /*protected void btnsubmit_Click(object sender, EventArgs e)
    {
        
        
        Response.Redirect("frompdf.aspx");
    }*/



   
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
    /*protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("publish.aspx");
    }
    protected void btnmember_Click(object sender, EventArgs e)
    {
        Response.Redirect("memberlist.aspx");
    }*/
}