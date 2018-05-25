<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/hmsmaster.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Pages_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationMenu" runat="Server">
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li runat="server" id="dashboard"      > <a class="menu-top-active" href="./dashboard.aspx">Dashboard</a></li>
                            <li runat="server" id="patientsportal" ><a href="./patient-portal.aspx">Patient's Portal</a></li>
                            <li runat="server" id="nursesportal"   ><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                            <li runat="server" id="doctorsportal"  ><a href="./doctors-portal.aspx">Doctor's Portal</a></li>
                            <li runat="server" id="adminportal"    ><a href="./admin-portal.aspx">Admin Portal</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Dashboard</h4>

                </div>

            </div>
           
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-one">
                        <i class="fa fa-venus dashboard-div-icon"></i>
                        <h3>Current Patient </h3>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                            </div>

                        </div>
                        <h3> <asp:Literal runat="server" ID="CurrentPatientNumberLiteral" Text="0"></asp:Literal></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-two">
                        <i class="fa fa-venus dashboard-div-icon"></i>
                        <h3>Total Staff Number </h3>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            </div>

                        </div>
                        <h3><asp:Literal runat="server" ID="TotalStaffLiteral" Text="0"></asp:Literal></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-three">
                        <i class="fa  fa-hospital-o dashboard-div-icon"></i>
                        <h3>Doctors</h3>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            </div>

                        </div>
                        <h3><asp:Literal runat="server" ID="DoctorNumberLiteral" Text="0"></asp:Literal></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-four">
                        <i class="fa fa-hospital-o dashboard-div-icon"></i>
                        <h3>Nurses</h3>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                            </div>

                        </div>
                       <h3><asp:Literal runat="server" ID="NurseNumberLiteral" Text="0"></asp:Literal></h3>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
</asp:Content>


