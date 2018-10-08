using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 :  System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var dataSource = (from d in obj.Logins
                          where (d.usertype.Equals("Admin") && txtUsername.Text.Equals(d.userid) && txtPassword.Text.Equals(d.password_))
                          select new { d.password_, d.userid }).ToList();
        if (dataSource.Count > 0)
        {
            Session["UserID"] = txtUsername.Text;
            Response.Redirect("/admin/home.aspx");
        }
        else
        {
            lblInfo.Text = "Invalid username or password";
            lblInfo.CssClass = "label label-danger";
        }
    }
}