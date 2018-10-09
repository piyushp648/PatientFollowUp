﻿using System;
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


    }
}