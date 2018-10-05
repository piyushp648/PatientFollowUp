<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="chemist_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chemist Registration</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/bootstrap.min.js"></script>
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Chemist Registration</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <div id="add" class="container">
            <h2>Chemist Registration :</h2>
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
                            <label for="txtName" class="required">Name:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" required></asp:TextBox>
                        </div>
                    </div>

                    

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtDOB" class="required">Date Of Birth:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" required></asp:TextBox>
                        </div>
                    </div>

                    

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtEmailID" class="required">Email ID:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtEmailID" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtMobile" class="required">Mobile Number:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtLicenseNo" class="required">License No:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtLicenseNo" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                   

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="ddlChemistType" class="required">Type(Wholeseller/retailer)</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:DropDownList runat="server" ID="ddlChemistType" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtAddress" class="required">Address</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtHomeAddress" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                    

                    <div class="row form-group">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success"  UseSubmitBehavior="false" OnClick="btnSubmit_Click" />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
