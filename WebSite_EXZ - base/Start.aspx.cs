using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!((Page.User.IsInRole("Region_Managers")) || (Page.User.IsInRole("Administrators")) || (Page.User.IsInRole("Members")) || (Page.User.IsInRole("Area_Managers"))))
        {
            Response.Redirect("~/Default.aspx");
        }

        if (Page.User.IsInRole("Area_Managers"))
        {
            Response.Redirect("~/Users_admin.aspx");
        }

        if (Page.User.IsInRole("Region_Managers"))
        {
//              Response.Redirect("~/Analysis.aspx");
//            Response.Redirect("~/Monitor.aspx");
            Response.Redirect("~/Main.aspx");
            Response.End();

        }

    }
}
