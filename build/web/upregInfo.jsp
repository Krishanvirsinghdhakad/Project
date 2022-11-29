<%-- 
    Document   : upregInfo
    Created on : Nov 22, 2019, 7:07:11 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
    
    Connection conn = DB.getConnection();

    Statement st = conn.createStatement();

    String sql = "update tbl_registration set departmentId = '" + department + "', batchId = '" + batch + "', name = '" + name + "', uni_id = '" + uni_id + "', password = '" + password + "', email = '" + email + "', mobile = '" + mobile + "', profession = '" + profession + "', job = '" + job + "', location = '" + location + "', facebook = '" + facebook + "', linkedin = '" + linkedin + "', twitter = '" + twitter + "', website = '" + website + "', dob = '" + dob + "' where uni_id = '" + session.getAttribute("uni_id") + "'";

    int i = st.executeUpdate(sql);
    
    if(i > 0){ %>
        <script type="text/javascript">
            alert("Profile Updated Successfully !");
            window.location = "profile.jsp";
        </script>
<%
    }
%>