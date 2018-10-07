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
                    <li><a href="report.aspx">Reports</a></li>
                    <li><a href="queryDoctor.aspx">Query Doctor</a></li>

                </ul>
            </div>
        </nav>
        <div class="container">
            <div id="add" class="container">

                <div class="row">
                    <br />
                    <div class="col-sm-8">

                        <div class="row form-group">
                            <div class="col-sm-6">
                                <label for="txtName" class="required">Order Details:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox runat="server" ID="txtOrderDetails" CssClass="form-control" required=""></asp:TextBox>
                            </div>
                        </div>
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

            </div>
        </div>

        <div class="row form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
                <asp:Button runat="server" ID="btnUploadPrescription" Text="Upload Prescription" CssClass="btn btn-success" UseSubmitBehavior="false" />

            </div>
        </div>
        <div class="row form-group">
            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
                <asp:Button runat="server" ID="btnOrderMedicine" Text="Order" CssClass="btn btn-success" UseSubmitBehavior="false" />

            </div>
        </div>
    </form>
</body>
</html>
