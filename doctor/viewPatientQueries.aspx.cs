using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_viewPatientQueries : System.Web.UI.Page
{
    static int selectedPatientQueryId;
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            FillPatientQueries(emailID);
            lblInfo.CssClass = "label label-warning";
        }

    }
    protected void FillPatientQueries(string emailID)
    {

        var dataSource = (from d in obj.Doctors where d.email.Equals(emailID) select new { d.doctor_id }).First();

        int did = dataSource.doctor_id;
        var dataSource1 = (from q in obj.Patient_queries
                           where q.doctor_id.Equals(did)
                           select new { q.patient_id, q.patient_query_id, q.query_question, q.query_response, q.query_status }).ToList();

        if (dataSource1.Count > 0)
        {
            grdPatientQuery.DataSource = dataSource1;
            grdPatientQuery.DataBind();
        }
        else
        {
            grdPatientQuery.DataSource = null;
            grdPatientQuery.DataBind();
        }
    }




    protected void grdPatientQuery_SelectedIndexChanged1(object sender, EventArgs e)
    {

        int ptQueryId = Convert.ToInt32(grdPatientQuery.Rows[grdPatientQuery.SelectedRow.RowIndex].Cells[2].Text);
        selectedPatientQueryId = ptQueryId;
        lblInfo.Text = "Query selected";
        lblInfo.CssClass = "label label-info";
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        if(selectedPatientQueryId == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please select a query');", true);
            return;
        }
        if (txtQueryResponse.Text.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please fill a response');", true);
            return;
        }
        string emailID = Session["UserID"].ToString();
        var dataSource = (from d in obj.Doctors where d.email.Equals(emailID) select new { d.doctor_id }).First();

        int did = dataSource.doctor_id;
        var dataSource1 = (from q in obj.Patient_queries

                           where q.patient_query_id.Equals(selectedPatientQueryId)
                           select new { q.patient_id, q.patient_query_id, q.query_question, q.query_response }).ToList().First();

        if (obj.SP_PATIENT_QUERY(2, selectedPatientQueryId, dataSource1.patient_id, did, dataSource1.query_question, txtQueryResponse.Text, "Query Responded") == 0)
        {
            lblInfo.Text = "Query Responded succesfully";
            lblInfo.CssClass = "label label-success";
            FillPatientQueries(emailID);
        }
        else
        {
            lblInfo.Text = "Database error";
            lblInfo.CssClass = "label label-danger";
        }
    }
}