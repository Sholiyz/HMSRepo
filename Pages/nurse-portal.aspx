<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/hmsmaster.master" AutoEventWireup="true" CodeFile="nurse-portal.aspx.cs" Inherits="Pages_nurse_portal" %>

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
                            <li runat="server" id="nursesportal"><a class="menu-top-active" href="./nurse-portal.aspx">Nurse's Portal</a></li>
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
                    <h1 class="page-head-line">NURSE'S PORTAL</h1>
                </div>
            </div>
            <uc1:ResponseAlert runat="server" ID="ResponseAlert" />
            <div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-body" id="tabs">
                                <ul class="nav nav-tabs">
                                    <li class="" id="nurseli" runat="server">
                                        <asp:LinkButton runat="server" ID="NurseDivNav" Text="NURSE MANAGEMENT" OnClick="NurseDivNav_Click"></asp:LinkButton>
                                    </li>
                                    <li class="active" runat="server" id="attendanceli"><%--<a href="#attendance" data-toggle="tab">ATTENDANCE</a>--%>
                                        <asp:LinkButton runat="server" ID="AttendanceDivNav" Text="ATTENDANCE" OnClick="AttendanceDivNav_Click"> </asp:LinkButton>
                                    </li>

                                </ul>

                                <div class="tab-content">
                                    <%-- NURSE tab --%>
                                    <div class="tab-pane fade active in" id="nurse" runat="server">
                                        <%-- <h4>Add New Nurse</h4>--%>
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <%-- ==============================ADD NURSE LIST ===================================== --%>
                                                    <div class="form-group" id="AddNewNurseDiv" runat="server">
                                                        <h4>ADD NEW NURSE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>
                                                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="PictureViewButton" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>--%>
                                                                <div class="form-group">

                                                                    <label class="control-label">PASSPORT</label>
                                                                    <div class="row">
                                                                        <div class="col-md-10">
                                                                            <asp:FileUpload runat="server" CssClass="form-control" ID="FileUploadNurse" />
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <%-- <asp:Button runat="server" Visible="false" CausesValidation="false" UseSubmitBehavior="false" CssClass="btn btn-sm btn-primary" ID="PictureViewButton" Text="View" OnClick="PictureViewButton_Click" />--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ID="Addnurseimage" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstname"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" required ID="txtLastname"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtOthername"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" required ID="ddlGender">
                                                                        <asp:ListItem Value="0" Text="--Select Gender--" Selected="True">Select Gender....</asp:ListItem>
                                                                        <asp:ListItem Value="1" Text="Female">Female</asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Male">Male</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" required ID="ddlMaritalStatus">
                                                                        <asp:ListItem Value="0" Text="Select Marital Status..." Selected="True">Select Marital Status...</asp:ListItem>
                                                                        <asp:ListItem Value="1" Text="Single">Single</asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Married">Married</asp:ListItem>
                                                                        <asp:ListItem Value="3" Text="Divorced">Divorced</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" required ID="txtPhone"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" ID="txtAddress"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" required ID="txtDOB"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" UseSubmitBehavior="false" ID="btnAddNewBack" OnClick="btnAddNewBack_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="PROCEED" ID="btnProceed" OnClick="btnProceed_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%-- ==============================VIEW NURSE LIST ===================================== --%>
                                                    <div class="form-group" id="ViewNurseListDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">NURSE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW NURSE" ID="btnAddNewNurse" OnClick="btnAddNewDoc_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="NurseListGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-condensed table-bordered " DataKeyNames="EmployeeID" EmptyDataText="There are no data records to display." AllowPaging="True" PagerStyle-Font-Size="Medium" PagerSettings-PageButtonCount="5" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="NurseListGridView_PageIndexChanging">
                                                                <PagerStyle CssClass="pagination-ys text-center" />
                                                                <Columns>
                                                                    <%--   <asp:TemplateField HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFullName" runat="server" Text='<%#Eval("FullName")%>'></asp:Label>
                                                                        <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName")%>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName")%>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblEmployeeID" runat="server" Text='<%#Eval("EmployeeID")%>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblStaffTypeID" runat="server" Text='<%#Eval("StaffTypeID")%>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB")%>' Visible="false"></asp:Label>
                                                                        <asp:Label runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Gender">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Mar. Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMaritalStatus" runat="server" Text='<%#Eval("MaritalStatus")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Telephone">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button CommandArgument='<%#Eval("EmployeeID")%>' OnClick="btnView_Click" runat="server" Text="View" ID="btnView" CssClass='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-primary" : "btn btn-sm btn-primary disabled") %>' />
                                                                                <asp:Button CommandArgument='<%#Eval("EmployeeID")%>' OnClick="btnEdit_Click" runat="server" Text="Edit" ID="btnEdit" CssClass='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-warning" : "btn btn-sm btn-warning disabled") %>' />
                                                                                <asp:Button CommandArgument='<%#Eval("EmployeeID")%>' OnClick="btnDeActivate_Click" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="btnDeactivate" CssClass='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-success") %>' />
                                                                                <asp:Button CommandArgument='<%#Eval("EmployeeID")%>' OnClick="btnDelete_Click" runat="server" Text="Delete" ID="btnDelete" CssClass='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-danger disabled") %>' />
                                                                            </div>
                                                                        </ItemTemplate>

                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="center text-center"></HeaderStyle>

                                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings PageButtonCount="5" />
                                                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Right" />
                                                            </asp:GridView>

                                                        </div>
                                                    </div>

                                                    <%-- =====================================EDIT NURSE PROFILE======================================= --%>
                                                    <div class="form-group" id="EditNurseDiv" runat="server">
                                                        <h4>EDIT NURSE PROFILE</h4>
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
                                                                    <asp:Image runat="server" Width="150" Height="150" ID="nurseEditImage" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstnameE"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLastnameE"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtOthernamesE"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList ID="ddlGenderE" runat="server" CssClass="form-control">
                                                                        <%--<asp:ListItem Value="0" Text="Select Gender..." Selected="True">Select Gender....</asp:ListItem>--%>
                                                                        <asp:ListItem Value="1" Text="Female">Female</asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Male">Male</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList ID="ddlMaritalStatusE" runat="server" CssClass="form-control">
                                                                        <%--<asp:ListItem Value="0" Text="Select Marital Status..." Selected="True">Select Marital Status....</asp:ListItem>--%>
                                                                        <asp:ListItem Value="1" Text="Single">Single</asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Married">Married</asp:ListItem>
                                                                        <asp:ListItem Value="3" Text="Divorced">Divorced</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="txtPhoneE"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtAddressE"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtDOBE"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" UseSubmitBehavior="false" ID="btnEditBack" OnClick="btnEditBack_Click" />
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="UPDATE" ID="btnUpdate" OnClick="btnUpdate_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%-- ============================= VIEW DOCTOR PROFILE ==================================== --%>
                                                    <div class="form-group" id="ViewNurseDiv" runat="server">
                                                        <h4>VIEW NURSE PROFILE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">

                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" Width="150" Height="150" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png" ID="nurseViewImage" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtFirstnameV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtLastnameV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtOthernamesV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtGenderV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtMaritalStatusV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true" ID="txtPhoneV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtAddressV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true" ID="txtDOBV"></asp:TextBox>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 text-left">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="btnBackView" OnClick="btnBackView_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- ATTENDANCE TAB --%>
                                    <div class="tab-pane fade" id="attendance" runat="server">

                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-group" id="NurseAttendanceDiv" runat="server">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4>ATTENDANCE</h4>
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
                                                                    <label class="control-label" runat="server" id="attandancemsg">WELCOME CLICK SIGN IN FOR TODAY'S DUTY</label>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="EmployeeNameFullName" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">TIME</label>
                                                                    <asp:TextBox runat="server" Text="" ID="AttendanceCurrentTime" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 text-left">
                                                                        </div>
                                                                        <div class="col-lg-6 text-right">
                                                                            <asp:Button runat="server" CssClass="btn btn-default btn-primary" ID="AttendanceSigninButton" Text="SIGN IN" OnClick="AttendanceSigninButton_Click" />
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

