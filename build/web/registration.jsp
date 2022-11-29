<%-- 
    Document   : registration
    Created on : Jul 11, 2019, 5:55:03 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%@page import="com.java.DB"%>

<%
    
    String department = request.getParameter("department");
    String batch      = request.getParameter("batch");
    String name       = request.getParameter("name");
    String uni_id     = request.getParameter("uni_id");
    String password   = request.getParameter("password");
    String email      = request.getParameter("email");
    String mobile     = request.getParameter("mobile");
    String profession = request.getParameter("profession");
    String job        = request.getParameter("job");
    String location   = request.getParameter("location");
    String facebook   = request.getParameter("facebook");
    String linkedin   = request.getParameter("linkedin");
    String twitter    = request.getParameter("twitter");
    String website    = request.getParameter("website");
    String dob        = request.getParameter("dob");
    
    
    Connection con = DB.getConnection();
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into tbl_registration(departmentId, batchId, name, uni_id, password, email, mobile, profession, job, dob, location, linkedin, facebook, twitter, website, power, date) values('" + department + "', '" + batch + "', '" + name + "', '" + uni_id + "', '" + password + "', '" + email + "', '" + mobile + "', '" + profession + "', '" + job + "', '" + dob + "', '" + location + "', '" + linkedin + "', '" + facebook + "', '" + twitter + "', '" + website + "', 'STUDENT', CURDATE())");
    if(i > 0){
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }

%>    