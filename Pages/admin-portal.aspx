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
                    <h1 class="page-head-line">PATIENT'S PORTAL</h1>
                </div>
            </div>
            <uc1:ResponseAlert runat="server" ID="ResponseAlert" />
            <div class="row">
                <div class="col-md-12"><%--aria-hidden="true"--%>
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span >&times;</span></button>
                        This is a simple admin template that can be used for your small project or may be large projects. This is free for personal and commercial use.
                    </div>
                </div>
            </div>
            <div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Basic Tabs
                            </div>
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#home" data-toggle="tab">Add Patient</a>
                                    </li>
                                    <li class=""><a href="#profile" data-toggle="tab">Profile</a>
                                    </li>
                                    <li class=""><a href="#role" data-toggle="tab">Role</a>
                                    </li>
                                    <li class=""><a href="#settings" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="home">
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
                                                        <h4>ROLE LIST</h4>
                                                        <div class="table-responsive">
                                                            <div class="form-group text-right">
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary" Text="ADD NEW ROLE" />
                                                                </div>
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

                                    <div class="tab-pane show" id="settings">
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
                              Please look <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap.com</a> fr more snippets and usage.
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
</asp:Content>

