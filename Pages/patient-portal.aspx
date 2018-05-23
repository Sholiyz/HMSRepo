<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/hmsmaster.master" AutoEventWireup="true" CodeFile="patient-portal.aspx.cs" Inherits="Pages_patient_portal" %>

<%@ Register Src="~/Controls/ResponseAlert.ascx" TagPrefix="uc1" TagName="ResponseAlert" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationMenu" runat="Server">
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li runat="server" id="dashboard"><a href="./dashboard.aspx">Dashboard</a></li>
                            <li runat="server" id="patientsportal"><a class="menu-top-active" href="./patient-portal.aspx">Patient's Portal</a></li>
                            <li runat="server" id="nursesportal"><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                            <li runat="server" id="doctorsportal"><a href="./doctors-portal.aspx">Doctor's Portal</a></li>
                            <li runat="server" id="adminportal"><a href="./admin-portal.aspx">Admin Portal</a></li>

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
                    <h1 class="page-head-line">PATIENT MANAGEMENT PORTAL</h1>
                </div>
            </div>
            <uc1:ResponseAlert runat="server" ID="ResponseAlert" />

            <div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <%--<div class="panel-heading">
                                PATIENT MANAGEMENT
                            </div>--%>
                            <asp:HiddenField ID="selected_tab" runat="server" />
                            <div class="panel-body" id="tabs">
                                <ul class="nav nav-tabs">
                                    <li class="active" runat="server" id="patientli"><%--<a href="#patient" data-toggle="tab">PATIENT MANAGEMENT</a>--%>
                                        <asp:LinkButton runat="server" ID="PatientDivNav" Text="PATIENT MANAGEMENT" OnClick="PatientDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" runat="server" id="familyplanli"><%--<a href="#familyplan" data-toggle="tab">FAMILY PLAN MANAGEMENT</a>--%>
                                        <asp:LinkButton runat="server" ID="FamilyPlanDivNav" Text="FAMILY PLAN MANAGEMENT" OnClick="FamilyPlanDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" runat="server" id="consultationli"><%--<a href="#consultation" data-toggle="tab">CONSULTATION</a>--%>
                                        <asp:LinkButton runat="server" ID="ConsultationDivNav" Text="CONSULTATION" OnClick="ConsultationDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" runat="server" id="vitalsignli"><%--<a href="#vitalsign" data-toggle="tab">VITAL SIGN</a>--%>
                                        <asp:LinkButton runat="server" ID="VitalSignDivNav" Text="VITAL SIGN" OnClick="VitalSignDivNav_Click"></asp:LinkButton>
                                    </li>
                                </ul>

                                <div class="tab-content">

                                    <div class="tab-pane fade active in" id="patient" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />

                                                    <div class="form-group" id="AddNewPatientDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>ADD NEW PATIENT</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" ID="Addpatientplantypelistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />  --%>
                                                    <div class="form-group" id="ViewPatientListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">PATIENT LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="PatientListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="PatientID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="PatientID" HeaderText="Patient ID" SortExpression="PatientID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="View" ID="ViewUserBtn" CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Edit" ID="EditUserBtn" CssClass="btn btn-sm btn-warning" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Delete" ID="DeleteUserBtn" CssClass="btn btn-sm btn-danger" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="UserActivatioButton" CssClass='<%#(Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-success") %>' />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>

                                                    <div class="form-group" id="EditPatientDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>EDIT PATIENT PROFILE</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div> --%>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" ID="Editpatientplantypelistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>

                                                    <div class="form-group" id="ViewPatientDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>VIEW PATIENT PROFILE</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="AddPatientVitalSignDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>ADD PATIENT VITAL SIGN</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="familyplan" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <%--<div class="panel-heading">
                                                    FAMILY PLAN MANAGEMENT
                                                </div>--%>
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="ViewPatientWithFamilyPlanListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">FAMILY PLAN PATIENT LIST</h4>
                                                                </div>
                                                                <%--<div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT" /></div>
                                                                --%>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="PatientWithFamilyPlanListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="FULLNAME" HeaderText="Order Name" SortExpression="Name">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PLAN" HeaderText="Price" SortExpression="Price">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="CURRENT MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="MAXIMUM MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsDeliveredStatus(Convert.ToBoolean(Eval("IsDelivered")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Canceled Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsCancelledStatus(Convert.ToBoolean(Eval("IsCancelled")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" Text="ADD MEMBER" ID="CancelRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-success" />
                                                                                <asp:Button runat="server" Text="VIEW MEMBER" ID="EditRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-warning" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr /> --%>

                                                    <div class="form-group" id="AddNewPatientFamilyMemberDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ADD NEW FAMILY MEMBER</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">RELATED PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <%--<div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <%--<hr /> --%>
                                                    <div class="form-group" id="ViewPatientFamilyMemberListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">PATIENT FAMILY MEMBER LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW FAMILY MEMBER" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="PatientFamilyMemberListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="FULLNAME" HeaderText="Order Name" SortExpression="Name">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PLAN" HeaderText="Price" SortExpression="Price">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="CURRENT MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="MAXIMUM MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsDeliveredStatus(Convert.ToBoolean(Eval("IsDelivered")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Canceled Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsCancelledStatus(Convert.ToBoolean(Eval("IsCancelled")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" Text="View" ID="CancelRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-success" />
                                                                                <asp:Button runat="server" Text="Edit" ID="EditRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-warning" />
                                                                                <asp:Button runat="server" Text="Delete" ID="DeleteRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-danger" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>

                                                    <div class="form-group" id="EditPatientFamilyMemberDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>EDIT PATIENT PROFILE</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW FAMILY MEMBER" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">RELATED PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewPatientFamilyMemberDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>VIEW PATIENT PROFILE</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW FAMILY MEMBER" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">RELATED PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="AddPatientFamilyMemberVitalSignDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>ADD PATIENT VITAL SIGN</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" />
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="tab-pane fade" id="consultation" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">                                            
                                                <div class="panel-body">
                                                    <hr />

                                                    <div class="form-group" id="ViewConsultaionListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-4 text-left">
                                                                    <h4 class="text-left">CONSULTATION LIST</h4>
                                                                </div>
                                                                <div class="col-md-4 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW CONSULTATION" />
                                                                </div>
                                                                <div class="col-md-4 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW VITAL SIGN" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="ConsultationListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="FULLNAME" HeaderText="Order Name" SortExpression="Name">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PLAN" HeaderText="Price" SortExpression="Price">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="CURRENT MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="MAXIMUM MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsDeliveredStatus(Convert.ToBoolean(Eval("IsDelivered")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>                                                                   
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" Text="ADD MEMBER" ID="CancelRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-success" />
                                                                                <asp:Button runat="server" Text="VIEW MEMBER" ID="EditRoleBtn" Enabled='<%# (((Convert.ToBoolean(Eval("IsProcessing")) == true || Convert.ToBoolean(Eval("IsDelivered")) == true)|| Convert.ToBoolean(Eval("IsCancelled")) == true) ? false : true) %>' CssClass="btn btn-md btn-warning" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="AddNewConsultationDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ADD NEW CONSULTATION</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT PATIENT</label>
                                                                    <asp:DropDownList runat="server" ID="AddConsultationPatientlistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SYMPTUMS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationSymptums" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationDiagnosis" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationPrescription"  CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationNote"  CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddNewConsultationBackButton" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddNewConsultationProceedButton" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="EditConsultationDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>EDIT CONSULTATION</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditConsultationPatientName" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SYMPTUMS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="EditConsultationSymptums"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="EditConsultationDiagnosis"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="EditConsultationPrescription"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="EditConsultationNote"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditConsultationBackButton" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditConsultationUpdateButton" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewConsultationDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>VIEW CONSULTATION</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewConsultationPatientName" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SYMPTUMS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="ViewConsultationSymptums" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="ViewConsultationDiagnosis" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="ViewConsultationPrescription" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine"  CssClass="form-control" ID="ViewConsultationNote" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewConsultationBackButton" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                           
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                   
                                                    <hr />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="vitalsign" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">                                      
                                                <div class="panel-body">
                                                    <hr />

                                                    <div class="form-group" id="ViewVitalSignListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">VITAL SIGN LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW VITAL SIGN" ID="ViewVitalSignAddNewVitalSignButton" OnClick="ViewVitalSignAddNewVitalSignButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="VitalSignListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="PATIENT FULLNAME">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetVitalSignPatientByID(Convert.ToInt32(Eval("ID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="CreatedDate" HeaderText="Order Name" SortExpression="Name" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    
                                                                    <asp:TemplateField HeaderText="CURRENT MEMBER">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetEmployeeFullNameById(Convert.ToInt32(Eval("StaffID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   
                                                                   <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ID") %>' Text="View" ID="ViewVitalSignBtn" OnClick="ViewVitalSignBtn_Click" CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ID") %>' Text="Edit" ID="EditVitalSignBtn" OnClick="EditVitalSignBtn_Click"  CssClass="btn btn-sm btn-warning" />
                                                                               

                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group" id="AddNewVitalSignDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ADD NEW VITAL SIGN</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                     <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="AddNewVitalSignViewlistButton" OnClick="AddNewVitalSignViewlistButton_Click" Text="VITAL SIGN LIST" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT PATIENT</label>
                                                                    <asp:DropDownList runat="server" ID="AddNewVitalSignPatientDDL" CssClass="form-control" OnSelectedIndexChanged="AddNewVitalSignPatientDDL_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group" runat="server" id="AddNewVitalSignPatientFamilyMemberDiv" visible="false">
                                                                    <label class="control-label">SELECT PATIENT FAMILY MEMBER</label>
                                                                    <asp:DropDownList runat="server" ID="AddNewVitalSignPatientFamilyMemberDDL" CssClass="form-control" required></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignTemprature" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignPulse" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignRespiration" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignBloodPressure" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignWeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddNewVitalSignHeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                           
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddNewVitalSignProceedButton" OnClick="AddNewVitalSignProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="EditVitalSignDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>EDIT VITAL SIGN</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditVitalSignPatientName" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignTemprature" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignPulse" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignRespiration" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignBloodPressure" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignWeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="EditVitalSignHeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="EditVitalSignBackButton" Text="BACK" OnClick="EditVitalSignBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="EditVitalSignUpdateButton" Text="UPDATE" OnClick="EditVitalSignUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewVitalSignDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>VIEW VITAL SIGN</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewVitalSignPatientFullname" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignTemprature" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignPulse" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignRespiration" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignBloodPressure" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignWeight" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="ViewVitalSignHeight" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewVitalSignBackButton" OnClick="ViewVitalSignBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <hr />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
</asp:Content>

