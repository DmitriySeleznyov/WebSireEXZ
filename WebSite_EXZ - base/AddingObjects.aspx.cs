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

public partial class AddingObjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        NpgsqlConnection myConn = new NpgsqlConnection(connString);
        try 
        { 
            byte[] pic = jpgtobytea();
            string queryinsert = "insert into \"Objects\" (object_name, object_id, object_type, short_name, add_info, loc, latitude, longitude ,picture) " +
                    "select '" + ASPxTextBox1.Text + "', '" + ASPxTextBox2.Text + "', '" + ASPxTextBox3.Text + "', '" + ASPxTextBox4.Text + "', '"
                    + ASPxTextBox5.Text + "', '" + ASPxTextBox6.Text + "', '"
                    + stringrefactor(ASPxTextBox7.Text) + "', '" + stringrefactor(ASPxTextBox8.Text) + "' , :pic";
            myConn.Open();
            NpgsqlCommand np = new NpgsqlCommand(queryinsert, myConn);
            np.Parameters.Add(new NpgsqlParameter("pic", pic));
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

    private string stringrefactor(string str)
    {
        return str.Replace(',', '.');
    }

    public byte[] jpgtobytea()
    {
        Bitmap image1 = (Bitmap)System.Drawing.Image.FromFile(LastFile());
        using (var ms = new MemoryStream())
        {
            image1.Save(ms, image1.RawFormat);
            return ms.ToArray();
        }
    }

    public string LastFile()
    {
        var directory = new DirectoryInfo("O:\\repos\\WebSiteEXZ\\WebSite_EXZ - base\\Images\\PicturesSubject\\");
        var myFile = directory.GetFiles()
                     .OrderByDescending(f => f.LastWriteTime)
                     .First();
        return myFile.FullName;
    }

    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
    {
        e.CallbackData = String.Format("Images\\PicturesSubject\\Picture_{0}", e.UploadedFile.FileName);
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
    }
}