<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Pages_login" %>

<%@ Register Src="~/Controls/ResponseAlert.ascx" TagPrefix="uc1" TagName="ResponseAlert" %>


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
    <title>HMS Portal</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/sweetalert/sweetalert.css" rel="stylesheet" />
   
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     style=" background-image: url('../img/background.jpg');"   <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body >
    <form id="form1" runat="server">
        <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>Email: </strong>softechhms@gmail.com
                    &nbsp;&nbsp;
                    <strong>Support: </strong>+234-807-053-6458
                </div>

            </div>
        </div>
    </header>
    <!-- HEADER END-->
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
           <div class="navbar-header">
               <%-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>--%>
                  <%--<a class="navbar-brand login-icon" href="../index.html">
                    <img src="../assets/img/logo.png" width="50%" />
                </a>
               <a class="navbar-brand" href="../index.html">
                    <img src="../assets/img/logo.png" width="50%" />
                </a>--%>
                <a class="loginnavbar-brand" href="../index.html">
                    <img src="../assets/img/logo.png" /></a>
            </div>

           <div class="left-div">
              
                <%--<i class="fa fa-sign-in login-icon" ></i>--%>
        </div>
            </div>
        </div>
    <!-- LOGO HEADER END-->
   
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Please Login To Enter </h4>

                </div>

            </div>
             <div class="row">
                <div class="col-md-12">
                    <uc1:ResponseAlert runat="server" ID="ResponseAlert" />

                </div>
            </div>
            <div class="row">
                <div class="col-md-3" >

                </div>
                <div class="col-md-6">
                   <hr />
                     <h4 style="color:white"> Login with <strong>HMS Portal Account  :</strong></h4>
                    <br />
                     <label style="color:white">Enter UserName : </label>
                        <input type="text" class="form-control"  runat="server" id="usernametextbox" />
                        <label style="color:white">Enter Password :  </label>
                        <input type="password" class="form-control"  runat="server" id="passwordtextbox" />
                        <hr />
                    <div class="row text-center">
 <asp:Button runat="server" ID="LoginButton" OnClick="LoginButton_Click" CssClass="btn btn-info" Text="Log Me In" />
                  
                    </div>
                       <%-- <a href="./dashboard.aspx" class="btn btn-info"><span class="glyphicon glyphicon-user"></span> &nbsp; </a>&nbsp;--%>
                    <hr />
                   </div>
               
                <div class="col-md-3" >

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
        <!-- scripit init-->
         <script src="../assets/js/sweetalert/sweetalert.min.js"></script>
        <script src="../assets/js/sweetalert/sweetalert.init.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="../assets/js/bootstrap.js"></script>
    </form>
</body>
</html>
