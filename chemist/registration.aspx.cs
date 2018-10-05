using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chemist_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillDropDowns.FillChemistType(ddlChemistType);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ddlChemistType.SelectedItem.Value) == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a valid type');", true);
            ddlChemistType.Focus();
            return;
        }
    }
}