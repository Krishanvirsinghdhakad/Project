<%-- 
    Document   : AddNews
    Created on : 14 Aug, 2022, 11:58:34 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String title= request.getParameter("title");
            String para1= request.getParameter("para1");
            String para2= request.getParameter("para2");
            String para3= request.getParameter("para3");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            int rs = stmt. executeUpdate("insert into tbl_news(file,title,para1,para2,para3,date,status) values('demo.jpg','"+title+"','"+para1+"','"+para2+"','"+para3+"',current_date(),1)");
              
            response.sendRedirect("../ADDNEWS.jsp");
        %>