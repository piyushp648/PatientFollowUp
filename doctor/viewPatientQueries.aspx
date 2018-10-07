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
                    <li><a href="#">Home</a></li>
                    <li><a href="ViewPatient.aspx">View Patient</a></li>
                    <li class="active"><a href="ViewPatientQueries.aspx">View Patient Queries</a></li>
                    <li><a href="ViewChemistQueries.aspx">View Chemist Query</a></li>


                </ul>
            </div>
        </nav>

        <div class="container">
            <h3>Patient Queries</h3>
            <asp:GridView ID="grdPatientQuery" runat="server" DataKeyNames="" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" OnSelectedIndexChanged="grdPatientQuery_SelectedIndexChanged1">
                <Columns>
                    <asp:TemplateField HeaderText="Sr. No.">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="patient_id" HeaderText="Patient Id" />
                    <asp:BoundField DataField="patient_query_id" HeaderText="Query Id" />
                    <asp:BoundField DataField="query_question" HeaderText="Question" />
                    <asp:BoundField DataField="query_status" HeaderText="Query Status" />
                    <asp:ButtonField Text="Select" CommandName="select" ControlStyle-CssClass="btn btn-default" ButtonType="Button" />
                </Columns>
               
            </asp:GridView>
            <div class="col-sm-8">

                <div class="row form-group">
                    <div class="col-sm-6">
                        <label for="txtName" class="required">Query Response:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtQueryResponse" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" UseSubmitBehavior="false" OnClick="btnSubmit_Click1" />

                        <asp:Label ID="lblInfo" runat="server"></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
