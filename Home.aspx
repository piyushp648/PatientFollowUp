<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="css/jquery.min.js"></script>
    <script src="css/bootstrap.min.js"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />


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

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/doctor1.jpg" alt="Los Angeles" style="width: 100%;" />
                    <div class="carousel-caption" style="top: 10%; bottom: auto">
                        <h4>Find your doctor now!</h4>
                        <p>
                            The best doctor is the one you run to and can't find<br />
                            -Denis Diderot
                        </p>
                    </div>
                </div>

                <div class="item">
                    <img src="images/pills.jpg" alt="Chicago" style="width: 100%;" />
                    <div class="carousel-caption" style="top: 10%; bottom: auto">
                        <h4>Buy medicines from only authorised pharmacist</h4>
                        <p></p>
                    </div>
                </div>

                <div class="item">
                    <img src="images/patient.jpg" alt="New york" style="width: 100%;" />
                    <div class="carousel-caption" style="top: 10%; bottom: auto">
                        <h4>Healthcare</h4>
                        <p>Enhanced to the next level</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">

                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">

                <span class="sr-only">Next</span>
            </a>
        </div>
    </form>
</body>
</html>
