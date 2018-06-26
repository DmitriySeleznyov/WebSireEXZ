using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Web.Configuration;
using System.IO;
using System.Text.RegularExpressions;
using DevExpress.Web;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using System.Net;
using System.Text;
using WebSocket4Net;
using System.Threading;
using System.Threading.Tasks;
using TinyJson;


public partial class About : System.Web.UI.Page
{
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();

    protected string m_CurrentMessage = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ASPxFormLayout1_E8_SelectedIndexChanged(object sender, EventArgs e)
    {
        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);

        ASPxFormLayout fl_1 = (ASPxFormLayout)ASPxNavBar1.Groups[1].FindControl("ASPxFormLayout1");

        ASPxComboBox combox_sdz = (ASPxComboBox)fl_1.FindControl("ASPxFormLayout1_E8");
        ASPxTextBox max_pot = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E3");
        ASPxTextBox min_pot = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E1");
        ASPxTextBox avg_pot = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E2");

        ASPxTextBox max_pot_rz = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E6");
        ASPxTextBox min_pot_rz = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E4");
        ASPxTextBox avg_pot_rz = (ASPxTextBox)fl_1.FindControl("ASPxFormLayout1_E5");

        try
        {
            NpgsqlCommand cmd_get_subjectdata_max = new NpgsqlCommand(String.Format("select s.subject_name as subject, max(m.pot_tz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject = cmd_get_subjectdata_max.ExecuteReader();

            while (dataReaderGetSubject.Read())
            {
                max_pot.Text = dataReaderGetSubject.GetValue(dataReaderGetSubject.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

            NpgsqlCommand cmd_get_subjectdata_min = new NpgsqlCommand(String.Format("select s.subject_name as subject, min(m.pot_tz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject2 = cmd_get_subjectdata_min.ExecuteReader();

            while (dataReaderGetSubject2.Read())
            {
                min_pot.Text = dataReaderGetSubject2.GetValue(dataReaderGetSubject2.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

            NpgsqlCommand cmd_get_subjectdata_avg = new NpgsqlCommand(String.Format("select s.subject_name as subject, avg(m.pot_tz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject3 = cmd_get_subjectdata_avg.ExecuteReader();

            while (dataReaderGetSubject3.Read())
            {
                avg_pot.Text = dataReaderGetSubject3.GetValue(dataReaderGetSubject3.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

            NpgsqlCommand cmd_get_subjectdata_avg_rz = new NpgsqlCommand(String.Format("select s.subject_name as subject, avg(m.pot_rz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject4 = cmd_get_subjectdata_avg_rz.ExecuteReader();

            while (dataReaderGetSubject4.Read())
            {
                avg_pot_rz.Text = dataReaderGetSubject4.GetValue(dataReaderGetSubject4.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

            NpgsqlCommand cmd_get_subjectdata_min_rz = new NpgsqlCommand(String.Format("select s.subject_name as subject, min(m.pot_rz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject5 = cmd_get_subjectdata_min_rz.ExecuteReader();

            while (dataReaderGetSubject5.Read())
            {
                min_pot_rz.Text = dataReaderGetSubject5.GetValue(dataReaderGetSubject5.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

            NpgsqlCommand cmd_get_subjectdata_max_rz = new NpgsqlCommand(String.Format("select s.subject_name as subject, max(m.pot_rz) as sum from \"Monitoring_SDZ\" as m LEFT JOIN \"Subject\" as s on m.subject_id=s.subject_id where s.subject_name = '{0}' GROUP BY subject", combox_sdz.SelectedItem.ToString()), myConn1);
            myConn1.Open();

            NpgsqlDataReader dataReaderGetSubject6 = cmd_get_subjectdata_max_rz.ExecuteReader();

            while (dataReaderGetSubject6.Read())
            {
                max_pot_rz.Text = dataReaderGetSubject6.GetValue(dataReaderGetSubject6.GetOrdinal("sum")).ToString();
            }

            myConn1.Close();

        }
        catch (NpgsqlException ex)
        {
        }
        finally
        {
            myConn1.Close();
        }
    }

    //применить фильтры
    protected void apply_filter_Click(object sender, EventArgs e)
    {
    }

    //очистить фильтры
    protected void clear_filter_Click(object sender, EventArgs e)
    {
    }


}
