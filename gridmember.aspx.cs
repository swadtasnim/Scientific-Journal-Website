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

public partial class gridmember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchdata();
        Label1.Text = DateTime.Now.ToLongDateString();
        Label2.Text = DateTime.Now.ToLongTimeString();
    }

    public void fetchdata()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select * from login", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
        rdr.Close();
        con.Close();
    }

    protected void gotomprofile(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        Session["profile"]= btn.CommandArgument;
        Response.Redirect("mprofile.aspx");
        
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

        SqlConnection con = new SqlConnection();

        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;


        con.Open();

        SqlCommand select = new SqlCommand();
        select.Connection = con;

        select.CommandText = "select username from login where username= '" + Login1.UserName.ToString() + "' and password = '" + Login1.Password.ToString() + "' ";




        SqlDataReader reader = select.ExecuteReader();
        if (reader.Read())
        {
            Session["Login"] = Login1.UserName.ToString();

            if (Login1.RememberMeSet == true)
            {
                HttpCookie cookie = Request.Cookies["swad"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("swad");
                    cookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(cookie);
                }
            }
            Response.Redirect("profile.aspx");

        }

        reader.Close();
        con.Close();
    }

    protected void B_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin.aspx");
    }


    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static List<string> GetCompletionList(string prefixText, int count)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        con.Open();




        SqlCommand cmd = new SqlCommand("SELECT fullname FROM login WHERE fullname LIKE '%" + prefixText + "%'", con);
        List<string> k = new List<string>();
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                k.Add(sdr["fullname"].ToString());
            }
        }
        con.Close();
        return k;

        //con.Close();

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand q = new SqlCommand("select * from login  where fullname='" + TextBox1.Text + "'", con);
        SqlDataReader r1 = q.ExecuteReader();

        if (r1.HasRows)
        {
            r1.Read();
            Session["profile"] = r1["username"];
            Response.Redirect("mprofile.aspx");
        }

        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('This content is not here.');</script>");
        }
        r1.Close();
        con.Close();
    }
   
}