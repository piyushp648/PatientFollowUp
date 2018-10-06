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
    </form>
</body>
</html>
