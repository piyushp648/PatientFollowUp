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
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Chemist Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                    <li><a href="viewOrders.aspx">View Order</a></li>
                    <li class="active"><a href="consultDoctor.aspx">Consult Doctor</a></li>
                    <li><a href="../logout.aspx">Logout</a></li>


                </ul>
            </div>
        </nav>

        <div class="container">
            

                <div class="row form-group">
                    <div class="col-sm-6">
                        <label for="txtName" class="required">Search Doctor:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-success" UseSubmitBehavior="false" />


                    </div>
                
            </div>
            <div class="row">
                
                <div class="col-sm-12">
                    <asp:GridView ID="grdConsultDoctor" runat="server" DataKeyNames="doctor_id" AutoGenerateColumns="false" OnSelectedIndexChanged="grdConsultDoctor_SelectedIndexChanged" CssClass="table table-bordered table-hover">
                        <Columns>
                            <asp:BoundField DataField="name_" HeaderText="Name" />
                            <asp:BoundField DataField="degree" HeaderText="Degree" />
                            <asp:BoundField DataField="specialization" HeaderText="Specilization" />

                            <asp:BoundField DataField="phone_no" HeaderText="Contact Number" />
                            <asp:BoundField DataField="email" HeaderText="Email Id" />
                            <asp:ButtonField CommandName="Select" ButtonType="Button" Text="Select" ControlStyle-CssClass="btn btn-block btn-default" />
                        </Columns>
                    </asp:GridView>
                </div>
                
            </div>



            <div class="row form-group">
                <div class="col-sm-6">
                    <label for="txtName" class="required">Send Query:</label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" ID="txtQuery" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                </div>
                
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="BtnSubmitQuery" Text="Submit Query" CssClass="btn btn-success" UseSubmitBehavior="false" OnClick="BtnSubmitQuery_Click" />

                    </div>
                </div>
            
            <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
        
    </form>
</body>
</html>
