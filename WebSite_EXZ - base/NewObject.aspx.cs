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

public partial class About : System.Web.UI.Page
{
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void but_enter_Click(object sender, EventArgs e)
    {
        NpgsqlConnection myConn = new NpgsqlConnection(connString);

        try
        {
            string subject_insert = "insert into \"Subject\" (subject_name, subject_type, subject_code, object_name, add_info, loc, latitude, longitude) select '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}'";
            string subject_update = "update \"Subject\" set subject_name='{0}', subject_type='{1}', subject_code='{2}', object_name='{3}', add_info='{4}', loc='{5}', latitude='{6}', longitude='{7}' where subject_code='{2}'";

            if (tb_subject_lat.Text.IndexOf(",") != -1) tb_subject_lat.Text.Replace(",", ".");
            if (tb_subject_lon.Text.IndexOf(",") != -1) tb_subject_lon.Text.Replace(",", ".");
            var upsert_subject = new NpgsqlCommand(String.Format(String.Format("WITH upsert AS ({0} RETURNING *) {1} WHERE NOT EXISTS (SELECT * FROM upsert)", subject_update, subject_insert), tb_add_subject_name.Text, combox_subject_type.Text, tb_add_subject_code.Text, apostrof(Request.Form[tb_object_name.UniqueID]), apostrof(Request.Form[tb_subject_add_info.UniqueID]), apostrof(Request.Form[tb_subject_loc.UniqueID]), tb_subject_lat.Text, tb_subject_lon.Text), myConn);

            myConn.Open();

            var subj_count = new NpgsqlCommand(String.Format("select count(subject_id) from \"Subject\""), myConn);

            int subj_count_prv = Convert.ToInt32(subj_count.ExecuteScalar());

            upsert_subject.ExecuteNonQuery();

            myConn.Close();

            Response.Redirect("~/Start.aspx/");
        }
        catch (Exception ee)
        {


        }

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

    protected void LocationCheckBox_CheckedChanged(object sender, EventArgs e)
    {

    }
    
 }
