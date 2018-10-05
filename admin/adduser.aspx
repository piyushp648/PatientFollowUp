<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adduser.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/jquery.min.js"></script>
    <script src="../css/bootstrap.min.js"></script>
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Admin portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                    <li class="active"><a href="adduser.aspx">Add Users</a></li>
                    <li><a href="updateuser.aspx">Update users</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h3>Select user to add:</h3>
            <div class="btn-group btn-group-justified">
                <a href="addOperator.aspx" class="btn btn-primary">Operator</a>
                <a href="addDoctor.aspx" class="btn btn-success">Doctor</a>
            </div>
        </div>
    </form>
</body>
</html>
