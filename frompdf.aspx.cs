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

public partial class frompdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] == null)
            
        
            Response.Redirect("submit.aspx");
        else
        {
            Label1.Text = DateTime.Now.ToLongDateString();
            Label2.Text = DateTime.Now.ToLongTimeString();
            string connectionString2 = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection con2 = new SqlConnection(connectionString2);

            con2.Open();
            SqlCommand cmd3 = new SqlCommand("select * from login where username='" + Session["Login"].ToString() + "'", con2);
            SqlDataReader r = cmd3.ExecuteReader();
            r.Read();
            TextBox3.Text = r["fullname"].ToString();
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
        }
    }
    protected void sendFile(object sender, EventArgs e)
    {

        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                Stream strm = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(strm);
                Byte[] filesize = br.ReadBytes((int)strm.Length);
                string filetype = FileUpload1.PostedFile.ContentType;
                string btype = DropDownList1.SelectedValue;
                
                string Author = TextBox3.Text;
               
                string papername = TextBox2.Text;
               string visited = "New!!";
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                
                    con.Open();
                    
               
                


                string insertsql = "insert into uploadfiles(fname,ftype,data,btype,date,visited,Author,papername) values (@fname,@ftype,@data,@btype,@date,@visited,@Author,@papername)";
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = insertsql;
                
                cmd2.Parameters.AddWithValue("@fname", filename);
                cmd2.Parameters.AddWithValue("@ftype", filetype);
                cmd2.Parameters.AddWithValue("@data", filesize);
                cmd2.Parameters.AddWithValue("@btype", btype);
                cmd2.Parameters.AddWithValue("@date", DateTime.Now);
                cmd2.Parameters.AddWithValue("@visited", visited);
                cmd2.Parameters.AddWithValue("@Author", Author);
                cmd2.Parameters.AddWithValue("@papername", papername);
                
                
                //cmd2.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                
                SqlCommand c = new SqlCommand();
                c.Connection = con;
                c.CommandText = "SELECT * FROM uploadfiles ORDER BY date DECS";
                con.Close();
               
               


                lblfiles.ForeColor = System.Drawing.Color.Green;
                lblfiles.Text = "File has Sent to Admin Successfully!!";
                //Response.Redirect("topdf.aspx");

            }
            catch
            {
                lblfiles.ForeColor = System.Drawing.Color.Red;
                lblfiles.Text = "Unsuccessful Posting!";
            }
        }

        else
        {
            lblfiles.ForeColor = System.Drawing.Color.Red;
            lblfiles.Text = "Please Select a File!";
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