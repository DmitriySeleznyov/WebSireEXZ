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
