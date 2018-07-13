using DevExpress.Web.ASPxGauges.Gauges;
using DevExpress.Web.ASPxGauges.Gauges.Circular;
using DevExpress.Web.ASPxTreeList;
using DevExpress.XtraGauges.Base;
using DevExpress.XtraGauges.Core.Drawing;
using DevExpress.XtraGauges.Core.Model;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Drawing;
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

        //        ASPxGaugeControl7.Value = "85";
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
        string subject_id="" ,skz ="" , epcode="" , subject_type="";
        short_name = GetShortName();
        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        short_name = GetShortName();
        NpgsqlCommand cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Subject\" where subject_id=(SELECT subject_id FROM \"Subject\" WHERE subject_name='{0}')", short_name), myConn1);
        myConn1.Open();
        NpgsqlDataReader dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
        while (dataReaderGetSubject.Read())
        {
            var pic = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("picture"));
            subject_id = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_id")).ToString();
            subject_type = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_type")).ToString();
            
            if (pic.ToString() != "")
            {
                ASPxBinaryImage1.ContentBytes = (byte[])pic;
            }
                    
        }
        switch (subject_type)
        {
            case "0"://СКЗ
                {
                    cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"SKZ\" where subject_id='{0}'", subject_id), myConn1);
                    dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
                    while (dataReaderGetSubject.Read())
                    {
                        skz = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("SKZ_id")).ToString();
                    }

                    cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Monitoring_EXZ_SKZ\" where \"SKZ_id\"='{0}'", skz), myConn1);
                    dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
                    while (dataReaderGetSubject.Read())
                    {
                        ASPxGaugeControl35.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Check_date_time")).ToString();
                        ASPxGaugeControl13.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("SKZ_voltage")).ToString();
                        ASPxGaugeControl11.Value = Math.Round(double.Parse(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("SKZ_voltage")).ToString())).ToString();
                        ASPxGaugeControl12.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("SKZ_current")).ToString();
                        ASPxGaugeControl10.Value = Math.Round(double.Parse(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("SKZ_current")).ToString())).ToString();
                        ASPxGaugeControl33.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Temper")).ToString();
                    }

                    cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Electrodes_SKZ\" where \"SKZ_id\"='{0}'", skz), myConn1);
                    dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
                    while (dataReaderGetSubject.Read())
                    {
                        epcode = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("EP_code")).ToString();
                    }

                    cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Monitoring_EP_SKZ\" where \"EP_SKZ_id\"='{0}'", epcode), myConn1);
                    dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();
                    while (dataReaderGetSubject.Read())
                    {

                        ASPxGaugeControl8.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Om_pot")).ToString();
                        ASPxGaugeControl9.Value = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Pol_pot")).ToString();
                        ASPxGaugeControl6.Value = Math.Round(double.Parse(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Om_pot")).ToString())).ToString();
                        ASPxGaugeControl7.Value = Math.Round(double.Parse(dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("Pol_pot")).ToString())).ToString();
                    }
                    break;
                }
            case "6"://БКМУ
                {
                    break;
                }
            default:
                break;
        }
        
        
        myConn1.Close();
    }

}