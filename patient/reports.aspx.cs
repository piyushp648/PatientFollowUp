using System;
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

    }

    protected void BtnUploadReport_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            string fileextension = System.IO.Path.GetExtension(FileUploadControl.FileName);
            if (!(FileUploadControl.PostedFile.ContentType == "image/png")
                || !(FileUploadControl.PostedFile.ContentType == "image/jpeg")
                || !fileextension.ToLower().Equals(".pdf") )
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
                FileUploadControl.SaveAs(Server.MapPath("~/UploadedReports/") + filename + ".png");
                lblInfo.Text = "Upload status: File uploaded!";
                lblInfo.CssClass = "label label-info";
            }

            catch (Exception ex)
            {
                lblInfo.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                return;
            }

            string path = "~/UploadedReports/" + filename + ".png";
            if (obj.SP_REPORT(1, pid, reportID, path, txtReportType.Text) == 0)
            {
                lblInfo.Text = "Upload status: File uploaded!";
                lblInfo.CssClass = "label label-info";
            }
            else
            {
                lblInfo.Text = "Database error!";
            }
        }
    }
}