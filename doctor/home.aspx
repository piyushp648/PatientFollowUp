<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="doctor_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../css/jquery.min.js"></script>
    <script src="../css/bootstrap.min.js"></script>
</head>
<body>
     <form id="form2" runat="server">
  
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Doctor Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                   <li><a href="ViewPatient.aspx">View Patient</a></li>
                    <li><a href="ViewPatientQueries.aspx">View Patient Queries</a></li>
                    <li ><a href="ViewChemistQueries.aspx">View Chemist Queries</a></li>
                    

                </ul>
            </div>
        </nav>
    <asp:Label ID="lblSession" runat="server" Text=""></asp:Label>
        </form>
</body>
</html>
