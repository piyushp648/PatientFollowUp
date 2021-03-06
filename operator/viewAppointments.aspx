﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewAppointments.aspx.cs" Inherits="operator_viewAppointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/jquery.min.js"></script>
    <script src="../css/bootstrap.min.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Operator Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="updateDoctorsProfile.aspx">Update Docotr's Profile</a></li>
                    <li class="active"><a href="viewAppointments.aspx">View Appointment</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>


                </ul>
            </div>
        </nav>

                <div class="container">
            <h3>Appointment</h3>
                    <asp:Label runat="server" ID="lblInfo" CssClass=""></asp:Label>
            <asp:GridView ID="grdViewAppointment" runat="server" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Height="195px" OnSelectedIndexChanged="grdViewAppointment_SelectedIndexChanged">
                <Columns>
                     <asp:BoundField DataField="appointment_id" HeaderText="Appointment Id" />
                    <asp:BoundField DataField="patient_id" HeaderText="Patient Id" />
                    <asp:BoundField DataField="doctor_id" HeaderText="Doctor Id" />
                    <asp:BoundField DataField="appointment_date" HeaderText="Date" />
                    <asp:BoundField DataField="appointment_time" HeaderText="Time" />
                    <asp:BoundField DataField="appointment_status" HeaderText="Appointment Status" />
                   
                    <asp:ButtonField Text="Confirm Appoinment" CommandName="Select" ButtonType="Button" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>

    </form>
</body>
</html>
