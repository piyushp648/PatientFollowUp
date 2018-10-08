using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default :  System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        try { 
        if (Session["Prevpage"].ToString().Equals("Reg"))
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Patient registered successfully');", true);
            Session.Clear();
            Session.RemoveAll();
        }
        }catch(Exception ex)
        {

        }
    }






    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var dataSource = (from d in obj.Logins where (d.usertype.Equals("Patient") && txtUsername.Text.Equals(d.userid) && txtPassword.Text.Equals(d.password_))
                          select new {d.password_,d.userid}).ToList();
        if (dataSource.Count > 0)
        {
            Session["UserID"] = txtUsername.Text;
            Response.Redirect("/patient/home.aspx");
        }
        else
        {
            lblInfo.Text = "Invalid username or password";
            lblInfo.CssClass = "label label-danger";
        }
    }
}