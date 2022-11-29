<%-- 
    Document   : AddBatch
    Created on : 14 Aug, 2022, 10:48:03 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String batchName= request.getParameter("batchName");
            String deptId= request.getParameter("deptId");
            System.out.print(batchName+"    "+deptId);
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            
            int rs = stmt. executeUpdate("insert into tbl_batch(departmentId,batchName) values("+deptId+",'"+batchName+"')");
              
            response.sendRedirect("../COMMON.jsp");
        %>