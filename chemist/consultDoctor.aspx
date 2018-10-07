<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consultDoctor.aspx.cs" Inherits="chemist_consultDoctor" %>

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
                    <li><a href="#">Home</a></li>
                    <li><a href="viewOrders.aspx">View Order</a></li>
                    <li class="active"><a href="consultDoctor.aspx">Consult Doctor</a></li>


                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="col-sm-8">

                <div class="row form-group">
                    <div class="col-sm-6">
                        <label for="txtName" class="required">Search Doctor:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-success" UseSubmitBehavior="false" />


                    </div>
                </div>
            </div>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Height="195px">
            <Columns>
                <asp:BoundField DataField="name_" HeaderText="Name" />
                <asp:BoundField DataField="degree" HeaderText="Degree" />
                <asp:BoundField DataField="specialization" HeaderText="Specilization" />
                <asp:BoundField DataField="work_address_ " HeaderText="Work Address" />
                <asp:BoundField DataField="phone_no" HeaderText="Contact Number" />
                <asp:BoundField DataField="email" HeaderText="Email Id" />
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
        <div class="col-sm-8">
            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtName" class="required">Insert Query:</label>
                </div>
                <div class="col-sm-6">
                </div>
                <asp:TextBox runat="server" ID="txtQuery" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="BtnSubmitQuery" Text="Submit Query" CssClass="btn btn-success" UseSubmitBehavior="false" />

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
