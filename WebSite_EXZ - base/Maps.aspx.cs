using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Data;
using System.Web.UI.WebControls;
using Npgsql;
using System.Web.Configuration;
using Geocoding;
using System.Globalization;
using WebSocket4Net;
using System.Threading;
using System.Threading.Tasks;
using TinyJson;
using DevExpress.Web;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using System.Net;
using System.Text;
using DevExpress.Web.ASPxTreeList;

    
public partial class Maps : System.Web.UI.Page
{

    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();

    protected AutoResetEvent m_MessageReceiveEvent = new AutoResetEvent(false);
    protected AutoResetEvent m_OpenedEvent = new AutoResetEvent(false);
    protected AutoResetEvent m_CloseEvent = new AutoResetEvent(false);

    protected string m_CurrentMessage = string.Empty;

    static string short_name;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //// временно
        ASPxGaugeControl7.Value = "48";
        ASPxGaugeControl6.Value = "7";
        ASPxGaugeControl10.Value = "-1200";
        ASPxGaugeControl11.Value = "-900";
        ASPxGaugeControl3.Value = "3";
        ASPxGaugeControl29.Value = "7";
        ////

        if (User.IsInRole("Region_Managers"))
        {
        }
            if (!IsPostBack)
            {
              Markers_build();
            }     
    }


    void Markers_build()
      {

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);

        myConn1.Open();

        string selectcmd = "";
        string selectcmd_mon = "";

        selectcmd = String.Format("select *  from \"Subject\"");

        NpgsqlCommand cmd_get_companydata = new NpgsqlCommand(selectcmd, myConn1);

        NpgsqlDataReader dataReaderGetSubject = cmd_get_companydata.ExecuteReader();

        XmlWriterSettings settings = new XmlWriterSettings();

        settings.Indent = true;
        settings.IndentChars = "    "; 

        settings.NewLineChars = "\n";

        settings.OmitXmlDeclaration = false;
        using (XmlWriter output = XmlWriter.Create(Server.MapPath("markers_bkmu.xml"), settings))
        using (XmlWriter output_bsz = XmlWriter.Create(Server.MapPath("markers_bsz.xml"), settings))
        using (XmlWriter output_sdz = XmlWriter.Create(Server.MapPath("markers_sdz.xml"), settings))
        using (XmlWriter output_skz = XmlWriter.Create(Server.MapPath("markers_skz.xml"), settings))
        using (XmlWriter output_bkmu_bsz = XmlWriter.Create(Server.MapPath("markers_bkmu_bsz.xml"), settings))
        {
            Char separator = '.';
            output.WriteStartElement("markers");
            output_bsz.WriteStartElement("markers");
            output_sdz.WriteStartElement("markers");
            output_skz.WriteStartElement("markers");
            output_bkmu_bsz.WriteStartElement("markers");

            List<string> DeviceName = new List<string>();
            List<string> DeviceID = new List<string>();
            List<string> Type = new List<string>();
            List<string> Latd = new List<string>();
            List<string> Longt = new List<string>();

            try
            {
                while (dataReaderGetSubject.Read())
                {
                    DeviceName.Add(dataReaderGetSubject.GetString(dataReaderGetSubject.GetOrdinal("subject_name")));
                    DeviceID.Add(Convert.ToString(dataReaderGetSubject.GetInt32(dataReaderGetSubject.GetOrdinal("subject_id"))));
                    Type.Add(dataReaderGetSubject.GetString(dataReaderGetSubject.GetOrdinal("subject_type")));
                    try
                    {
                        Latd.Add(Convert.ToString(dataReaderGetSubject.GetDouble(dataReaderGetSubject.GetOrdinal("latitude")).ToString(CultureInfo.InvariantCulture.NumberFormat)));
                        Longt.Add(Convert.ToString(dataReaderGetSubject.GetDouble(dataReaderGetSubject.GetOrdinal("longitude")).ToString(CultureInfo.InvariantCulture.NumberFormat)));
                    }
                    catch (InvalidCastException ex)
                    {
                        Latd.Add("");
                        Longt.Add("");
                    }

                }
            }
            catch (Exception ee)
            {


            }


            dataReaderGetSubject.Close();

            //////////////////
            for (int i = 0; i < DeviceName.Count; i += 1)
            {
                string short_name = DeviceName[i].ToString();
                string c_id = DeviceID[i].ToString();
                string c_lat = Latd[i].ToString();
                string c_lon = Longt[i].ToString();
                string c_type = Type[i].ToString();

                string Address = "";
                string Sum_pot = "";
                string Pol_pot = "";
                string Curr = "";
                string Volt = "";
                string Temper = "";
                string State = "";
                string Date = "";
                string Curr_BSZ = "";
                string Volt_BSZ = "";
                string Curr_ust = "";
                string Volt_ust = "";


                if (c_type == "БКМУ")
                {
                    selectcmd_mon = String.Format("select sum_pot, pol_pot, curr, volt, temper, state, reg_time from \"Monitoring_BKMU\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_BKMU\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();
                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("sum_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pol_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }
                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }
                        try
                        {
                            Temper = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("temper")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Temper = "";
                        }
                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));
                            
                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }
                    }
                    dataReaderGetMon.Close();

                    ///////////////// bkmu

                    output.WriteStartElement("marker");
                    output.WriteElementString("Name", short_name);
                    output.WriteElementString("Type", c_type);
                    output.WriteElementString("Latitude", c_lat);
                    output.WriteElementString("Longitude", c_lon);
                    output.WriteElementString("Address", Address);
                    output.WriteElementString("Sum_pot", Sum_pot);
                    output.WriteElementString("Pol_pot", Pol_pot);
                    output.WriteElementString("Curr", Curr);
                    output.WriteElementString("Volt", Volt);
                    output.WriteElementString("Temper", Temper);
                    output.WriteElementString("State", State);
                    output.WriteElementString("Date", Date);
                    output.WriteEndElement();

                }

                // БСЗ
                if (c_type == "БСЗ")
                {
                    selectcmd_mon = String.Format("select curr, volt, curr_ust, volt_ust, state, reg_time from \"Monitoring_BSZ\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_BSZ\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();

                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }
                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }

                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));
                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }

                    }
                    dataReaderGetMon.Close();

                    ///////////////// bsz
                    output_bsz.WriteStartElement("marker");
                    output_bsz.WriteElementString("Name", short_name);
                    output_bsz.WriteElementString("Type", c_type);
                    output_bsz.WriteElementString("Latitude", c_lat);
                    output_bsz.WriteElementString("Longitude", c_lon);
                    output_bsz.WriteElementString("Address", Address);
                    output_bsz.WriteElementString("Curr", Sum_pot);
                    output_bsz.WriteElementString("Volt", Pol_pot);
                    output_bsz.WriteElementString("Curr_ust", Curr);
                    output_bsz.WriteElementString("Volt_ust", Volt);
                    output_bsz.WriteElementString("State", State);
                    output_bsz.WriteElementString("Date", Date);
                    output_bsz.WriteEndElement();
                }

                // БКМУ+БСЗ
                if (c_type == "БКМУ+БСЗ")
                {
                    selectcmd_mon = String.Format("select sum_pot, pol_pot, curr, volt, temper, state, curr_bsz, volt_bsz, curr_ust, volt_ust, state_bsz, reg_time from \"Monitoring_BKMU_BSZ\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_BKMU_BSZ\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();

                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("sum_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pol_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }
                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }

                        try
                        {
                            Curr_BSZ = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr_bsz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr_BSZ = "";
                        }
                        try
                        {
                            Volt_BSZ = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_bsz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt_BSZ = "";
                        }

                        try
                        {
                            Curr_ust = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr_ust = "";
                        }
                        try
                        {
                            Volt_ust = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt_ust = "";
                        }

                        try
                        {
                            Temper = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("temper")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Temper = "";
                        }

                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));
                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }

                    }
                    dataReaderGetMon.Close();

                    ///////////////// bkmu+bsz
                    output_bkmu_bsz.WriteStartElement("marker");
                    output_bkmu_bsz.WriteElementString("Name", short_name);
                    output_bkmu_bsz.WriteElementString("Type", c_type);
                    output_bkmu_bsz.WriteElementString("Latitude", c_lat);
                    output_bkmu_bsz.WriteElementString("Longitude", c_lon);
                    output_bkmu_bsz.WriteElementString("Address", Address);
                    output_bkmu_bsz.WriteElementString("Sum_pot", Sum_pot);
                    output_bkmu_bsz.WriteElementString("Pol_pot", Pol_pot);
                    output_bkmu_bsz.WriteElementString("Curr", Curr);
                    output_bkmu_bsz.WriteElementString("Volt", Volt);
                    output_bkmu_bsz.WriteElementString("Curr_BSZ", Curr_BSZ);
                    output_bkmu_bsz.WriteElementString("Volt_BSZ", Volt_BSZ);
                    output_bkmu_bsz.WriteElementString("Curr_ust", Curr_ust);
                    output_bkmu_bsz.WriteElementString("Volt_ust", Volt_ust);
                    output_bkmu_bsz.WriteElementString("State", State);
                    output_bkmu_bsz.WriteElementString("Date", Date);
                    output_bkmu_bsz.WriteEndElement();
                }

                // СДЗ
                if (c_type == "СДЗ")
                {
                    selectcmd_mon = String.Format("select curr, volt_akb, pot_tz, pot_rz, state, reg_time from \"Monitoring_SDZ\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_SDZ\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();

                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_akb")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }
                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pot_tz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pot_rz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }

                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));
                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }

                    }
                    dataReaderGetMon.Close();

                    ///////////////// sdz
                    output_sdz.WriteStartElement("marker");
                    output_sdz.WriteElementString("Name", short_name);
                    output_sdz.WriteElementString("Type", c_type);
                    output_sdz.WriteElementString("Latitude", c_lat);
                    output_sdz.WriteElementString("Longitude", c_lon);
                    output_sdz.WriteElementString("Address", Address);
                    output_sdz.WriteElementString("Curr", Curr);
                    output_sdz.WriteElementString("Volt", Volt);
                    output_sdz.WriteElementString("Pot_tz", Sum_pot);
                    output_sdz.WriteElementString("Pot_rz", Pol_pot);
                    output_sdz.WriteElementString("State", State);
                    output_sdz.WriteElementString("Date", Date);
                    output_sdz.WriteEndElement();
                }

////SKZ
                if (c_type == "СКЗ")
                {
                    selectcmd_mon = String.Format("select sum_pot, pol_pot, curr, volt, temper, state, reg_time from \"Monitoring_SKZ\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_SKZ\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();
                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("sum_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pol_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }
                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }
                        try
                        {
                            Temper = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("temper")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Temper = "";
                        }
                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));

                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }
                    }
                    dataReaderGetMon.Close();

                    ///////////////// skz

                    output_skz.WriteStartElement("marker");
                    output_skz.WriteElementString("Name", short_name);
                    output_skz.WriteElementString("Type", c_type);
                    output_skz.WriteElementString("Latitude", c_lat);
                    output_skz.WriteElementString("Longitude", c_lon);
                    output_skz.WriteElementString("Address", Address);
                    output_skz.WriteElementString("Sum_pot", Sum_pot);
                    output_skz.WriteElementString("Pol_pot", Pol_pot);
                    output_skz.WriteElementString("Curr", Curr);
                    output_skz.WriteElementString("Volt", Volt);
                    output_skz.WriteElementString("Temper", Temper);
                    output_skz.WriteElementString("State", State);
                    output_skz.WriteElementString("Date", Date);
                    output_skz.WriteEndElement();

                }

/////

            }


            // закрываем
            output.WriteEndElement();
            output_bsz.WriteEndElement();
            output_sdz.WriteEndElement();
            output_skz.WriteEndElement();
            output_bkmu_bsz.WriteEndElement();
            // сбрасываем буфферизированные данные
            output.Flush();
            output_bsz.Flush();
            output_sdz.Flush();
            output_skz.Flush();
            output_bkmu_bsz.Flush();
            // закрываем фаил, с которым связан output
            output.Close();
            output_bsz.Close();
            output_sdz.Close();
            output_skz.Close();
            output_bkmu_bsz.Close();
        }



    myConn1.Close();
        
    }
    
/// Subjects build
/// 
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

    protected void SubjectsBuild()
    {

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);

        //get selected subject

        string c_id = "";
        string c_code = "";
        string c_type = "";

        string selectcmd = "";
        string selectcmd_mon = "";

        string Sum_pot = "";
        string Pol_pot = "";
        string Curr = "";
        string Volt = "";
        string Curr_BSZ = "";
        string Volt_BSZ = "";
        string Curr_ust = "";
        string Volt_ust = "";
        string Temper = "";
        string State = "";
        string Date = "";

        myConn1.Open();

        short_name = GetShortName();
        NpgsqlCommand cmd_get_subjectdata = new NpgsqlCommand(String.Format("select *  from \"Subject\" where subject_id=(SELECT subject_id FROM \"Subject\" WHERE subject_name='{0}')", short_name), myConn1);

        NpgsqlDataReader dataReaderGetSubject = cmd_get_subjectdata.ExecuteReader();

        try
        {
            while (dataReaderGetSubject.Read())
            {
                c_id = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_id")).ToString();
                c_code = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_code")).ToString();
                c_type = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("subject_type")).ToString();
            }
        }
        catch (Exception ee)
        {
        }

        dataReaderGetSubject.Close();


        // БСЗ
                if (c_type == "БКМУ+БСЗ")
                {
                    selectcmd_mon = String.Format("select sum_pot, pol_pot, curr, volt, temper, state, curr_bsz, volt_bsz, curr_ust, volt_ust, state_bsz, reg_time from \"Monitoring_BKMU_BSZ\" where subject_id='{0}' and reg_time = (SELECT max(reg_time) from \"Monitoring_BKMU_BSZ\" where subject_id='{0}')", c_id);
                    NpgsqlCommand cmd_get_data = new NpgsqlCommand(selectcmd_mon, myConn1);

                    NpgsqlDataReader dataReaderGetMon = cmd_get_data.ExecuteReader();

                    while (dataReaderGetMon.Read())
                    {

                        try
                        {
                            Sum_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("sum_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Sum_pot = "";
                        }
                        try
                        {
                            Pol_pot = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("pol_pot")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Pol_pot = "";
                        }
                        try
                        {
                            Curr = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr = "";
                        }
                        try
                        {
                            Volt = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt = "";
                        }

                        try
                        {
                            Curr_BSZ = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr_bsz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr_BSZ = "";
                        }
                        try
                        {
                            Volt_BSZ = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_bsz")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt_BSZ = "";
                        }

                        try
                        {
                            Curr_ust = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("curr_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Curr_ust = "";
                        }
                        try
                        {
                            Volt_ust = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("volt_ust")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Volt_ust = "";
                        }

                        try
                        {
                            Temper = Convert.ToString(dataReaderGetMon.GetFloat(dataReaderGetMon.GetOrdinal("temper")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                        }
                        catch (InvalidCastException ex)
                        {
                            Temper = "";
                        }

                        try
                        {
                            State = dataReaderGetMon.GetString(dataReaderGetMon.GetOrdinal("state"));
                        }
                        catch (InvalidCastException ex)
                        {
                            State = "";
                        }

                        try
                        {
                            Date = Convert.ToString(dataReaderGetMon.GetTimeStamp(dataReaderGetMon.GetOrdinal("reg_time")));
                        }
                        catch (InvalidCastException ex)
                        {
                            Date = "";
                        }

                    }
                    dataReaderGetMon.Close();

                    ///////////////// bsz
                    ASPxGaugeControl36.Value = Curr;
                    ASPxGaugeControl40.Value = Curr;

                    ASPxGaugeControl37.Value = Volt;
                    ASPxGaugeControl41.Value = Volt;
    
                    ASPxGaugeControl38.Value = Sum_pot;
                    ASPxGaugeControl42.Value = Sum_pot;

                    ASPxGaugeControl39.Value = Pol_pot;
                    ASPxGaugeControl43.Value = Pol_pot;

                    ASPxGaugeControl44.Value = Temper;

                    ASPxGaugeControl49.Value = Curr_ust;
                    ASPxGaugeControl50.Value = Volt_ust;

                    ASPxGaugeControl45.Value = Curr_BSZ;
                    ASPxGaugeControl47.Value = Curr_BSZ;

                    ASPxGaugeControl46.Value = Volt_BSZ;
                    ASPxGaugeControl48.Value = Volt_BSZ;


                    ASPxGaugeControl51.Value = Date;
                }



        myConn1.Close();

    }
    
    protected void Page_PreRender(object sender, EventArgs e)
    {
        short_name = GetShortName();

        if (short_name != null) //было Session["SelectedSubject"] вместо short_name
        {
            SubjectsBuild();

        }
        else
        {
        }

    }

}
