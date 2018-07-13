using Npgsql;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddingObject_type : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        NpgsqlConnection myConn = new NpgsqlConnection(connString);
        try
        {
            string queryinsert = "insert into \"Object_type\" (object_type_id, name, code) " +
                    "select '" + ASPxTextBox1.Text + "', '" + ASPxTextBox2.Text + "', '" + ASPxTextBox3.Text + "'";
            myConn.Open();
            NpgsqlCommand np = new NpgsqlCommand(queryinsert, myConn);
            np.ExecuteNonQuery();
        }
        catch (NpgsqlException ex)
        {
        }
        finally
        {
            myConn.Close();
        }
    }
}