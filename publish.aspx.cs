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

public partial class publish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
        {
            if (!IsPostBack)

                fetchdata();
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
        SqlCommand c = new SqlCommand("select * from Publication where published='Publish' or published='Yes' order by date DESC", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();

        rdr.Close();
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


            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                LinkButton lbl = (LinkButton)(GridView1.Rows[i].Cells[5].FindControl("LinkButton2"));
                if (lbl.Text == "Yes")
                    GridView1.Rows[i].Cells[5].Visible = false;
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
    protected void Go_to_review(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        Session["idu"] = id;
        Response.Redirect("vreview.aspx");
    }

    protected void Publish(object sender, EventArgs e)
    {
        int id=  int.Parse((sender as LinkButton).CommandArgument);
        Session["idh"] = id;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand c2 = new SqlCommand())
            {
                c2.Connection = con;
                con.Open();
                int i=1;
                c2.CommandText = "UPDATE Publication SET published='Yes' where id='"+id+"'";
               // c2.ExecuteNonQuery();
               // c2.Parameters.AddWithValue("@date", DateTime.Now);
                SqlDataReader s = c2.ExecuteReader();

                s.Read();

                //s.Close();

                //fetchdata();
                //visited = s["visited"].ToString();

            }
        }


       Response.Redirect("home.aspx");

       



    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie cookie = new HttpCookie("swad");
        cookie.Expires = DateTime.Now.AddMonths(-1);
        Response.Cookies.Add(cookie);
        Response.Redirect("home.aspx");
    }

    protected void Delete_file(object sender, EventArgs e)
    {


        int id = int.Parse((sender as LinkButton).CommandArgument);
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "delete from Publication where id='" + id + "'";
        SqlDataReader rd = cmd.ExecuteReader();
        rd.Read();


        rd.Close();
        
        con.Close();
        // Response.Write("Delete Succefully!");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Delete Successfully!!!');</script>");
        fetchdata();



    }

   
}