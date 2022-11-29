<%-- 
    Document   : updatebatch
    Created on : Nov 16, 2019, 5:27:34 AM
    Author     : singdho
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>

<%@page import="com.java.DB"%>

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="assets/alumni/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/selectize.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/vanillabox/vanillabox.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/vanillabox/vanillabox.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/style.css" type="text/css">
<link rel="stylesheet" href="assets/alumni/css/bootstrap-datepicker.css" type="text/css">


<script type="text/javascript" src="assets/alumni/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="assets/alumni/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/selectize.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/alumni/parsley/dist/parsley.js"></script>
<script type="text/javascript" src="assets/alumni/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="assets/alumni/js/jQuery.equalHeights.js"></script>
<script type="text/javascript" src="assets/alumni/js/icheck.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/jquery.vanillabox-0.1.5.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/countdown.js"></script>
<script type="text/javascript" src="assets/alumni/js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="assets/alumni/js/custom.js"></script>
<script type="text/javascript" src="assets/alumni/js/bootstrap-datepicker.js"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			window.setTimeout(function() {
			    $(".alert").slideUp(1000, function(){
			        $(this).remove();
			    });
			}, 5000);
		});
	</script>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Batch</title>
    </head>
    <body>
        
         <% 
            int batch;
            Connection conn15 = DB.getConnection();
            Statement st15 = conn15.createStatement();
            ResultSet rs15;  
            rs15 = st15.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");

            while (rs15.next()){

                batch = rs15.getInt("batchId");

        %>
    
        <div class="form-group">
        <label>Batch</label>
        <select data-parsley-required="true" name="batch" id="batch">
            <option value="">Select Batch</option>
            <%

                int department_id = Integer.parseInt(request.getParameter("department_id"));
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                
                ResultSet rs = st.executeQuery("select * from tbl_batch where departmentId="+ department_id +" ");
                while (rs.next()) {
            %>
            <option <% if(batch == rs.getInt("batchId")){ %>
                                                                                                selected="selected"
                                                                                                <% } %> value="<%=rs.getInt("batchId")%>"><%=rs.getString("batchName")%></option>
            <%
                }
            %>
        </select>
        </div>
                                
        <% } %>

    </body>
</html>
