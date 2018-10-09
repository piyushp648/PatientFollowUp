using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_viewPatient : System.Web.UI.Page
{
    static int selectedPatientId;
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

    
    protected void FillReports(int selectedPatientId)
    {
        
        var dataSource1 = (from r in obj.Reports
                           where r.patient_id.Equals(selectedPatientId)
                           select new { r.patient_id, r.report_id, r.report_image , r.report_type }).ToList();

        if (dataSource1.Count > 0)
        {
            grdViewReport.DataSource = dataSource1;
            grdViewReport.DataBind();
        }
        else
        {
            grdViewReport.DataSource = null;
            grdViewReport.DataBind();
        }


    }



    protected void grdViewPatient_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ptId = Convert.ToInt32(grdViewPatient.Rows[grdViewPatient.SelectedRow.RowIndex].Cells[0].Text);
        selectedPatientId = ptId;
        lblInfo.Text = "Patient selected";
        lblInfo.CssClass = "label label-info";
        FillReports(selectedPatientId);
    }

    protected void grdViewReport_SelectedIndexChanged(object sender, EventArgs e)
    {
        var reportSource = (from d in obj.Reports
                            where d.patient_id.Equals(selectedPatientId)
                            select new {d.report_image}
                            ).ToList().First();
        string report_location = reportSource.report_image;
        string control_string = "window.open('" + report_location + "','_newtab');";
        Page.ClientScript.RegisterStartupScript(
        this.GetType(), "OpenWindow", control_string, true);
    }
}