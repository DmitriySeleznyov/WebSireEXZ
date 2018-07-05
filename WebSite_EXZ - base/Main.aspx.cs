using DevExpress.Web.ASPxTreeList;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.Page
{
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    static bool changed = false;
    static string short_name;
    static string comp_id;

    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void SubjectsBuild()
    {
        short_name = GetShortName();
        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);


       
                short_name = GetShortName();
                NpgsqlCommand cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Subject\" where subject_id=(SELECT subject_id FROM \"Subject\" WHERE subject_name='{0}')", short_name), myConn1);
                myConn1.Open();
                NpgsqlDataReader dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
                while (dataReaderGetSubject.Read())
                {
                    /*tb_subject_name.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_name")).ToString();
                    tb_subject_id.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_id")).ToString();
                    tb_subject_code.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_code")).ToString();
                    tb_subject_add_info.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("add_info")).ToString();
                    tb_object_name.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("object_name")).ToString();
                    tb_subject_loc.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("loc")).ToString();
                    tb_subject_lat.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("latitude")).ToString();
                    tb_subject_lon.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("longitude")).ToString();
                    combox_subject_type.SelectedIndex = combox_subject_type.Items.FindByText(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_type")).ToString()).Index;*/
                    var pic = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("picture"));
                    if (pic.ToString() != "")
                    { ASPxBinaryImage1.ContentBytes = (byte[])pic; }
                    
                }
                myConn1.Close();
    }

}