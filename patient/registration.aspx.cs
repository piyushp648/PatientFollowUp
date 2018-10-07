using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_registration : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
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
        else if (txtMobile.Text.Length == 0)
        {
            txtMobile.Focus();
        }
        else if (txtMedicalHistory.Text.Length == 0)
        {
            txtMedicalHistory.Focus();
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
        if (obj.SP_PATIENT(1, 0,  txtName.Text, txtHomeAddress.Text, txtEmailID.Text, txtMobile.Text, convertedDOB, txtMedicalHistory.Text) == 0)
        {
            if (obj.SP_LOGIN(1, txtEmailID.Text, txtPassword.Text,"Patient") == 0)
            {
                lblInfo.Text = "Patient registered succcessfully";
                lblInfo.CssClass = "label label-success";
                resetFields();
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
        txtMedicalHistory.Text = "";
        txtEmailID.Text = "";
        txtHomeAddress.Text = "";
        txtMobile.Text = "";
    }

    
}