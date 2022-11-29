<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@include file="includes/header.jsp" %>

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
        ResultSet rs4;  
        rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");
        
        while (rs4.next()){
                status = rs4.getString("status");
                int s = Integer.parseInt(status);
            if (s == 0){
                response.sendRedirect("loginerror.jsp");

            } else {
%>

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
    #msg{
        font-family: 'Raleway', sans-serif;
        font-size: 13px;
        color: #ea6645 ;
    }
    
    .toggle-password {
        float: right;
        margin-left: -17px;
        margin-top: -36px;
        position: relative;
        z-index: 2;
        margin-right: 13px;
    }

</style>

                                    <% 
                                        String status3 = "";
                                        Connection conn = DB.getConnection();
                                        Statement st = conn.createStatement();
                                        ResultSet rs;  
                                        rs = st.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs.next()){
                                            status3 = rs.getString("status");
                                            int s2  = Integer.parseInt(status3);
                                    %>
                                        

<!-- Ajax modal -->
<div class="modal fade" id="modal_ajax">
	<div class="modal-dialog">
		<div class="modal-content" style="margin-top: 22%;">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" align="center">Mbstu | Alumni</h4>
			</div>

			<div class="modal-body" style="height:250px; overflow:auto;">
                            <form class="form-horizontal form-bordered" action="updatestatus.jsp" data-parsley-validate="true" method="post" accept-charset="utf-8">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3">Current Status</label>
                                <div class="col-md-9 col-sm-9" style="margin-top: 10px;">
                                        
<%
    if(s2 == 0){
%>
                                            <span class="label label-primary" style="margin-top: 8px; padding: 4px 7px;">Running Student </span>
<%
    } else if(s2 == 1){
%>
                                            <span class="label label-primary" style="margin-top: 8px; padding: 4px 7px;">Alumnus </span>
<%
    }
%>
                                        
                                    </div>
                            </div>
                                
                            <div class="form-group">
                                <label class="col-md-3 control-label">You are</label>
                                <div class="col-md-9 col-sm-9">
                                      
                                        <select style="width: 350px;" name="status" data-parsley-required="true">
                                            <option value="">Select Current Status</option>
                                                                                            <option 
                                                                                                <% if(s2==0){ %>
                                                                                                selected="selected"
                                                                                                <% } %>
                                                                                                value="0">Running Student</option>
                                                                                            <option <% if(s2==1){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="1">Alumnus</option>
                                                                                            
                                        </select>
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3"></label>
                                <div class="col-md-9 col-sm-9">
                                    <button type="submit" class="btn">Update</button>
                                </div>
                            </div>
                                
                        </form>
                    </div>

		</div>
	</div>
</div>

<% } %>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Upsert your Information</li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div id="page-main">
                <div class="col-md-10 col-sm-10 col-sm-offset-1 col-md-offset-1">
                    <div class="row">
			<div class="col-md-6">
                            <section class="account-block">
                                <header><h2>Upsert Your profile Information</h2></header>
                                <form action="updateInfo.jsp" style="margin: 0 0 40px 0" data-parsley-validate="true" method="post" accept-charset="utf-8">
                                    
                                <% 
                                        String status10 = "", activity = "", hometown = "", current_city = "", c_session = "", year = "", semester = "", present = "", permanent = "", blood = "", school = "", spy = "", gender = "", college = "", hpy = "", university = "", bpy = "", muni = "", mpy = "";
                                        Connection conn10 = DB.getConnection();
                                        Statement st10 = conn10.createStatement();
                                        ResultSet rs10;  
                                        rs10 = st10.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs10.next()){
                                            status10 = rs10.getString("status");
                                            int s10  = Integer.parseInt(status10);
                                            
                                            activity     = rs10.getString("activity");
                                            hometown     = rs10.getString("hometown");
                                            current_city = rs10.getString("current_city");
                                            c_session    = rs10.getString("session");
                                            year         = rs10.getString("year");
                                            semester     = rs10.getString("semester");
                                            present      = rs10.getString("present");
                                            permanent    = rs10.getString("permanent");
                                            blood        = rs10.getString("blood");
                                            school       = rs10.getString("school");
                                            spy          = rs10.getString("spy");
                                            gender       = rs10.getString("gender");
                                            college      = rs10.getString("college");
                                            hpy          = rs10.getString("hpy");
                                            university   = rs10.getString("university");
                                            bpy          = rs10.getString("bpy");
                                            muni         = rs10.getString("muni");
                                            mpy          = rs10.getString("mpy");
                                    %>

                                    <div class="form-group">
                                                <label>You are</label> <a style="margin-top: -3px; padding: 2px 5px;margin-right: 315px;" onclick="showAjaxModal('url');" href="javascript:;" class="btn btn-framed pull-right">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                                <select name="status" data-parsley-required="true" disabled="" style="background-color: #eee; border: 2px solid #918e8e;">
	                                            
	                                            	                                            <option 
                                                                                                        <% if(s10 == 0){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="0">Running Student</option>
	                                            	                                            <option 
                                                                                                        <% if(s10 == 1){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="1">Alumnus</option>
	                                            	                                            
                                                </select>
	                                            	                                                                                                   </div>
                                        
                                            <div class="form-group">
	                                        <label>Activity</label>
	                                        <textarea placeholder="Enter your activity" name="activity" maxlength="180" rows="2" style="resize:none;" data-parsley-required="true"><%= activity %>
                                                </textarea>
	                                    </div>
                                        
	                                    
	                                    <div class="form-group">
	                                        <label>Hometown</label>
                                                <input name="hometown" type="text" class="form-control" placeholder="Enter your hometown" value="<%= hometown %>" data-parsley-required="true">
	                                    </div>
                                        
	                                    <div class="form-group">
	                                        <label>Current City</label>
                                                <input name="current_city" type="text" class="form-control" placeholder="Enter current city" value="<%= current_city %>" data-parsley-required="true">
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>Session</label>
	                                        <input name="session" type="text" class="form-control" placeholder="Enter your session" value="<%= c_session %>" data-parsley-required="true">
	                                    </div>
                                        
                                    <% 
                                        String status4 = "";
                                        Connection conn2 = DB.getConnection();
                                        Statement st2 = conn2.createStatement();
                                        ResultSet rs2;  
                                        rs2 = st2.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs2.next()){
                                            status4 = rs2.getString("status");
                                            int s4  = Integer.parseInt(status4);
                                                if(s4 != 1){
                                                    
                                    %>
                                        
	                                    <div class="form-group">
	                                        <label>Current Year</label>
	                                        <select name="year" data-parsley-required="true">
                                                    <% if(!year.equals("")){ %>
                                                        <option value="<%= year %>"><%= year %></option>
                                                    <% } else { %>
                                                        <option value="">Select Current Year</option>
                                                    <% } %>
	                                            	                                            <option  value="1st">1st</option>
	                                            	                                            <option  value="2nd">2nd</option>
	                                            	                                            <option  value="3rd">3rd</option>
	                                            	                                            <option  value="4th">4th</option>
	                                            	                                            <option  value="5th">5th</option>
                                                </select>
	                                            	                                                                                                   </div>
                                        
                                                                                                                                                           <div class="form-group">
	                                        <label>Running Semester</label>
	                                        <select name="semester" data-parsley-required="true">
	                                            <% if(!semester.equals("")){ %>
                                                        <option value="<%= semester %>"><%= semester %></option>
                                                    <% } else { %>
                                                        <option value="">Select Running Semester</option>
                                                    <% } %>
	                                            	                                            <option  value="1st">1st</option>
	                                            	                                            <option  value="2nd">2nd</option>
	                                            	                                            
                                                </select>
	                                            	                                                                                                   </div>
                                        
                                        <% } } %>                                                                                                                   <div class="form-group">
	                                        <label>Present Address</label> (Optional)
	                                        <input name="present" type="text" class="form-control" placeholder="Enter present address" value="<%= present %>">
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>Permanent Address</label> (Optional)
	                                        <input name="permanent" type="text" class="form-control" placeholder="Enter permanent address" value="<%= permanent %>">
	                                    </div>
                                        
	                                    <div class="form-group">
	                                        <label>Blood Group</label>
	                                        <select name="blood" data-parsley-required="true">
	                                            <% if(!blood.equals("")){ %>
                                                        <option value="<%= blood %>"><%= blood %></option>
                                                    <% } else { %>
                                                        <option value="">Select Blood Group</option>
                                                    <% } %>
                                                                                <option  value="O+">O+</option>
								                <option  value="O-">O-</option>
								                <option  value="A+">A+</option>
								                <option  value="A-">A-</option>
								                <option  value="B+">B+</option>
								                <option  value="B-">B-</option>
								                <option  value="AB+">AB+</option>
								                <option  value="AB-">AB-</option>
	                                        </select>
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>School</label> (Optional)
                                                <input name="school" type="text" class="form-control" placeholder="Enter your school" value="<%= school %>">
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>Passing Year (SSC)</label>
	                                        <input name="spy" type="text" class="form-control" placeholder="Enter passing year" value="<%= spy %>" data-parsley-required="true">
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>Gender</label>
	                                        <select name="gender" data-parsley-required="true">
	                                            <% if(!gender.equals("")){ %>
                                                        <option value="<%= gender %>"><%= gender %></option>
                                                    <% } else { %>
                                                        <option value="">Select Gender</option>
                                                    <% } %>
	                                            	                                            <option  value="Male">Male</option>
	                                            	                                            <option  value="Female">Female</option>
	                                            	                                            
                                                </select>
	                                            	                                                                                                   </div>
	                              
	                                    <div class="form-group">
	                                        <label>College</label> (Optional)
                                                <input name="college" type="text" class="form-control" placeholder="Enter your college" value="<%= college %>">
	                                    </div>
	                                    <div class="form-group">
	                                        <label>Passing Year (HSC)</label>
	                                        <input name="hpy" type="text" class="form-control" placeholder="Enter passing year" data-parsley-required="true" value="<%= hpy %>">
	                                    </div>
                                        
                                    <% 
                                        String status5 = "";
                                        Connection conn3 = DB.getConnection();
                                        Statement st3 = conn3.createStatement();
                                        ResultSet rs3;  
                                        rs3 = st3.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs3.next()){
                                            status5 = rs3.getString("status");
                                            int s5  = Integer.parseInt(status5);
                                                if(s5 != 0){
                                                    
                                    %>
                                        
                                            <div class="form-group">
	                                        <label>University</label> (Optional)
	                                        <input name="university" type="text" class="form-control" placeholder="Enter your university" value="<%= university %>">
	                                    </div>
	                                    <div class="form-group">
	                                        <label>Passing Year (BSc)</label>
	                                        <input name="bpy" type="text" class="form-control" placeholder="Enter passing year" data-parsley-required="true" value="<%= bpy %>">
	                                    </div>
                                        
                                            <div class="form-group">
	                                        <label>University (MSc)</label> (Optional)
	                                        <input name="muni" type="text" class="form-control" placeholder="Enter your university" value="<%= muni %>">
	                                    </div>
	                                    <div class="form-group">
	                                        <label>Passing Year (MSc)</label> (Optional)
	                                        <input name="mpy" type="text" class="form-control" placeholder="Enter passing year" value="<%= mpy %>">
	                                    </div>
                                    
                                    <% } } } %>
                                        
                                    
                                    <div align="right">
                                    </div>
                                </form>                            
                            </section>
                        </div><!-- /.col-md-6 -->
                        
                        <div class="col-md-6">
                            <section class="account-block">
                                <header><h2>Update Your Account Information</h2></header>
                                <form action="upregInfo.jsp" id="signupform" style="margin: 0 0 40px 0" data-parsley-validate="true" method="post" accept-charset="utf-8">
                                    
                                    <% 
                                        String name = "", password = "", email = "", mobile = "", profession = "", job = "", dob = "", location = "", facebook = "", linkedin = "", twitter = "", website = "";
                                        int department;
                                        int batch;
                                        Connection conn15 = DB.getConnection();
                                        Statement st15 = conn15.createStatement();
                                        ResultSet rs15;  
                                        rs15 = st15.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

                                        while (rs15.next()){
                                            name = rs15.getString("name");
                                            department = rs15.getInt("departmentId");
                                            batch = rs15.getInt("batchId");
                                            password = rs15.getString("password");
                                            email = rs15.getString("email");
                                            mobile = rs15.getString("mobile");
                                            profession = rs15.getString("profession");
                                            job = rs15.getString("job");
                                            dob = rs15.getString("dob");
                                            location = rs15.getString("location");
                                            facebook = rs15.getString("facebook");
                                            linkedin = rs15.getString("linkedin");
                                            twitter = rs15.getString("twitter");
                                            website = rs15.getString("website");
                                          
                                            
                                    %>
                                    
                                    <div class="form-group">
                                        <label>ID</label>
                                        
                                        <input name="uni_id" id="uni_id" type="text" class="form-control" placeholder="Enter ID No" value="<%= session.getAttribute("uni_id") %>" data-parsley-required="true"><span id="msg"></span>
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input class="form-control" placeholder="Enter full name" name="name" value='<%= name %>'>
                                        
                                    </div>

                                    <div class="form-group">
                                        <label>Department</label>
                                        <select name="department" id="department_id" data-parsley-required="true">
                                            <option value="">Select Department</option>
                                            
                                            <%
                                                try
                                                {
                                                    String query = "select * from tbl_department";
                                                    Connection con = DB.getConnection();
                                                    Statement stm = con.createStatement();
                                                    ResultSet rss = stm.executeQuery(query);
                                                    while(rss.next())
                                                    {
                                            %>
                                            
                                            
                                                    <option <% if(department == rss.getInt("departmentId")){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="<%=rss.getInt("departmentId")%>"><%=rss.getString("departmentName")%></option>
                                            <%                                                                                                               }
                                                    
                                                }
                                                catch(Exception ex)
                                                {
                                                    ex.printStackTrace();
                                                }
                                            %>
                                            
                                        </select>
                                    </div>

                                    <div class="form-group" id="batch_id">
                                        <label>Batch</label>
                                        <select name="batch" data-parsley-required="true">
                                            <option value="">Select Batch</option>
                                            
                                            
                                            <%

                                                Connection con = DB.getConnection();
                                                Statement st5 = con.createStatement();

                                                ResultSet rs5 = st5.executeQuery("select * from tbl_batch where departmentId="+ department +" ");
                                                while (rs5.next()) {
                                            %>
            <option <% if(batch == rs5.getInt("batchId")){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="<%=rs5.getInt("batchId")%>"><%=rs5.getString("batchName")%></option>
                                            <%
                                                }
                                            %>
                                            
                                            
                                        </select>
                                    </div>
                                    

                                     <div class="form-group">
                                        <label>Password</label>
                                        
                                        <div class="input-group">
                                            <input name="password" type="password" class="form-control" placeholder="Enter password" value="<%= password %>" id="myInput" data-parsley-required="true">
                                            <div class="input-group-addon">
                                                <span onclick="myFunction()" class="glyphicon glyphicon-zoom-in" style="cursor: zoom-in "></span>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" type="email" class="form-control" placeholder="Enter email" value="<%= email %>" data-parsley-required="true">
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <input name="mobile" type="text" class="form-control" placeholder="Enter mobile number" value="<%= mobile %>" data-parsley-required="true">
                                    </div>
                                    <div class="form-group">
                                        <label>Profession</label>
                                        <select name="profession" data-parsley-required="true">
                                            <option value="<%= profession %>"><%= profession %></option>
                                                                                        <option value="Accountant">Accountant</option>
                                                                                        <option value="Actor">Actor</option>
                                                                                        <option value="Air Steward">Air Steward</option>
                                                                                        <option value="Animator">Animator</option>
                                                                                        <option value="Architect">Architect</option>
                                                                                        <option value="Artist">Artist</option>
                                                                                        <option value="Author">Author</option>
                                                                                        <option value="Baker">Baker</option>
                                                                                        <option value="Biologist">Biologist</option>
                                                                                        <option value="Builder">Builder</option>
                                                                                        <option value="Butcher">Butcher</option>
                                                                                        <option value="Counselor">Counselor</option>
                                                                                        <option value="Chef">Chef</option>
                                                                                        <option value="Director">Director</option>
                                                                                        <option value="Dentist">Dentist</option>
                                                                                        <option value="Designer">Designer</option>
                                                                                        <option value="Doctor">Doctor</option>
                                                                                        <option value="Economist">Economist</option>
                                                                                        <option value="Electrician">Electrician</option>
                                                                                        <option value="Engineer">Engineer</option>
                                                                                        <option value="Farmer">Farmer</option>
                                                                                        <option value="Film Director">Film Director</option>
                                                                                        <option value="Fisherman">Fisherman</option>
                                                                                        <option value="Geologist">Geologist</option>
                                                                                        <option value="Head Teacher">Head Teacher</option>
                                                                                        <option value="Journalist">Journalist</option>
                                                                                        <option value="Judge">Judge</option>
                                                                                        <option value="Lawyer">Lawyer</option>
                                                                                        <option value="Lecturer">Lecturer</option>
                                                                                        <option value="Magician">Magician</option>
                                                                                        <option value="Manager">Manager</option>
                                                                                        <option value="Musician">Musician</option>
                                                                                        <option value="Nurse">Nurse</option>
                                                                                        <option value="Painter">Painter</option>
                                                                                        <option value="Photographer">Photographer</option>
                                                                                        <option value="Pilot">Pilot</option>
                                                                                        <option value="Police Officer">Police Officer</option>
                                                                                        <option value="Politician">Politician</option>
                                                                                        <option value="Professor">Professor</option>
                                                                                        <option value="Receptionist">Receptionist</option>
                                                                                        <option value="Student">Student</option>
                                                                                        <option value="Salesperson">Salesperson</option>
                                                                                        <option value="Scientist">Scientist</option>
                                                                                        <option value="Secretary">Secretary</option>
                                                                                        <option value="Singer">Singer</option>
                                                                                        <option value="Software Engineer">Software Engineer</option>
                                                                                        <option value="Soldier">Soldier</option>
                                                                                        <option value="Surgeon">Surgeon</option>
                                                                                        <option value="Teacher">Teacher</option>
                                                                                        <option value="Translator">Translator</option>
                                                                                        
                                                                                        <option value="Web Developer">Web Developer</option>
                                                                                        <option value="Writer">Writer</option>
                                                                                        <option value="Other">Other</option>
                                                                                    </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Job Details</label> (Optional)
                                        <input name="job" value="<%= job %>" type="text" class="form-control" placeholder="Enter job position">
                                    </div>
                                            
                                    <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="input-group date">
                                                <input type="text" id="dob" name="dob" value="<%= dob %>" class="form-control" placeholder="Pick birth date">
                                                <div class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </div>
                                                
                                            </div>
                                            <span id="msg2"></span>
                                    </div>

                                    <div class="form-group">
                                        <label>Current Location</label> (Optional)
                                        <input name="location" type="text" value="<%= location %>" class="form-control" placeholder="Enter current location">
                                    </div>


                                    <div class="form-group">
                                        <label>Facebook</label> (Ex: https://www.facebook.com/snigdho.majumder)
                                        <input name="facebook" type="text" value="<%= facebook %>" class="form-control" placeholder="Enter facebook profile url" data-parsley-required="true">
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Linkedin</label> (Optional)
                                        <input name="linkedin" type="text" value="<%= linkedin %>" class="form-control" placeholder="Enter linkedin profile url" >
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Twitter</label> (Optional)
                                        <input name="twitter" type="text" value="<%= twitter %>" class="form-control" placeholder="Enter twitter profile url" >
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Personal Website</label> (Optional)                                                                     <input name="website" type="text" value="<%= website %>" class="form-control" placeholder="Enter personal website url" >
                                    </div>
                                            
                                    <% } %>
                                    
                                    
                                    <div align="right">
										<button type="submit" class="btn">Save</button>
                                    </div>
                                </form>                            
                            </section>
                        </div><!-- /.col-md-6 -->
					                    </div><!-- /.row -->
                </div><!-- /.col-md-10 -->
            </div><!-- /#page-main -->
            
            <!-- end SIDEBAR Content-->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->


<script type="text/javascript" src="assets/alumni/js/jquery-2.1.0.min.js"></script>
    
<!-- 
<script>
	$('#alumnus').on('click', function () {
		$('#email').val('alumnus@venus.com');
		$('#password').val('alumnus');
	});

	$('#volunteer').on('click', function () {
		$('#email').val('volunteer@venus.com');
		$('#password').val('volunteer');
	});
</script>
        <!-- end Page Content -->
        
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript">
        function myFunction() {
            var x = document.getElementById("myInput");
            if (x.type === "password") {
              x.type = "text";
            } else {
              x.type = "password";
            }
        }
    </script>

    
    <script>
        $(document).ready(function(){
            var date_input=$('.date');
            var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
            var options={
            format: 'yyyy/mm/dd',
            container: container,
            todayHighlight: true,
            autoclose: true
            };
            date_input.datepicker(options);
        });
    </script>
    
    
<script>
    $(document).ready(function () {
        $("#department_id").on("change", function () {
            var department_id = $("#department_id").val();
                $.ajax({
                    url: "updatebatch.jsp",
                    data: {department_id: department_id}, //sending request to batch.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#batch_id").html(data); //output or response will display in batch select box.
                    }
                });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#submit").on("click",function () {
            var department_id = $("#department_id").val();//id of country select box of index.jsp page;
            var batch_id = $("#batch").val();//coming value from state.jsp page.
            
            // check if country select box have blank or null value.
            if (department_id === ""||department_id===null)
            {
                $("#error").html("All fields are mandatory.");//this message will display in error div.
            }
            else
            {
                $("#error").html("");//show blank message when all select box doesn't have any null value.
                $.ajax({
                    url:"DisplayText",//your servlet or jsp page name.
                    method:"POST",//HTTP method.
                    data:{department_id:department_id,batch_id:batch_id},//sending request to DisplayText.java page.
                    success:function(data)
                    {
                        $("#success").html(data);//output or response will display in success div.
                        $("#form").trigger("reset");//this will reset the form.
                    }
                });
            }
        });
    });
    
</script>

        <script type="text/javascript">
		$(document).ready(function() {
			$("#uni_id").live("blur", function(e) {
				$('#msg').hide();
				if ($('#uni_id').val() == null || $('#uni_id').val() == "") {
					$('#msg').show();
					$("#msg").html("<b>* ID</b> is required for your unique identification.").css("color", "#ea6645");
				} else {
					$.ajax({
						type: "POST",
						url: "check",
						data: $('#signupform').serialize(),
						dataType: "html",
						cache: false,
						success: function(msg) {
							$('#msg').show();
							$("#msg").html(msg);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							$('#msg').show();
							$("#msg").html(textStatus + " " + errorThrown);
						}
					});
				}
			});
		});
	</script>
        
        
        <script type="text/javascript">
		$(document).ready(function() {
			$("#dob").live("blur", function(e) {
				$('#msg2').hide();
				if ($('#dob').val() == null || $('#dob').val() == "") {
					$('#msg2').show();
					$("#msg2").html("<b>* </b>Date of birth is required.").css("color", "#ea6645");
				}
			});
		});
	</script>
        

<% } } } %>

<%@include file="includes/footer.jsp" %>  
        