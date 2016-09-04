<%@ WebHandler Language="C#" Class="Handler" %>

using System;

using System.Web;

using System.Data.SqlClient;

using System.Data;

using System.IO;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        SqlCommand cmd = new SqlCommand("select * from login where username = '"+context.Request.QueryString["username"]+"'", connection);

        SqlDataReader r = cmd.ExecuteReader();
        while(r.Read())
        {
            context.Response.ContentType = r["pictype"].ToString();
            byte[] binaryImage = (byte[])r["propic"];
           
            
            context.Response.BinaryWrite(binaryImage);
        }

        r.Close();       
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}