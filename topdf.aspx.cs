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

public partial class topdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {    if(!IsPostBack)

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
        SqlCommand c = new SqlCommand("select * from uploadfiles order by date DESC", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
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
                else if(quantity == "visited")
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.Green;
                }
                
                
            }

            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            DropDownList ddl = (DropDownList)e.Row.FindControl("DropDownList1");
            SqlCommand cmd = new SqlCommand("select fullname from login where status='reviewer'",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            ddl.DataSource = ds;
            ddl.DataTextField = "fullname";
            ddl.DataValueField = "fullname";
            ddl.DataBind();
           // ddl.Items.Insert(0, new ListItem("--Select Reviewer--", "0"));
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
                c2.CommandText = "UPDATE uploadfiles SET visited='visited'";
                c2.ExecuteNonQuery();
                SqlDataReader s = c2.ExecuteReader();



                //fetchdata();
                //visited = s["visited"].ToString();

            }
        }
    }


    protected void DownloadFile(object sender, EventArgs e)
    {
       
        int id= int.Parse((sender as LinkButton).CommandArgument);
        
        byte[] bytes;
        string fileName, contentType,btype,date,visited;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {


           
           
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select fname, data, ftype,btype,date,visited from uploadfiles where id=@Id";
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
                c2.CommandText = "UPDATE uploadfiles SET visited='visited'";
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
        
        Response.Flush();

       
        
        Response.End();
        
        
        
       

        
    }


    protected void Send_to_review(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        //Session["idb"] = id;
        byte[] bytes;
        string fileName, contentType, btype,  visited,Authors,papername;
        visited = "New!!";

        GridViewRow gvRow = (GridViewRow)(sender as LinkButton).Parent.Parent;
        int index = gvRow.RowIndex;
        //Response.Write(index);


       // int rowid =   row.RowIndex;
        var ddl = GridView1.Rows[index].FindControl("DropDownList1") as DropDownList;

        string text = ddl.SelectedItem.Text;
        string value = ddl.SelectedValue;
        //Response.Write(text);
        string pub="No";
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {


            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select fname, data, ftype,btype,Author,papername from uploadfiles where id='" + id + "'";



                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["data"];
                    contentType = sdr["ftype"].ToString();
                    fileName = sdr["fname"].ToString();
                    btype = sdr["btype"].ToString();
                    Authors = sdr["Author"].ToString();
                    papername = sdr["papername"].ToString();
                    // date = sdr["date"].ToString();
                    //visited = sdr["visited"].ToString();


                }


            }



                using (SqlCommand c2 = new SqlCommand())
                {
                    c2.Connection = con;
                    c2.CommandText = "insert into Publication(fname,ftype,data,btype,date,visited,id,Authors,papername,reviewer,published) values (@fname,@ftype,@data,@btype,@date,@visited,'" + id + "',@Authors,@papername,'"+text+"','"+pub+"')";
                    c2.Parameters.AddWithValue("@id", id);
                    c2.Parameters.AddWithValue("@fname", fileName);
                    c2.Parameters.AddWithValue("@ftype", contentType);
                    c2.Parameters.AddWithValue("@data", bytes);
                    c2.Parameters.AddWithValue("@btype", btype);
                    c2.Parameters.AddWithValue("@date", DateTime.Now);
                    c2.Parameters.AddWithValue("@visited", visited);
                    c2.Parameters.AddWithValue("@Authors", Authors);
                    c2.Parameters.AddWithValue("@papername", papername);


                    c2.ExecuteNonQuery();
                }

            using(SqlCommand cmd2 = new SqlCommand())
            {
                cmd2.Connection = con;
                cmd2.CommandText = "delete from uploadfiles where id='" + id + "'";
                cmd2.ExecuteNonQuery();
            }
                con.Close();
            
        }

        //Response.Write("Send To Reviwer Successfully!!!");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Send To Reviwer Successfully!!!');</script>");
        //Response.Redirect("profile.aspx");

    }
    protected void Delete_file(object sender, EventArgs e)
    {
        
        
            int id = int.Parse((sender as LinkButton).CommandArgument);
            string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from uploadfiles where id='" + id + "'";
            cmd.ExecuteNonQuery();
            con.Close();
            //Response.Write("Delete Succefully!");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Delete Successfully');</script>");
            fetchdata();
        


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