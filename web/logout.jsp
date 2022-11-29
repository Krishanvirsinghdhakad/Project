<%-- 
    Document   : logout
    Created on : Aug 4, 2019, 2:46:51 PM
    Author     : singdho
--%>

<% 
    session.setAttribute("uni_id", null);
    session.invalidate();
    response.sendRedirect("index.jsp");
%>