<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewPatientQueries.aspx.cs" Inherits="doctor_viewPatientQueries" %>

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
                    <a class="navbar-brand" href="#">Doctor Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">Home</a></li>
                    <li><a href="ViewPatient.aspx">View Patient</a></li>
                    <li class="active"><a href="ViewPatientQueries.aspx">View Patient Queries</a></li>
                    <li><a href="ViewChemistQueries.aspx">View Chemist Query</a></li>
                    

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
