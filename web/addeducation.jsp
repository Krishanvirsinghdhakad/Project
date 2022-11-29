<%-- 
    Document   : addeducation
    Created on : 22 Aug, 2022, 12:01:06 PM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    
    String degree = request.getParameter("degree");
    String course = request.getParameter("course");
    String sesion = request.getParameter("session");
    String instituteName = request.getParameter("institute_name");
    String grade = request.getParameter("grade");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
    Statement stmt = conn.createStatement();
    int rs = stmt. executeUpdate("insert into tbl_education(uni_id,degree,course,session,college_name,grade) "
                                + "values("+session.getAttribute("uni_id")+",'"+degree+"','"+course+"','"+sesion+"','"+instituteName+"','"+grade+"')");

    response.sendRedirect("index.jsp");

%>

