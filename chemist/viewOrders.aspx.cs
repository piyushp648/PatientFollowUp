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
        FillOrders();
    }

    void FillOrders()
    {
        chemistEmail = Session["UserID"].ToString();

        var dataSource = (from d in obj.Order_medicines
                          join dp in obj.Chemists on d.chemist_id equals dp.chemist_id
                          join ds in obj.Patients on d.patient_id equals ds.patient_id
                          where dp.email.Equals(chemistEmail)
                          select new { d.order_id, ds.name_, d.order_details, d.Delivery_address_, d.patient_id, d.prescription }
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
        var dataSource = (from d in obj.Order_medicines
                          join dp in obj.Patients on d.patient_id equals dp.patient_id
                          where dp.email.Equals(emailID)
                          select new { d.patient_id, d.chemist_id, d.order_id, d.prescription, d.order_details, d.payment_id, d.Delivery_address_, d.Order_status }).ToList().First();

        if (obj.SP_ORDER_MEDICINE(2, dataSource.patient_id, dataSource.chemist_id, dataSource.order_id, dataSource.prescription, dataSource.order_details, dataSource.payment_id, dataSource.Delivery_address_ , "Confirmed") == 0)
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