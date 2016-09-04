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

public partial class uploadpdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchdata();
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                Stream strm = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(strm);
                Byte[] filesize = br.ReadBytes((int)strm.Length);
                string filetype = FileUpload1.PostedFile.ContentType;
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string insertsql = "insert into uploadfiles(fname,ftype,data) values (@fname,@ftype,@data)";
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = insertsql;
                cmd2.Parameters.AddWithValue("@fname", filename);
                cmd2.Parameters.AddWithValue("@ftype", filetype);
                cmd2.Parameters.AddWithValue("@data", filesize);
                if (filetype != "application/pdf")
                {
                    lblfiles.ForeColor = System.Drawing.Color.Red;
                    lblfiles.Text = "Not PDF!";
                }
                cmd2.ExecuteNonQuery();
                con.Close();
                lblfiles.ForeColor = System.Drawing.Color.Green;
                lblfiles.Text = "Successful Upload!";

            }
            catch
            {
                lblfiles.ForeColor = System.Drawing.Color.Red;
                lblfiles.Text = "Unsuccessful Uploading!";
            }
        }

        else
        {
            lblfiles.ForeColor = System.Drawing.Color.Red;
            lblfiles.Text = "Please Select a File!";
        }
    }

    public void fetchdata()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand c = new SqlCommand("select * from uploadfiles", con);
        SqlDataReader rdr = c.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
        con.Close();
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select fname, data, ftype from uploadfiles where id=@Id";
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["data"];
                    contentType = sdr["ftype"].ToString();
                    fileName = sdr["fname"].ToString();
                }
                con.Close();
            }
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
    
}