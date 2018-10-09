<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewOrders.aspx.cs" Inherits="chemist_viewOrders" %>

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
                    <a class="navbar-brand" href="#">Chemist Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                    <li class="active"><a href="viewOrders.aspx">View Order</a></li>
                    <li><a href="consultDoctor.aspx">Consult Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>

                </ul>
            </div>
        </nav>

        <div class="container">
            <h3>Orders</h3>
            <div class="row form-group">
                <div class="col-sm-12">
                    <asp:GridView ID="grdViewOrders" runat="server" DataKeyNames="prescription" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-bordered table-hover" ForeColor="Black" GridLines="Horizontal" Height="195px" OnSelectedIndexChanged="grdViewOrders_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="name_" HeaderText="Patient Name" />

                            <asp:BoundField DataField="order_id" HeaderText="Order Id" />
                            <asp:BoundField DataField="order_details" HeaderText="Order Details" />
                            <asp:BoundField DataField="Delivery_address_" HeaderText="Address" />
                            <asp:BoundField DataField="Order_status" HeaderText="Order Status" />
                            
                            <asp:ButtonField Text="Select" ButtonType="Button" CommandName="Select" ControlStyle-CssClass="btn btn-default" />

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
            <div class ="row form-group">
                <div class="col-sm-4">
                    <asp:Button ID="btnConfirmOrder" runat="server" CssClass="btn btn-success" Text="Confirm Order" OnClick="btnConfirmOrder_Click"/>
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnDenyOrder" runat="server" CssClass="btn btn-danger" Text="Deny order" OnClick="btnDenyOrder_Click" />

                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btnViewPrescription" runat="server" CssClass="btn btn-info" Text="View prescription" OnClick="btnViewPrescription_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
