<%-- 
    Document   : addDonate
    Created on : 21 Aug, 2022, 8:31:04 PM
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
                int rs = stmt.executeUpdate("insert into donate(user_id,amount) values("+session.getAttribute("uni_id")+",'"+request.getParameter("donate")+"')");
            
            %>
            
        Payment Completed Successfully
        <a href="../index.jsp">Go to Home</a>
    </body>
</html>
