<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewChemistQueries.aspx.cs" Inherits="doctor_viewChemistQueries" %>

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
                    <a class="navbar-brand" href="#">Doctor Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">Home</a></li>
                   <li><a href="ViewPatient.aspx">View Patient</a></li>
                    <li><a href="ViewPatientQueries.aspx">View Patient Queries</a></li>
                    <li class="active"><a href="ViewChemistQueries.aspx">View Chemist Queries</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>
                    

                </ul>
            </div>
        </nav>

       <div class="container">
            <h3>Patient Queries</h3>
            <asp:GridView ID="grdChemistQueries" runat="server" AutoGenerateColumns="False" Width="1028px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" ForeColor="Black" GridLines="Horizontal" Height="195px" OnSelectedIndexChanged="grdChemistQueries_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="chemist_id" HeaderText="Chemist Id" />
                    <asp:BoundField DataField="chemist_query_id" HeaderText="Query Id" />
                    <asp:BoundField DataField="query_question" HeaderText="Question" />
                    <asp:BoundField DataField="query_status" HeaderText="Query Status" />
                    <asp:BoundField DataField="prescription" HeaderText="Prescription" />


                    <asp:ButtonField Text=" Respond Query" ButtonType="Button" />
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
                        <label for="txtName" class="required">Query Response:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtQueryResponse" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" UseSubmitBehavior="false" OnClick="btnSubmit_Click" />

                        <asp:Label ID="lblInfo" runat="server"></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
