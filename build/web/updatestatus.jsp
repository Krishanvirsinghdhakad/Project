<%-- 
    Document   : updatestatus
    Created on : Oct 4, 2019, 10:49:37 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="com.java.DB"%>


<%
    String status = request.getParameter("status");
    
    Connection conn = DB.getConnection();

    Statement st = conn.createStatement();

    String sql = "update tbl_profile set status = '" + status + "' where uni_id = '" + session.getAttribute("uni_id") + "'";

    int i = st.executeUpdate(sql);
    
    if(i > 0){ %>
        <script type="text/javascript">
            alert("Your Current Status Updated Successfully !");
            window.location = "profile.jsp";
        </script>
<%
    }
%>


