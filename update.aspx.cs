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
public partial class update : System.Web.UI.Page
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
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand c= new SqlCommand("select * from login where username='"+Session["login"].ToString()+"'" ,con);
                SqlDataReader sdr = c.ExecuteReader();
                sdr.Read();
                txtfullname.Text = sdr["fullname"].ToString();
                txtbio.Text = sdr["biography"].ToString();
                txtresearch.Text = sdr["research"].ToString();
                txtcontact.Text = sdr["contact"].ToString();
                txtusername.Text = sdr["username"].ToString();
                txtpassword.Text = sdr["password"].ToString();
                

                





                if (sdr["status"].ToString() == "admin")
                {
                    // btnsubmit.Visible = false;
                    // btnreview.Visible = false;
                    lblsubmit.Visible = false;
                    lblreview.Visible = false;
                }
                else if (sdr["status"].ToString() == "reviewer")
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


                sdr.Close();
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
        }
    }
   


    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie cookie = new HttpCookie("swad");
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("home.aspx");
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        Stream strm = FileUpload1.PostedFile.InputStream;
        BinaryReader br = new BinaryReader(strm);
        Byte[] filesize = br.ReadBytes((int)strm.Length);
        string filetype = FileUpload1.PostedFile.ContentType;
        if (CheckEmail(txtusername.Text, txtpassword.Text))
        {
            lblMsg.Visible = true;
            lblMsg.Text = "This User ID is already available";
            lblMsg.ForeColor = System.Drawing.Color.Red;

        }

        else
        //string insertsql = "insert into profile (fullname,biography,research,contact) values (@fullname,@biography,@research,@contact)";
        {
            string insertsql = "update login set username='" + txtusername.Text + "',password='" + txtpassword.Text + "',fullname='" + txtfullname.Text + "',biography= '" + txtbio.Text + "',research= '" + txtresearch.Text + "',contact='" + txtcontact.Text + "',propic=@propic,picname='" + filename + "',pictype='" + filetype + "' where(username='" + Session["Login"] + "')";

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = insertsql;
            //Pass the values from FileUpload control here
            cmd2.Parameters.Add("@propic", SqlDbType.VarBinary);
            cmd2.Parameters["@propic"].Value = filesize;
            SqlDataReader r = cmd2.ExecuteReader();
            r.Read();
            /*SqlParameter fullname = new SqlParameter("@fullname", SqlDbType.NChar, 20);
            SqlParameter biography = new SqlParameter("@biography", SqlDbType.NVarChar, 1000);
            SqlParameter research = new SqlParameter("@research", SqlDbType.NVarChar,1000);
           // SqlParameter photo = new SqlParameter("@photo", SqlDbType.Image);
            SqlParameter contact = new SqlParameter("@contact", SqlDbType.NChar, 20);

            fullname.Value = txtfullname.Text.ToString();
            biography.Value = txtbio.Text.ToString();
            research.Value = txtresearch.Text.ToString();
            contact.Value = txtcontact.Text.ToString();

            cmd2.Parameters.Add(fullname);
            cmd2.Parameters.Add(biography);
            cmd2.Parameters.Add(research);
            cmd2.Parameters.Add(contact);


            cmd2.ExecuteNonQuery();*/

            r.Close();
            con.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Updated Successfully');</script>");
            Session["Login"] = txtusername.Text;
           Response.Redirect("profile.aspx");
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

    public static bool CheckEmail(string u, string p)
    {
        bool retval;
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string insertsql = "Select * from login where username=@username or password=@password";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = insertsql;
        SqlParameter username = new SqlParameter("@username", SqlDbType.NChar, 10);
        SqlParameter password = new SqlParameter("@password", SqlDbType.NChar, 10);
        username.Value = u;
        password.Value = p;
        cmd.Parameters.Add(username);
        cmd.Parameters.Add(password);

        SqlDataReader r1 = cmd.ExecuteReader();
        int i = 0;
        while (r1.Read())
        
            i++;
            if (i>1)
            {
                retval = true;

            }
            else
            {
                retval = false;
            }
        

        return retval;
    }
}