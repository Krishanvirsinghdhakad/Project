<%-- 
    Document   : eventdetails
    Created on : Aug 24, 2019, 3:17:54 AM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@include file="includes/header.jsp" %>


<%
    String id = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    String title = "", file = "", time = "", venue = "", para1 = "",  para2 = "", para3 = "", google_map = "", hashtag = "", added_on = "";
    Connection conn = DB.getConnection();
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_event where id = '" + id + "'");
    while (rs.next()) {
        title      = rs.getString("title");
        file       = rs.getString("file");
        time       = rs.getString("time");
        venue      = rs.getString("venue");
        para1      = rs.getString("para1");
        para2      = rs.getString("para2");
        para3      = rs.getString("para3");
        google_map = rs.getString("google_map");
        hashtag    = rs.getString("hashtag");
        added_on   = rs.getString("added_on");
        
%>



<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="events.jsp">Events</a></li>
        <li class="active"><%=title%></li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
                <header><h1><%=title%></h1></header>
        <div class="row">
            <!-- Course Image -->
            <div class="col-md-2 col-sm-3">
                <figure class="event-image">
                    <div class="image-wrapper">
                        <img src="event_images/<%=file%>">
                    </div>
                </figure>
            </div><!-- end Course Image -->
            <!--MAIN Content-->
            <div class="col-md-6 col-sm-9">
                <div id="page-main">
                    <section id="event-detail">
                        <article class="event-detail">
                            <section id="event-header">
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String date = "";
    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W %M %d, %Y') as 'date' FROM tbl_event where id = '" + id + "'");
    while (rs3.next()) {
        date = rs3.getString("date");
%>
                                <header>
                                    <h2 class="event-date"><%=date%></h2>
                                </header>

                                <hr>
                                <div class="course-count-down" id="course-count-down">
                                    <figure class="course-start"></figure>
                                    <!-- /.course-start-->

                                    <div class="count-down-wrapper">
                                        <script type="text/javascript">
                                            var _date = "<%=date%><% } %> <%=time%>";
                                        </script>
                                    </div><!-- /.count-down-wrapper -->

                                </div><!-- /.course-count-down -->
                                <hr>
                                <figure>
                                    <span class="course-summary"><i class="fa fa-map-marker"></i><%=venue%></span>
                                    <span class="course-summary"><i class="fa fa-hashtag"></i><%=hashtag%></span>
                                    <span class="course-summary"><i class="fa fa-clock-o"></i><%=time%></span>
                                </figure>
                            </section><!-- /#course-header -->

                            							
                            <section id="course-info">
                                <header><h2>Event Details</h2></header>
                                <p><%=para1%></p>
                                <p><%=para2%></p>
                                <p><%=para3%></p>
                            </section>

                            
                            <section id="map">
                                <header><h2>Place on Map</h2></header>
                                <div class="map-wrapper">
                                    <iframe src="<%=google_map%>" width="100%" height="350" frameborder="0" style="border:0"></iframe>
                                </div>
                            </section><!-- /#map -->
                            
<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){
    } else {
%>
                            
                             <hr>
                    <section id="discussion">
                        <header><h2>Comments</h2></header>
    <%
        try {
            String id2 = "";
            id2 = rs.getString("id");
            String uni_id = "", name = "", comment = "", date2 = "", status = "", file2 ="";
            
            Connection con4 = DB.getConnection();
            Statement st4 = con4.createStatement();
            ResultSet rs4;
            rs4 = st4.executeQuery("SELECT tbl_eventcomment.*, tbl_event.*, tbl_registration.* FROM tbl_registration INNER JOIN tbl_eventcomment ON tbl_eventcomment.uni_id = tbl_registration.uni_id INNER JOIN tbl_event ON tbl_eventcomment.event_id = tbl_event.id WHERE tbl_eventcomment.event_id = '" + id2 + "' order by tbl_eventcomment.date desc"); 
           
            while(rs4.next()){
                name    = rs4.getString("name");
                uni_id  = rs4.getString("uni_id"); 
                comment = rs4.getString("comment");
                date    = rs4.getString("date");
                file2   = rs4.getString("file");
                
                status  = rs4.getString("status");               
                int s = Integer.parseInt(status);
                
                if(s != 1)
                    continue;    
    %>  
                          
                        <ul class="discussion-list">

                            <li class="author-block">
                    
                                <figure class="author-picture">
                                                                                                                                                 <img src="profile_images/<%= file2 %>">
                                                                                                                                             </figure>
                                
                                <article class="paragraph-wrapper">
                                    <div class="inner">
                                        <header>
											<h5>
												<%= name %>											</h5>
                                        </header>
                                        <p><%= comment %></p>
                                    </div>
                                    <div class="comment-controls">
                                        <%
    
    String date3 = "";
    Connection conn5 = DB.getConnection();
    Statement st5 = conn5.createStatement();

    ResultSet rs5 = st5.executeQuery("select DATE_FORMAT(date, '%M %d, %Y') as 'date' FROM tbl_event where id = '" + id + "'");
    while (rs5.next()) {
        date3 = rs5.getString("date");
%>
                                        <span><%= date3 %></span>
                                        <% } %>
                                    </div>
                                </article>

                            </li>
                        </ul><!-- /.discussion-list --> 
    <%  } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%> 
                    </section><!-- /.discussion -->
                    
                    <section id="leave-reply">
                        <header><h2>Leave a comment</h2></header>
                        <form action="eventcomment.jsp" method="post" class="reply-form" data-parsley-validate="true" accept-charset="utf-8">
                            <input type="hidden" name="id" value="<%= id %>" />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="controls">
                                            <label for="comment">Your comment</label>
                                            <textarea maxlength="333" rows="4" style="resize: none" name="eventcomment" id="comment" data-parsley-required="true"></textarea>
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->
                                </div><!-- /.col-md-4 -->
                            </div><!-- /.row -->
                            <div class="form-actions pull-right">
                                <input type="submit" class="btn btn-color-primary" style="margin-bottom: 55px;" value="Submit">
                            </div><!-- /.form-actions -->
                        </form>                    
                    </section>
<%
    }
%>
                        </article><!-- /.course-detail -->
                    </section><!-- /.course-detail -->
                </div><!-- /#page-main -->
            </div><!-- /.col-md-8 -->

            <!--SIDEBAR Content-->
            <div class="col-md-4">
                <div id="page-sidebar" class="sidebar">
                    <aside class="news-small" id="news-small">
                        <header><h2>Most Read Stories</h2></header>
                        <div class="section-content">
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="../story/glasses-masses.html">
                                        Glasses for the masses                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="../story/magic-cambridge.html">
                                        The life changing magic of Cambridge                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="../story/star-_nomadess.html">
                                        A journey under the star of the nomadess                                    </a>
                                </header>
                            </article><!-- /article -->
                        </div><!-- /.section-content -->
                        <!-- <a href="blog-detail.html" class="read-more">All News</a> -->
                    </aside><!-- /.news-small -->
                </div><!-- /#sidebar -->
            </div><!-- /.col-md-4 -->
            <!-- end SIDEBAR Content-->
        </div><!-- /.row -->
            </div><!-- /.container -->
</div>
                        

<%
    } 
%>

<!-- end Page Content -->

<%@include file="includes/footer.jsp" %>
