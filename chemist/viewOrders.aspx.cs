using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chemist_viewOrders : System.Web.UI.Page
{
    static string chemistEmail;
    static int orderId;
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
    static string report_location;
    protected void grdViewOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        orderId = Convert.ToInt32(grdViewOrders.Rows[grdViewOrders.SelectedRow.RowIndex].Cells[1].Text);
        report_location = grdViewOrders.DataKeys[grdViewOrders.SelectedRow.RowIndex].Values["prescription"].ToString();

    }

    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        if (orderId == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select an order!');", true);
            return;
        }
        string emailID = Session["UserID"].ToString();
        if (obj.SP_ORDER_MEDICINE(2, 0, 0, orderId, "null", "null", 0, "null", "Confirmed") == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Order confirmed');", true);
            FillOrders();
            orderId = 0;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Database error!');", true);
        }
    }

    protected void btnDenyOrder_Click(object sender, EventArgs e)
    {
        if (orderId == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select an order!');", true);
            return;
        }
        string emailID = Session["UserID"].ToString();
        if (obj.SP_ORDER_MEDICINE(2, 0, 0, orderId, "null", "null", 0, "null", "Denied") == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Order denied');", true);
            FillOrders();
            orderId = 0;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Database error!');", true);
        }
    }

    protected void btnViewPrescription_Click(object sender, EventArgs e)
    {
        if(report_location.Length == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Please select a patient!');", true);
            return;
        }
        
        string control_string = "window.open('" + report_location + "','_newtab');";
        Page.ClientScript.RegisterStartupScript(
        this.GetType(), "OpenWindow", control_string, true);
    }
}