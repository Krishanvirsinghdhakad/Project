<%-- 
    Document   : loginerror
    Created on : Jul 20, 2019, 10:47:27 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>

<%@include file="includes/header.jsp" %>


    
<!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Error</li>
    </ol>
</div>
<!-- end Breadcrumb -->
<br/>
<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div class="col-md-8">
                <div id="page-main">
                    <section id="contact">
                        <div class="image">
                            <img src="assets/alumni/img/not.jpg" alt="Not approved" width="" height=""/>
                        </div>
                        <br>
                        <div class="alert alert-danger" role="alert">
                            <b>Error !</b> Your account hasn't been approved yet ! Please try again later.
                        </div>              
                    </section>
                    
                </div><!-- /#page-main -->
            </div><!-- /.col-md-8 -->

            
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->
        <!-- end Page Content -->


<%@include file="includes/footer.jsp" %>