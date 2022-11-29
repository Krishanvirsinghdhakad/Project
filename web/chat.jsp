
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <%
//            Class.forName("com.mysql.cj.jdbc.Driver");
            String uni_id= request.getParameter("uni_id");
            String msg= request.getParameter("msg");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            String query = "insert into chatuser(alumni,user_id,message,date) values("+uni_id+","+session.getAttribute("uni_id")+",'"+msg+"',curdate())";
            System.out.print(query);
            int rs = stmt.executeUpdate(query);
        
        %>