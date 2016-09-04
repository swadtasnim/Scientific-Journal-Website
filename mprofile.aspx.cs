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
public partial class mprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        string insertsql = "Select * from login where (username='" + Session["profile"] + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = insertsql;
        SqlDataReader reader = cmd2.ExecuteReader();
        reader.Read();



        


        //if (reader["fullname"].ToString() == "-1")
        //lblfullname.Text = "";
        // else
        lblfullname.Text = reader["fullname"].ToString();
        string n=reader["fullname"].ToString();
        //if (reader["biography"].ToString() == "-1")
        // txtbio.Text = "";
        //else
       // txtbio.Text = reader["biography"].ToString();
        //if (reader["research"].ToString() == "-1")
        //  txtresearch.Text = "";
        //else
       // txtresearch.Text = reader["research"].ToString();
        //if (reader["contact"].ToString() == "-1")
        //lblcontact.Text = "";

        // else
        lblcontact.Text = reader["contact"].ToString();

        Label1.Text = reader["biography"].ToString();
        Label2.Text = reader["research"].ToString();
        Image1.ImageUrl = ("Handler.ashx?username=" + Session["profile"]);

        con.Close();
        con.Open();
        SqlCommand c = new SqlCommand("select papername from Publication where authors='"+n+"'", con);
        SqlDataReader s = c.ExecuteReader();
        GridView1.DataSource = s;
        GridView1.DataBind();
        con.Close();
    }


    protected void Go_to_review(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string b = btn.CommandArgument;

        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select * from Publication  where papername='" + b + "'", con);
        SqlDataReader r = c.ExecuteReader();
        r.Read();
        Session["idu"] = (int)r["id"];
        con.Close();
        Response.Redirect("vreview.aspx");



    }
}