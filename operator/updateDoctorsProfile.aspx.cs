using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class operator_updateDoctorsProfile : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            FillDoctorData();
        }
    }
    public void FillDoctorData()
    {
        string opEmailId = Session["UserID"].ToString();

        var docIdSource = (from d in obj.Operators
                     where d.email.Equals(opEmailId)
                     select new {d.doctor_id}
                     
                     ).ToList().First();

        int docId = Convert.ToInt32(docIdSource.doctor_id);

        var dataSource = (from d in obj.Doctors
                          where d.doctor_id.Equals(docId)
                          select new { d.phone_no, d.doctor_id, d.degree, d.specialization, d.registration_no, d.address_ }
                          ).ToList().First();
        txtMobile.Text = dataSource.phone_no.ToString();
        txtDegree.Text = dataSource.degree.ToString();
        txtHomeAddress.Text = dataSource.address_.ToString();
        txtRegistrationNo.Text = dataSource.registration_no.ToString();
        txtSpecialization.Text = dataSource.specialization.ToString();
        hdnDocId.Value = dataSource.doctor_id.ToString();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (obj.SP_DOCTOR(2, Convert.ToInt32(hdnDocId.Value), txtRegistrationNo.Text, "bla", txtHomeAddress.Text, "bla", txtMobile.Text, DateTime.Today, txtDegree.Text, txtSpecialization.Text, "bla") == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Profile updated successfully');", true);
            FillDoctorData();
        }
    }
}