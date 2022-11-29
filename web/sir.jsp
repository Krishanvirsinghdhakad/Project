<%-- 
    Document   : sir
    Created on : Nov 13, 2019, 12:23:35 AM
    Author     : singdho
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="com.java.DB"%>
<%@include file="includes/header.jsp" %>

<style>
    #page-footer {
        display: contents;
        height: 1px;
}
</style>

<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){ 
%>
    <script type="text/javascript">
        alert("You aren't logged in ! Please log in to continue.");
        window.location = "login.jsp";
    </script>
<%
    } else {
%>

<% 
        Class.forName("com.mysql.jdbc.Driver");
        String uni_id = "", status = "";
        Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
        Statement st4 = conn4.createStatement();
        ResultSet rs4;  
        rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");
        
        while (rs4.next()){
                status = rs4.getString("status");
                int s = Integer.parseInt(status);
            if (s == 0){
                response.sendRedirect("loginerror.jsp");

            } else {
%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>


        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="">Teachers</a></li>
        <li class="active">Teacher Profile</li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div class="col-md-8">
                <div id="page-main">
                    <section id="members">
                        <header><h1>Teacher Details</h1></header>
                        						                        <div class="author-block member-detail">
                                                    <figure class="author-picture">
                                                        
                                
                                                        
							                                                                                                            <img src="event_images/nazrul_sir.jpg" alt="">
                                                        								<a style="margin-top: 7%" href="javascript:;" class="btn btn-framed btn-block"> <i class="fa fa-image"> Upload Image</i></a>
                                                                                                                                                           
							                            
                                                    </figure>
                            <article class="paragraph-wrapper">
                                <div class="inner">
                                    
                                    <header>
                                    
                                        
                                        <h2>Nazrul Islam</h2>
                                    
                                                                            <a href="" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil">Edit Profile</i>
                                        </a>
                                    </header>
                                    <hr>
                                    
                                    
                                    
                                        
                                   
                                    <p class="quote" style="font-style: normal;" ><i class="fa fa-university" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Activity"></i>
                                        <b>Assistant Professor</b> at Information and Communication Technology, MBSTU
                                    </p>
                                        
                                       
                                    <div style="float:left;">
                                    <p class="quote" style="font-style: normal; float: left" ><i class="fa fa-compass" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Hometown"></i>
                                         From Gazipur
                                    </p>
                                        
                                        
                                    
                                    <p class="quote" style="font-style: normal; float: left; margin-left: 55px;" ><i class="fa fa-user" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Profile Views"></i>
                                         22000 views
                                    </p>
                                    
                                    
                                    <p class="quote" style="font-style: normal; float: right; margin-left: 60px;" ><i class="fa fa-map-marker" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Current City"></i>
                                         Lives in Tangail
                                    </p>
                                    
                                    </div>
                                    
                                    
                                    <br>
                                    <hr>
                                    <div class="contact">
                                        
                                       <strong>Social Links</strong>
                                        <div class="icons">
                                            
                                      
                                                                                                                                                         <a href="" target="_blank">
                                                                                                              
                                                    <i class="fa fa-facebook" data-toggle="tooltip" data-placement="left" title="Facebook" style="color: #3b5998"></i>
                                                    
                                                </a>
                                            
                                                
                                            
                                            <a href="" target="_blank">
                                                <i class="fa fa-linkedin" data-toggle="tooltip" data-placement="bottom" title="Linkedin" style="color: #007bb5"></i>
                                            </a>
                                                
                                            
                                            
                                            <a href="" target="_blank">
                                                <i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="bottom" title="Twitter" style="color: #1494f6"></i>
                                            </a>
                                                
                                            
                                            
                                            <a href="" target="_blank">
                                                <i class="fa fa-globe" data-toggle="tooltip" data-placement="right" title="Website" style="color: #607D8B"></i>
                                            </a>
                                            
                                            
                                           
                                             
                                        </div><!-- /.icons -->
                                        
                                    </div>
                                    
                                    <div class="contact">
                                        <strong>Actions</strong>
                                        <div class="icons">
                                                                                                                                                           <a href="https://www.linkedin.com/in/t1m9m/" target="_blank">
                                                <i class="fa fa-comments" data-toggle="tooltip" data-placement="left" title="Send Message" style="color:lightseagreen"></i>
                                            </a>                                  
                                            
                                            <a href="https://www.linkedin.com/in/t1m9m/" target="_blank">
                                                <i class="fa fa-envelope-open" data-toggle="tooltip" data-placement="bottom" title="Send Email" style="color:lightseagreen"></i>
                                            </a>
                                            
                                            <a href="https://www.linkedin.com/in/t1m9m/" target="_blank">
                                                <i class="fa fa-send" data-toggle="tooltip" data-placement="right" title="Send SMS" style="color:lightseagreen"></i>
                                            </a>
                                        </div><!-- /.icons -->
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Basic Information</h3> <a style="margin-top: -34px;" href="" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit </i>
                                        </a>
                                    <div class="table-responsive">
                                        <table class="table course-list-table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <tr>
                                                    <td class="course-title">Institution</td>

                                                    <td>Mawlana Bhashani Science and Technology University</td>
                             </tr>

                                            
                                                <tr>
                                                    <td class="course-title">Department</td>

                                                    <td>Information and Communication Technology</td>
                             </tr>
                                                <tr>
                                                    <td class="course-title">Batch</td>

                                                    <td>
                                                        1st
                                                    </td>

                                                </tr> 
                                                
                                                <tr>
                                                    <td class="course-title">Session</td>

                                                    <td></td>
                                                </tr>
                                                                                               
                                                                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Contact Information</h3><a style="margin-top: -34px;" href="" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit </i>
                                        </a>
                                    <div class="table-responsive">
                                        <table class="table course-list-table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        <tr>
                                                    <td class="course-title">Mobile Number</td>
                                       
                                                    <td>
                                                        01721259140
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Email</td>
                                       
                                                    <td>
                                                        nazrul.mbstu@gmail.com
                                                    </td>
                                                    
                                                </tr>
                                    
                                    
                                                <tr>
                                                    <td class="course-title">Present Address</td>
                                                
                                                    <td>
                                                        Tangail
                                                    </td>
                                                
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Permanent Address</td>
                                                 
                                                    <td>
                                                        Gazipur
                                                    </td>
                                                
                                                </tr>
                                    
                                    
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Details Information</h3><a style="margin-top: -34px;" href="" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit </i>
                                        </a>
                                    <div class="table-responsive">
                                        <table class="table course-list-table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        <tr>
                                                    <td class="course-title">Gender</td>
                                       
                                                    <td>
                                                        male
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Blood Group</td>
                                       
                                                    <td>
                                                        
                                                    </td>
                                                    
                                                </tr>
                                    
                                    
                                                <tr>
                                                    <td class="course-title">Religious Views</td>
                                                
                                                    <td>
                                                        Islam
                                                    </td>
                                                
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Birth Date</td>
                                                 
                                                    <td>
                                                        
                                                    </td>
                                                
                                                </tr>
                                    
                                    
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Educational Background</h3><a style="margin-top: -34px;" href="" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit </i>
                                        </a>
                                    <div class="table-responsive">
                                        <table class="table course-list-table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <tr>
                                                    <td class="course-title">B.Sc</td>
                                                    
                                               
                                                    <td>
                                                        <i>University :</i> Mawlana Bhashani Science and Technology University

                                                    </td>
                                                    
                                                
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                
                                                    
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> 
                                                    </td>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">M.Sc</td>
                                                    
                                               
                                                    <td>
                                                        <i>University :</i> 
                                                    </td>
                                                    
                                                
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                
                                                    
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> 
                                                    </td>
                                                    
                                                </tr>
                                    
                                    
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                   
                                    
                                </div>
                            </article>
                                                </div><!-- /.author -->
                    </section>
                   
                </div><!-- /#page-main -->
                
            </div><!-- /.col-md-8 -->
            <%@include file="includes/sidebar.jsp" %>
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content
        <!-- end Page Content -->
        
<% } } } %>      
<%@include file="includes/footer.jsp" %>    
