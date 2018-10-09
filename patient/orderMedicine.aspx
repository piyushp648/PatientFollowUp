<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderMedicine.aspx.cs" Inherits="patient_orderMedicine" %>

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
                    <li class="active"><a href="orderMedicine.aspx">Order Medicine</a></li>
                    <li><a href="reports.aspx">Reports</a></li>
                    <li><a href="queryDoctor.aspx">Query Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>

                </ul>
            </div>
        </nav>
        <div class="container">


            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtName" class="required">Order Details:</label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" ID="txtOrderDetails" CssClass="form-control" required=""></asp:TextBox>
                </div>
            </div>


            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtName" class="required">Delivery Address:</label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" ID="txtDeliveryAddress" CssClass="form-control" required=""></asp:TextBox>
                </div>
            </div>


            <div class="row form-group">
                <div class="col-sm-6">
                    <asp:Button runat="server" ID="btnUploadPrescription" Text="Upload Prescription" CssClass="btn btn-info" UseSubmitBehavior="false" OnClick="btnUploadPrescription_Click" />
                </div>
                <div class="col-sm-6">
                    <asp:Button runat="server" ID="btnOrderMedicine" Text="Order" CssClass="btn btn-success" UseSubmitBehavior="false" OnClick="btnOrderMedicine_Click" />

                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="grdPrescription" runat="server" DataKeyNames="report_image" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="grdPrescription_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="patient_id" HeaderText="Patient Id" />
                            <asp:BoundField DataField="report_id" HeaderText="Report Id" />
                            <asp:BoundField DataField="report_type" HeaderText="Report type" />
                            <asp:ButtonField ButtonType="Button" Text="Select" CommandName="Select" ControlStyle-CssClass="btn btn-default" />
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
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="grdShowChemist" runat="server" DataKeyNames="chemist_id" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="grdShowChemist_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="name_" HeaderText="Name" />
                            <asp:BoundField DataField="address_" HeaderText="Address" />
                            <asp:BoundField DataField="phone_no" HeaderText="Phone" />
                            <asp:BoundField DataField="type_" HeaderText="Chemist Type" />
                            <asp:ButtonField ButtonType="Button" Text="Select" CommandName="Select" ControlStyle-CssClass="btn btn-default" />
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
        </div>
        </div>
    </form>
</body>
</html>
