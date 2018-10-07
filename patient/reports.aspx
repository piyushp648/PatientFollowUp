<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="patient_reports" %>

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
                    <a class="navbar-brand" href="#">Patient Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="bookAppointment.aspx">Book Appointment</a></li>
                    <li><a href="orderMedicine.aspx">Order Medicine</a></li>
                    <li class="active"><a href="report.aspx">Reports</a></li>
                    <li><a href="queryDoctor.aspx">Query Doctor</a></li>
                </ul>
            </div>
        </nav>


        <div class="row form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
                <asp:Button runat="server" ID="BtnUploadReport" Text="Upload Report" CssClass="btn btn-success" UseSubmitBehavior="false" />

            </div>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Height="195px">
            <Columns>
                <asp:BoundField DataField="patient_id" HeaderText="Patient Id" />
                <asp:BoundField DataField="report_id" HeaderText="Report Id" />
                <asp:BoundField DataField="report_type" HeaderText="Report Type" />

                <asp:ButtonField ButtonType="Button" Text="View Report" />

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
    </form>
</body>
</html>
