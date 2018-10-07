using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default5 :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        if (txtUsername.Text == "Piyush" && txtPassword.Text == "1234")
        {
            Session["UserID"] = txtUsername.Text;
            Response.Redirect("/doctor/home.aspx");
        }

    }
}