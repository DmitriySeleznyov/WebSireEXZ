using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections.Generic;
using System.Web.Configuration;
using Npgsql;

/// <summary>
/// Сводное описание для WebServices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// Чтобы разрешить вызывать веб-службу из скрипта с помощью ASP.NET AJAX, раскомментируйте следующую строку. 
[System.Web.Script.Services.ScriptService]
public class AutoComplete : System.Web.Services.WebService {

    
    static string connString = WebConfigurationManager.ConnectionStrings["PostgresConnectionString"].ToString();
    static List<string> cityCodeList = new List<string>();
    static List<string> KVEDCodeList = new List<string>();
    static List<string> DKPPCodeList = new List<string>();
    static List<string> KVCPZCodeList = new List<string>();
    static List<string> CompanyCodeList = new List<string>();


    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public List<string> GetCompany(string prefixText, int count)
    {

        List<string> company_id = new List<string>();
        List<string> names = new List<string>();

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_company = new NpgsqlCommand(String.Format("SELECT company_id, short_name FROM \"Company\" where state_registr_number!='0'"), myConn1);

        // Загрузить списки из кэша
        if (HttpContext.Current.Cache["CompanyList"] == null)
        {
            // Если списки еще не сохранены в кэше, то создать их
            try
            {
                myConn1.Open();
                NpgsqlDataReader reader = cmd_get_company.ExecuteReader();
                while (reader.Read())
                {
                    company_id.Add((string)reader["company_id"].ToString());
                    names.Add((string)reader["short_name"]);
                }
                reader.Close();
            }
            finally
            {
                myConn1.Close();
            }

            // Сохранить списки в кэше на 60 минут
            HttpContext.Current.Cache.Insert("CompanyIDList", company_id, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("CompanyList", names, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
        }
        else
        {
            // Загрузить из кэша списки
            company_id = (List<string>)HttpContext.Current.Cache["CompanyIDList"];
            names = (List<string>)HttpContext.Current.Cache["CompanyList"];
        }

        int index = -1;
        List<string> companyList = new List<string>();
        for (int i = 0; i < names.Count; i++)
        {
            // Остановить, если поиск переходит к следующей букве.
            if (names[i].StartsWith(prefixText, StringComparison.InvariantCultureIgnoreCase))
            {
                index = i;
                companyList.Add(names[i]);
                CompanyCodeList.Add(company_id[i]); // для того, чтобы затем записывать в БД
            }
        }

        // Остановить поиск при отсутствии соответствия
        if (index == -1) return new List<string>();
        return companyList;
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public List<string> GetCities(string prefixText, int count)
    {

        List<string> koatuu_id = new List<string>();
        List<string> classes = new List<string>();
        List<string> types = new List<string>();
        List<string> names = new List<string>();

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_city = new NpgsqlCommand(String.Format("select class_koatuu_id,class_koatuu,type_obj,name_obj from \"Class_KOATUU\""), myConn1);

        // Загрузить списки из кэша
        if (HttpContext.Current.Cache["NameList"] == null)
        {
            // Если списки еще не сохранены в кэше, то создать их
            try
            {
                myConn1.Open();
                NpgsqlDataReader reader = cmd_get_city.ExecuteReader();
                while (reader.Read())
                {
                    koatuu_id.Add((string)reader["class_koatuu_id"].ToString());
                    classes.Add((string)reader["class_koatuu"]);
                    types.Add((string)reader["type_obj"]);
                    names.Add((string)reader["name_obj"]);
                }
                reader.Close();
            }
            finally
            {
                myConn1.Close();
            }

            // Сохранить списки в кэше на 60 минут
            HttpContext.Current.Cache.Insert("CityIDList", koatuu_id, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("NameList", names, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("TypeList", types, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("ClassList", classes, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
        }
        else
        {
            // Загрузить из кэша списки
            koatuu_id = (List<string>)HttpContext.Current.Cache["CityIDList"];
            names = (List<string>)HttpContext.Current.Cache["NameList"];
            types = (List<string>)HttpContext.Current.Cache["TypeList"];
            classes = (List<string>)HttpContext.Current.Cache["ClassList"];
        }

        int index = -1;
        List<string> cityList = new List<string>();
        for (int i = 0; i < names.Count; i++)
        {
            // Остановить, если поиск переходит к следующей букве.
            string reg = "";
            string distr = "";
            if ((types[i] == "місто") || (types[i] == "смт") || (types[i] == "село") || (types[i] == "селище"))
            {
                if (names[i].StartsWith(prefixText, StringComparison.InvariantCultureIgnoreCase))
                {

                    //ищем область
                    try
                    {
                        myConn1.Open();
                        for (int j = 0; j < names.Count; j++)
                        {
                            var cmd_get_region = new NpgsqlCommand(String.Format("select class_koatuu,name_obj from \"Class_KOATUU\" where class_koatuu='{0}'", classes[i].Substring(0, 2) + "00000000"), myConn1);
                            NpgsqlDataReader reader_r = cmd_get_region.ExecuteReader();
                            if (reader_r.Read())
                            {
                                reg = (string)reader_r["name_obj"];
                                break;
                            }
                            reader_r.Close();
                        }
                    }
                    finally
                    {
                        myConn1.Close();
                    }
                    index = i;
                                        //ищем район
                                        try
                                        {
                                            myConn1.Open();
                                            for (int j = 0; j < names.Count; j++)
                                            {
                                                var cmd_get_distr = new NpgsqlCommand(String.Format("select class_koatuu,name_obj from \"Class_KOATUU\" where class_koatuu='{0}'", classes[i].Substring(0, 5) + "00000"), myConn1);
                                                NpgsqlDataReader reader_d = cmd_get_distr.ExecuteReader();
                                                if (reader_d.Read())
                                                {
                                                    distr = (string)reader_d["name_obj"];
                                                    break;
                                                }
                                                reader_d.Close();
                                            }
                                        }
                                        finally
                                        {
                                            myConn1.Close();
                                        }                    
                    
                    
                    if (reg.IndexOf('/') != -1)
                        reg = reg.Substring(0, reg.IndexOf('/'));
                                        if (distr.IndexOf('/') != -1)
                                            distr = distr.Substring(0, distr.IndexOf('/'));
                    cityList.Add(names[i] + "(" + types[i] + ", " + reg +", "+distr+ ")");
                    cityCodeList.Add(koatuu_id[i]); // для того, чтобы затем записывать в БД
                }
            }

        }
        // Остановить поиск при отсутствии соответствия
        if (index == -1) return new List<string>();
        return cityList;
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public List<string> GetKVED(string prefixText, int count)
    {

        List<string> kved_id = new List<string>();
        List<string> classes = new List<string>();
        List<string> names = new List<string>();

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_kved = new NpgsqlCommand(String.Format("select class_kved_id,class_kved,description from \"Class_KVED\""), myConn1);

        // Загрузить списки из кэша
        if (HttpContext.Current.Cache["KVEDList"] == null)
        {
            // Если списки еще не сохранены в кэше, то создать их
            try
            {
                myConn1.Open();
                NpgsqlDataReader reader = cmd_get_kved.ExecuteReader();
                while (reader.Read())
                {
                    kved_id.Add((string)reader["class_kved_id"].ToString());
                    classes.Add((string)reader["class_kved"]);
                    names.Add((string)reader["description"]);
                }
                reader.Close();
            }
            finally
            {
                myConn1.Close();
            }

            // Сохранить списки в кэше на 60 минут
            HttpContext.Current.Cache.Insert("KVEDIDList", kved_id, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("KVEDList", names, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("KVEDClassList", classes, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
        }
        else
        {
            // Загрузить из кэша списки
            kved_id = (List<string>)HttpContext.Current.Cache["KVEDIDList"];
            names = (List<string>)HttpContext.Current.Cache["KVEDList"];
            classes = (List<string>)HttpContext.Current.Cache["KVEDClassList"];
        }

        int index = -1;
        List<string> kvedList = new List<string>();
        for (int i = 0; i < names.Count; i++)
        {
            // Остановить, если поиск переходит к следующей букве.
            if (classes[i].StartsWith(prefixText, StringComparison.InvariantCultureIgnoreCase))
            {
                index = i;
                kvedList.Add(classes[i] + " - " + names[i]);
                KVEDCodeList.Add(kved_id[i]); // для того, чтобы затем записывать в БД
            }
        }

        // Остановить поиск при отсутствии соответствия
        if (index == -1) return new List<string>();
        return kvedList;
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public List<string> GetDKPP(string prefixText, int count)
    {

        List<string> dkpp_id = new List<string>();
        List<string> classes = new List<string>();
        List<string> names = new List<string>();

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_dkpp = new NpgsqlCommand(String.Format("select class_dkpp_id,class_dkpp,class_dkpp_descr from \"Class_DKPP\""), myConn1);

        // Загрузить списки из кэша
        if (HttpContext.Current.Cache["DKPPList"] == null)
        {
            // Если списки еще не сохранены в кэше, то создать их
            try
            {
                myConn1.Open();
                NpgsqlDataReader reader = cmd_get_dkpp.ExecuteReader();
                while (reader.Read())
                {
                    dkpp_id.Add((string)reader["class_dkpp_id"].ToString());
                    classes.Add((string)reader["class_dkpp"]);
                    names.Add((string)reader["class_dkpp_descr"]);
                }
                reader.Close();
            }
            finally
            {
                myConn1.Close();
            }

            // Сохранить списки в кэше на 60 минут
            HttpContext.Current.Cache.Insert("DKPPIDList", dkpp_id, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("DKPPList", names, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("DKPPClassList", classes, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
        }
        else
        {
            // Загрузить из кэша списки
            dkpp_id = (List<string>)HttpContext.Current.Cache["DKPPIDList"];
            names = (List<string>)HttpContext.Current.Cache["DKPPList"];
            classes = (List<string>)HttpContext.Current.Cache["DKPPClassList"];
        }

        int index = -1;
        List<string> dkppList = new List<string>();
        for (int i = 0; i < names.Count; i++)
        {
            // Остановить, если поиск переходит к следующей букве.
            if (classes[i].StartsWith(prefixText, StringComparison.InvariantCultureIgnoreCase))
            {
                index = i;
                dkppList.Add(classes[i] + " > " + names[i]);
                DKPPCodeList.Add(dkpp_id[i]); // для того, чтобы затем записывать в БД ????
            }
        }

        // Остановить поиск при отсутствии соответствия
        if (index == -1) return new List<string>();
        return dkppList;
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public List<string> GetKVCPZ(string prefixText, int count)
    {

        List<string> kvcpz_id = new List<string>();
        List<string> classes = new List<string>();
        List<string> names = new List<string>();

        NpgsqlConnection myConn1 = new NpgsqlConnection(connString);
        NpgsqlCommand cmd_get_kvcpz = new NpgsqlCommand(String.Format("select class_kvcpz_id,class_kvcpz,kvcpz_descr from \"Class_KVCPZ\""), myConn1);

        // Загрузить списки из кэша
        if (HttpContext.Current.Cache["KVCPZList"] == null)
        {
            // Если списки еще не сохранены в кэше, то создать их
            try
            {
                myConn1.Open();
                NpgsqlDataReader reader = cmd_get_kvcpz.ExecuteReader();
                while (reader.Read())
                {
                    kvcpz_id.Add((string)reader["class_kvcpz_id"].ToString());
                    classes.Add((string)reader["class_kvcpz"]);
                    names.Add((string)reader["kvcpz_descr"]);
                }
                reader.Close();
            }
            finally
            {
                myConn1.Close();
            }

            // Сохранить списки в кэше на 60 минут
            HttpContext.Current.Cache.Insert("KVCPZIDList", kvcpz_id, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("KVCPZList", names, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
            HttpContext.Current.Cache.Insert("KVCPZClassList", classes, null,
              DateTime.Now.AddMinutes(60), TimeSpan.Zero);
        }
        else
        {
            // Загрузить из кэша списки
            kvcpz_id = (List<string>)HttpContext.Current.Cache["KVCPZIDList"];
            names = (List<string>)HttpContext.Current.Cache["KVCPZList"];
            classes = (List<string>)HttpContext.Current.Cache["KVCPZClassList"];
        }

        int index = -1;
        List<string> kvcpzList = new List<string>();
        for (int i = 0; i < names.Count; i++)
        {
            // Остановить, если поиск переходит к следующей букве.
            if (classes[i].StartsWith(prefixText, StringComparison.InvariantCultureIgnoreCase))
            {
                index = i;
                kvcpzList.Add(classes[i] + " > " + names[i]);
                KVCPZCodeList.Add(kvcpz_id[i]); // для того, чтобы затем записывать в БД ????
            }
        }

        // Остановить поиск при отсутствии соответствия
        if (index == -1) return new List<string>();
        return kvcpzList;
    }
}
