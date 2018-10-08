using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_viewChemistQueries : System.Web.UI.Page
{

    static int selectedChemistQueryId;
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            FillChemistQueries(emailID);
            lblInfo.CssClass = "label label-warning";
        }

    }
    protected void FillChemistQueries(string emailID)
    {

        var dataSource = (from d in obj.Doctors where d.email.Equals(emailID) select new { d.doctor_id }).First();

        int did = dataSource.doctor_id;
        var dataSource1 = (from q in obj.Chemist_queries
                           where q.doctor_id.Equals(did)
                           select new { q.chemist_id, q.chemist_query_id, q.query_question, q.query_response, q.query_status }).ToList();

        if (dataSource1.Count > 0)
        {
            grdChemistQueries.DataSource = dataSource1;
            grdChemistQueries.DataBind();
        }
        else
        {
            grdChemistQueries.DataSource = null;
            grdChemistQueries.DataBind();
        }
    }

    protected void grdChemistQueries_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ptQueryId = Convert.ToInt32(grdChemistQueries.Rows[grdChemistQueries.SelectedRow.RowIndex].Cells[2].Text);
        selectedChemistQueryId = ptQueryId;
        lblInfo.Text = "Query selected";
        lblInfo.CssClass = "label label-info";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (selectedChemistQueryId == 0)
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
        var dataSource1 = (from q in obj.Chemist_queries

                           where q.chemist_query_id.Equals(selectedChemistQueryId)
                           select new { q.chemist_id, q.chemist_query_id, q.query_question, q.query_response }).ToList().First();

        if (obj.SP_CHEMIST_QUERY(2, selectedChemistQueryId, dataSource1.chemist_id, did, dataSource1.query_question, txtQueryResponse.Text, "Query Responded") == 0)
        {
            lblInfo.Text = "Query Responded succesfully";
            lblInfo.CssClass = "label label-success";
            FillChemistQueries(emailID);
        }
        else
        {
            lblInfo.Text = "Database error";
            lblInfo.CssClass = "label label-danger";
        }
    }
}