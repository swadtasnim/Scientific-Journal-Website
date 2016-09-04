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
using AjaxControlToolkit;

public partial class vreview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        string insertsql = "Select * from Publication where (id='" + Session["idu"] + "')";

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
       // Label3.Text = reader["downloads"].ToString();
        lbltitle.Text = reader["papername"].ToString();
        //if (reader["biography"].ToString() == "-1")
        // txtbio.Text = "";
        //else
        Label1.Text = reader["rating"].ToString();
       // Label2.Text = Rating1.CurrentRating.ToString();
        //if (reader["research"].ToString() == "-1")
        //  txtresearch.Text = "";
        //else
        lblreview.Text = reader["review"].ToString();
        //if (reader["contact"].ToString() == "-1")
        //lblcontact.Text = "";

        // else
       // lblauthor.Text = reader["Authors"].ToString();
        Label2.Text = reader["date"].ToString();
        LinkButton1.Text = reader["Authors"].ToString();
        BindRatingControl();


    }

   /* protected void RatingControlChanged(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        string insertsql = "Select * from Publication where (id='" + Session["idu"] + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("update  Publication set rating='"+(int)Rating1.CurrentRating + "' where id='"+ Session["idu"] +"'", con);
        
        cmd.ExecuteNonQuery();
        con.Close();
        BindRatingControl();
    }*/

    protected void BindRatingControl()
    {
        int total = 0;
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

       // string insertsql = "Select * from Publication where (id='" + Session["idu"] + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        DataTable dt = new DataTable();
        
        SqlCommand cmd = new SqlCommand("Select rating from Publication where id='"+Session["idu"]+"'", con);
        
        SqlDataReader sdr= cmd.ExecuteReader();
        sdr.Read();
        
        
       /* SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                total += Convert.ToInt32(dt.Rows[i][0].ToString());
            }
            int average = total / (dt.Rows.Count);*/

      
           Rating1.CurrentRating = (int)sdr["rating"];
           // Label2.Text = i + "user(s) have rated this article";
        }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        //int id = int.Parse((sender as LinkButton).CommandArgument);
        int id = (int)Session["idu"];
        int downloads=1;
        byte[] bytes;
        string fileName, contentType, btype, date, visited;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            con.Open();
            
           /* using (SqlCommand c2 = new SqlCommand())
            {
                c2.Connection = con;
                c2.CommandTimeout = 50;
                c2.CommandText = "UPDATE Publication SET downloads= downloads+1 where id='" + Session["idu"] + "'";
                // c2.ExecuteNonQuery();
                SqlDataReader s = c2.ExecuteReader();
                s.Read();


                // fetchdata();
                //visited = s["visited"].ToString();


            } */
           


            using (SqlCommand cmd = new SqlCommand())
            {    
                cmd.CommandText = "select fname, data, ftype,btype,date,visited from Publication where id=@Id";
                cmd.Parameters.AddWithValue("@id", id);
               // con.Open();

                cmd.Connection = con;
               
                
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["data"];
                    contentType = sdr["ftype"].ToString();
                    fileName = sdr["fname"].ToString();
                    btype = sdr["btype"].ToString();
                    date = sdr["date"].ToString();
                    visited = sdr["visited"].ToString();
                   //downloads = (int)sdr["downloads"];


                }



            }

           


            con.Close();

        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);

        Response.Flush();



       // Response.End();
        //incrsdwn();
       // SqlConnection conn = new SqlConnection(constr);
       
        Response.End();
        
    }

   /* public void incrsdwn()
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        using (SqlCommand c2 = new SqlCommand())
        {
            c2.Connection = con;
           // c2.CommandTimeout = 70;
            c2.CommandText = "UPDATE Publication SET downloads= downloads+1 where id='" + Session["idu"] + "'";
            // c2.ExecuteNonQuery();
            SqlDataReader s = c2.ExecuteReader();
            s.Read();


            // fetchdata();
            //visited = s["visited"].ToString();

        }
    }*/
    protected void Go_to_profile(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        //string insertsql = "Select * from Publication where (id='" + Session["idu"] + "')";

        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("Select * from Publication where (id='" + Session["idu"] + "')", con);
        SqlDataReader sdr = c.ExecuteReader();
        sdr.Read();
        string a = sdr["authors"].ToString();
        con.Close();
        con.Open();
        SqlCommand c2 = new SqlCommand("Select username from login where (fullname='" + a + "')", con);
        SqlDataReader sdr2 = c2.ExecuteReader();
        sdr2.Read();
        Session["profile"] = sdr2["username"].ToString();
        Response.Redirect("mprofile.aspx");
       
        
    }
}
