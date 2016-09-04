using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fetchdata();
        }
        Label1.Text = DateTime.Now.ToLongDateString();
        Label2.Text = DateTime.Now.ToLongTimeString();
       // HttpCookie cookie = Request.Cookies["swad"];
        HttpCookie cookie = Request.Cookies["swad"];
        if (cookie != null)
        {
            if (!cookie.Value.Equals(-1))
            {
                //Session.Clear();

                //Session["login"] = Login1.UserName.ToString();

                Response.Redirect("profile.aspx");
            }
        }
        
    }

    
    public void fetchdata()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select papername from Publication  where btype='General science' and published='Yes'", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
        GridView1.GridLines = GridLines.None;
        rdr.Close();
        con.Close();

        con.Open();
        SqlCommand c2 = new SqlCommand("select papername from Publication  where btype='Neuroscience & Psychology' and published='Yes'", con);
        SqlDataReader rdr2 = c2.ExecuteReader();
        GridView2.DataSource = rdr2;
        GridView2.DataBind();
        GridView2.GridLines = GridLines.None;
        rdr2.Close();
        con.Close();
        con.Open();
        SqlCommand c3 = new SqlCommand("select papername from Publication  where btype='Genetics & Molicular Biology' and published='Yes'", con);
        SqlDataReader rdr3 = c3.ExecuteReader();
        GridView3.DataSource = rdr3;
        GridView3.DataBind();
        GridView3.GridLines = GridLines.None;
        rdr3.Close();
        con.Close();
        con.Open();
        SqlCommand c4 = new SqlCommand("select papername from Publication  where btype='Biochemistry' and published='Yes'", con);
        SqlDataReader rdr4 = c4.ExecuteReader();
        GridView4.DataSource = rdr4;
        GridView4.DataBind();
        GridView4.GridLines = GridLines.None;
        rdr4.Close();
        con.Close();
        con.Open();
        SqlCommand c5 = new SqlCommand("select papername from Publication  where btype='Engineering' and published='Yes'", con);
        SqlDataReader rdr5 = c5.ExecuteReader();
        GridView5.DataSource = rdr5;
        GridView5.DataBind();
        GridView5.GridLines = GridLines.None;
        rdr5.Close();
        con.Close();
        con.Open();
        SqlCommand c6 = new SqlCommand("select papername from Publication  where btype='Chemistry' and published='Yes'", con);
        SqlDataReader rdr6 = c6.ExecuteReader();
        GridView6.DataSource = rdr6;
        GridView6.DataBind();
        GridView6.GridLines = GridLines.None;
        rdr6.Close();
        con.Close();

        con.Open();
        SqlCommand c7 = new SqlCommand("select papername from Publication  where btype='Physics' and published='Yes'", con);
        SqlDataReader rdr7 = c7.ExecuteReader();
        GridView7.DataSource = rdr7;
        GridView7.DataBind();
        GridView7.GridLines = GridLines.None;
        rdr7.Close();
        con.Close();
        con.Open();
        SqlCommand c8 = new SqlCommand("select papername from Publication  where btype='Material Sciences' and published='Yes'", con);
        SqlDataReader rdr8 = c8.ExecuteReader();
        GridView8.DataSource = rdr8;
        GridView8.DataBind();
        GridView8.GridLines = GridLines.None;
        rdr8.Close();
        con.Close();
        con.Open();
        SqlCommand c9 = new SqlCommand("select papername from Publication  where btype='Social & Political Science' and published='Yes'", con);
        SqlDataReader rdr9 = c9.ExecuteReader();
        GridView9.DataSource = rdr9;
        GridView9.DataBind();
        GridView9.GridLines = GridLines.None;
        rdr9.Close();
        con.Close();
        con.Open();
        SqlCommand c10 = new SqlCommand("select papername from Publication  where btype='Earth & Environmental Science' and published='Yes'", con);
        SqlDataReader rdr10 = c10.ExecuteReader();
        GridView10.DataSource = rdr10;
        GridView10.DataBind();
        GridView10.GridLines = GridLines.None;
        rdr10.Close();
        con.Close();
        con.Open();
        SqlCommand c11= new SqlCommand("select papername from Publication  where btype='Chemical Engineering' and published='Yes'", con);
        SqlDataReader rdr11 = c11.ExecuteReader();
        GridView11.DataSource = rdr11;
        GridView11.DataBind();
        GridView11.GridLines = GridLines.None;
        rdr11.Close();
        con.Close();
        con.Open();
        SqlCommand c12 = new SqlCommand("select papername from Publication  where btype='Medical' and published='Yes'", con);
        SqlDataReader rdr12 = c12.ExecuteReader();
        GridView12.DataSource = rdr12;
        GridView12.DataBind();
        GridView12.GridLines = GridLines.None;
        rdr12.Close();
        con.Close();
        con.Open();
        SqlCommand c13 = new SqlCommand("select papername from Publication  where btype='Agri Food & Aqua' and published='Yes'", con);
        SqlDataReader rdr13 = c13.ExecuteReader();
        GridView13.DataSource = rdr13;
        GridView13.DataBind();
        GridView13.GridLines = GridLines.None;
        rdr13.Close();
        con.Close();
        con.Open();
        SqlCommand c14 = new SqlCommand("select papername from Publication  where btype='Immunology & Microbiology' and published='Yes'", con);
        SqlDataReader rdr14 = c14.ExecuteReader();
        GridView14.DataSource = rdr14;
        GridView14.DataBind();
        GridView14.GridLines = GridLines.None;
        rdr14.Close();
        con.Close();
        con.Open();
        SqlCommand c15 = new SqlCommand("select papername from Publication  where btype='Pharmaceutical Sciences' and published='Yes'", con);
        SqlDataReader rdr15 = c15.ExecuteReader();
        GridView15.DataSource = rdr15;
        GridView15.DataBind();
        GridView15.GridLines = GridLines.None;
        rdr15.Close();
        con.Close();
        con.Open();
        SqlCommand c16 = new SqlCommand("select papername from Publication  where btype='Informatics' and published='Yes'", con);
        SqlDataReader rdr16 = c16.ExecuteReader();
        GridView16.DataSource = rdr16;
        GridView16.DataBind();
        GridView16.GridLines = GridLines.None;
        rdr16.Close();
        con.Close();
        con.Open();
        SqlCommand c17 = new SqlCommand("select papername from Publication  where btype='Business and Management' and published='Yes'", con);
        SqlDataReader rdr17 = c17.ExecuteReader();
        GridView17.DataSource = rdr17;
        GridView17.DataBind();
        GridView17.GridLines = GridLines.None;
        rdr17.Close();
        con.Close();


    
    }

   /* protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
                tc.BorderWidth = 0;
                tc.BorderColor = System.Drawing.Color.Transparent;
            }
        }
    }*/

    protected void Go_to_review(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string b = btn.CommandArgument;

        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select * from Publication  where papername='" + b +"'", con);
        SqlDataReader r = c.ExecuteReader();
        r.Read();
        Session["idu"] = (int)r["id"];
        con.Close();
        Response.Redirect("vreview.aspx");
        


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




        SqlCommand cmd = new SqlCommand("SELECT papername FROM Publication WHERE papername LIKE '%" + prefixText + "%'", con);
        List<string> k = new List<string>();
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                k.Add(sdr["papername"].ToString());
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
        SqlCommand q = new SqlCommand("select * from Publication  where papername='" + TextBox1.Text + "'", con);
        SqlDataReader r1 = q.ExecuteReader();

        if (r1.HasRows)
        {
            r1.Read();
            Session["idu"] = (int)r1["id"];
            Response.Redirect("vreview.aspx");
        }

        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('This content is not here.');</script>");
        }
        r1.Close();
        con.Close();
    }
   
}