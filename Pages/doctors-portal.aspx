<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/hmsmaster.master" AutoEventWireup="true" CodeFile="doctors-portal.aspx.cs" Inherits="Pages_doctors_portal" %>

<%@ Register Src="~/Controls/ResponseAlert.ascx" TagPrefix="uc1" TagName="ResponseAlert" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationMenu" Runat="Server">
     <section class="menu-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a href="./dashboard.aspx">Dashboard</a></li>
                                <li><a href="./patient-portal.aspx">Patient's Portal</a></li>
                                <li><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                                <li><a class="menu-top-active" href="./doctors-portal.aspx">Doctor's Portal</a></li>
                                <li><a href="./admin-portal.aspx">Admin Portal</a></li>                            
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- MENU SECTION END-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Doctor'S PORTAL</h1>
                    </div>
                </div>
                <uc1:ResponseAlert runat="server" ID="ResponseAlert" />
                <div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <%--<div class="panel-heading">
                                  Nurse Portal  
                                </div>--%>
                                <div class="panel-body">
                                    <ul class="nav nav-tabs">
                                        <li class="active" id="doctorli" runat="server"><%--<a href="#doctor" data-toggle="tab">DOCTOR MANAGEMENT</a>--%>
                                            <asp:LinkButton runat="server" ID="DoctorDivNav" OnClick="DoctorDivNav_Click" Text="DOCTOR MANAGEMENT"></asp:LinkButton>
                                        </li>
                                        <li class="" runat="server" id="attendanceli"><%--<a href="#attendance" data-toggle="tab">ATTENDANCE</a>--%>
                                            <asp:LinkButton  runat="server" ID="AttendanceDivNav" OnClick="AttendanceDivNav_Click" Text="ATTENDANCE"> </asp:LinkButton>
                                        </li>
                                        <li class=""><a href="#messages" data-toggle="tab">Messages</a>
                                        </li>
                                        <li class=""><a href="#settings" data-toggle="tab">Settings</a>
                                        </li> 
                                        <li class=""><a href="#messages" data-toggle="tab">Manage Nurse Shift</a>
                                        </li>
                                        <li class=""><a href="#settings" data-toggle="tab">Settings</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content">

                                        <div class="tab-pane fade active in" id="doctor" runat="server">
                                           <%-- <h4>Add New Nurse</h4>--%>
                                            <div class="col-md-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-body">
                                                    <hr />
                                                        <%-- ========================ADD NEW DOCTOR ================================ --%>
                                                    <div class="form-group" id="AddNewDoctorDiv" runat="server">
                                                        <h4>ADD NEW DOCTOR</h4>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">FIRSTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" required ID="txtFirstname"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">LASTNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" required ID="txtLastname"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">OTHERNAMES</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" required ID="txtOthername"></asp:TextBox>
                                                                </div>                                                              
                                                                <div class="form-group">
                                                                    <label class="control-label">GENDER</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" required ID="ddlGender">
                                                                        <asp:ListItem Value="0" Text="Select Gender..." Selected="True">Select Gender....</asp:ListItem>
                                                                        <asp:ListItem Value="1" Text="Female">Female</asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Male">Male</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>                                                                
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control" required ID="ddlMaritalStatus"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" required ID="txtPhone"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" required ID="txtAddress"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" required ID="txtDOB"></asp:TextBox>
                                                                </div> 
                                                                 <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" required ID="txtKinFullname"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" required ID="txtKinPhone"></asp:TextBox>
                                                                </div> 
                                                                 <div class="form-group">
                                                                     <div class="row">
                                                                    <div class="col-lg-6 text-left">
                                                                        <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK"  UseSubmitBehavior="false"  ID="btnAddNewBack" OnClick="btnAddNewBack_Click"  />
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
                                                    <hr />   
                                                        <%-- ==============================VIEW DOCTOR LIST ===================================== --%>                                                
                                                    <div class="form-group" id="ViewDoctorListDiv" runat="server">                                                       
                                                           <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">DOCTOR LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD DOCTOR" ID="btnAddNewDoc" OnClick="btnAddNewDoc_Click" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive center-block">                                                           
                                                            <asp:GridView ID="DoctorListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered text-center" DataKeyNames="DoctorID" EmptyDataText="There are no data records to display." OnRowCommand="DoctorListGridView_RowCommand">
                                                                <Columns>
                                                                    <%--<asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
                                                                        <HeaderStyle CssClass="hide" HorizontalAlign="Left" />
                                                                        <ItemStyle CssClass="hide" HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Name" HeaderText="Order Name" SortExpression="Name">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:BoundField>--%>
                                                                    
                                                                    <asp:TemplateField HeaderText="Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFullName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FullName")%>'></asp:Label>
                                                                            <asp:Label ID="lblFirstName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FirstName")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblLastName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "LastName")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblDoctorID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "DoctorID")%>' Visible="false"></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Gender">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGender" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Gender")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Telephone">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PhoneNumber")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddress" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Address")%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsDeliveredStatus(Convert.ToBoolean(Eval("IsDelivered")))%>'></asp:Label>
                                                                            <asp:Label runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Canceled Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsCancelledStatus(Convert.ToBoolean(Eval("IsCancelled")))%>'></asp:Label>
                                                                            <asp:Label runat="server" ></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="center text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                        <ItemTemplate>
                                                                            <div class="form-actions text-center">
                                                                                <%--<asp:Button runat="server" Text="Processing" ID="lnkView" Enabled='<%#Eval("IsProcessing") %>' CssClass="btn btn-xs btn-success" />--%>
                                                                                <asp:Button CommandArgument="View" runat="server" Text="View" ID="CancelRoleBtn" CssClass="btn btn-md btn-primary" />
                                                                                <asp:Button CommandArgument="Edit" runat="server" Text="Edit" ID="EditRoleBtn" CssClass="btn btn-md btn-warning" />
                                                                                <asp:Button CommandArgument="Delete" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="DeleteRoleBtn"  CssClass='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-md btn-danger" : "btn btn-md btn-success") %>' />   <%--Enabled='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? false : true) %>' --%>
                                                                                <asp:Button CommandArgument="Delete" runat="server" Text="Delete" ID="Button1"  CssClass="btn btn-md btn-danger" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <hr />

                                                        <%-- =====================================EDIT DOCTOR PROFILE======================================= --%>
                                                    <div class="form-group" id="EditDoctorDiv" runat="server">
                                                       <h4>EDIT DOCTOR PROFILE</h4>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <asp:DropDownList ID="ddlGenderE" runat="server"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">MARITAL STATUS</label>
                                                                    <asp:DropDownList ID="ddlMaritalStatusE" runat="server"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PHONE NUMBER</label>
                                                                    <asp:TextBox ID="txtPhoneE" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">ADDRESS</label>
                                                                    <asp:TextBox ID="txtAddressE" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DATE OF BIRTH (MM/DD/YYYY)</label>
                                                                    <asp:TextBox ID="txtDOBE" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                                </div> 
                                                                 <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox ID="txtKinFullnameE" runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox ID="txtKinPhoneE" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                 <div class="form-group">
                                                                     <div class="row">
                                                                    <div class="col-lg-6 text-left">
                                                                        <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK"  UseSubmitBehavior="false"  ID="btnEditBack"   />
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
                                                    <hr />
                                                        <%-- ============================= VIEW DOCTOR PROFILE ==================================== --%>
                                                    <div class="form-group" id="ViewDoctorDiv" runat="server">
                                                        <h4>VIEW DOCTOR PROFILE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <%--<div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>--%>                                                                
                                                                <div class="form-group text-center">
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <label class="control-label">NEXT OF KIN FULLNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtKinFullnameV"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">NEXT OF KIN PHONE NUMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ReadOnly="true" ID="txtKinPhoneV"></asp:TextBox>
                                                                </div> 
                                                                     <div class="form-group">
                                                                     <div class="row">
                                                                    <div class="col-lg-12 text-left">
                                                                        <asp:Button runat="server" CssClass="btn btn-default btn-danger" Text="BACK" ID="btnBackView" OnClick="btnBackView_Click" />
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

                                        <div class="tab-pane fade" id="attendance" runat="server">
                                          
                                            <div class="col-md-12">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        NURSE FORM
                                                    </div>
                                                    <div class="panel-body">
                                                        <div role="form">
                                                            <div class="form-group has-success">
                                                                <label class="control-label" for="success">SUCCESS EXAMPLE</label>
                                                                <input type="text" class="form-control" id="success" />
                                                            </div>
                                                            <div class="form-group has-warning">
                                                                <label class="control-label" for="warning">WARNING EXAMPLE</label>
                                                                <input type="text" class="form-control" id="warning" />
                                                            </div>
                                                            <div class="form-group has-error">
                                                                <label class="control-label" for="error">ERROR EXAMPLE</label>
                                                                <input type="text" class="form-control" id="error" />
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group">
                                                            <label>Select Example</label>
                                                            <select class="form-control">
                                                                <option>One Vale</option>
                                                                <option>Two Vale</option>
                                                                <option>Three Vale</option>
                                                                <option>Four Vale</option>
                                                            </select>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group">
                                                            <label>Multiple Select Example</label>
                                                            <select multiple="" class="form-control">
                                                                <option>One Vale</option>
                                                                <option>Two Vale</option>
                                                                <option>Three Vale</option>
                                                                <option>Four Vale</option>
                                                            </select>
                                                        </div>
                                                        <hr />
                                                        For more customization for this template or its components please
                             visit official bootstrap website i.e <strong>getbootstrap.com </strong>or
                            <a href="http://getbootstrap.com/css/#forms" target="_blank">click here</a>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="tab-pane fade" id="messages">
                                            <h4>Messages Tab</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>

                                        <div class="tab-pane fade" id="settings">
                                            <h4>Settings Tab</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                       <div class="col-md-12">

                        <div class="alert alert-info">
                            <asp:Button runat="server" ID="ShowAlertClick" Text="Show Note" CssClass="btn btn-default btn-primary" OnClick="ShowAlertClick_Click" />
                            <asp:Button runat="server" ID="ShowPopAlert" Text="Show pop Note" CssClass="btn btn-default btn-primary" OnClick="ShowPopAlert_Click" />
                            Click to test Notification Message
                            <br />
                            <strong>ALERT EXAMPLE :</strong> This is an alert example . You can use differnt classes like alert-success, alert-warning,etc.
                        </div>

                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
</asp:Content>


