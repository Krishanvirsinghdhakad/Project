<%-- 
    Document   : AddDept
    Created on : 14 Aug, 2022, 10:41:29 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String departmentName= request.getParameter("departmentName");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            int rs = stmt. executeUpdate("insert into tbl_department(departmentName) values('"+departmentName+"')");
              
            response.sendRedirect("../COMMON.jsp");
        %>