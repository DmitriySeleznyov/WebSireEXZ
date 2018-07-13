using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using DevExpress.Web;
using DevExpress.Web.ASPxTreeList;
using Npgsql;
using System.Web.Security;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;
using Geocoding;
using System.Reflection;
using System.Runtime.Serialization.Formatters;
using DevExpress.Utils.MVVM.Services;
using System.Drawing;

public partial class About : System.Web.UI.Page
{
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    static bool changed = false;
    static string short_name;
    static string comp_id;

    protected string GetShortName()
    {
        if (Page.User.IsInRole("Members"))
        {
        }
        else
        {
            if (Session["SelectedSubject"] != null)
            {
                TreeListNode SNode = (TreeListNode)Session["SelectedSubject"];
                short_name = SNode.GetValue("subject_name").ToString();
            }
        }
        return short_name;
    }

    protected string GetCompId()
    {
        if (Page.User.IsInRole("Members"))
        {
        }
        else
        {
            if (Session["SelectedSubject"] != null)
            {
                TreeListNode SNode = (TreeListNode)Session["SelectedSubject"];
                comp_id = SNode.GetValue("subject_id").ToString();
            }
        }
        return comp_id;
    }

    public static Control GetPostBackControl(Page thePage)
    {
        Control myControl = null;
        string ctrlName = thePage.Request.Params.Get("__EVENTTARGET");
        if (((ctrlName != null) & (ctrlName != string.Empty)))
        {
            myControl = thePage.FindControl(ctrlName);
        }
        else
        {
            foreach (string Item in thePage.Request.Form)
            {
                Control c = thePage.FindControl(Item);
                if (c != null)
                {
                    if (((c) is System.Web.UI.WebControls.Button))
                    {
                        myControl = c;
                    }
                }
            }

        }
        return myControl;
    }


    protected void SubjectsBuild()
    {
        short_name = GetShortName();
        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);


        switch (ASPxPageControl1.ActiveTabIndex)
        {
            case 0:

                short_name = GetShortName();
                NpgsqlCommand cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Subject\" where subject_id=(SELECT subject_id FROM \"Subject\" WHERE subject_name='{0}')", short_name), myConn1);
                myConn1.Open();

                NpgsqlDataReader dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();


                while (dataReaderGetSubject.Read())
                {
                    tb_subject_name.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_name")).ToString();
                    tb_subject_id.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_id")).ToString();
                    tb_subject_code.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_code")).ToString();
                    tb_subject_add_info.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("add_info")).ToString();
                    tb_object_name.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("object_id")).ToString();
                    tb_subject_loc.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("loc")).ToString();
                    tb_subject_lat.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("latitude")).ToString();
                    tb_subject_lon.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("longitude")).ToString();
                    combox_subject_type.Text= dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_type")).ToString();
                    //combox_subject_type.SelectedIndex = combox_subject_type.Items.FindByText(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_type")).ToString()).Index;
                    var pic = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("picture"));
                    if (pic.ToString() != "")
                    { ASPxBinaryImageSubject.ContentBytes = (byte[])pic; }
                }


                myConn1.Close();

                break;

            default:
                break;
        }


    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!((Page.User.IsInRole("Region_Managers")) || (Page.User.IsInRole("Administrators")) || (Page.User.IsInRole("Members"))))
        {
            Response.Redirect("~/Default.aspx");
        }

        short_name = GetShortName();


        if (!IsPostBack)
        {
            short_name = GetShortName();

            if (short_name != null)
            {
                string sub_id = GetCompId();
            }
            else
            {
            }
        }
        else
        {
        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        RefreshRootFolders();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        short_name = GetShortName();
        comp_id = GetCompId();
        if (short_name != null) //было Session["SelectedSubject"] вместо short_name
        {
            SubjectsBuild();
        }
        else
        {
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        RefreshRootFolders();
    }

    protected void RefreshRootFolders()
    {
        string sub_id = GetCompId();

    }

    // ------------------ tab general
    private string stringrefactor(string str)
    {
        return str.Replace(',', '.');
    }

    public string LastFile()
    {
        var directory = new DirectoryInfo("O:\\repos\\WebSiteEXZ\\WebSite_EXZ - base\\Images\\PicturesSubject\\");
        var myFile = directory.GetFiles()
                     .OrderByDescending(f => f.LastWriteTime)
                     .First();
        return myFile.FullName;
    }

    protected void but_enter_Click(object sender, EventArgs e)
    {
        NpgsqlConnection myConn = new NpgsqlConnection(connString);
        try
        {

            short_name = GetShortName();
            byte[] pic = jpgtobytea();
            //string subject_insert = "insert into \"Subject\" (subject_name, subject_type, subject_code, object_id, add_info, loc, latitude, longitude) select '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}'";
            //string subject_update = "update \"Subject\" set subject_name='{0}', subject_type='{1}', subject_code='{2}', object_id='{3}', add_info='{4}', loc='{5}', latitude='{6}', longitude='{7}' where subject_id='{8}'";
            string queryinsert = "insert into \"Subject\" (subject_name, subject_type, subject_code, object_id, add_info, loc, latitude, longitude , picture) " +
                "select '" + tb_subject_name.Text + "', '" + combox_subject_type.Value + "', '" +
                tb_subject_code.Text + "', '" + apostrof(Request.Form[tb_object_name.UniqueID]) + "', '"
                + apostrof(Request.Form[tb_subject_add_info.UniqueID]) + "', '" + 
                apostrof(Request.Form[tb_subject_loc.UniqueID]) + "', '"
                + stringrefactor(Request.Form[tb_subject_lat.UniqueID]) + "', '" + 
                stringrefactor(Request.Form[tb_subject_lon.UniqueID]) + "' , '" + pic + "'";
            string queryupdate = "update \"Subject\" set subject_name='" + tb_subject_name.Text + "', subject_type='" + combox_subject_type.Text +
                "', subject_code='" + tb_subject_code.Text + "', object_id='" + apostrof(Request.Form[tb_object_name.UniqueID]) + "', add_info='" + 
                apostrof(Request.Form[tb_subject_add_info.UniqueID]) + "', loc='" + apostrof(Request.Form[tb_subject_loc.UniqueID]) + "', latitude='" + 
                stringrefactor(Request.Form[tb_subject_lat.UniqueID]) + "', longitude='" + stringrefactor(Request.Form[tb_subject_lon.UniqueID]) + 
                "' , picture=:pic where subject_id='"+ tb_subject_id.Text+"'";
            myConn.Open();
            NpgsqlCommand np = new NpgsqlCommand(queryupdate, myConn);
            np.Parameters.Add(new NpgsqlParameter("pic", pic));
            np.ExecuteNonQuery();
        }
        catch (NpgsqlException ex)
        {
        }
        finally
        {
            myConn.Close();
            ClearDirectoriPictureSubject();

        }
    }

    public static string NewMethod(string a)
    {
        return Regex.Replace(a, "\\,", ".");
    }

    public static string apostrof(string a)
    {
        return Regex.Replace(a, "\\'", "\"");
    }

    public static bool IsChecked(string a)
    {
        if (a == "C")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void UpdatePanel_Tab1_Unload(object sender, EventArgs e)
    {
        RegisterUpdatePanel((UpdatePanel)sender);
    }

    protected void RegisterUpdatePanel(UpdatePanel panel)
    {
        var sType = typeof(ScriptManager);
        var mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", BindingFlags.NonPublic | BindingFlags.Instance);
        if (mInfo != null)
            mInfo.Invoke(ScriptManager.GetCurrent(Page), new object[] { panel });
    }

    protected void UpdatePageControl_Unload(object sender, EventArgs e)
    {
        RegisterUpdatePanel((UpdatePanel)sender);
    }

    protected void UpdatePanel_Tab2_Unload(object sender, EventArgs e)
    {
        RegisterUpdatePanel((UpdatePanel)sender);
    }

    protected void UpdatePanel2_Unload(object sender, EventArgs e)
    {
        RegisterUpdatePanel((UpdatePanel)sender);
    }

    protected void but_save_Click(object sender, EventArgs e)
    {



    }
 
    protected void ASPxUploadControlPicture_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        e.CallbackData = String.Format("Images\\PicturesSubject\\Picture_{0}", e.UploadedFile.FileName);
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);
    }
    #region
    /// <summary>
    /// 
    /// </summary>
    public void ClearDirectoriPictureSubject()
    {
        string directoria = String.Format("O:\\repos\\WebSiteEXZ\\WebSite_EXZ - base\\Images\\PicturesSubject\\");

        foreach (string file in Directory.GetFiles(directoria))
        { File.Delete(file); }
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
    #endregion

}