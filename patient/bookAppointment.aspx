﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookAppointment.aspx.cs" Inherits="patient_bookAppointment" %>

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
                    <li class="active"><a href="bookAppointments.aspx">Book Appointment</a></li>
                    <li><a href="orderMedicine.aspx">Order Medicine</a></li>
                    <li><a href="reports.aspx">Reports</a></li>
                    <li><a href="queryDoctor.aspx">Query Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>


                </ul>
            </div>
        </nav>
        <div class="container">
            <div id="add" class="container">
                <h2>Book appointment :</h2>
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4 center-block">
                        <asp:Label runat="server" ID="lblInfo" CssClass=""></asp:Label>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
                <div class="row">
                    <br />
                    <div class="col-sm-8">

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtName" class="required">Search Doctor:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                            </div>
                            <div class="col-sm-6">
                                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-success" UseSubmitBehavior="false" />

                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtName" class="required">Insert date for appointment:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" ID="txtAppointmentDate" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtName" class="required">Insert time for appointment:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" ID="txtAppointmentTime" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-12">
                                <asp:GridView ID="grdDoctors" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataKeyNames="doctor_id,operator_id" OnSelectedIndexChanged="grdDoctors_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="name_" HeaderText="Name" />
                                        <asp:BoundField DataField="degree" HeaderText="Degree" />
                                        <asp:BoundField DataField="specialization" HeaderText="Specilization" />
                                        <asp:BoundField DataField="phone_no" HeaderText="Contact Number" />
                                        <asp:BoundField DataField="email" HeaderText="Email Id" />
                                        <asp:ButtonField Text="Select" CommandName="select" ControlStyle-CssClass="btn btn-default btn-block" >
<ControlStyle CssClass="btn btn-default btn-block"></ControlStyle>
                                        </asp:ButtonField>
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
        </div>

    </form>
</body>
</html>
