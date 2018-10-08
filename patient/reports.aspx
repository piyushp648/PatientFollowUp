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
                    <li class="active"><a href="reports.aspx">Reports</a></li>
                    <li><a href="queryDoctor.aspx">Query Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div id="add" class="container">
                <h2>Upload report :</h2>

                <div class="row form-group">
                    <div class="col-sm-6">
                        <asp:Label runat="server" Text="Enter report type"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtReportType" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row">

                    <div class="col-sm-6 center-block">
                        <asp:Label runat="server" ID="lblInfo" CssClass=""></asp:Label>
                    </div>
                    <div class="col-sm-6"></div>
                </div>
                <div class="row">
                    <br />


                    <div class="row form-group">
                        <div class="col-sm-6">
                            <asp:FileUpload runat="server" ID="FileUploadControl"/>
                        </div>
                        <div class="col-sm-6">
                            <asp:Button runat="server" ID="btnUpload" OnClick="btnUpload_Click" Text="Upload" CssClass="btn btn-default" />
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-12">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="493px">
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
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
