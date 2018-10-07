using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class operator_viewAppointments : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            FillViewAppointment(emailID);

            lblInfo.CssClass = "label label-warning";
        }
    }
    protected void FillViewAppointment(String emailID)
    {
        var dataSource = (from a in obj.Appointments
                          join dp in obj.Operators on a.operator_id equals dp.operator_id
                          where dp.email.Equals(emailID)
                          select new { a.appointment_id, a.patient_id, a.doctor_id, a.appointment_date, a.appointment_time, a.payment_status, a.appointment_status }).ToList();

        if (dataSource.Count > 0)
        {
            grdViewAppointment.DataSource = dataSource;
            grdViewAppointment.DataBind();
        }
        else
        {
            grdViewAppointment.DataSource = null;
            grdViewAppointment.DataBind();
        }
    }
    protected void grdViewAppointment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string emailID = Session["UserID"].ToString();
        lblInfo.Text = emailID;
        var dataSource = (from a in obj.Appointments
                          join dp in obj.Operators on a.operator_id equals dp.operator_id
                          where dp.email.Equals(emailID)
                          select new { a.appointment_id, a.patient_id, a.doctor_id, a.operator_id, a.payment_id, a.appointment_date, a.appointment_time, a.payment_status, a.appointment_status }).ToList().First();

        if (obj.SP_APPOINTMENT(2, dataSource.appointment_id,dataSource.patient_id, dataSource.doctor_id, dataSource.operator_id, dataSource.payment_id, dataSource.appointment_date, dataSource.appointment_time, "Pending", "Confirmed") == 0)
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
