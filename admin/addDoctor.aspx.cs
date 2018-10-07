using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addDoctor :  System.Web.UI.Page
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
        else if(txtRegistrationNo.Text.Length == 0)
        {
            txtRegistrationNo.Focus();
        }else if(txtDegree.Text.Length == 0)
        {
            txtDegree.Focus();
        }else if(txtSpecialization.Text.Length ==0)
        {
            txtSpecialization.Focus();
        }else if (txtHomeAddress.Text.Length == 0)
        {
            txtHomeAddress.Focus();
        }else if (txtWorkAddress.Text.Length == 0)
        {
            txtWorkAddress.Focus();
        }else if(txtPassword.Text.Length == 0)
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
        if(obj.SP_DOCTOR(1,0,txtRegistrationNo.Text, txtName.Text, txtHomeAddress.Text, txtEmailID.Text, txtMobile.Text, convertedDOB, txtDegree.Text, txtSpecialization.Text, txtWorkAddress.Text) == 0)
        {
            if(obj.SP_LOGIN(1,txtEmailID.Text,txtPassword.Text,"Doctor") == 0) { 
            lblInfo.Text = "Doctor registered succcessfully";
            lblInfo.CssClass = "label label-success";
            resetFields();
            }
        }
        else
        {
            lblInfo.Text = "Database error!";
            lblInfo.CssClass = "label label-danger";
            resetFields();
        }
    }

    protected void resetFields()
    {
        txtName.Text = "";
        txtDOB.Text = "";
        txtSpecialization.Text = "";
        txtEmailID.Text = "";
        txtDegree.Text = "";
        txtHomeAddress.Text = "";
        txtWorkAddress.Text = "";
        txtRegistrationNo.Text = "";
        txtMobile.Text = "";
    }
}