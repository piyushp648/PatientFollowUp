<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateDoctorsProfile.aspx.cs" Inherits="operator_updateDoctorsProfile" %>

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
                    <a class="navbar-brand" href="#">Operator Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                    <li class="active"><a href="updateDoctorsProfile.aspx">Update Docotr's Profile</a></li>
                    <li><a href="viewAppointments.aspx">View Appointment</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>


                </ul>
            </div>
        </nav>

       
        <div id="add" class="container">
            <h2>Update Profile:</h2>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4 center-block">
                    <asp:Label runat="server" ID="lblInfo" CssClass=""></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:HiddenField ID="hdnDocId" runat="server" />
                </div>
            </div>
            <div class="row">
                <br />
                <div class="col-sm-8">

                    
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
                            <label for="txtRegistrationNo" class="required">Registration No:</label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtRegistrationNo" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtDegree" class="required">Degree: </label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtDegree" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtSpecialization" class="required">Specialization: </label>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtSpecialization" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-sm-6">
                            <label for="txtAddress" class="required">Home Address</label>
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
    </form>
</body>
</html>
