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
        <div>
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
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" UseSubmitBehavior="false" />

                        </div>
                    </div>
                    //Grid view of doctor remaining with book appointment option
                </div>
            </div>
    </form>
</body>
</html>
