<%-- 
    Document   : insertinfo
    Created on : Nov 4, 2019, 4:14:00 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="com.java.DB"%>

<%
        
    String activity     = request.getParameter("activity");
    String hometown    = request.getParameter("hometown");
    String current_city = request.getParameter("current_city");
    String c_session = request.getParameter("session");
    String year = request.getParameter("year");
    String semester    = request.getParameter("semester");
    String present     = request.getParameter("present");
    String permanent    = request.getParameter("permanent");
    String blood = request.getParameter("blood");
    String school = request.getParameter("school");
    String spy = request.getParameter("spy");
    String gender    = request.getParameter("gender");
    String college    = request.getParameter("college");
    String hpy = request.getParameter("hpy");
    String university = request.getParameter("university");
    String bpy    = request.getParameter("bpy");
    String muni    = request.getParameter("muni");
    String mpy = request.getParameter("mpy");
    
    String status5 = "";
    Connection conn3 = DB.getConnection();
    Statement st3 = conn3.createStatement();
    ResultSet rs3;  
    rs3 = st3.executeQuery("select * from tbl_profile where uni_id = '" + session.getAttribute("uni_id") + "'");

    while (rs3.next()){
            status5 = rs3.getString("status");
            int s5  = Integer.parseInt(status5);
                if(s5 != 0){

            String sql = "update tbl_profile set activity = ?, hometown = ?, current_city = ?, session = ?, present = ?, permanent = ?, blood = ?, school = ?, spy = ?, gender = ?, college = ?, hpy = ?, university = ?, bpy = ?, muni = ?, mpy = ?  where uni_id = '" + session.getAttribute("uni_id") + "'";
            PreparedStatement pst = conn3.prepareStatement(sql);
    
            pst.setString(1, activity);
            pst.setString(2, hometown);
            pst.setString(3, current_city);
            pst.setString(4, c_session);
            pst.setString(5, present);
            pst.setString(6, permanent);
            pst.setString(7, blood);
            pst.setString(8, school);
            pst.setString(9, spy);
            pst.setString(10, gender);
            pst.setString(11, college);
            pst.setString(12, hpy);
            pst.setString(13, university);
            pst.setString(14, bpy);
            pst.setString(15, muni);
            pst.setString(16, mpy);
            
            
            pst.executeUpdate();
 %>   
        <script type="text/javascript">
            alert("Profile updated successfully as alumnus !");
            window.location = "profile.jsp";
        </script>
        
<%    } else if(s5 != 1) {
        String sql1 = "update tbl_profile set activity = ?, hometown = ?, current_city = ?, session = ?, year = ?, semester = ?, present = ?, permanent = ?, blood = ?, school = ?, spy = ?, gender = ?, college = ?, hpy = ? where uni_id = '" + session.getAttribute("uni_id") + "'";
            PreparedStatement pst1 = conn3.prepareStatement(sql1);
    
            pst1.setString(1, activity);
            pst1.setString(2, hometown);
            pst1.setString(3, current_city);
            pst1.setString(4, c_session);
            pst1.setString(5, year);
            pst1.setString(6, semester);
            pst1.setString(7, present);
            pst1.setString(8, permanent);
            pst1.setString(9, blood);
            pst1.setString(10, school);
            pst1.setString(11, spy);
            pst1.setString(12, gender);
            pst1.setString(13, college);
            pst1.setString(14, hpy);
                     
            pst1.executeUpdate();
   
    }
%>
    <script type="text/javascript">
        alert("Profile updated successfully as current student !");
        window.location = "profile.jsp";
    </script>
<%    }
    

%>    