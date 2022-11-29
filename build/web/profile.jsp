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
        String uni_id = "", status = "";
        Connection conn4 = DB.getConnection();
        Statement st4 = conn4.createStatement();
        
        ResultSet rs4,rs55;  
        rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");
        
        while (rs4.next()){
                status = rs4.getString("status");
                int s = Integer.parseInt(status);
            if (s == 0){
                response.sendRedirect("loginerror.jsp");

            } else {
%>
<%
    Statement st55 = conn4.createStatement();
    rs55 = st55.executeQuery("select * from tbl_education where uni_id="+session.getAttribute("uni_id"));
%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

<script type="text/javascript">
	
	function showAjaxModal(url)
	{
		// Showing ajax perloader image
		//jQuery('#modal_ajax .modal-body').html('<div style="text-align:center;margin-top:200px;"><img src="assets/images/preloader.gif" /></div>');

		// Loading the ajax modal
		jQuery('#modal_ajax').modal('show', {backdrop: 'true'});

		//Show ajax response on request success
		$.ajax({
			url: url,
			success: function(response)
			{
				jQuery('#modal_ajax .modal-body').html(response);
			}
		});
	}
        
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
        

</script>

<style>
    .file-upload {
        position: relative;
        display: inline-block;
    }
    
    .file-upload__label {
        display: block;
        padding: 1em 2em;
        color: #fff;
        background: #222;
        transition: background .3s;
        cursor: pointer;
    }
    
    .file-upload__input {
        position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        
        width: 0;
        height: 100%;
        opacity: 0;
    }
    
    .btn{
        opacity: 0.9;
    }
    
    .author-block .paragraph-wrapper header {
        font-size: 18px;
        margin-bottom: 0;
        line-height: 8px;
    }
    
</style>

<!-- Ajax modal -->
<div class="modal fade" id="modal_ajax">
	<div class="modal-dialog">
		<div class="modal-content" style="margin-top: 22%;">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" align="center">Mbstu | Alumni</h4>
			</div>

			<div class="modal-body" style="height:420px; overflow:auto;">
                            <form class="form-horizontal form-bordered" data-parsley-validate="true" enctype="multipart/form-data" method="post" action="/../alumni/profileImage" accept-charset="utf-8">
                                
                                    <% 
                                        String file2 = ""; String id = "";
                                        Connection connn3 = DB.getConnection();
                                        Statement sta3 = connn3.createStatement();
                                        ResultSet rst3;  
                                        rst3 = sta3.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rst3.next()){
                                            file2 = rst3.getString("file");
                                            id = rst3.getString("uni_id");
                                            
                                            if(!file2.equals("")){
                                    %>
                                    
                                   

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3">Preview</label>
                                    <div class="col-md-9 col-sm-9">
                                        <img width="50%" src="profile_images/<%= file2 %>" alt="" class="media-object">
                                    </div>
                            </div> 
                                   
                                    <% } else { %>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3">Preview</label>
                                            <div class="col-md-9 col-sm-9">
                                                <div class="well well-sm m-b-15" align="center">
                                                    No Preview Available ! Please upload a profile picture.
                                                </div>
                                            </div>
                                        </div> 
                                   
                                    <% } %>
                                    
                            <input type="hidden" name="id" value="<%= id %>">    
                            <div class="form-group">
                                <label class="col-md-3 control-label">Image</label>
                                <div class="col-md-9 col-sm-9">
                                        <div class="well well-sm m-b-15" align="center">
                                            Select an image of the dimension 160 × 160
                                        </div>
                                    
                                        <div class="file-upload">
                                            <label for="upload" class="file-upload__label"><i class="fa fa-plus"></i> Add image</label>
                                            <input id="upload" data-parsley-required="true" class="file-upload__input" type="file" name="file">
                                        </div>
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3"></label>
                                <div class="col-md-9 col-sm-9">
                                    <button type="submit" class="btn">Save</button>
                                </div>
                            </div>
                        <% } %>         
                        </form>
                    </div>

		</div>
	</div>
</div>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="">Alumni</a></li>
        <li class="active">Profile Details</li>
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
                        <header><h1>Profile Details</h1></header>
                        						                        <div class="author-block member-detail">
                                                    <figure class="author-picture">
                                                        
                                <% 
                                        String file = "";
                                        Connection connn2 = DB.getConnection();
                                        Statement sta2 = connn2.createStatement();
                                        ResultSet rst2;  
                                        rst2 = sta2.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rst2.next()){
                                            file = rst2.getString("file");
                                            
                                            if(!file.equals("")){
                                    %>
                                                        
                                    <img src="profile_images/<%= file %>" alt="Profile Picture" style="width:165px; height: 200px">
                                                        								<a style="margin-top: 7%" onclick="showAjaxModal('url');" href="javascript:;" class="btn btn-framed btn-block"> <i class="fa fa-image"> Change Image</i></a>
                                                                                                                                                           <% } else { %>
                                                                                                                                                                       <img src="profile_images/noprofile.png" alt="">
                                                        								<a style="margin-top: 7%" onclick="showAjaxModal('url');" href="javascript:;" class="btn btn-framed btn-block"> <i class="fa fa-image"> Upload Image</i></a>
                                                                                                                                                           <% } } %>
							                            
                                                    </figure>
                            <article class="paragraph-wrapper">
                                <div class="inner">
                                    
                                    <% 
                                        String status5 = "";
                                        Connection connn = DB.getConnection();
                                        Statement stt = connn.createStatement();
                                        ResultSet rss;  
                                        rss = stt.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rss.next()){
                                            status5 = rss.getString("status");
                                            int s2  = Integer.parseInt(status5);
                                    %>
                                    
                                    <%
    if(s2 == 0){
%>
<span class="label label-primary" style="padding: 4px 10px;font-size: 12px; line-height: 24px;">Running Student </span>
<%
    } else if(s2 == 1){
%>
<span class="label label-primary" style="padding: 4px 12px;font-size: 13px; line-height: 25px;">Alumnus </span>
<%
    } }
%>
                                            
                                    
                                    <header>
                                                        
                                        
                                    <% 
                                        String name = "";
                                        Connection conn = DB.getConnection();
                                        Statement st = conn.createStatement();
                                        ResultSet rs;  
                                        rs = st.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs.next()){
                                            name = rs.getString("name");
               
                                    %>
                                        
                                    <br><h2><%= name %></h2>
                                    <% } %>
                                    
              
                                                                            <a href="addprofileinfo.jsp" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit Profile</i>
                                        </a>
                                    
                                   
                                    </header>
                                    <hr>
                                    
                                    <% 
                                        String activity = "", hometown = "", current_city = "";
                                        Connection conn2 = DB.getConnection();
                                        Statement st2 = conn2.createStatement();
                                        ResultSet rs2;  
                                        rs2 = st2.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs2.next()){
                                            activity     = rs2.getString("activity");
                                            hometown     = rs2.getString("hometown");
                                            current_city = rs2.getString("current_city");
               
                                    %>
                                    
                                        <% if(!activity.equals("")){ %>
                                    
                                    <p class="quote" style="font-style: normal;" ><i class="fa fa-university" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Activity"></i>
                                         <%= activity %>                                    
                                    </p>
                                        <% } else { %>
                                    
                                    <p class="quote" style="font-style: normal;" ><i class="fa fa-university" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Activity"></i>
                                    <a href="addprofileinfo.jsp" target="_blank">
                                        Add your activity                                                      `                                   </a>
                                    </p>
                                        <% } %>
                                       
                                       <% if(!hometown.equals("")){ %>
                                       
                                    <div style="float:left;">
                                    <p class="quote" style="font-style: normal; float: left" ><i class="fa fa-compass" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Hometown"></i>
                                         From <%= hometown %>  
                                    </p>
                                        <% } else { %>
                                    
                                        <p class="quote" style="font-style: normal; float: left" ><i class="fa fa-plus-circle" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Hometown"></i>
                                            <a href="addprofileinfo.jsp" style="filter: none;" target="_blank">
                                        Add hometown                                                      `                                            </a>
                                    </p>
                                        <% } %>
                                    
                                    <p class="quote" style="font-style: normal; float: left; margin-left: 55px;" ><i class="fa fa-user" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Profile Views"></i>
                                         1520 views
                                    </p>
                                    
                                    <% if(!current_city.equals("")){ %>
                                    
                                    <p class="quote" style="font-style: normal; float: right; margin-left: 60px;" ><i class="fa fa-map-marker" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Current City"></i>
                                         Lives in <%= current_city %>
                                    </p>
                                    
                                    <% } else { %>
                                    
                                    <p class="quote" style="font-style: normal; float: right; margin-left: 60px;" ><i class="fa fa-map-marker" data-toggle="tooltip" data-placement="right" style="color: #385898;" title="Current City"></i>                     <a href="addprofileinfo.jsp" target="_blank">
                                        Add current city                                                      `                                            </a>
                                    </p>
                                        <% } %>
                                    
                                    </div>
                                    
                                    <% } %>
                                    
                                    <br>
                                    <hr>
                                    <div class="contact">
                                        
                                       <strong>Social Links</strong>
                                        <div class="icons">
                                            
                                    <% 
                                        String facebook = "", linkedin = "", twitter = "", website = "";
                                        Connection conn3 = DB.getConnection();
                                        Statement st3 = conn3.createStatement();
                                        ResultSet rs3;  
                                        rs3 = st3.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs3.next()){
                                            facebook = rs3.getString("facebook");
                                            linkedin = rs3.getString("linkedin");
                                            twitter  = rs3.getString("twitter");
                                            website  = rs3.getString("website");
               
                                    %>    
                                            
                                            <% if(!facebook.equals("")){ %>
                                                                                                                                                               <a href="<%= facebook %>" target="_blank">
                                                                                                              
                                                    <i class="fa fa-facebook" data-toggle="tooltip" data-placement="left" title="Facebook" style="color: #3b5998"></i>
                                                    
                                                </a>
                                            <% } else { %>
                                                
                                                <a href="addprofileinfo.jsp" target="_blank">
                                                                                                              
                                                    <i class="fa fa-plus-square" data-toggle="tooltip" data-placement="left" title="Facebook" style="color: #3b5998"></i>
                                                    
                                                </a>
                                            
                                            <% } %>
                                            
                                            
                                            <% if(!linkedin.equals("")){ %>
                                            
                                            <a href="<%= linkedin %>" target="_blank">
                                                <i class="fa fa-linkedin" data-toggle="tooltip" data-placement="bottom" title="Linkedin" style="color: #007bb5"></i>
                                            </a>
                                                
                                            <% } else { %>
                                            
                                            <a href="addprofileinfo.jsp" target="_blank">
                                                <i class="fa fa-plus-square" data-toggle="tooltip" data-placement="bottom" title="Linkedin" style="color: #007bb5"></i>
                                            </a>
                                            
                                            <% } %>
                                            
                                            <% if(!twitter.equals("")){ %>
                                            
                                            <a href="<%= twitter %>" target="_blank">
                                                <i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="bottom" title="Twitter" style="color: #1494f6"></i>
                                            </a>
                                                
                                            <% } else { %>
                                             
                                            <a href="addprofileinfo.jsp" target="_blank">
                                                <i class="fa fa-plus-square" data-toggle="tooltip" data-placement="bottom" title="Twitter" style="color: #1494f6"></i>
                                            </a>
                                            
                                            <% } %>
                                            
                                            <% if(!website.equals("")){ %>
                                            
                                            <a href="<%= website %>" target="_blank">
                                                <i class="fa fa-globe" data-toggle="tooltip" data-placement="right" title="Website" style="color: #607D8B"></i>
                                            </a>
                                            
                                            <% } else { %>
                                            
                                            <a href="addprofileinfo.jsp" target="_blank">
                                                <i class="fa fa-plus-square" data-toggle="tooltip" data-placement="right" title="Website" style="color: #607D8B"></i>
                                            </a>
                                            
                                            <% } %>
                                        <% } %>    
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
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Basic Information</h3> <a style="margin-top: -34px;" href="addprofileinfo.jsp" class="btn btn-framed pull-right">
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
                                            
<%
    
    String departmentId = "", batchId = "";
    Connection conn5 = DB.getConnection();
    Statement st5 = conn5.createStatement();

    ResultSet rs5 = st5.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");
    while (rs5.next()) {
        departmentId = rs5.getString("departmentId");
        batchId      = rs5.getString("batchId");
        
%>
                                            
                                                <tr>
                                                    <td class="course-title">Department</td>
<%
    
    String departmentName = "";
    Connection conn6 = DB.getConnection();
    Statement st6 = conn6.createStatement();

    ResultSet rs6 = st6.executeQuery("SELECT * from tbl_department where departmentId = '" + departmentId + "'");
    if (rs6.next()) {
        departmentName = rs6.getString("departmentName");

%>
                                                    <td>
                                                        <%= departmentName %>                                                                                      </td>
 <% } %>                                                    
                                                </tr>
                                                <tr>
                                                    <td class="course-title">Batch</td>
<%
    String batchName = "";
    Connection conn7 = DB.getConnection();
    Statement st7 = conn7.createStatement();

    ResultSet rs7 = st7.executeQuery("SELECT * from tbl_batch where batchId = '" + batchId + "'");
    if (rs7.next()) {
        batchName = rs7.getString("batchName");
%>
                                                    <td>
                                                        <%= batchName %> 
                                                    </td>
<% } %> 
                                                </tr>
<% } %>         
                                                                                               
                                                <tr>
                                                    <td class="course-title">ID</td>
                                                    <td>
                                                        <%= session.getAttribute("uni_id") %>
                                                    </td>
                                                </tr>
                                                
                                    <% 
                                        String Session = "", year = "", semester = "", stat = "";
                                        Connection conn8 = DB.getConnection();
                                        Statement st8 = conn8.createStatement();
                                        ResultSet rs8;  
                                        rs8 = st8.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs8.next()){
                                            Session  = rs8.getString("session");
                                            year     = rs8.getString("year");
                                            semester = rs8.getString("semester");
                                            
                                            stat = rs8.getString("status");
                                            int sta = Integer.parseInt(stat);
                                            
                                    %>
                                                
                                                <tr>
                                                    <td class="course-title">Session</td>
                                        <% if(!Session.equals("")){ %>            
                                                    <td>
                                                        <%= Session %>
                                                    </td>
                                                    
                                        <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add your session</a>
                                                    </td>
                                        <% } %>
                                                </tr>
                                                
                                            <% 
                                                if(sta != 0)
                                                    continue; 
                                            %>    
                                                <tr>
                                                    <td class="course-title">Current Year</td>
                                        <% if(!year.equals("")){ %> 
                                                    <td>
                                                        <%= year %>
                                                    </td>
                                                    
                                        <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add current year</a>
                                                    </td>
                                        <% } %>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Current Semester</td>
                                        <% if(!semester.equals("")){ %> 
                                                    <td>
                                                        <%= semester %>
                                                    </td>
                                                    
                                        <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add running semester</a>
                                                    </td>
                                        <% } %>
                                                </tr>
                                                
                                    <% } %>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Contact Information</h3><a style="margin-top: -34px;" href="addprofileinfo.jsp" class="btn btn-framed pull-right">
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
                                    <% 
                                        String email = "", mobile = "";
                                        Connection conn9 = DB.getConnection();
                                        Statement st9 = conn9.createStatement();
                                        ResultSet rs9;  
                                        rs9 = st9.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs9.next()){
                                            email  = rs9.getString("email");
                                            mobile = rs9.getString("mobile");
                                            
                                    %>   
                                                <tr>
                                                    <td class="course-title">Mobile Number</td>
                                       
                                                    <td>
                                                        <%= mobile %>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Email</td>
                                       
                                                    <td>
                                                        <%= email %>
                                                    </td>
                                                    
                                                </tr>
                                    <% } %>  
                                    
                                    <% 
                                        String present = "", permanent = "";
                                        Connection conn10 = DB.getConnection();
                                        Statement st10 = conn10.createStatement();
                                        ResultSet rs10;  
                                        rs10 = st10.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs10.next()){
                                            present   = rs10.getString("present");
                                            permanent = rs10.getString("permanent");
                                            
                                    %>
                                    
                                                <tr>
                                                    <td class="course-title">Present Address</td>
                                                <% if(!present.equals("")){ %> 
                                                    <td>
                                                        <%= present %>
                                                    </td>
                                                <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add present address</a>
                                                    </td>
                                                <% } %>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Permanent Address</td>
                                                <% if(!permanent.equals("")){ %> 
                                                    <td>
                                                        <%= permanent %>                                           
                                                    </td>
                                                <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add permanent address</a>
                                                    </td>
                                                <% } %>
                                                </tr>
                                    
                                    <% } %>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Details</h3><a style="margin-top: -34px;" href="addprofileinfo.jsp" class="btn btn-framed pull-right">
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
                                                
                                    <% 
                                        String profession = "", job = "";
                                        Connection conn11 = DB.getConnection();
                                        Statement st11 = conn11.createStatement();
                                        ResultSet rs11;  
                                        rs11 = st11.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs11.next()){
                                            profession = rs11.getString("profession");
                                            job        = rs11.getString("job");
                                            
                                    %>
                                                
                                                <tr>
                                                    <td class="course-title">Profession</td>
                                                    <td>
                                                        <%= profession %>                                                                                          </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Job Position</td>
                                                    <td>
                                                        <%= job %>                                                                                          </td>
                                                </tr>
                                                
                                    <% } %>
                                    
                                    <% 
                                        String gender = "", blood = "", religion = "";
                                        Connection conn12 = DB.getConnection();
                                        Statement st12 = conn12.createStatement();
                                        ResultSet rs12;  
                                        rs12 = st12.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs12.next()){
                                            gender   = rs12.getString("gender");
                                            blood    = rs12.getString("blood");
                                            religion = rs12.getString("religion");
                                            
                                    %>
                                                
                                                <tr>
                                                    <td class="course-title">Gender</td>
                                                <% if(!gender.equals("")){ %> 
                                                    <td>
                                                        <%= gender %>                                           
                                                    </td>
                                                <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add your gender</a>
                                                    </td>
                                                <% } %>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Blood Group</td>
                                                <% if(!blood.equals("")){ %> 
                                                    <td>
                                                        <%= blood %>                                           
                                                    </td>
                                                <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add blood group</a>
                                                    </td>
                                                <% } %>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Religious Views</td>
                                                <% if(!religion.equals("")){ %> 
                                                    <td>
                                                        <%= religion %>                                           
                                                    </td>
                                                <% } else { %>
                                                    <td>
                                                        <a href="addprofileinfo.jsp" target="_blank">Add your religion</a>
                                                    </td>
                                                <% } %>
                                                </tr>
                                    <% } %> 
                                        
                                    <% 
                                        String dob = "";
                                        Connection conn13 = DB.getConnection();
                                        Statement st13 = conn13.createStatement();
                                        ResultSet rs13;  
                                        rs13 = st13.executeQuery("select DATE_FORMAT(dob, '%W %M %d, %Y') as 'dob' FROM tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs13.next()){
                                            dob   = rs13.getString("dob");
                                           
                                    %>
                                                
                                                
                                                <tr>
                                                    <td class="course-title">Birth Date</td>
                                                 
                                                    <td>
                                                        <%= dob %>                                           
                                                    </td>
                                                
                                                </tr>
                                                
                                    <% } %>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Educational Background</h3><a style="margin-top: -34px;" href="addprofileinfo.jsp" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"> Edit </i>
                                        </a>
                                    <div class="table-responsive">
                                        <table class="table course-list-table">
                                            <thead>
                                                <%
                                                    while(rs55.next()){
                                                %>
                                                <tr>
                                                    <th class="course-title">Course</th>
                                                    <th><%=rs55.getString("course")%></th>
                                                </tr>
                                                <tr>
                                                    <td class="course-title">Institute</td>
                                                    <td><%=rs55.getString("college_name")%></td>
                                                </tr>
                                                <% } %>
                                            </thead>
                                            <tbody>
                                    <% 
                                        String school = "", college = "", university = "", spy = "", hpy = "", bpy = "", muni = "", mpy = "";
                                        Connection conn14 = DB.getConnection();
                                        Statement st14 = conn14.createStatement();
                                        ResultSet rs14;  
                                        rs14 = st14.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs14.next()){
                                            school     = rs14.getString("school");
                                            college    = rs14.getString("college");
                                            university = rs14.getString("university");
                                            muni       = rs14.getString("muni");
                                            spy        = rs14.getString("spy");
                                            hpy        = rs14.getString("hpy");
                                            bpy        = rs14.getString("bpy");
                                            mpy        = rs14.getString("mpy");
                                            
                                            stat = rs14.getString("status");
                                            int sta = Integer.parseInt(stat);
                                            
                                    %>            
                                                <tr>
                                                    <td class="course-title">SSC</td>
                                                <% if(!school.equals("")){ %> 
                                                    
                                                    <td>
                                                        <i>School :</i> <%= school %> 
                                                    </td>
                                                    
                                                <% } else { %>
                                                    <td>
                                                        <i>School :</i> <a href="addprofileinfo.jsp" target="_blank">Add school</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                <% if(!spy.equals("")){ %> 
                                                    
                                                    <td style="border-top: 0px;width: 65%;">
                                                        <i>Passing Year :</i> <%= spy %>                                                                           </td>
                                                    
                                                <% } else { %>
                                                    <td style="border-top: 0px;width: 65%;">
                                                        <i>Passing Year :</i> <a href="addprofileinfo.jsp" target="_blank">Add passing year</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">HSC</td>
                                                    
                                                    <% if(!college.equals("")){ %> 
                                                    
                                                    <td>
                                                        <i>College :</i> <%= college %> 
                                                    </td>
                                                    
                                                <% } else { %>
                                                    <td>
                                                        <i>College :</i> <a href="addprofileinfo.jsp" target="_blank">Add college</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                <% if(!hpy.equals("")){ %> 
                                                    
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <%= hpy %>                                                                           </td>
                                                    
                                                <% } else { %>
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <a href="addprofileinfo.jsp" target="_blank">Add passing year</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                            <% 
                                                if(sta != 0)
                                                    continue; 
                                            %> 
                                                
                                                <tr>
                                                    <td class="course-title">BSc</td>
                                                    
                                                <% if(!university.equals("")){ %> 
                                                    
                                                    <td>
                                                        <i>University :</i> <%= university %> 
                                                    </td>
                                                    
                                                <% } else { %>
                                                    <td>
                                                        <i>University :</i> <a href="addprofileinfo.jsp" target="_blank">Add university</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                <% if(!bpy.equals("")){ %> 
                                                    
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <%= bpy %>                                                                           </td>
                                                    
                                                <% } else { %>
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <a href="addprofileinfo.jsp" target="_blank">Add passing year</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">MSc</td>
                                                    
                                                    <% if(!muni.equals("")){ %> 
                                                    
                                                    <td>
                                                        <i>University :</i> <%= muni %> 
                                                    </td>
                                                    
                                                <% } else { %>
                                                    <td>
                                                        <i>University :</i> <a href="addprofileinfo.jsp" target="_blank">Add university</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td style="border-top: 0px;" class="course-title"></td>
                                                    
                                                <% if(!mpy.equals("")){ %> 
                                                    
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <%= mpy %>                                                                           </td>
                                                    
                                                <% } else { %>
                                                    <td style="border-top: 0px;">
                                                        <i>Passing Year :</i> <a href="addprofileinfo.jsp" target="_blank">Add passing year</a>
                                                    </td>
                                                <% } %>
                                                    
                                                </tr>
                                    <% } %>           
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
