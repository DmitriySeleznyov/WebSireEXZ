using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Web.Profile;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class About : System.Web.UI.Page
{

    static string conString = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();

public void Page_Load()
{
    if (!((Page.User.IsInRole("Area_Managers")) || (Page.User.IsInRole("Administrators"))))
    {
        Response.Redirect("~/Default.aspx");
    }
    else
    {
        RegisterHyperLink.NavigateUrl = "~/Account/Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        UserGrid.Visible = true;
        UsersOnlineLabel.Text = "";
        ChangePasswordHyperLink.NavigateUrl = "~/Account/ChangePassword.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
    }
    if (!IsPostBack)
    {
        GetUsers();
    }
}

public void Page_Init()
{
    DeleteUserButton.Attributes.Add("onclick", "if (confirm('Вы уверены, что желаете удалить пользователя ?')) {return true;} else {return false;}");
}

private void GetUsers()
{

    UsersOnlineLabel.Text = Membership.GetNumberOfUsersOnline().ToString();

}

protected void btnDeleteUser_Click(object sender, EventArgs e)
{
    if ((Roles.FindUsersInRole("Members", UserName.Text).Length) != 0)
    {
        // Membership.DeleteUser(UserName.Text, true);

        SqlConnection myConn = new SqlConnection(conString);
        SqlCommand myCom = myConn.CreateCommand();
        int cnt = 0;
        myCom.CommandType = CommandType.StoredProcedure;
        myCom.CommandText = "[aspnet_Users_DeleteUser]";

        myCom.Parameters.Add("@ApplicationName", SqlDbType.NVarChar);
        myCom.Parameters["@ApplicationName"].Value = '/';
        myCom.Parameters.Add("@UserName", SqlDbType.NVarChar);
        myCom.Parameters["@UserName"].Value = UserName.Text;
        myCom.Parameters.Add("@TablesToDeleteFrom", SqlDbType.Int);
        myCom.Parameters["@TablesToDeleteFrom"].Value = 15;
        myCom.Parameters.Add("@NumTablesDeletedFrom", SqlDbType.Int);
        myCom.Parameters["@NumTablesDeletedFrom"].Value = cnt;
        myConn.Open();
        myCom.ExecuteNonQuery();
        myConn.Close();
        
    }
}

}
