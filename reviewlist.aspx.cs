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

public partial class reviewlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            Label2.Text = DateTime.Now.ToLongDateString();
            Label3.Text = DateTime.Now.ToLongTimeString();
            string connectionString2 = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection con2 = new SqlConnection(connectionString2);

            con2.Open();
            SqlCommand cmd3 = new SqlCommand("select * from login where username='" + Session["Login"].ToString() + "'", con2);
            SqlDataReader r = cmd3.ExecuteReader();
            r.Read();
            //TextBox3.Text = r["fullname"].ToString();
            // Response.Write(r["fullname"].ToString());
            name.Text = r["username"].ToString();
            if (r["status"].ToString() == "admin")
            {
                // btnsubmit.Visible = false;
                // btnreview.Visible = false;
                lblsubmit.Visible = false;
                lblreview.Visible = false;
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
                lblreview.Visible = false;
            }

            con2.Close();
            
            fetchdata(); }
        else
            Response.Redirect("submit.aspx");
    }

    public void fetchdata()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select * from Publication where published='No' and reviewer='"+ Session["rv"].ToString()+"' order by date DESC", con);
        SqlDataReader rdr = c.ExecuteReader();
        
        
        GridView1.DataSource = rdr;
        GridView1.DataBind();
        con.Close();
        con.Open();
        SqlCommand c2 = new SqlCommand("select * from Publication where published='No' and reviewer='" + Session["rv"].ToString() + "'  order by date DESC", con);
        SqlDataReader rdr2 = c2.ExecuteReader();
        int i = 0;
        while(rdr2.Read())
        {
        i++;
         }
         Label1.Text = i.ToString();
        con.Close();







    }

    public void onrowdatabound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string quantity = (e.Row.Cells[0].Text);


            foreach (TableCell cell in e.Row.Cells)
            {
                if (quantity == "New!!")
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.Red;
                    foo();
                }
                else if (quantity == "visited")
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.Green;
                }


            }
        }
    }

    public void foo()
    {
        System.Threading.Timer timer = null;
        timer = new System.Threading.Timer((obj) =>
        {
            updatevisit();
            timer.Dispose();
        },
                    null, 1000, System.Threading.Timeout.Infinite);
    }


    public void updatevisit()
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand c2 = new SqlCommand())
            {
                c2.Connection = con;
                con.Open();
                c2.CommandText = "UPDATE Publication SET visited='visited'";
                c2.ExecuteNonQuery();
                SqlDataReader s = c2.ExecuteReader();



                //fetchdata();
                //visited = s["visited"].ToString();

            }
        }
    }


    protected void DownloadFile(object sender, EventArgs e)
    {

        int id = int.Parse((sender as LinkButton).CommandArgument);

        byte[] bytes;
        string fileName, contentType, btype, date, visited;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {


            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select fname, data, ftype,btype,date,visited from Publication where id=@Id";
                cmd.Parameters.AddWithValue("@id", id);


                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["data"];
                    contentType = sdr["ftype"].ToString();
                    fileName = sdr["fname"].ToString();
                    btype = sdr["btype"].ToString();
                    date = sdr["date"].ToString();
                    visited = sdr["visited"].ToString();


                }



            }
           /* using (SqlCommand c2 = new SqlCommand())
            {
                c2.Connection = con;
                c2.CommandText = "UPDATE Publication SET visited='visited'";
                c2.ExecuteNonQuery();
                SqlDataReader s = c2.ExecuteReader();


                fetchdata();
                //visited = s["visited"].ToString();

            }*/

            con.Close();

        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
       // Response.AddHeader("Refresh", "12;URL=topdf.aspx");
        Response.Flush();

        Response.End();




    }

    protected void Go_to_review(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        Session["idb"] = id;
      
        Response.Redirect("review.aspx");
    }

    

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie cookie = new HttpCookie("swad");
        cookie.Expires = DateTime.Now.AddMonths(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("home.aspx");
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
}