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
                            <li><a href="./dashboard.aspx">Dashboard</a></li>
                            <li><a href="./patient-portal.aspx">Patient's Portal</a></li>
                            <li><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                            <li><a href="./doctors-portal.aspx">Doctor's Portal</a></li>
                            <li><a class="menu-top-active" href="./admin-portal.aspx">Admin Portal</a></li>
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

                                    <li class="active"><a href="#usercreation" data-toggle="tab">USER MANAGEMENT</a>
                                    </li>
                                    <li class=""><a href="#transactiontype" data-toggle="tab">TRANSACTION TYPE</a>
                                    </li>
                                    <li class=""><a href="#role" data-toggle="tab">ROLE MANAGEMENT</a>
                                    </li>
                                    <li class=""><a href="#patientplan" data-toggle="tab">PATIENT PLAN</a>
                                    </li>
                                    <li class=""><a href="#dutytype" data-toggle="tab">DUTY TYPE</a>
                                    </li>
                                    <li class=""><a href="#assigningnurseduty" data-toggle="tab">ASSIGN NURSE DUTY</a>
                                    </li>

                                </ul>

                                <div class="tab-content">
                                    <%--User Creation USER CREATION UserCreation UserCreationList usercreation --%>
                                    <%--<div class="tab-pane fade active in" id="home">
                                        <h4>Add New Patient</h4>
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    PATIENT FORM
                                                </div>
                                                <div class="panel-body">
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1">Email address</label>
                                                                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">

                                                                <div class="form-group">
                                                                    <label for="exampleInputPassword1">Password</label>
                                                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="form-group">
                                                            <label for="exampleInputFile">File input</label>
                                                            <input type="file" id="exampleInputFile" />
                                                            <p class="help-block">Example block-level help text here.</p>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" />
                                                                Check me out
                                                            </label>
                                                        </div>
                                                        <button type="submit" class="btn btn-default">Submit</button>
                                                        <hr />
                                                        <input type="text" class="form-control" placeholder="Text input" />
                                                        <hr />
                                                        <textarea class="form-control" rows="3" placeholder="Text Area"></textarea>
                                                        <hr />
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" value="" />
                                                                Option one is this and that&mdash;be sure to include why it's great
                                                            </label>
                                                        </div>
                                                        <div class="checkbox disabled">
                                                            <label>
                                                                <input type="checkbox" value="" disabled />
                                                                Option two is disabled
                                                            </label>
                                                        </div>

                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked />
                                                                Option one is this and that&mdash;be sure to include why it's great
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" />
                                                                Option two can be something else and selecting it will deselect option one
                                                            </label>
                                                        </div>
                                                        <div class="radio disabled">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled />
                                                                Option three is disabled
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="profile">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    PATIENT FORM
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

                                    </div>--%>
                                    <div class="tab-pane fade active in" id="usercreation">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ADD NEW USER</h4>
                                                    <div class="form-group" id="AddUserDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT ROLE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PASSWORD</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">CONFIRM PASSWORD</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewUserListDiv">                                                       
                                                         <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">USER LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW USER" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">                                                        
                                                            <asp:GridView ID="UserListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditUserDiv">
                                                        <h4>EDIT USER</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USER ROLE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">RESET PASSWORD</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">CONFIRM RESET PASSWORD</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewUserCreationDiv">
                                                        <h4>VIEW USER DETAIL</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">EMPLOYEE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USER ROLE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">USERNAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
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

                                    <div class="tab-pane fade" id="transactiontype">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ADD TRANSACTION TYPE</h4>
                                                    <div class="form-group" id="AddTransactionTypeDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewTransactionTypeListDiv">                                                      
                                                           <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">TRANSACTION TYPE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW TRANSACTION TYPE" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">                                                           
                                                            <asp:GridView ID="transactiontypeListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditTransactionTypeDiv">
                                                        <h4>EDIT TRANSACTION TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewTransactionTypeDiv">
                                                        <h4>VIEW TRANSACTION TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">TRANSACTION TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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

                                    <div class="tab-pane fade" id="role">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ADD NEW ROLE</h4>
                                                    <div class="form-group" id="AddRolesDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewRolesDiv">
                                                        <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ROLE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW ROLE" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="RoleListGrid" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>
                                                                    <%-- <asp:BoundField DataField="ISProcessStatus" HeaderText="ProcessStatus" SortExpression="ISProcessStatus">
                                <HeaderStyle CssClass="show" HorizontalAlign="Left" />
                                <ItemStyle CssClass="show" HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditRoleDiv">
                                                        <h4>EDIT ROLE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewRoleDiv">
                                                        <h4>VIEW ROLE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">ROLE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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

                                    <div class="tab-pane fade" id="dutytype">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ADD NEW DUTY TYPE</h4>
                                                    <div class="form-group" id="AddDutyTypeDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewDutyTypeListDiv">                                                        
                                                           <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">DUTY TYPE LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD DUTY TYPE" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">                                                          
                                                            <asp:GridView ID="DutyTypeListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>
                                                                    <%-- <asp:BoundField DataField="ISProcessStatus" HeaderText="ProcessStatus" SortExpression="ISProcessStatus">
                                <HeaderStyle CssClass="show" HorizontalAlign="Left" />
                                <ItemStyle CssClass="show" HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditDutyTypeDiv">
                                                        <h4>EDIT DUTY TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewDutyTypeDiv">
                                                        <h4>VIEW DUTY TYPE</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">START TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">END TIME (HH:MM AM/PM)</label>
                                                                    <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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

                                    <div class="tab-pane fade" id="patientplan">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ADD NEW PATIENT PLAN</h4>
                                                    <div class="form-group" id="AddPatientPlanDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewPatientPlanListDiv">                                                       
                                                           <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">PATIENT PLAN LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT PLAN" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                           
                                                            <asp:GridView ID="PatientPlanListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditPatientPlanDiv">
                                                        <h4>EDIT PATIENT PLAN</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewPatientPlanDiv">
                                                        <h4>VIEW PATIENT PLAN</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">PATIENT PLAN</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">PLAN MAXIMUM MEMBER</label>
                                                                    <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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

                                    <div class="tab-pane fade" id="assigningnurseduty">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <hr />
                                                    <h4>ASSIGN NURSE DUTY</h4>
                                                    <div class="form-group" id="AssignNurseDutyDiv">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT NURSE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">SELECT DUTY TYPE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">COMMENT</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="Proceed" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewNurseDutyListDiv">                                                      
                                                         <div class="form-group">
                                                            <div class="row form-group">
                                                                <div class="col-md-6 text-left">
                                                                    <h4 class="text-left">ASSIGNED NURSE DUTY LIST</h4>
                                                                </div>
                                                                <div class="col-md-6 text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ASSIGN NEW NURSE DUTY" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            
                                                            <asp:GridView ID="NurseDutyListGridView" runat="server" AutoGenerateColumns="false" CssClass="table  table-bordered " DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID">
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
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Process Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#GetIsProcessStatus(Convert.ToBoolean(Eval("IsProcessing")))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivered Status">
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
                                                    <hr />
                                                    <div class="form-group" id="EditNurseDutyDiv">
                                                        <h4>EDIT NURSE DUTY</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">NURSE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE</label>
                                                                    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">COMMENT</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-primary right" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="form-group" id="ViewNurseDutyDiv">
                                                        <h4>VIEW ASSIGNED NURSE DUTY</h4>
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label class="control-label">NURSE NAME</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DUTY TYPE</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">DESCRIPTION</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label">COMMENT</label>
                                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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

