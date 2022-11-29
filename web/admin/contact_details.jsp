<%-- 
    Document   : contact_details
    Created on : 22 Aug, 2022, 11:10:39 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String msg = request.getParameter("message");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            int rs = stmt. executeUpdate("insert into contact(name,email,message) values('"+name+"','"+email+"','"+msg+"')");
//            
            response.sendRedirect("../contact_us.jsp");
        %>
