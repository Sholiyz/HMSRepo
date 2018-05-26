<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/hmsmaster.master" AutoEventWireup="true" CodeFile="admin-portal.aspx.cs" Inherits="Pages_admin_portal" %>

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
                            <li runat="server" id="patientsportal"><a href="./patient-portal.aspx">Patient's Portal</a></li>
                            <li runat="server" id="nursesportal"><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                            <li runat="server" id="doctorsportal"><a href="./doctors-portal.aspx">Doctor's Portal</a></li>
                            <li runat="server" id="adminportal"><a class="menu-top-active" href="./admin-portal.aspx">Admin Portal</a></li>
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
                    <h1 class="page-head-line">MANAGEMENT'S PORTAL</h1>
                </div>
            </div>
            <uc1:ResponseAlert runat="server" ID="ResponseAlert" />

            <div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                PORTAL MANAGEMENT
                            </div>
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <%--<li class="active"><a href="#home" data-toggle="tab">Add Patient</a>
                                    </li>
                                    <li class=""><a href="#profile" data-toggle="tab">Profile</a>
                                    </li>--%>

                                    <li class="active" runat="server" id="usercreationli"><%--<a href="#usercreation" data-toggle="tab">USER MANAGEMENT</a>--%>
                                        <asp:LinkButton runat="server" ID="UsercreationDivNav" Text="USER MGMT." OnClick="UsercreationDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="transactiontypeli" runat="server"><%--<a href="#transactiontype" data-toggle="tab">TRANSACTION TYPE</a>--%>
                                        <asp:LinkButton runat="server" ID="TransactionTypeDivNav" Text="TRANSACTION TYPE" OnClick="TransactionTypeDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="roleli" runat="server"><%--<a href="#role" data-toggle="tab">ROLE MANAGEMENT</a>--%>
                                        <asp:LinkButton runat="server" ID="RoleDivNav" Text="ROLE MGMT." OnClick="RoleDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="patientplanli" runat="server"><%--<a href="#patientplan" data-toggle="tab">PATIENT PLAN</a>--%>
                                        <asp:LinkButton runat="server" ID="PatientPlanDivNav" Text="PATIENT PLAN" OnClick="PatientPlanDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="dutytypeli" runat="server"><%--<a href="#dutytype" data-toggle="tab">DUTY TYPE</a>--%>
                                        <asp:LinkButton runat="server" ID="DutyTypeDivNav" Text="DUTY TYPE" OnClick="DutyTypeDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="assigningnursedutyli" runat="server"><%--<a href="#assigningnurseduty" data-toggle="tab">ASSIGN NURSE DUTY</a>--%>
                                        <asp:LinkButton runat="server" ID="AssigningNurseDutyDivNav" Text="ASSIGN NURSE DUTY" OnClick="AssigningNurseDutyDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="attendancelogli" runat="server">
                                        <asp:LinkButton runat="server" ID="AttendanceLogDivNav" Text="ATTENDANCE LOG" OnClick="AttendanceLogDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="" id="hospitaldetailli" runat="server">
                                        <asp:LinkButton runat="server" ID="HospitalDetailDivNav" Text="HOSPITAL DETAIL" OnClick="HospitalDetailDivNav_Click"></asp:LinkButton>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <%--User Creation USER CREATION UserCreation UserCreationList usercreation --%>

                                    <div class="tab-pane fade active in" id="usercreation" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-group" id="AddUserDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ADD NEW USER</h4>
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
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:DropDownList runat="server" ID="AddUserEmployeelistddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT ROLE</label>
                                                                    <asp:DropDownList runat="server" ID="Adduserrolelistddl" CssClass="form-control selectpicker">
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <%--<div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" ID="AddUsernameTxtBox" CssClass="form-control"></asp:TextBox>
                                                                </div>--%>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSWORD</label>
                                                                    <asp:TextBox runat="server" ID="AddUserPasswordTxtBox" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">CONFIRM PASSWORD</label>
                                                                    <asp:TextBox runat="server" ID="AddUserConfirmPasswordTxtBox" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" ID="AddUserBackBtn" CssClass="btn btn-default btn-danger" OnClick="AddUserBackBtn_Click" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" ID="AddUserSubmitBtn" CssClass="btn btn-default btn-primary" OnClick="AddUserSubmitBtn_Click" Text="PROCEED" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="ViewUserListDiv" runat="server">

                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">USER LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" ID="ViewUserlistAddUserButton" OnClick="ViewUserlistAddUserButton_Click" Text="ADD NEW USER" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr style="border-top: 1px solid #232121;" />
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-sm-2 col-md-2 form-group text-right">
                                                                    <h4 class="text-right">Employee</h4>
                                                                </div>
                                                                <div class="col-sm-3 col-md-3 form-group text-left">
                                                                    <asp:DropDownList runat="server" ID="UserSearchEmployeeNameddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 col-md-2 form-group text-right">
                                                                    <h4 class="text-right">HMS UserName</h4>
                                                                </div>
                                                                <div class="col-sm-3 col-md-2 form-group text-left">
                                                                    <asp:TextBox runat="server" ID="UserSearchEmployeeHMSID"></asp:TextBox>
                                                                </div>
                                                                <div class="col-sm-2 col-md-1 form-group text-left">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" ID="UserSearchButton" Text="SEARCH" OnClick="UserSearchButton_Click" />
                                                                </div>
                                                                <%-- <div class="col-sm-2 col-md-2 form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" ID="Button1" OnClick="ViewUserlistAddUserButton_Click" Text="ADD NEW USER" />
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="UserListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="UserID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Employee">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetEmployeeFullNameById(int.Parse(Eval("StaffID").ToString()))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>

                                                                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="Name">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="User Role">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetRoleNameByRoleID(int.Parse(Eval("StaffRoleID").ToString()))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("UserID") %>' Text="View" ID="ViewUserBtn" OnClick="ViewUserBtn_Click" CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("UserID") %>' Text="Edit" ID="EditUserBtn" OnClick="EditUserBtn_Click" CssClass="btn btn-sm btn-warning" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("UserID") %>' Text="Delete" ID="DeleteUserBtn" OnClick="DeleteUserBtn_Click" CssClass="btn btn-sm btn-danger" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("UserID") %>' Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="UserActivatioButton" OnClick="UserActivatioButton_Click" CssClass='<%#(Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-success") %>' />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="EditUserDiv" runat="server">
                                                        <h4>EDIT USER</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:TextBox runat="server" ID="EditUserEmployeeNameTextBox" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USER ROLE</label>
                                                                    <asp:DropDownList runat="server" ID="EditUserUserRoleddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" ID="EditUserUsername" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">RESET PASSWORD</label>
                                                                    <asp:TextBox runat="server" ID="EditUserPasswordTextbox" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">CONFIRM RESET PASSWORD</label>
                                                                    <asp:TextBox runat="server" ID="EditUserConfirmPasswordTextbox" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="EditUserBackButton" OnClick="EditUserBackButton_Click" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="EditUserProceedButton" OnClick="EditUserProceedButton_Click" Text="UPDATE" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewUserCreationDiv" runat="server">
                                                        <h4>VIEW USER DETAIL</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewUserEmployeeNameTextField" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USER ROLE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewUserRoleTextField" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewUserUserNameTextField" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewUserBackButton" OnClick="ViewUserBackButton_Click" />
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

                                    <div class="tab-pane fade" id="transactiontype" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AddTransactionTypeDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ADD TRANSACTION TYPE</h4>
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
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddTranxTypeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="AddTranxTypeDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="AddTranxBackButton" Text="BACK" OnClick="AddTranxBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="AddTranxProceedButton" Text="PROCEED" OnClick="AddTranxProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewTransactionTypeListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">TRANSACTION TYPE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" ID="ViewListAddtranxbutton" OnClick="ViewListAddtranxbutton_Click" Text="ADD NEW TRANSACTION TYPE" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="transactiontypeListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="TransactionTypeID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="TransactionTypeID" HeaderText="Transaction Type ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="TransactionTypeName" HeaderText="Transaction Type" SortExpression="TransactionTypeName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>


                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <asp:Button runat="server" Text="View" CommandArgument='<%# Eval("TransactionTypeID") %>' ID="ViewTranxTypeBtn" CssClass="btn btn-md btn-primary" OnClick="ViewTranxTypeBtn_Click" />
                                                                                <asp:Button runat="server" Text="Edit" CommandArgument='<%# Eval("TransactionTypeID") %>' ID="EditTranxTypeBtn" CssClass="btn btn-md btn-warning" OnClick="EditTranxTypeBtn_Click" />
                                                                                <asp:Button runat="server" Text="Delete" CommandArgument='<%# Eval("TransactionTypeID") %>' ID="DeleteTranxTypeBtn" CssClass="btn btn-md btn-danger" OnClick="DeleteTranxTypeBtn_Click" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="EditTransactionTypeDiv" runat="server">
                                                        <h4>EDIT TRANSACTION TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditTranxTypeTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="EditTranxTypeDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="EditTranxBackButton" Text="BACK" OnClick="EditTranxBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="EditTranxUpdateButton" Text="UPDATE" OnClick="EditTranxUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewTransactionTypeDiv" runat="server">
                                                        <h4>VIEW TRANSACTION TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="ViewTranxtypeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true" ID="ViewTranxTypeDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="ViewTranxBackbutton" Text="BACK" OnClick="ViewTranxBackbutton_Click" />
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

                                    <div class="tab-pane fade" id="role" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AddRolesDiv" runat="server">
                                                        <h4>ADD NEW ROLE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" ID="AddRoleNameTxtbox" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddRoleDescriptionTxtbox" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="AddRoleBackButton" OnClick="AddRoleBackButton_Click" Text="BACK" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="AddRoleProceedButton" OnClick="AddRoleProceedButton_Click" Text="PROCEED" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewRolesListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ROLE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW ROLE" ID="ViewRolelistAddnewButton" OnClick="ViewRolelistAddnewButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="RoleListGrid" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered table-condensed text-center pager" DataKeyNames="RoleID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="RoleID" HeaderText="Role ID" SortExpression="RoleID" ItemStyle-BackColor="#00000A">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="RoleName" HeaderText="Role Name" SortExpression="RoleName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="RoleDescription" HeaderText="Role Description" SortExpression="RoleDescription">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("RoleID") %>' Text="View" ID="ViewRoleBtn" OnClick="ViewRoleBtn_Click" CssClass="btn btn-md btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("RoleID") %>' Text="Edit" ID="EditRoleBtn" OnClick="EditRoleBtn_Click" CssClass="btn btn-md btn-warning" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("RoleID") %>' Text="Delete" ID="DeleteRoleBtn" OnClick="DeleteRoleBtn_Click" CssClass="btn btn-md btn-danger" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="EditRoleDiv" runat="server">
                                                        <h4>EDIT ROLE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditRoleNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditRoleDescriptionTextBox" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditRoleBackButton" OnClick="EditRoleBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditRoleUpdateButton" OnClick="EditRoleUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewRoleDiv" runat="server">
                                                        <h4>VIEW ROLE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewRoleNameTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewRoleDecriptionTextBox" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="ViewRoleBackButton" OnClick="ViewRoleBackButton_Click" Text="BACK" />
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

                                    <div class="tab-pane fade" id="dutytype" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AddDutyTypeDiv" runat="server">
                                                        <h4>ADD NEW DUTY TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddDutyTypeNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="AddDutyTypeStarttimeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="AddDutyTypeEndtimeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="AddDutyTypeDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddDutyTypeBackButton" OnClick="AddDutyTypeBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddDutyTypeProceedButton" OnClick="AddDutyTypeProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewDutyTypeListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">DUTY TYPE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD DUTY TYPE" ID="ViewDutyTypeListAddButton" OnClick="ViewDutyTypeListAddButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="DutyTypeListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="DutyTypeID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="DutyTypeID" HeaderText="DutyType ID" SortExpression="DutyTypeID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="DutyTypeName" HeaderText="Name" SortExpression="DutyTypeName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("DutyTypeID") %>' Text="View" ID="ViewDutyTypeBtn" OnClick="ViewDutyTypeBtn_Click" CssClass="btn btn-md btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("DutyTypeID") %>' Text="Edit" ID="EditDutyTypeBtn" OnClick="EditDutyTypeBtn_Click" CssClass="btn btn-md btn-warning" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("DutyTypeID") %>' Text="Delete" ID="DeleteDutyTypeBtn" OnClick="DeleteDutyTypeBtn_Click" CssClass="btn btn-md btn-danger" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="EditDutyTypeDiv" runat="server">
                                                        <h4>EDIT DUTY TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditDutyTypeNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="EditDutyTypeStarttimeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="EditDutyTypeEndtimeTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="EditDutyTypeDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditDutyTypeBackButton" OnClick="EditDutyTypeBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditDutyTypeUpdatebutton" OnClick="EditDutyTypeUpdatebutton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewDutyTypeDiv" runat="server">
                                                        <h4>VIEW DUTY TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewDutyTypeNameTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="ViewDutyTypeStarttimeTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="ViewDutyTypeEndtimeTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="ViewDutyTypeDescriptionTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewDutyTypeBackButton" OnClick="ViewDutyTypeBackButton_Click" />
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

                                    <div class="tab-pane fade" id="patientplan" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AddPatientPlanDiv" runat="server">
                                                        <h4>ADD NEW PATIENT PLAN</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddPatientPlanNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="AddPatientPlanMaxNumberTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="AddPatientPlanDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AddPatientPlanBackButton" OnClick="AddPatientPlanBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddPatientPlanProceedButton" OnClick="AddPatientPlanProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewPatientPlanListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">PATIENT PLAN LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT PLAN" ID="ViewPatientPlanListAddNewPatientButton" OnClick="ViewPatientPlanListAddNewPatientButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">

                                                            <asp:GridView ID="PatientPlanListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="PlanTypeID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="PlanTypeID" HeaderText="PlanType ID" SortExpression="PlanTypeID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PlanTypeName" HeaderText="Plan Type" SortExpression="PlanTypeName">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PlanTypeDescription" HeaderText="PlanTypeDescription" SortExpression="PlanTypeDescription">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PlanTypeID") %>' Text="View" ID="ViewPlanTypeBtn" CssClass="btn btn-md btn-primary" OnClick="ViewPlanTypeBtn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PlanTypeID") %>' Text="Edit" ID="EditPlanTypeBtn" CssClass="btn btn-md btn-warning" OnClick="EditPlanTypeBtn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PlanTypeID") %>' Text="Delete" ID="DeletePlanTypeBtn" CssClass="btn btn-md btn-danger" OnClick="DeletePlanTypeBtn_Click" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="EditPatientPlanDiv" runat="server">
                                                        <h4>EDIT PATIENT PLAN</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditPatientPlanNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="EditPatientPlanMaxNumTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="EditPatientPlanDescriptionTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditPatientPlanBackButton" OnClick="EditPatientPlanBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditPatientPlanUpdateButton" OnClick="EditPatientPlanUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewPatientPlanDiv" runat="server">
                                                        <h4>VIEW PATIENT PLAN</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewPatientPlanTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="ViewPatientPlanMaxNumberTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="ViewPatientPlanDescriptionTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" ID="ViewPatientPlanBackButton" Text="BACK" OnClick="ViewPatientPlanBackButton_Click" />
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

                                    <div class="tab-pane fade" id="assigningnurseduty" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AssignNurseDutyDiv" runat="server">
                                                        <h4>ASSIGN NURSE DUTY</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT NURSE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="AssignNurseDutyNurseDdl"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT DUTY TYPE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="AssignNurseDutyTypeDdl"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="AssignNurseDutyStartdateTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="AssignNurseDutyEnddateTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="AssignNurseDutyBackButton" OnClick="AssignNurseDutyBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AssignNurseDutyProceedButton" OnClick="AssignNurseDutyProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewNurseDutyListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ASSIGNED NURSE DUTY LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ASSIGN NEW NURSE DUTY" ID="ViewNurseDutyListAddDutyButton" OnClick="ViewNurseDutyListAddDutyButton_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">

                                                            <asp:GridView ID="NurseDutyListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="NurseDutyID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="NurseDutyID" HeaderText="NurseDutyID" SortExpression="NurseDutyID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Nurse">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetEmployeeFullNameById(Convert.ToInt32(Eval("NurseID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DutyType">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetDutyTypeNameByID(Convert.ToInt32(Eval("DutyTypeID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("NurseDutyID") %>' Text="View" ID="ViewNurseDutyBtn" CssClass="btn btn-md btn-success" OnClick="ViewNurseDutyBtn_Click" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("NurseDutyID") %>' Text="Edit" ID="EditNurseDutyBtn" CssClass="btn btn-md btn-warning" OnClick="EditNurseDutyBtn_Click" />
                                                                                <%--<asp:Button runat="server" CommandArgument='<%# Eval("NurseDutyID") %>' Text="Delete" ID="DeleteNurseDutyBtn" CssClass="btn btn-md btn-danger" OnClick="DeleteNurseDutyBtn_Click" />--%>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="EditNurseDutyDiv" runat="server">
                                                        <h4>EDIT NURSE DUTY</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">NURSE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="EditNurseDutyNursenameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" ID="EditNurseDutyTypeDdl"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="EditNurseDutyStartdateTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="EditNurseDutyEnddateTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditNurseDutyBackButton" OnClick="EditNurseDutyBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EditNurseDutyUpdateButton" OnClick="EditNurseDutyUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="ViewNurseDutyDiv" runat="server">
                                                        <h4>VIEW ASSIGNED NURSE DUTY</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">NURSE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="ViewNurseDutyNurseNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="ViewNurseDutyTypeTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ReadOnly="true" ID="ViewNurseDutyStartdateTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END DATE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ReadOnly="true" ID="ViewNurseDutyEnddateTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="ViewNurseDutyBackButton" OnClick="ViewNurseDutyBackButton_Click" />
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

                                    <div class="tab-pane fade" id="attendancelog" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="ViewAttendanceLogListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ATTENDANCE LOG LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-sm-2 form-group text-right">
                                                                    <h4 class="text-right"></h4>
                                                                </div>
                                                                <div class="col-sm-3 form-group text-left">
                                                                    <asp:DropDownList runat="server" ID="AttendanceSearchEmployeeNameddl" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="col-sm-2 form-group text-left">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" ID="AttendanceSearchButton" Text="SEARCH" OnClick="AttendanceSearchButton_Click" />
                                                                </div>
                                                                <div class="col-sm-2 form-group text-right"></div>
                                                                <div class="col-sm-3 form-group text-left"></div>

                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="AttendanceLogListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="AttendanceID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="AttendanceID" HeaderText="AttendanceID" SortExpression="AttendanceID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Employee">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetEmployeeFullNameById(Convert.ToInt32(Eval("StaffID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DutyType">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Pasture.GetDutyTypeNameByID(Convert.ToInt32(Eval("DutyID")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="ClockInTime" HeaderText="ClockIn Time" SortExpression="ClockInTime" DataFormatString="{0:T}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="ClockOutTime" HeaderText="ClockOut Time" SortExpression="ClockOutTime" DataFormatString="{0:T}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" SortExpression="AttendanceDate" DataFormatString="{0:d}">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>

                                                                </Columns>


                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <hr />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="hospitaldetail" runat="server">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <div class="form-group" id="AddHospitalDetailDiv" runat="server">
                                                        <h4>ADD HOSPITAL DETAIL</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">HOSPITAL NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddHospitalNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddHospitalAddressTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">EMAIL</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="AddHospitalEmailTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Phone" ID="AddHospitalPhoneNumberTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">WEBSITE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="AddHospitalWedsiteTextBox"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="AddHospitalDetailProceedButton" OnClick="AddHospitalDetailProceedButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="EditHospitalDetailDiv" runat="server">
                                                        <h4>EDIT HOSPITAL DETAIL</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">HOSPITAL NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditHospitalNameTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditHospitalAddressTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">EMAIL</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="EditHospitalEmailTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="EditHospitalPhoneNumberTextbox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">WEBSITE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EditHospitalWedsiteTextBox"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="EditHospitalDetailBackButton" OnClick="EditHospitalDetailBackButton_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="EdiHospitalDetailUpdateButton" OnClick="EdiHospitalDetailUpdateButton_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<hr />--%>
                                                    <div class="form-group" id="ViewHospitalDetailDiv" runat="server">
                                                        <h4>VIEW HOSPITAL DETAIL</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">HOSPITAL NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewHospitalNameTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewHospitalAddressTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">EMAIL</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="ViewHospitalEmailTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="ViewHospitalPhoneNumberTextbox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">WEBSITE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="ViewHospitalWedsiteTextBox" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="ViewHospitalDetailEditButton" Text="EDIT" OnClick="ViewHospitalDetailEditButton_Click" />
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
