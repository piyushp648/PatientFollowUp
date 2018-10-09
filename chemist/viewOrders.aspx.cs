using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chemist_viewOrders : System.Web.UI.Page
{
    static string chemistEmail;
    DataClassesDataContext obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillOrders();
        }
    }

    void FillOrders()
    {
        chemistEmail = Session["UserID"].ToString();

        var dataSource = (from d in obj.Order_medicines
                          join dp in obj.Chemists on d.chemist_id equals dp.chemist_id
                          join ds in obj.Patients on d.patient_id equals ds.patient_id
                          where dp.email.Equals(chemistEmail)
                          select new { d.order_id, ds.name_, d.order_details, d.Delivery_address_, d.patient_id, d.prescription,d.Order_status}
                          ).ToList();
        if (dataSource.Count > 0)
        {

            grdViewOrders.DataSource = dataSource;
            grdViewOrders.DataBind();

            //  lblInfo.Text = "No data found!";
        }
        else
        {
            grdViewOrders.DataSource = null;
            grdViewOrders.DataBind();
        }


    }

    protected void grdViewOrders_SelectedIndexChanged(object sender, EventArgs e)
    {

        string emailID = Session["UserID"].ToString();
        //lblInfo.Text = emailID;

        int ordrId = Convert.ToInt32(grdViewOrders.Rows[grdViewOrders.SelectedRow.RowIndex].Cells[1].Text);
        if (obj.SP_ORDER_MEDICINE(2, 0, 0, ordrId ,"null","null",0,"null", "Confirmed") == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Order confirmed');", true);
            FillOrders();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Database error!');", true);
        }


    }
}