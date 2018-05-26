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
                                                                    <asp:FileUpload runat="server" CssClass="form-control" ID="AddNewPatientPictureUpload" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="AddNewPatientImageviewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFirtnameTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientLastNameTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientOtherNamesTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" ID="Addpatientplantypelistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="AddNewPatientGenderDDl">
                                                                        <asp:ListItem Text="Select Gender..." Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="FEMALE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MALE" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientOccupationTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="AddNewPatientMaritalStatusddl">
                                                                        <asp:ListItem Text="Select Marital Status..." Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="SINGLE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MARRIED" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="AddNewPatientPhoneNumberTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientAddressTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="AddNewPatientDOBTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientNOKFullNameTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="AddNewPatientNOKPhoneNumberTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddNewPatientBackButton" OnClick="AddNewPatientBackButton_Click" UseSubmitBehavior="false"  />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddNewPatientProceedButton" OnClick="AddNewPatientProceedButton_Click" />
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
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT" ID="ViewPatientListAddNewPatietButton" OnClick="ViewPatientListAddNewPatietButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="PatientListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="PatientID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="PatientListGridView_PageIndexChanging">
                                                                <PagerStyle CssClass="pagination-ys text-center" />
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
                                                                    <asp:BoundField DataField="MaritalStatus" HeaderText="Marital Status" SortExpression="MaritalStatus">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Patient Plan">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetPatientPlanNameByID(Convert.ToInt32(Eval("PlanTypeID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="View" ID="ViewPatientListBtn" CssClass="btn btn-sm btn-primary" OnClick="ViewPatientListBtn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Edit" ID="EditPatientListBtn" CssClass="btn btn-sm btn-warning" OnClick="EditPatientListBtn_Click" />
                                                                                <%--<asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Delete" ID="DeletePatientBtn" CssClass="btn btn-sm btn-danger" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="PatientActivatioButton" CssClass='<%#(Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-success") %>' OnClick="PatientActivatioButton_Click" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings PageButtonCount="5" />
                                                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
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
                                                                    <asp:FileUpload runat="server" CssClass="form-control" ID="EditPatientPassportFileupload" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="EditPatientImageViewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFirstNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientLastNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientOtherNamesTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:DropDownList runat="server" ID="Editpatientplantypelistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="EditPatientGenderddl">
                                                                        <asp:ListItem Text="Select Gender..." Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="FEMALE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MALE" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientOccupationTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="EditPatientMaritalStatusddl">
                                                                        <asp:ListItem Text="Select Marital Status..." Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="SINGLE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MARRIED" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="EditPatientPhoneNumberTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientAddressTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="EditPatientDOBTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientNOKFullNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="EditPatientNOKPhoneNumberTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditPatientBackButton" OnClick="EditPatientBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditPatientUpdateButton" OnClick="EditPatientUpdateButton_Click" />
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="ViewPatientmageViewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFirstNameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientLastNameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientOtherNamesTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientPlanTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientGenderTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OCCUPATION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientOccupationTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientMaritalStatusTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="ViewPatientPhoneNumberTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientAddressTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="ViewPatientDOBTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientNOKFullNAmeTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="ViewPatientNOKPhoneNumberTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewPatientBackButton" OnClick="ViewPatientBackButton_Click" />
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
                                                                <asp:HiddenField runat="server" ID="PatientIDforVitalSign" />
                                                                <div class="form-group">
                                                                    <label class="control-label">Temprature</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignTemprature" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignPulse" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignRespiration" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignBloodPressure" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignWeight" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" ID="AddPatientVitalSignHeight" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="PROCEED" ID="AddPatientVitalSignProceedButton" OnClick="AddPatientVitalSignProceedButton_Click" />
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
                                                            <asp:GridView ID="PatientWithFamilyPlanListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="PatientID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="PatientWithFamilyPlanListGridView_PageIndexChanging">
                                                                 <PagerStyle CssClass="pagination-ys text-center" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientFMID">
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
                                                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="Phone Number">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Patient Plan" ItemStyle-CssClass="text-left">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetPatientPlanNameByID(Convert.ToInt32(Eval("PlanTypeID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="View" ID="ViewPatientWithFamilyPlanListBtn" OnClick="ViewPatientWithFamilyPlanListBtn_Click" CssClass="btn btn-sm btn-primary" />
                                                                                <%-- <asp:Button runat="server" CommandArgument='<%# Eval("FamilyMemberID") %>' Text="Edit" ID="EditViewPatientWithFamilyPlanListBtn" CssClass="btn btn-sm btn-warning"/>--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Enabled='<%# Pasture.MaxFamilyMemberReached(Convert.ToInt32( Eval("PatientID"))) == true ? false : true %>' ToolTip='<%# Pasture.MaxFamilyMemberReached(Convert.ToInt32( Eval("PatientID"))) == true ? "Maximum Plan Member Reached, You will not be able to add member again" : "" %>' Text="ADD NEW MEMBER" ID="AddViewPatientWithFamilyPlanListBtn" CssClass="btn btn-sm btn-primary" OnClick="AddViewPatientWithFamilyPlanListBtn_Click" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings PageButtonCount="5" />
                                                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
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
                                                                <div class="form-group">
                                                                    <label class="control-label">RELATED PATIENT FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberRelatedPatientFullNameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberPassportFileUpload" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="AddNewPatientFamilyMemberImageViewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberFirstNametxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberLastNameTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberOTHERNAMESTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberGenderddl">
                                                                        <asp:ListItem Text="Select Gender..." Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="FEMALE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MALE" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="AddNewPatientFamilyMemberPhoneNumberTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddNewPatientFamilyMemberAddressTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="AddNewPatientFamilyMemberDOBTxtBox" required></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddNewPatientFamilyMemberTxtBoxBackButton" OnClick="AddNewPatientFamilyMemberTxtBoxBackButton_Click" UseSubmitBehavior="false"  />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddNewPatientFamilyMemberTxtBoxProceedButton" OnClick="AddNewPatientFamilyMemberTxtBoxProceedButton_Click" />
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
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW FAMILY MEMBER" ID="ViewPatientFamilyMemberAddFamilyMemberButton" OnClick="ViewPatientFamilyMemberAddFamilyMemberButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="PatientFamilyMemberListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="FamilyMemberID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="PatientFamilyMemberListGridView_PageIndexChanging">
                                                                <PagerStyle CssClass="pagination-ys text-center" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="FamilyMemberID" HeaderText="FamilyMemberID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("FamilyMemberID") %>' Text="View" ID="PatientFamilyMemberListViewBtn" CssClass="btn btn-sm btn-success" OnClick="PatientFamilyMemberListViewBtn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("FamilyMemberID") %>' Text="Edit" ID="PatientFamilyMemberListEdittn" CssClass="btn btn-sm btn-warning" OnClick="PatientFamilyMemberListEdittn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("FamilyMemberID") %>' Text="Delete" ID="PatientFamilyMemberListDeleteBtn" CssClass="btn btn-sm btn-danger" OnClick="PatientFamilyMemberListDeleteBtn_Click" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                 <PagerSettings PageButtonCount="5" />
                                                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
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
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFamilyMemberRelatedPatientfullnameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSPORT</label>
                                                                    <asp:FileUpload runat="server" CssClass="form-control" ID="EditPatientFamilyMemberPassportFileupload" />
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="EditPatientFamilyMemberImageViewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFamilyMemberFirstNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFamilyMemberLastNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFamilyMemberOtherNameTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="EditPatientFamilyMemberGenderTxtBox">
                                                                        <asp:ListItem Text="Select Gender..." Value="-1" Selected="True"></asp:ListItem>
                                                                        <asp:ListItem Text="FEMALE" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="MALE" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="EditPatientFamilyMemberPhoneNumberTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientFamilyMemberAddressTxtBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="EditPatientFamilyMemberDOBTxtBox"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditPatientFamilyMemberBackButton" OnClick="EditPatientFamilyMemberBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditPatientFamilyMemberUpdateButton" OnClick="EditPatientFamilyMemberUpdateButton_Click" />
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
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberRelatedPatientFullnameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="ViewPatientFamilyMemberImageViewer" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberFirstNameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberLastNameTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberOthernamesTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberGenderTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="ViewPatientFamilyMemberPhoneNumberTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientFamilyMemberAddressTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="ViewPatientFamilyMemberDOBTxtBox" ReadOnly="true"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewPatientFamilyMemberBackButton" OnClick="ViewPatientFamilyMemberBackButton_Click" />
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
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignTempratureTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignPulseTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignRespirationTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignBloodPressureTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignWeightTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientFamilyMemberVitalSignHeightTxtBox" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="PROCEED" ID="AddPatientFamilyMemberVitalSignProceedButton" OnClick="AddPatientFamilyMemberVitalSignProceedButton_Click" />
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
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">CONSULTATION LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW CONSULTATION" ID="ViewConsultaionListAddNewConsultation" OnClick="ViewConsultaionListAddNewConsultation_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="ConsultationListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="ConsultationID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="ConsultationListGridView_PageIndexChanging">
                                                                <PagerStyle CssClass="pagination-ys text-center" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="ConsultationID" HeaderText="ConsultationID" SortExpression="ConsultationID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Patient Name" ItemStyle-CssClass="text-left">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetConsulteeFullNameByID(Convert.ToInt32(Eval("ConsultationID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="Diagnosis" HeaderText="Diagnosis" SortExpression="Diagnosis">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ConsultationID") %>' Text="View" ID="ViewConsultationBtn" OnClick="ViewConsultationBtn_Click" CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ConsultationID") %>' Text="Edit" ID="EditConsultationBtn" OnClick="EditConsultationBtn_Click" CssClass="btn btn-sm btn-warning" />

                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings PageButtonCount="5" />
<PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
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
                                                                    <asp:DropDownList runat="server" ID="AddConsultationPatientlistddl" CssClass="form-control" OnSelectedIndexChanged="AddConsultationPatientlistddl_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group" runat="server" id="AddNewConsultationPatientFamilyMemberDiv" visible="false">
                                                                    <label class="control-label">SELECT PATIENT FAMILY MEMBER</label>
                                                                    <asp:DropDownList runat="server" ID="AddNewConsultationPatientFamilyMemberDDL" CssClass="form-control" ></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SYMPTUMS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationSymptums" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationDiagnosis" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationPrescription" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="AddNewConsultationNote" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddNewConsultationBackButton" OnClick="AddNewConsultationBackButton_Click" UseSubmitBehavior="false" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddNewConsultationProceedButton" OnClick="AddNewConsultationProceedButton_Click" />
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
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="EditConsultationSymptums"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="EditConsultationDiagnosis"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="EditConsultationPrescription"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="EditConsultationNote"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditConsultationBackButton" OnClick="EditConsultationBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditConsultationUpdateButton" OnClick="EditConsultationUpdateButton_Click" />
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
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="ViewConsultationSymptums" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DIAGNOSIS</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="ViewConsultationDiagnosis" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PRESCRIPTION</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="ViewConsultationPrescription" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NOTE</label>
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="ViewConsultationNote" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewConsultationBackButton" OnClick="ViewConsultationBackButton_Click" />
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
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW VITAL SIGN" ID="ViewVitalSignAddNewVitalSignButton" OnClick="ViewVitalSignAddNewVitalSignButton_Click" UseSubmitBehavior="false" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="VitalSignListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center text-center" DataKeyNames="ID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="VitalSignListGridView_PageIndexChanging">
                                                                <PagerStyle CssClass="pagination-ys text-center" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="PATIENT FULLNAME" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetVitalSignPatientByID(Convert.ToInt32(Eval("ID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Staff Name" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetEmployeeFullNameById(Convert.ToInt32(Eval("PatientID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ID") %>' Text="View" ID="ViewVitalSignBtn" OnClick="ViewVitalSignBtn_Click" CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("ID") %>' Text="Edit" ID="EditVitalSignBtn" OnClick="EditVitalSignBtn_Click" CssClass="btn btn-sm btn-warning" />

                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings PageButtonCount="5" />
<PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
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
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="AddNewVitalSignViewlistButton" OnClick="AddNewVitalSignViewlistButton_Click" Text="VITAL SIGN LIST" UseSubmitBehavior="false" />
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
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignTemprature" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignPulse" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignRespiration" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignBloodPressure" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignWeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" ID="AddNewVitalSignHeight" CssClass="form-control" required></asp:TextBox>
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
                                                                    <asp:TextBox runat="server" ID="EditVitalSignTemprature" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Pulse</label>
                                                                    <asp:TextBox runat="server" ID="EditVitalSignPulse" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Respiration</label>
                                                                    <asp:TextBox runat="server" ID="EditVitalSignRespiration" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">BloodPressure</label>
                                                                    <asp:TextBox runat="server" ID="EditVitalSignBloodPressure" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Weight</label>
                                                                    <asp:TextBox runat="server" ID="EditVitalSignWeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">Height</label>
                                                                    <asp:TextBox runat="server" ID="EditVitalSignHeight" CssClass="form-control" required></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="EditVitalSignBackButton" Text="BACK" OnClick="EditVitalSignBackButton_Click" UseSubmitBehavior="false"  />
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

