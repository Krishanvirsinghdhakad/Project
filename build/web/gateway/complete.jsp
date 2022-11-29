<%-- 
    Document   : complete
    Created on : 14 Aug, 2022, 12:00:09 AM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
                Statement stmt = conn.createStatement();
                int rs = stmt.executeUpdate("update tbl_registration set payment='1' where uni_id="+session.getAttribute("uni_id"));
                out.print(rs);
            
            %>
        Payment Completed Successfully
        <a href="../allalumni.jsp">All Alumina</a>
    </body>
</html>
