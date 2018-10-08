<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminLogin.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="css/bootstrap.min.js"></script>
    <script src="css/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Patient FollowUp</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="Home.aspx">Home</a></li>
      <li><a href="patientLogin.aspx">Patient</a></li>
      <li><a href="doctorLogin.aspx">Doctor</a></li>
      <li><a href="chemistLogin.aspx">Chemist</a></li>
      <li><a href="operatorLogin.aspx">Operator</a></li>
      <li class="active"><a href="adminLogin.aspx">Admin</a></li>

    </ul>
  </div>
</nav>
  
<div class="container-fluid bg">
        <div class="row">
            <div class="col-sm-4 col-md-4 col-xs-12"></div>
            <div class="col-sm-4 col-md-4 col-xs-12">
                 <form id="formLoginAdmin" runat="server" class="form-horizontal form-box">
                    <h1 class="fontstyle">Welcome!</h1>
                    <h2 class="fontstyle">Please login to continue</h2>
                    <div class="form-group">
                        <label for="txtUsername" class="col-sm-4 col-md-4 col-xs-12 control-label">Username: </label>
                        <div class="col-sm-8 col-md-8 col-xs-12">
                            <!-- <i class="glyphicon glyphicon-log-in glyphicon-adjust"></i>-->
                            <i class="fa fa-2x fa-sign-in glyphicon-adjust"></i>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword" class="col-sm-4 col-md-4 col-xs-12 control-label">Password: </label>
                        <div class="col-sm-8 col-md-8  col-xs-12">
                            <!--<i class="glyphicon-user glyphicon  glyphicon-adjust"></i>-->
                            <i class="fa fa-2x fa-key glyphicon-adjust"></i>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control box-enlarge" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8 col-md-8 col-xs-12">
                            <!--<asp:Button runat="server" CssClass="btn btn-success btn-block btn-enlarge" Text="Login"/>-->
                            <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-success btn-block  btn-enlarge" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                    </div>

                     <div class="form-group">
                        
                        <div class="col-sm-8 col-md-8  col-xs-12">
                           
                            
                           <asp:Label ID="lblInfo" runat="server"></asp:Label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 col-xs-12"></div>
        </div>
    </div>
</body>
</html>
