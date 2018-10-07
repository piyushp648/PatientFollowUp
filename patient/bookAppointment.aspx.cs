using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_bookAppointment : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDoctorData();
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            lblInfo.CssClass = "label label-warning";
        }
    }

    protected void FillDoctorData()
    {
        var dataSource = (from d in obj.Doctors
                          join dp in obj.Operators on d.doctor_id equals dp.doctor_id
                          select new { d.name_, d.degree, d.specialization, d.phone_no, d.email, d.doctor_id, dp.operator_id }).ToList();

        if(dataSource.Count > 0)
        {
            grdDoctors.DataSource = dataSource;
            grdDoctors.DataBind();
        }
        else
        {
            grdDoctors.DataSource = null;
            grdDoctors.DataBind();
        }
    }

    protected void grdDoctors_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(txtAppointmentDate.Text.Length == 0)
        {
            lblInfo.Text = "Please fill appointment date";
            lblInfo.CssClass = "label label-danger";
        }else if(txtAppointmentTime.Text.Length == 0)
        {
            lblInfo.Text = "Please fill appointment time";
            lblInfo.CssClass = "label label-danger";
        }



        string emailID = Session["UserID"].ToString();
        var dataSource = (from d in obj.Patients where d.email.Equals(emailID) select new { d.patient_id }).First();
        
        int pid = dataSource.patient_id;

        int docid = Convert.ToInt32(grdDoctors.DataKeys[grdDoctors.SelectedRow.RowIndex].Values["doctor_id"].ToString());
        int opid = Convert.ToInt32(grdDoctors.DataKeys[grdDoctors.SelectedRow.RowIndex].Values["operator_id"].ToString());
        DateTime convertedDate = DateTime.Parse(txtAppointmentDate.Text);
        //DateTime convertedTime = DateTime.Parse(txtAppointmentTime.Text);
        TimeSpan convertedTime = TimeSpan.Parse(txtAppointmentTime.Text);
        if (obj.SP_APPOINTMENT(1, 0, pid, docid, opid,400 , convertedDate, convertedTime, "Pending","Booked") == 0)
        {
            lblInfo.Text = "Appointment booked succesfully";
            lblInfo.CssClass = "label label-success";
        }
        else
        {
            lblInfo.Text = "Database error";
            lblInfo.CssClass = "label label-danger";
        }
    }
}