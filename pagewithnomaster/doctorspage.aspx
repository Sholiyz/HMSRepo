<%@ Page Language="C#" AutoEventWireup="true" CodeFile="doctorspage.aspx.cs" Inherits="Pages_doctorspage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>HMS Doctor's Portal</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <strong>Email: </strong>info@yourdomain.com
                    &nbsp;&nbsp;
                    <strong>Support: </strong>+90-897-678-44
                    </div>

                </div>
            </div>
        </header>
        <!-- HEADER END-->
        <div class="navbar navbar-inverse set-radius-zero">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">

                        <img src="../assets/img/logo.png" />
                    </a>

                </div>

                <div class="left-div">
                    <div class="user-settings-wrapper">
                        <ul class="nav">

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                    <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                                </a>
                                <div class="dropdown-menu dropdown-settings">
                                    <div class="media">
                                        <a class="media-left" href="#">
                                            <img src="../assets/img/64-64.jpg" alt="" class="img-rounded" />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">Jhon Deo Alex </h4>
                                            <h5>Developer & Designer</h5>

                                        </div>
                                    </div>
                                    <hr />
                                    <h5><strong>Personal Bio : </strong></h5>
                                    Anim pariatur cliche reprehen derit.
                                <hr />
                                    <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a href="login.html" class="btn btn-danger btn-sm">Logout</a>

                                </div>
                            </li>


                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- LOGO HEADER END-->
        <section class="menu-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a href="./index.aspx">Dashboard</a></li>
                                <li><a href="./patientform.aspx">Patient's Portal</a></li>
                                <li><a href="nursepage.aspx">Nurse's Portal</a></li>
                                <li><a class="menu-top-active" href="./doctorspage.aspx">Doctor's Portal</a></li>                            
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Doctor'S PORTAL</h1>
                    </div>
                </div>
                <div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <%--<div class="panel-heading">
                                  Nurse Portal  
                                </div>--%>
                                <div class="panel-body">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#home" data-toggle="tab">Add Nurse</a>
                                        </li>
                                        <li class=""><a href="#profile" data-toggle="tab">View Nurse</a>
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
                                        <div class="tab-pane fade active in" id="home">
                                            <h4>Add New Nurse</h4>
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
                                            <h4>Profile Tab</h4>
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
                        <div class="col-md-6">

                            <!--  Modals-->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Modals Example
                                </div>
                                <div class="panel-body">
                                    <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Click  Launch Demo Modal
                                    </a>
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                                </div>
                                                <div class="modal-body">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Modals-->

                        </div>
                        <div class="col-md-6">

                            <div class="alert alert-info">
                                <strong>ALERT EXAMPLE :</strong> This is an alert example . You can use differnt classes like alert-success, alert-warning,etc. 
                              Please look <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap.com</a> fr more snippets and usage.
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        &copy; 2017 HMS | By : <a href="http://www.devgroupnet.com/" target="_blank">Devgroupnet</a>
                    </div>

                </div>
            </div>
        </footer>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY SCRIPTS -->
        <script src="../assets/js/jquery-1.11.1.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="../assets/js/bootstrap.js"></script>
    </form>


</body>
</html>
