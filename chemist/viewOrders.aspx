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
                    <li><a href="#">Home</a></li>
                    <li class="active"><a href="viewOrders.aspx">View Order</a></li>
                    <li><a href="consultDoctor.aspx">Consult Doctor</a></li>



                </ul>
            </div>
        </nav>

        <div class="container">
            <h3>Inverted Navbar</h3>
            <p>An inverted navbar is black instead of gray.</p>
        </div>
    </form>
</body>
</html>
