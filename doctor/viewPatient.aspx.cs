using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_viewPatient : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            FillViewPatient(emailID);
            lblInfo.CssClass = "label label-warning";
        }
    }
    protected void FillViewPatient(string emailID)
    {
        var dataSource = (from a in obj.Appointments
                          join p in obj.Patients on a.patient_id equals p.patient_id
                          join d in obj.Doctors on a.doctor_id equals d.doctor_id
                          where d.email.Equals(emailID) 
                          select new { p.patient_id, p.name_, p.phone_no,p.date_of_birth,p.medical_history, a.appointment_date, a.appointment_time }).ToList();

        if (dataSource.Count > 0)
        {
            grdViewPatient.DataSource = dataSource;
            grdViewPatient.DataBind();
        }
        else
        {
            grdViewPatient.DataSource = null;
            grdViewPatient.DataBind();
        }
    }
}