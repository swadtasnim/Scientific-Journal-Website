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
public partial class signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        /* string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
         string insertsql = "Select * from login where username=@username or password=@password";

         SqlConnection con = new SqlConnection(connectionString);
         con.Open();

         SqlCommand cmd = new SqlCommand();
        
         cmd.Connection = con;
         cmd.CommandType = CommandType.Text;
         cmd.CommandText = insertsql;
         SqlParameter username = new SqlParameter("@username", SqlDbType.NChar, 10);
         SqlParameter password = new SqlParameter("@password", SqlDbType.NChar, 10);
         username.Value = txtusername.Text.ToString();
         password.Value = txtpassword.Text.ToString();
         cmd.Parameters.Add(username);
         cmd.Parameters.Add(password);

         SqlDataReader r1 = cmd.ExecuteReader();*/
        if (CheckBox1.Checked == false)
        {
            Lblv.Visible = true;
            Lblv.Text = "Please check the button.";
            Lblv.ForeColor = System.Drawing.Color.Red;

        }
        else
        {
            if (CheckEmail(txtusername.Text.ToString(), txtpassword.Text.ToString()))
            {
                lblMsg.Visible = true;
                lblMsg.Text = "This User ID is already available";
                lblMsg.ForeColor = System.Drawing.Color.Red;

            }

            else
            {
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                string insertsql = "insert into login (username,password,fullname,biography,research,contact,status) values (@username,@password,@fullname,@biography,@research,@contact,'member')";

                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = insertsql;
                SqlParameter username2 = new SqlParameter("@username", SqlDbType.NChar, 10);
                SqlParameter password2 = new SqlParameter("@password", SqlDbType.NChar, 10);
                SqlParameter fullname2 = new SqlParameter("@fullname", SqlDbType.NChar, 20);
                SqlParameter biography2 = new SqlParameter("@biography", SqlDbType.NVarChar, 1000);
                SqlParameter research2 = new SqlParameter("@research", SqlDbType.NVarChar, 1000);
                SqlParameter contact2 = new SqlParameter("@contact", SqlDbType.NChar, 30);
                username2.Value = txtusername.Text.ToString();
                password2.Value = txtpassword.Text.ToString();

                fullname2.Value = txtfullname.Text.ToString();
                biography2.Value = "No Data Yet";
                research2.Value = "No Data Yet";
                contact2.Value = "No Data Yet";

                cmd2.Parameters.Add(username2);
                cmd2.Parameters.Add(password2);
                cmd2.Parameters.Add(fullname2);
                cmd2.Parameters.Add(biography2);
                cmd2.Parameters.Add(research2);
                cmd2.Parameters.Add(contact2);


                cmd2.ExecuteNonQuery();
                /* SqlCommand c = new SqlCommand();
                 c.Connection = con;

                 c.CommandText = "insert into profile (username,fullname,biography,research,contact) values (@username,@fullname,@biography,@research,@contact)";
                 SqlParameter username3 = new SqlParameter("@username", SqlDbType.NChar, 20);
                 SqlParameter fullname = new SqlParameter("@fullname", SqlDbType.NChar, 20);
                 SqlParameter biography = new SqlParameter("@biography", SqlDbType.NVarChar, 1000);
                 SqlParameter research = new SqlParameter("@research", SqlDbType.NVarChar, 1000);
                 // SqlParameter photo = new SqlParameter("@photo", SqlDbType.Image);
                 SqlParameter contact = new SqlParameter("@contact", SqlDbType.NChar, 20);

                 fullname.Value = "-1";
                 biography.Value = "-1";
                 research.Value = "-1";
                 contact.Value = "-1";

                 c.Parameters.Add(fullname);
                 c.Parameters.Add(biography);
                 c.Parameters.Add(research);
                 c.Parameters.Add(contact);
                 username3.Value = txtusername.Text.ToString();
                 c.Parameters.Add(username3);
                 c.ExecuteNonQuery();*/

                lblMsg.Visible = true;
                lblMsg.Text = "Registration Successful!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("home.aspx");
            }
        }

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
        if (r1.HasRows)
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