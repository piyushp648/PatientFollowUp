using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_orderMedicine : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    static int SelectedReportID;
    static int SelectedChemistID;
    static int pid;
    static string SelectedReportImage;
    protected void Page_Load(object sender, EventArgs e)
    {
        string emailID = Session["UserID"].ToString();
        var dataSource = (from d in obj.Patients where d.email.Equals(emailID) select new { d.patient_id }).First();

        pid = dataSource.patient_id;
        FillgrdPrescription(pid);
        FillgrdShowChemist();
        
    }

    protected void btnUploadPrescription_Click(object sender, EventArgs e)
    {
        Response.Redirect("reports.aspx");
    }
    protected void FillgrdPrescription(int pid)
    {
        var dataSource = (from d in obj.Reports
                          where d.patient_id.Equals(pid)
                          select new { d.patient_id, d.report_id, d.report_type,d.report_image }
                          ).ToList();
        if (dataSource.Count > 0)
        {
            grdPrescription.DataSource = dataSource;
            grdPrescription.DataBind();
        }
        else
        {
            grdPrescription.DataSource = null;
            grdPrescription.DataBind();

            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('No uploaded prescription to show');", true);
        }
    }

    protected void grdPrescription_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtOrderDetails.Text.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please enter order details');", true);
        }
        else if (txtDeliveryAddress.Text.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please enter Address');", true);
        }

        SelectedReportID = Convert.ToInt32(grdPrescription.Rows[grdPrescription.SelectedRow.RowIndex].Cells[1].Text);
       
        SelectedReportImage = grdPrescription.DataKeys[grdPrescription.SelectedRow.RowIndex].Values["report_image"].ToString();


    }
    protected void FillgrdShowChemist()
    {

        var dataSource = (from c in obj.Chemists
                         
                          select new { c.chemist_id, c.name_, c.address_, c.phone_no, c.type_ }
                          ).ToList();
        if (dataSource.Count > 0)
        {
            grdShowChemist.DataSource = dataSource;
            grdShowChemist.DataBind();
        }
        else
        {
            grdShowChemist.DataSource = null;
            grdShowChemist.DataBind();

            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('No Chemist to show');", true);
        }

    }

    protected void grdShowChemist_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SelectedReportID == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select the prescription');", true);
        }
       SelectedChemistID = Convert.ToInt32(grdShowChemist.DataKeys[grdShowChemist.SelectedRow.RowIndex].Values["chemist_id"].ToString());
        
    }

    protected void btnOrderMedicine_Click(object sender, EventArgs e)
    {
        if(txtDeliveryAddress.Text.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please enter a delivery address!');", true);
            return;
        }
        if (txtOrderDetails.Text.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please enter order details!');", true);
            return;
        }
        if (SelectedChemistID == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a chemist');", true); return;
        }
        if (SelectedReportID == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a prescription');", true);
            return;
        }
        if (obj.SP_ORDER_MEDICINE(1,pid , SelectedChemistID, 0, SelectedReportImage, txtOrderDetails.Text,400 ,txtDeliveryAddress.Text, "Order Placed") == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Order placed successfully');", true);
            SelectedReportID = 0;
            SelectedChemistID = 0;
            SelectedReportImage = null;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Database error');", true);

        }

    }
}