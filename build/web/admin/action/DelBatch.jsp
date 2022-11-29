<%-- 
    Document   : DelBatch
    Created on : 14 Aug, 2022, 10:47:40 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String id= request.getParameter("id");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            int rs = stmt. executeUpdate("delete from tbl_batch where batchId="+id);
            
//            System.out.println("id>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+id);
            response.sendRedirect("../COMMON.jsp");
        %>
