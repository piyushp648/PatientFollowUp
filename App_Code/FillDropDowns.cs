using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class1
/// </summary>
public class FillDropDowns
{
    static DataClassesDataContext obj = new DataClassesDataContext();
    public FillDropDowns()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void FillChemistType(DropDownList ddl)
    {
        ddl.Items.Clear();
        ddl.Items.Insert(0, new ListItem("--SELECT--", "0"));
        ddl.Items.Add(new ListItem("Retail", "1"));
        ddl.Items.Add(new ListItem("Wholesale", "2"));
        ddl.Items.Add(new ListItem("Both", "3"));
        ddl.DataBind();
    }

    public static void FillDoctors(DropDownList ddl)
    {
        ddl.Items.Clear();
        var dataSource = (from d in obj.Doctors where d.OperatorSet==false select new { data = d.name_, id = d.doctor_id });
        ddl.DataSource = dataSource;
        ddl.DataTextField = "data";
        ddl.DataValueField = "id";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("--SELECT--", "0"));

        
    }

}