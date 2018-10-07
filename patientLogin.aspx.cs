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

    }


   

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text == "Rajshree" && txtPassword.Text == "1234")
        {
            Session["UserID"] = txtUsername.Text;
            Response.Redirect("/patient/home.aspx");
        }
    }
}