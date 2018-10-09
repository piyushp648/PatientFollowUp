<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewPatient.aspx.cs" Inherits="doctor_viewPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/bootstrap.min.js"></script>
    <script src="../css/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <a class="navbar-brand" href="#">Doctor Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">Home</a></li>
                    <li class="active"><a href="ViewPatient.aspx">View Patient</a></li>
                    <li><a href="ViewPatientQueries.aspx">View Patient Queries</a></li>
                    <li><a href="ViewChemistQueries.aspx">View Chemist Query</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>
                    

                </ul>
            </div>
        </nav>
     <div class="container">
            <h3>Appointment Scheduled</h3>
            <asp:GridView ID="grdViewPatient" runat="server" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Height="195px" OnSelectedIndexChanged="grdViewPatient_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="patient_id" HeaderText="Patient Id" />
                    <asp:BoundField DataField="name_" HeaderText="Name" />
                    <asp:BoundField DataField="phone_no" HeaderText="Contact Number" />
                    <asp:BoundField DataField="date_of_birth" HeaderText="Date Of Birth" />
                    <asp:BoundField DataField="medical_history" HeaderText="Medical History" />
                    <asp:BoundField DataField="appointment_date" HeaderText="Appointmant Date" />
                    <asp:BoundField DataField="appointment_time" HeaderText="Appointment time" />
                    <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-default" />
                   
                    
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
         <asp:Label ID="lblInfo" runat="server"></asp:Label>
         <asp:GridView ID="grdViewReport" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grdViewReport_SelectedIndexChanged">
             <Columns>
                 <asp:BoundField DataField="patient_id" HeaderText="Patient Id"/>
                 <asp:BoundField DataField="report_id" HeaderText="Report Id"/>
                 <asp:BoundField DataField="report_type" HeaderText="Report type"/>
                 <asp:ButtonField ButtonType="Button" CommandName="Select" Text="View report" ControlStyle-CssClass="btn btn-default" />
             </Columns>
         </asp:GridView>
    </form>
</body>
</html>
