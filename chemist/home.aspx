<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="chemist_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/jquery.min.js"></script>
    <script src="../css/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Chemist Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li ><a href="viewOrders.aspx">View Order</a></li>
                    <li><a href="consultDoctor.aspx">Consult Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>



                </ul>
            </div>
        </nav>
         
        <div class="container">
            <h3>Welcome!</h3>
            <p>Please navigate through sections.</p>
            <asp:Label ID="lblSession" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
