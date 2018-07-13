using DevExpress.Web;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkWithSubject : System.Web.UI.Page
{
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_objectTypedata = new NpgsqlCommand(String.Format("select *  from \"Object_type\""), myConn1);
        myConn1.Open();
        
        NpgsqlDataReader dataReaderGetObject_type = cmd_get_objectTypedata.ExecuteReader();
        try
        {
            while(ASPxTreeView1.Nodes.Count != 0)
            {
                ASPxTreeView1.Nodes.Remove(ASPxTreeView1.Nodes[0]);
            }
            

            while (dataReaderGetObject_type.Read())
            {
                if (dataReaderGetObject_type.GetValue(dataReaderGetObject_type.GetOrdinal("code")).ToString() == "")
                {
                    ASPxTreeView1.Nodes.Add(dataReaderGetObject_type.GetValue(dataReaderGetObject_type.GetOrdinal("name")).ToString(), dataReaderGetObject_type.GetValue(dataReaderGetObject_type.GetOrdinal("name")).ToString());
                }
                else
                {
                    ASPxTreeView1.Nodes.Add(dataReaderGetObject_type.GetValue(dataReaderGetObject_type.GetOrdinal("code")).ToString(), dataReaderGetObject_type.GetValue(dataReaderGetObject_type.GetOrdinal("name")).ToString());
                }
            }

        }
        catch (Exception ex)
        { }
        myConn1.Close();

        NpgsqlCommand cmd_get_objectdata = new NpgsqlCommand(String.Format("select *  from \"Objects\""), myConn1);
        myConn1.Open();
        NpgsqlDataReader dataReaderGetObject = cmd_get_objectdata.ExecuteReader();

        while (dataReaderGetObject.Read())
        {
            String object_id = dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_id")).ToString();
            switch (object_id)
            {
                case "0":
                    ASPxTreeView1.Nodes[0].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "1":
                    ASPxTreeView1.Nodes[1].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "2":
                    ASPxTreeView1.Nodes[2].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "3":
                    ASPxTreeView1.Nodes[3].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "4":
                    ASPxTreeView1.Nodes[4].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "5":
                    ASPxTreeView1.Nodes[5].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                case "6":
                    ASPxTreeView1.Nodes[6].Nodes.Add(dataReaderGetObject.GetValue(dataReaderGetObject.GetOrdinal("object_name")).ToString());
                    break;
                default:
                    break;
            }
        }
        myConn1.Close();
    }

    protected void ASPxTreeView1_NodeClick(object source, DevExpress.Web.TreeViewNodeEventArgs e)
    {
        
    }

    protected void but_enter_Click(object sender, EventArgs e)
    {
       // NpgsqlConnection myConn = new NpgsqlConnection(connString);
        //try
        //{

        //    short_name = GetShortName();
        //    byte[] pic = jpgtobytea();
        //    string subject_insert = "insert into \"Subject\" (subject_name, subject_type, subject_code, object_id, add_info, loc, latitude, longitude) select '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}'";
        //    string subject_update = "update \"Subject\" set subject_name='{0}', subject_type='{1}', subject_code='{2}', object_id='{3}', add_info='{4}', loc='{5}', latitude='{6}', longitude='{7}' where subject_id='{8}'";
        //    //var upsert_subject = new NpgsqlCommand(String.Format(String.Format("WITH upsert AS ({0} RETURNING *) {1} WHERE NOT EXISTS (SELECT * FROM upsert)", subject_update, subject_insert), tb_subject_name.Text, combox_subject_type.Text, tb_subject_code.Text, apostrof(Request.Form[tb_object_name.UniqueID]), apostrof(Request.Form[tb_subject_add_info.UniqueID]), apostrof(Request.Form[tb_subject_loc.UniqueID]), Request.Form[tb_subject_lat.UniqueID].Replace(",", "."), Request.Form[tb_subject_lon.UniqueID].Replace(",", "."), tb_subject_id.Text), myConn);
        //    string queryinsert = "insert into \"Subject\" (subject_name, subject_type, subject_code, object_id, add_info, loc, latitude, longitude , picture) " +
        //        "select '" + tb_subject_name.Text + "', '" + combox_subject_type.Text + "', '" + tb_subject_code.Text + "', '" + apostrof(Request.Form[tb_object_name.UniqueID]) + "', '"
        //        + apostrof(Request.Form[tb_subject_add_info.UniqueID]) + "', '" + apostrof(Request.Form[tb_subject_loc.UniqueID]) + "', '"
        //        + stringrefactor(Request.Form[tb_subject_lat.UniqueID]) + "', '" + stringrefactor(Request.Form[tb_subject_lon.UniqueID]) + "' , '" + pic + "'";
        //    string queryupdate = "update \"Subject\" set " +
        //        "subject_name='" + tb_subject_name.Text + "', subject_type='" + combox_subject_type.Text + "', subject_code='" + tb_subject_code.Text +
        //        "', object_id='" + apostrof(Request.Form[tb_object_name.UniqueID]) + "', add_info='" + apostrof(Request.Form[tb_subject_add_info.UniqueID]) + "', loc='"
        //        + apostrof(Request.Form[tb_subject_loc.UniqueID]) + "', latitude='" + stringrefactor(Request.Form[tb_subject_lat.UniqueID])
        //        + "', longitude='" + stringrefactor(Request.Form[tb_subject_lon.UniqueID]) + "' , picture=:pic where subject_id='666'";

        //    myConn.Open();
        //    NpgsqlCommand np = new NpgsqlCommand(queryupdate, myConn);
        //    np.Parameters.Add(new NpgsqlParameter("pic", pic));
        //    np.ExecuteNonQuery();
        //    //upsert_subject.ExecuteNonQuery();
        //}
        //catch (NpgsqlException ex)
        //{
        //}
        //finally
        //{
        //    myConn.Close();
        //    ClearDirectoriPictureSubject();

        //}


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
}