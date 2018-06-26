using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for GetAllUsers
/// </summary>
public class GetAllUsers
{
	public GetAllUsers()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet CustomGetAllUsers()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt = ds.Tables.Add("Users");


        MembershipUserCollection muc;
        muc = Membership.GetAllUsers();

        string[] rolesArray = Roles.GetAllRoles();
        string[] usersInRole;

        dt.Columns.Add("Имя", Type.GetType("System.String"));
        dt.Columns.Add("E-mail", Type.GetType("System.String"));
        dt.Columns.Add("Дата создания", Type.GetType("System.DateTime"));
        dt.Columns.Add("Время последнего входа", Type.GetType("System.DateTime"));
        dt.Columns.Add("Время последней активности", Type.GetType("System.DateTime"));
        dt.Columns.Add("Online", Type.GetType("System.Boolean"));
        dt.Columns.Add("Ролі", Type.GetType("System.String"));

        foreach (MembershipUser mu in muc)
        {
            DataRow dr;
            dr = dt.NewRow();
            dr["Имя"] = mu.UserName;
            string userRoles = "";

            foreach (string mr in rolesArray)
            {
              usersInRole = Roles.GetUsersInRole(mr);
              foreach (string mur in usersInRole)
              {
                  if (mu.UserName == mur)
                      userRoles = userRoles + ' ' + mr;
              }
             }

            dr["E-mail"] = mu.Email;
            dr["Дата создания"] = mu.CreationDate;
            dr["Время последнего входа"] = mu.LastLoginDate;
            dr["Время последней активности"] = mu.LastActivityDate;
            dr["Online"] = mu.IsOnline;
            dr["Роли"] = userRoles;

            dt.Rows.Add(dr);
        }
        return ds;
    }
}
