using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chemist_register : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
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
        if (txtName.Text.Length == 0)
        {
            txtName.Focus();
        }
        else if (txtDOB.Text.Length == 0)
        {
            txtDOB.Focus();
        }
        else if (txtEmailID.Text.Length == 0)
        {
            txtEmailID.Focus();
        }
        else if(txtMobile.Text.Length == 0)
        {
            txtMobile.Focus();
        }
        else if(txtLicenseNo.Text.Length ==0)
        {
            txtLicenseNo.Focus();
        }
        else if (txtPassword.Text.Length == 0)
        {
            txtPassword.Focus();
        }
        else if (txtCnfPassword.Text.Length == 0)
        {
            txtCnfPassword.Focus();
        }
        else if (!txtPassword.Equals(txtCnfPassword))
        {
            lblInfo.Text = "Password do not match!";
            lblInfo.CssClass = "label label-danger";
            txtCnfPassword.Focus();
        }

        DateTime convertedDOB = DateTime.Parse(txtDOB.Text);
        if (obj.SP_CHEMIST(1, 0,txtLicenseNo.Text ,txtName.Text,txtHomeAddress.Text , txtEmailID.Text, txtMobile.Text, convertedDOB, ddlChemistType.SelectedItem.Text) == 0)
        {
            if (obj.SP_LOGIN(1, txtEmailID.Text, txtPassword.Text,"Chemist") == 0)
            {
                lblInfo.Text = "Chemist registered succcessfully";
                lblInfo.CssClass = "label label-success";
                Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('User registered successfully');", true);
                resetFields();
                Response.Redirect("../chemistLogin.aspx");
            }

            else
            {
                lblInfo.Text = "Database error!";
                lblInfo.CssClass = "label label-danger";
                resetFields();
            }
        }
    }
    protected void resetFields()
    {
        txtName.Text = "";
        txtDOB.Text = "";
        txtLicenseNo.Text ="";
        txtEmailID.Text = "";
       txtHomeAddress.Text = "";
       txtMobile.Text = "";
    }
}