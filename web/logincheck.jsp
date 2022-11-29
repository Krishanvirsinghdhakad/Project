<%-- 
    Document   : logincheck
    Created on : Jul 13, 2019, 4:46:13 PM
    Author     : singdho
--%>

<%-- 
    Document   : login
    Created on : May 29, 2019, 1:26:47 AM
    Author     : singdho
--%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="com.java.DB"%>

<%@page import = "java.sql.*" %>
<%
        String uni_id   = request.getParameter("uni_id");
        String password = request.getParameter("password");
        
        String v = "", p = "";
        
        Connection connnn = DB.getConnection();
        Statement stttt = connnn.createStatement();
        ResultSet rssss;       
        rssss = stttt.executeQuery("select * from tbl_registration where uni_id = '" +uni_id+ "' and password = '" +password+ "'");
        
        
        Statement stttt2 = connnn.createStatement();
        ResultSet rssss2;       
        rssss2 = stttt2.executeQuery("select * from tbl_registration where uni_id = '" +uni_id+ "' and password = '" +password+ "'");
        
             
        if(rssss.next()){
            if(rssss.getString("status").equals("1")){
                session.setAttribute("uni_id", uni_id);
                session.setAttribute("power", rssss.getString("power"));
                response.sendRedirect("index.jsp");                
            }else{
                response.sendRedirect("index.jsp");
            }
        } else if(rssss2.next()) {
            
            session.setAttribute("uni_id", uni_id);
            response.sendRedirect("loginerror.jsp");
        } else { %>
            <script type="text/javascript">
                alert("Please enter valid Id and Password.");
                window.location = "login.jsp";
            </script>
        <%  } 
%>
  