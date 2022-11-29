<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%@page import="com.java.DB"%>

<html lang="en-US">
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="t1m9m">
    <meta name="description" content="Alumni, Mbstu, University, Association">

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="assets/alumni/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/selectize.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/vanillabox/vanillabox.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/vanillabox/vanillabox.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/style.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/bootstrap-datepicker.css" type="text/css">

    <title>MBSTU | Alumni</title>

    <link href="uploads/logos/logo2.png" rel="icon" type="image/*">
    </head>

<body class="page-sub-page page-my-account">
    <!-- Wrapper -->
    <div class="wrapper">
        <!-- Header -->
        <div class="navigation-wrapper">
            <div class="secondary-navigation-wrapper">
    <div class="container">
        <div class="navigation-contact pull-left">
			Call Us:  
			<span class="opacity-70">000-123-456-789</span>
		</div>
        
        <%
            String getURL = request.getRequestURI();
        %>
        
        <ul class="secondary-navigation list-unstyled pull-right">
            <li>
<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){ 
%>
    
        <a href="login.jsp">
            <i class="fa fa-sign-in"></i>Login                       
        </a>
        
        <a href="login.jsp" style="margin-left: 12px;">
            <i class="fa fa-user-plus"></i>Registration                
        </a>
                        
<%
    } else {
%>
            
                <a href="profile.jsp">
                    <i class="fa fa-user"></i>My Profile                
                </a>
                <%
                    if(session.getAttribute("power").equals("ADMIN")){
                %>
                <% }else{ %>
                <a href="ChatBox.jsp" style="margin-left: 12px;">
                    <i class="fa fa-user-o"></i>Chat
                </a>
                <a href="ChatBox.jsp" style="margin-left: 12px;">
                    <i class="fa fa-book"></i>Donate
                </a>
                <% } %>
                <a href="logout.jsp" style="margin-left: 12px;">
                    <i class="fa fa-sign-out"></i>Logout                
                </a>
               
<% } %>
            </li>
        </ul>
    </div>
</div>
            <div class="primary-navigation-wrapper">
    <header class="navbar" id="top" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand nav" id="brand">
                    <a href="index.jsp">
                        <img width="80px" src="uploads/logos/logo7.jpeg" alt="MBSTU">
                    </a>
                </div>
            </div>
            <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                <ul class="nav navbar-nav">
                    
                    
                     <li <% if(getURL.equals("/alumni/index.jsp") || getURL.equals("/alumni/")){ %>
                            class="active"
                        <% } %>>
                        <a href="index.jsp">
                            Home                        
                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/alumni.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="allalumni.jsp">
                            Alumni                        
                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/events.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="events.jsp">
                            Events                        
                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/news.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="news.jsp">
                            News                        
                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/gallery.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="gallery.jsp">
                            Gallery                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/volunteers.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="volunteers.jsp">
                            Volunteers                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/notices.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="notices.jsp">
                            Notice Board                        </a>
                    </li>
                    
                    <li <% if(getURL.equals("/alumni/contact_us.jsp")){ %>
                            class="active"
                        <% } %>>
                        <a href="contact_us.jsp">
                            Contact Us                        </a>
                    </li>
                    <li>
                        <a href="./admin/ADMIN.jsp">
                             <%
                                try{
                                    if(session.getAttribute("power").equals("ADMIN")){
                                        out.print("Admin");    
                                    }
                                    if(session.getAttribute("power").equals("ALUMNI")){
                                        out.print("Dashboard");    
                                    }
                                }catch(Exception ex){}
                                 
                             %>
                             
                        </a>                        
                    </li>
                </ul>
            </nav><!-- /.navbar collapse-->
        </div><!-- /.container -->
    </header><!-- /.navbar -->
</div><!-- /.primary-navigation -->
            <div class="background">
                <img src="assets/alumni/img/background-city.png"  alt="background">
            </div>
        </div>
        <!-- end Header -->