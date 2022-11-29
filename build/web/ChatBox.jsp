
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <title>Chat Box</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt. executeQuery("select * from tbl_registration where power='ALUMNI'");
            
        %>
        <%
            Statement stmt0 = conn.createStatement();
            ResultSet rs0 = stmt0. executeQuery("select * from tbl_registration where power='STUDENT'");
            
        %>
        <%
            
            String alumni = request.getParameter("val");
            Statement stmt2 = conn.createStatement();
            String query = "";
            if(session.getAttribute("power").equals("ALUMNI")){
                query = "select * from chatuser where alumni="+session.getAttribute("uni_id")+" and user_id="+alumni+" ";
            }
            if(session.getAttribute("power").equals("STUDENT")){
                query = "select * from chatuser where alumni="+alumni+" and user_id="+session.getAttribute("uni_id")+" ";
            }
            ResultSet rs2 = null;
            rs2 = stmt2.executeQuery(query);
            
        %>
        
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: darkblue">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" style="font-size: 12px;" href="logout.jsp"><i class="fa fa-sign-out"></i>  Logout</a>
            </li>
        </ul>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: darkblue">
        <div class="container">
            <a class="navbar-brand" href="#">ALUMNI</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
              </ul>
            </div>
        </div>
    </nav>
        
        <div class="container-fluid">
            <div class="row text-center mt-5">
                <div class="col">
                    <span class="h2">Chat Box</span>
                </div>
            </div>
            <div class="row text-center mt-3 mx-4">
                <div class="col mx-5">
                    <select id='alumni' onchange="getChat(this.value)" class="form-control form-control-sm">
                        <% if(session.getAttribute("power").equals("ALUMNI")){%>
                            <option value='na'>Select Student</option>
                            <% while(rs0.next()){ %>
                                <option value='<%=rs0.getString("uni_id")%>'><%=rs0.getString("name")%></option>
                            <% } %>
                        <%}%>
                        <% if(session.getAttribute("power").equals("STUDENT")){%>
                            <option value='na'>Select Alumni</option>
                            <% while(rs.next()){ %>
                                <option value='<%=rs.getString("uni_id")%>'><%=rs.getString("name")%></option>
                            <% } %>
                        <%}%>
                    </select>
                </div>
            </div>
            <div class="row ">
                <div class="container p-4 mt-4 border">
                    
                    <div class="row ">
                        <div class="col py-2 mx-3 border" style="height: 220px;overflow-x: hidden;overflow-y: auto;">
                            <div id='msgBox'>
                                <% while(rs2.next()){ %>
                                    <p style="text-align: left">
                                        <%=rs2.getString("message")%><br />
                                        <span class="text-secondary" style="font-size: 8"><%=rs2.getString("date").split(" ")[0]%></span>
                                    </p>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-11">
                            <input type='text' id='message' class='form-control form-control-sm' placeholder='Type Something.....' />
                        </div>
                        <div class="col-1">
                            <button id='btn' class='btn btn-primary btn-sm'> send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
    <script>
        
        $('#alumni').val('<%=request.getParameter("val")%>')
        $(document).ready(function(){
            $('#btn').click(function(e){
                e.preventDefault()
                
                if($('#alumni').val() !== 'na'){
                    if($('#message').val()==='' || $('#message').val() === null){
                           alert('Leave a message')    
                    }else{
                        $.ajax({
                            url:'chat.jsp',
                            method:'POST',
                            data:{'uni_id':$('#alumni').val(),'msg':$('#message').val()},
                            success:function(e){
                                alert(e)
                                $('#message').val('')
                                $('#alumni').val('<%=request.getParameter("val")%>')
                                $('#msgBox').load(location.href+" #msgBox")
                            }
                        }) 
                    }
                    
                }else{
                    alert('Select Alumni')
                }
            })
        })
        
            function getChat(val){
                window.location.href='ChatBox.jsp?val='+val
            }
        </script>
</html>