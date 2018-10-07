using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_viewPatientQueries : System.Web.UI.Page
{
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
         dataSource = (from q in obj.Patient_querys
                         
                          where q.doctor_id.Equals(did)
                          select new { q.patient_id, q.patient_query_id,q.query_question,q.query_response}).ToList();

        if (dataSource.Count > 0)
        {
            grdPatientQuery.DataSource = dataSource;
            grdPatientQuery.DataBind();
        }
        else
        {
            grdPatientQuery.DataSource = null;
            grdPatientQuery.DataBind();
        }
    }

    protected void grdPatientQuery_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtQueryResponse.Text.Length == 0)
        {
            lblInfo.Text = "Please fill the query";
            lblInfo.CssClass = "label label-danger";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string emailID = Session["UserID"].ToString();
        var dataSource = (from d in obj.Doctors where d.email.Equals(emailID) select new { d.doctor_id }).First();

        int did = dataSource.doctor_id;
         dataSource = (from q in obj.Patient_querys

                      where q.doctor_id.Equals(did)
                      select new { q.patient_id, q.patient_query_id, q.query_question, q.query_response }).ToList();

        if (obj.SP_PATIENT_QUERY(2, dataSource.patient_query_id, dataSource.patient_id, did, dataSource.query_question, txtQueryResponse.Text, "Query Responded") == 0)
        {
            lblInfo.Text = "Query Responded succesfully";
            lblInfo.CssClass = "label label-success";
        }
        else
        {
            lblInfo.Text = "Database error";
            lblInfo.CssClass = "label label-danger";
        }
    }
}