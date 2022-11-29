<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>

<%@page import="com.java.DB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    #msg{
        font-family: 'Raleway', sans-serif;
        font-size: 13px;
        color: #ea6645 ;
    }
    
</style>

<%@include file="includes/header.jsp" %>


<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){ 
%>



        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Login or Register</li>
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
                            <section id="account-sign-in" class="account-block">
                                <header><h2>Have an Account?</h2></header>
                                                                                                
                                <form action="logincheck.jsp" class="clearfix" data-parsley-validate="true" method="post" accept-charset="utf-8">

                                    <div class="form-group">
                                        <label for="uni_id">ID No.</label>
                                        <input value="" name="uni_id" type="text" class="form-control" id="email" placeholder="Enter ID No." data-parsley-required="true">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input value="" name="password" type="password" class="form-control" id="password" placeholder="Enter password" data-parsley-required="true">
                                    </div>
                                    <div class="">
                                        <div class="radio">
                                            <label id="alumnus"><input type="radio" value="alumnus" name="auth_type" checked>Login as Alumnus</label>
                                        </div>
                                        
                                    </div>
                                    <button type="submit" class="btn pull-right">Sign In</button>
								</form>                            
                            </section><!-- /#account-block -->
                        </div><!-- /.col-md-6 -->
                        <div class="col-md-6">
                            <section class="account-block">
                                <header><h2>Create New Alumni Account</h2></header>
                                <form action="registration.jsp" id="signupform" data-parsley-validate="true" style="margin: 0 0 40px 0" method="post" accept-charset="utf-8">
                                    
                                    
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" placeholder="Enter full name" data-parsley-required="true">
                                    </div>

                                    <div class="form-group">
                                        <label>ID</label>
                                        <input name="uni_id" id="uni_id" type="text" class="form-control" placeholder="Enter ID No" data-parsley-required="true">
                                        <span id="msg"></span>
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
                                                    ResultSet rs = stm.executeQuery(query);
                                                    out.print(rs);
                                                    while(rs.next())
                                                    {
                                            %>
                                                    <option value="<%=rs.getInt("departmentId")%>"><%=rs.getString("departmentName")%></option>
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
                                            
                                        </select>
                                    </div>
                                            
                                        
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input name="password" type="password" class="form-control" placeholder="Enter password" data-parsley-required="true">
                                    </div>

                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" type="email" class="form-control" placeholder="Enter email" data-parsley-required="true">
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <input name="mobile" type="text" class="form-control" placeholder="Enter mobile number" data-parsley-required="true">
                                    </div>
                                    <div class="form-group">
                                        <label>Profession</label>
                                        <select name="profession" data-parsley-required="true">
                                            <option value="">Select Profession</option>
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
                                        <label>Job Details (optional)</label>
                                        <input name="job" type="text" class="form-control" placeholder="Enter job position">
                                    </div>
                                            
                                    <div class="form-group">
                                            <label>Date of Birth</label>
                                            <div class="input-group date">
                                                <input type="text" name="dob" id="dob" class="form-control" placeholder="Pick birth date">
                                                <div class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </div>
                                            </div>
                                            <span id="msg2"></span>
                                    </div>

                                    <div class="form-group">
                                        <label>Current Location</label>
                                        <input name="location" type="text" class="form-control" placeholder="Enter current location" data-parsley-required="true">
                                    </div>


                                    <div class="form-group">
                                        <label>Facebook</label> (Ex: https://www.facebook.com/snigdho.majumder)
                                        <input name="facebook" type="text" class="form-control" placeholder="Enter facebook profile url" data-parsley-required="true">
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>LinkedIn  (optional)</label>
                                        <input name="linkedin" type="text" class="form-control" placeholder="Enter linkedin profile url" >
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Twitter  (optional)</label>
                                        <input name="twitter" type="text" class="form-control" placeholder="Enter twitter profile url" >
                                    </div>
                                            
                                    <div class="form-group">
                                        <label>Personal Website (optional)</label>
                                        <input name="website" type="text" class="form-control" placeholder="Enter personal website url" >
                                    </div>
                                            
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="0" name="terms" data-parsley-required="true">I understand terms &amp; Conditions                                        </label>
                                    </div>
                                    <button style="margin: 6% 0 10% 0" type="submit" class="btn pull-right">Create New Account</button>
				</form> 
                            
                                <div style="color:red;" id="error"></div><!-- error message will display here. --->
            <div id="success"></div>
                                
                            </section><!-- /#account-block -->
                        </div><!-- /.col-md-6 -->
                    </div><!-- /.row -->
                </div><!-- /.col-md-10 -->
            </div><!-- /#page-main -->
            <!-- end SIDEBAR Content-->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->

<!-- 
<script type="text/javascript">
       function chg()
       {
           var val=document.getElementById('department').value;
           var xhttp = new XMLHttpRequest;
           xhttp.onreadystatechange=function()
           {
              if(xhttp.readyState===4 && xhttp.status===200)
              {
                  document.getElementById('batch').innerHTML=xhttp.responseText;
              }
           };
           
           xhttp.open("POST","getBatch?valajax="+val,true);
           xhttp.send();
       } 
</script>
 -->

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
                    url: "batch.jsp",
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
					$("#msg").html("<b>⦿ ID</b> is required for your unique identification.").css("color", "#ea6645");
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
					$("#msg2").html("<b>•</b> Date of birth is required.").css("color", "#ea6645");
				}
			});
		});
	</script>
        
        
        <% } else { %>
        <div class='alert alert-warning'>You are currently logged in ! Please <a class="btn btn-primary btn-xs" href="logout.jsp">log out</a> to continue.</div>
        <% } %>
        
<%@include file="includes/footer.jsp" %>