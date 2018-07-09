using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using Npgsql;
using System.Xml;
using System.Data;
using System.Configuration;
using DevExpress.Web.ASPxTreeList;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Globalization;
using DevExpress.Web;
using System.Net.Mail;
using System.Net;



public partial class SiteMaster : System.Web.UI.MasterPage
{

    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    string sh_name = "";
    bool sent = false;


    public String TreeCommand
    {
        get { return (String)ViewState["treeCommand"]; }
        set { ViewState["treeCommand"] = value; }
    }

    protected string GetShortName()
    {
        sh_name = "";
        return sh_name;
    }
   
    protected void Page_PreRender(object sender, EventArgs e)
    {

        foreach (System.Web.UI.Control control in NavigationMenu.Controls)
        {
            HtmlAnchor link = control as HtmlAnchor;
            if (link == null) continue;
            if (Request.Path.IndexOf(link.HRef) != -1)
            {
                // Link is active (the href is a substring of the current address)
                link.Attributes.Add("class", "active");
                link.HRef = "";
            }
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {

        if (Page.User.IsInRole("Region_Managers"))
        {

        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!((Page.User.IsInRole("Region_Managers")) || (Page.User.IsInRole("Administrators")) || (Page.User.IsInRole("Members")) || (Page.User.IsInRole("Area_Managers"))))
        {
            Response.Redirect("~/Default.aspx");
        }

        if (Page.User.IsInRole("Area_Managers"))
        {
            ASPxSplitter1.GetPaneByName("RightBox").Collapsed = true;
            if (NavigationMenu.Items.Count > 0)
            {
                NavigationMenu.Items.Clear();
            }

        }
            if (Page.User.IsInRole("Region_Managers"))
        {
            ASPxSplitter1.GetPaneByName("RightBox").Collapsed = false;
            if (NavigationMenu.Items.Count > 4)
            {
                NavigationMenu.Items.RemoveAt(5);
                NavigationMenu.Items.RemoveAt(4);
            }
        }

        if (Page.User.IsInRole("Members"))
        {
            ASPxSplitter1.GetPaneByName("RightBox").Collapsed = true;
            FilterLabel.Text = "";
            FiltersTabControl.Visible = false;
            MembersInfo.Visible = true;
            MembersInfo.Text = "Для редактирования и просмотра информации по предприятию нажмите <Субъекты> в верхнем меню";
            if (NavigationMenu.Items.Count > 3)
            {
                NavigationMenu.Items.RemoveAt(5);
                NavigationMenu.Items.RemoveAt(4);
                NavigationMenu.Items.RemoveAt(3);
                NavigationMenu.Items.RemoveAt(2);
                ASPxHyperLink1.Visible = false;
            }
        }

        if (!IsPostBack)
        {
        }
        else
        {
            if (Page.User.IsInRole("Members"))
            {
                ASPxHyperLink1.Visible = false;
            }
            else
            {
               
               // с учетом фильтров
                if ((TreeCommand != "") && (TreeCommand != null))
                    SqlDataSource22.SelectCommand = TreeCommand;
                else
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\" order by subject_name");
                }
        }


    }


    protected void ASPxMenu1_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        String s = e.Item.Name;
        switch (s)
        {
            case "Item1":
                TreeLabel.Text = "СКЗ";
                if (!Page.User.IsInRole("Members"))
                {
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\" where subject_type='СКЗ' order by subject_name");
                    TreeCommand = SqlDataSource22.SelectCommand;
                }
                ASPxTreeList1.DataBind();
                break;
            case "Item2":
                TreeLabel.Text = "БСЗ";
                if (!Page.User.IsInRole("Members"))
                {
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\" where subject_type='БСЗ' or subject_type='БКМУ+БСЗ' order by subject_name");
                    TreeCommand = SqlDataSource22.SelectCommand;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BSZSet", "BSZSet()", true);
                }
                ASPxTreeList1.DataBind();
                break;
            case "Item3":
                TreeLabel.Text = "БКМУ";
                if (!Page.User.IsInRole("Members"))
                {
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\" where subject_type='БКМУ' order by subject_name");
                    TreeCommand = SqlDataSource22.SelectCommand;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BKMUSet","BKMUSet()", true);
                }
                ASPxTreeList1.DataBind();
                break;
            case "Item9":
                TreeLabel.Text = "Все объекты";
                if (!Page.User.IsInRole("Members"))
                {
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\"");
                    TreeCommand = SqlDataSource22.SelectCommand;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AllSet", "AllSet()", true);
                }
                ASPxTreeList1.DataBind();
                break;
            case "Item4":
                TreeLabel.Text = "СДЗ";
                if (!Page.User.IsInRole("Members"))
                {
                    SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\" where subject_type='СДЗ' order by subject_name");
                    TreeCommand = SqlDataSource22.SelectCommand;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SDZSet", "SDZSet()", true);
                }
                ASPxTreeList1.DataBind();
                break;
            default:
                TreeLabel.Text = "";
                break;
        } 
    }

    
    protected void ASPxTreeList1_FocusedNodeChanged(object sender, EventArgs e)
    {

        Session["SelectedSubject"] = ASPxTreeList1.FocusedNode;

        //string short_name = ASPxTreeList1.FocusedNode.GetValue("short_name").ToString();

        string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
        string short_name = "";
        string company_lat = "";
        string company_lon = "";

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        myConn1.Open();

        if (Page.User.IsInRole("Members"))
        {
            NpgsqlCommand get_shortname = new NpgsqlCommand(String.Format("select subject_name, latitude, longitude from \"Subject\" where \"EDRPOU\"='{0}'", Page.User.Identity.Name.ToString()), myConn1);
            NpgsqlDataReader dataReaderCompany = get_shortname.ExecuteReader();
            while (dataReaderCompany.Read())
            {
                short_name = dataReaderCompany.GetString(dataReaderCompany.GetOrdinal("subject_name"));
                try
                {
                    company_lat = Convert.ToString(dataReaderCompany.GetDouble(dataReaderCompany.GetOrdinal("latitude")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                    company_lon = Convert.ToString(dataReaderCompany.GetDouble(dataReaderCompany.GetOrdinal("longitude")).ToString(CultureInfo.InvariantCulture.NumberFormat));
                }
                catch (InvalidCastException ex)
                {
                }
            }
            dataReaderCompany.Close();
            
        }
        else
        {
            short_name = ASPxTreeList1.FocusedNode.GetValue("subject_name").ToString();
        }

        string Address = "";
        string building = "";
        string streetname = "";
        string streettype = "";

        Address = Address + " " +streettype+ " "+ streetname + " " + building;

        if (Page.User.IsInRole("Members"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GetLocaiton", string.Format("GetLocaiton('{0}','{1}');", company_lat.Replace(",", "."), company_lon.Replace(",", ".")), true);
        }
        else
        {
            string teststr = ASPxTreeList1.FocusedNode["latitude"].ToString().Replace(",", ".");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GetLocaiton", string.Format("GetLocaiton('{0}','{1}');", ASPxTreeList1.FocusedNode.GetValue("latitude").ToString().Replace(",", "."), ASPxTreeList1.FocusedNode.GetValue("longitude").ToString().Replace(",", ".")), true);
        }

        XmlWriterSettings settings = new XmlWriterSettings();


        settings.Indent = true;
        settings.IndentChars = "    "; 

        settings.NewLineChars = "\n";

        settings.OmitXmlDeclaration = false;
        using (XmlWriter output = XmlWriter.Create(Server.MapPath("subject_detail.xml"), settings))
        {
            output.WriteStartElement("Информация");
            output.WriteStartElement("Общая_информация");
            output.WriteElementString("Название", ASPxTreeList1.FocusedNode.GetValue("subject_name").ToString());
            Label_full_name.Text = ASPxTreeList1.FocusedNode.GetValue("subject_name").ToString();
            output.WriteElementString("Тип", ASPxTreeList1.FocusedNode.GetValue("subject_type").ToString());
            Label_type.Text = ASPxTreeList1.FocusedNode.GetValue("subject_type").ToString();
            output.WriteElementString("Код", ASPxTreeList1.FocusedNode.GetValue("subject_code").ToString());
            Label_code.Text = ASPxTreeList1.FocusedNode.GetValue("subject_code").ToString();
            output.WriteElementString("Объект", ASPxTreeList1.FocusedNode.GetValue("object_id").ToString());
            Label_object.Text = ASPxTreeList1.FocusedNode.GetValue("object_id").ToString();
            output.WriteElementString("Описание", ASPxTreeList1.FocusedNode.GetValue("add_info").ToString());
            Label_info.Text = ASPxTreeList1.FocusedNode.GetValue("add_info").ToString();

            output.WriteEndElement();
            output.WriteEndElement();
            output.Flush();
            output.Close();
        }        

    }


    protected void FilterEnableASPxButton1_Click(object sender, EventArgs e)
    {
 
    }

    protected void FilterDisableASPxButton1_Click(object sender, EventArgs e)
    {
        SqlDataSource22.SelectCommand = String.Format("SELECT subject_id, subject_name, subject_type, subject_code, object_id, add_info, latitude, longitude FROM \"Subject\"");
        TreeCommand = SqlDataSource22.SelectCommand;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "AllSet", "AllSet()", true);
    }


    protected void SearchButton_Click(object sender, EventArgs e)
    {
        
    }

    protected void ClearSearchButton_Click(object sender, EventArgs e)
    {
    }


    protected void MessagesListBox_TextChanged(object sender, EventArgs e)
    {

    }


}
