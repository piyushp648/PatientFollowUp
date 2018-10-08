using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chemist_consultDoctor : System.Web.UI.Page
{
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string emailID = Session["UserID"].ToString();
            lblInfo.Text = emailID;
            FillDoctorData(emailID);

            lblInfo.CssClass = "label label-warning";
        }
    }
    protected void FillDoctorData(string emailID)
    {
        var dataSource = (from d in obj.Doctors

                          select new { d.name_, d.degree, d.specialization, d.phone_no, d.email, d.doctor_id }).ToList();

        if (dataSource.Count > 0)
        {
            grdConsultDoctor.DataSource = dataSource;
            grdConsultDoctor.DataBind();
        }
        else
        {
            grdConsultDoctor.DataSource = null;
            grdConsultDoctor.DataBind();
        }
    }


    protected void grdConsultDoctor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtQuery.Text.Length == 0)
        {
            lblInfo.Text = "Please fill the query";
            lblInfo.CssClass = "label label-danger";
        }
    }

    protected void BtnSubmitQuery_Click(object sender, EventArgs e)
    {
        string emailID = Session["UserID"].ToString();
        var dataSource = (from d in obj.Chemists where d.email.Equals(emailID) select new { d.chemist_id }).First();

        int cid = dataSource.chemist_id;

        int docid = Convert.ToInt32( grdConsultDoctor.DataKeys[grdConsultDoctor.SelectedRow.RowIndex].Values["doctor_id"].ToString());

        if (obj.SP_CHEMIST_QUERY(1, 0, cid, docid, txtQuery.Text, "", "Pending") == 0)
        {
            lblInfo.Text = "Query registered succesfully";
            lblInfo.CssClass = "label label-success";
        }
        else
        {
            lblInfo.Text = "Database error";
            lblInfo.CssClass = "label label-danger";
        }
    }
}