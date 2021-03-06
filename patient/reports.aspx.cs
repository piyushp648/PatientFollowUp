﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_reports : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillUploadedReports();
            FillDropDowns.FillReportTypes(ddlReportType);
        }
    }

    protected void BtnUploadReport_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ddlReportType.SelectedItem.Value) == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a valid report type');", true);
            ddlReportType.Focus();
            return;
        }
        if (FileUploadControl.HasFile)
        {
            
            string fileextension = System.IO.Path.GetExtension(FileUploadControl.FileName);
            if (!(FileUploadControl.PostedFile.ContentType == "image/png")
                && !(FileUploadControl.PostedFile.ContentType == "image/jpeg")
                && !fileextension.ToLower().Equals(".pdf"))
            {
                lblInfo.Text = "Please upload png/jpeg/pdf files only!";
                lblInfo.CssClass = "label label-danger";
                Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Only png/jpeg/pdf file allowed!');", true);
                return;
            }
            string emailID = Session["UserID"].ToString();
            var dataSource = (from d in obj.Patients
                              where d.email.Equals(emailID)
                              select new { d.patient_id, d.name_ }).ToList();

            int pid = dataSource.First().patient_id;
            string pname = dataSource.First().name_;
            var dataSource2 = (from d in obj.Reports select new { d.report_id }).ToList();
            int reportID = 0;

            if (dataSource2.Count > 0)
            {
                reportID = dataSource2.Last().report_id + 1;
            }
            else
            {
                reportID = 1000;
            }


            string filename = reportID + "_" + pid;

            try
            {
                FileUploadControl.SaveAs(Server.MapPath("../UploadedReports/") + filename + ".png");
                Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('File uploaded');", true);
                lblInfo.Text = "Upload status: File uploaded!";
                lblInfo.CssClass = "label label-info";
            }

            catch (Exception ex)
            {
                lblInfo.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                return;
            }

            string path = "../UploadedReports/" + filename + ".png";
            if (obj.SP_REPORT(1, pid, reportID, path, ddlReportType.SelectedItem.Text) == 0)
            {
                lblInfo.Text = "Upload status: File uploaded!";
                lblInfo.CssClass = "label label-info";
                FillUploadedReports();
            }
            else
            {
                lblInfo.Text = "Database error!";
            }
        }
    }

    public void FillUploadedReports()
    {
        string emailID = Session["UserID"].ToString();
        var patientIdSource = (from d in obj.Patients
                               where d.email.Equals(emailID)
                               select new { d.patient_id, d.name_ }).ToList();

        int pid = patientIdSource.First().patient_id;

        var dataSource = (from d in obj.Reports
                          where d.patient_id.Equals(pid)
                          select new { d.report_id, d.report_type, d.report_image }
                          ).ToList();
        if (dataSource.Count > 0)
        {
            grdUploadedReports.DataSource = dataSource;
            grdUploadedReports.DataBind();
        }
        else
        {
            grdUploadedReports.DataSource = null;
            grdUploadedReports.DataBind();
            
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('No uploaded reports to show');", true);
        }
    }

    protected void grdUploadedReports_SelectedIndexChanged(object sender, EventArgs e)
    {
        string report_location = grdUploadedReports.DataKeys[grdUploadedReports.SelectedRow.RowIndex].Values["report_image"].ToString();
        string control_string = "window.open('" + report_location + "','_newtab');";
        Page.ClientScript.RegisterStartupScript(
        this.GetType(), "OpenWindow", control_string, true);
    }
}