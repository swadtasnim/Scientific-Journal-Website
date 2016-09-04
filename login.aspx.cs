using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin.aspx");
    }
}
