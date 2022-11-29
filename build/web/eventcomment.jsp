<%-- 
    Document   : eventcomment
    Created on : Aug 26, 2019, 9:23:17 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%@page import="com.java.DB"%>

<%    
    String id      = request.getParameter("id");
    String comment = request.getParameter("eventcomment");
    Object uni_id = session.getAttribute("uni_id");
    
    Connection con = DB.getConnection();
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into tbl_eventcomment(uni_id, comment, event_id, date) values('" + uni_id + "', '" + comment + "', '" + id + "', CURDATE())");
    if(i > 0){
%>
        <script type="text/javascript">
            window.location = "eventdetails.jsp?id=<%=id%>";
        </script>
<%
        } else {
            response.sendRedirect("index.jsp");
    }

%>    