using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
public partial class authors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* if (Session["a"] == null)

             Response.Redirect("home.aspx");

         else
         {


             Response.ClearHeaders();


             Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");

             Response.AddHeader("Pragma", "no-cache");


         }*/

        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;


        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        connection.Open();


        command.CommandText = "Select * from  login ";
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {

            r.Text += "<tr ><td style=\" height:60px;text-align:center; valign:top; background-color:Tan;\">" + reader["username"] + "</td><td  style=\" text-align:center; valign:top; background-color:Tan;\">" + reader["fullname"] + "</td></tr> ";

        }
        reader.Close();

        connection.Close();





    }

}