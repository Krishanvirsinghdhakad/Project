<%-- 
    Document   : DelNews
    Created on : 14 Aug, 2022, 12:08:52 PM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String id = request.getParameter("id");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            int rs = stmt. executeUpdate("update tbl_news set status=0 where id="+id);
              
            response.sendRedirect("../ADDNEWS.jsp");
        %>