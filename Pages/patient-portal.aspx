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
                            <li  runat="server" id="dashboard" ><a href="./dashboard.aspx">Dashboard</a></li>
                            <li  runat="server" id="patientsportal" ><a class="menu-top-active" href="./patient-portal.aspx">Patient's Portal</a></li>
                            <li  runat="server" id="nursesportal" ><a href="./nurse-portal.aspx">Nurse's Portal</a></li>
                            <li  runat="server" id="doctorsportal" ><a href="./doctors-portal.aspx">Doctor's Portal</a></li>
                            <li  runat="server" id="adminportal" ><a href="./admin-portal.aspx">Admin Portal</a></li>

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
                                        <asp:LinkButton runat="server"  ID="PatientDivNav" Text="PATIENT MANAGEMENT" OnClick="PatientDivNav_Click" ></asp:LinkButton>
                                    </li>
                                    <li class="" runat="server" id="familyplanli"><%--<a href="#familyplan" data-toggle="tab">FAMILY PLAN MANAGEMENT</a>--%>
                                        <asp:LinkButton runat="server"  ID="FamilyPlanDivNav" Text="FAMILY PLAN MANAGEMENT" OnClick="FamilyPlanDivNav_Click" ></asp:LinkButton>
                                    </li>
                                    <li class="" runat="server" id="consultationli"><%--<a href="#consultation" data-toggle="tab">CONSULTATION</a>--%>
                                        <asp:LinkButton runat="server"  ID="ConsultationDivNav" Text="CONSULTATION" OnClick="ConsultationDivNav_Click"></asp:LinkButton>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <asp:DropDownList runat="server" ID="Addpatientplantypelistddl" CssClass="form-control" ></asp:DropDownList>
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
                                                                    <asp:Button runat="server" CssClass="btn btn-default btn-primary text-right" Text="ADD NEW PATIENT" /></div>
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
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="View" ID="ViewUserBtn"   CssClass="btn btn-sm btn-primary" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Edit" ID="EditUserBtn" CssClass="btn btn-sm btn-warning" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text="Delete" ID="DeleteUserBtn" CssClass="btn btn-sm btn-danger" />
                                                                                <asp:Button runat="server" CommandArgument='<%# Eval("PatientID") %>' Text='<%# (Convert.ToBoolean(Eval("IsActive")) == true  ? "Deactivate" : "Activate") %>' ID="UserActivatioButton" CssClass='<%#(Convert.ToBoolean(Eval("IsActive")) == true  ? "btn btn-sm btn-danger" : "btn btn-sm btn-success") %>'  />
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                            --%></div>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                                                    <asp:Image runat="server" CssClass="img-thumbnail" ImageUrl="../assets/img/dummypicture.png"/>
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
                                        <h4>Messages Tab</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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

