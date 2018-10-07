using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addOperator :  System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDropDowns.FillDoctors(ddlDoctor);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(Convert.ToInt32(ddlDoctor.SelectedItem.Value) == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a valid doctor');", true);
            ddlDoctor.Focus();
            return;
        }


        DateTime convertedDOB = DateTime.Parse(txtDOB.Text);
        if (obj.SP_OPERATOR(1, 0, Convert.ToInt32(ddlDoctor.SelectedItem.Value), txtName.Text, txtHomeAddress.Text, txtEmailID.Text, txtMobile.Text, convertedDOB) == 0)
        {
            if (obj.SP_LOGIN(1, txtEmailID.Text, txtPassword.Text,"Operator") == 0)
            {
                lblInfo.Text = "Data added successfully!";
                lblInfo.CssClass = "label label-success";
                resetFields();
            }
            else
            {
                lblInfo.Text = "Database error!";
                lblInfo.CssClass = "label label-danger";
            }
        }
        else
        {
            lblInfo.Text = "Database error!";
            lblInfo.CssClass = "label label-danger";
        }
    }

    protected void resetFields()
    {
        txtDOB.Text = "";
        txtEmailID.Text = "";
        txtHomeAddress.Text = "";
        txtMobile.Text = "";
        txtName.Text = "";
        FillDropDowns.FillDoctors(ddlDoctor);
    }
}