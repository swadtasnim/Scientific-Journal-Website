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

public partial class memberlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            if (!IsPostBack)

                fetchdata();
            Label1.Text = DateTime.Now.ToLongDateString();
            Label2.Text = DateTime.Now.ToLongTimeString();
            string connectionString2 = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection con2 = new SqlConnection(connectionString2);

            con2.Open();
            SqlCommand cmd3 = new SqlCommand("select * from login where username='" + Session["Login"].ToString() + "'", con2);
            SqlDataReader r = cmd3.ExecuteReader();
            r.Read();
            // TextBox3.Text = r["fullname"].ToString();
            // Response.Write(r["fullname"].ToString());
            name.Text = r["username"].ToString();
            if (r["status"].ToString() == "admin")
            {
                // btnsubmit.Visible = false;
                // btnreview.Visible = false;
                // lblsubmit.Visible = false;
                // lblreview.Visible = false;
            }
            else if (r["status"].ToString() == "reviewer")
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
                //lblreview.Visible = false;
            }

            con2.Close();

        }
        else
            Response.Redirect("home.aspx");
    }

   public void fetchdata()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        
        SqlCommand c2 = new SqlCommand("select username,fullname,status from login where status='reviewer'", con);
        SqlDataReader rdr2 = c2.ExecuteReader();
        GridView2.DataSource = rdr2;
        GridView2.DataBind();
        con.Close();
        con.Open();
        SqlCommand c = new SqlCommand("select username,fullname,status from login where status='member'", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
        con.Close();
        
    }

   
   protected void Makereviewer(object sender, EventArgs e)
   {
       LinkButton btn = (LinkButton)(sender);
       string name = btn.CommandArgument;
       //Response.Write(name);

       string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
       SqlConnection con = new SqlConnection(connectionString);
       con.Open();
       SqlCommand c = new SqlCommand("update login set status='reviewer' where username='"+name+"'", con);
       c.ExecuteNonQuery();
       Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Process Got Succeed');</script>");

   }
   protected void  Deletemem(object sender, EventArgs e)
   {
       LinkButton btn = (LinkButton)(sender);
       string name= btn.CommandArgument;
       string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
       SqlConnection con = new SqlConnection(constr);
       con.Open();
       SqlCommand cmd = new SqlCommand();
       cmd.Connection = con;
       cmd.CommandText = "delete from login where username='" + name + "'";
       cmd.ExecuteNonQuery();
       con.Close();
       //Response.Write("Delete Succefully!");
       Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Account Has Been Disabled Successfully');</script>");
       fetchdata();
   }

    protected void Makermem(object sender, EventArgs e)
   {
       LinkButton btn = (LinkButton)(sender);
       string name = btn.CommandArgument;
       //Response.Write(name);

       string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
       SqlConnection con = new SqlConnection(connectionString);
       con.Open();
       SqlCommand c = new SqlCommand("update login set status='member' where username='" + name + "'", con);
       c.ExecuteNonQuery();
       Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Process Got Succeed');</script>");
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