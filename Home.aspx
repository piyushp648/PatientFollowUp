<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="css/jquery.min.js"></script>
    <script src="css/bootstrap.min.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Patient FollowUp</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="patientLogin.aspx">Patient</a></li>
      <li><a href="doctorLogin.aspx">Doctor</a></li>
      <li><a href="chemistLogin.aspx">Chemist</a></li>
      <li><a href="operatorLogin.aspx">Operator</a></li>
      <li><a href="adminLogin.aspx">Admin</a></li>

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
