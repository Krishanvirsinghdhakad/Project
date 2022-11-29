<%-- 
    Document   : newsdetails
    Created on : Sep 21, 2019, 2:50:44 PM
    Author     : singdho
--%>

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
    
    String title = "", file = "", para1 = "",  para2 = "", para3 = "";
    int views;
    Connection conn = DB.getConnection();
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_news where id = '" + id + "'");
    while (rs.next()) {
        title      = rs.getString("title");
        file       = rs.getString("file");        
        para1      = rs.getString("para1");
        para2      = rs.getString("para2");
        para3      = rs.getString("para3");
        
%>



<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="news.jsp">News</a></li>
        <li class="active"><%= title %></li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div class="col-md-8">
                <div id="page-main" style="margin-bottom: 100px">
                    <section id="blog-detail">
                        <header><h1>News</h1></header>
                        <article class="blog-detail">
                            <header class="blog-detail-header">
                                <img src="news_images/<%=file%>">
                                <h2><%= title %></h2>
                                <div class="blog-detail-meta">
<%
    
    String date = "";
    Connection conn3 = DB.getConnection();;
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W %M %d, %Y') as 'date' FROM tbl_news where id = '" + id + "'");
    while (rs3.next()) {
        date = rs3.getString("date");
%>
                                    <span class="author">
                                        <span class="fa fa-calendar-o"></span>
                                        <%= date %>                                 
                                    </span>
<%
    }
%>   

<%
         Integer Hits = rs.getInt("views");;
	 if( (Hits == 0) || (Hits == null) ){	 
            Hits = 1;
	 } else {
            Hits += 1;
	 }
	 
        try {

            Connection con = DB.getConnection();	
            PreparedStatement ps = con.prepareStatement("UPDATE tbl_news SET views = '" + Hits + "' where id = '" + id + "' ");
            views = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);		
        }
%>

                                    <span class="author">
                                        <span class="fa fa-user"></span>
                                        <%= Hits %> views                                
                                    </span>
                                    
                                    <span class="author">
                                        <span class="fa fa-comment-o"></span>
                                        0 comments
                                    </span>
                                </div>
                            </header>
                            <hr>
                            <p><%= para1 %></p>
                            <p><%= para2 %></p>
                            <p><%= para3 %></p>
                        </article>
                    </section><!-- /.blog-detail -->
                    <hr>
                    <section id="discussion">
                        <header><h2>Comments</h2></header>
                        <ul class="discussion-list">
						                        </ul><!-- /.discussion-list -->
                    </section><!-- /.discussion -->
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
                                    <a href="glasses-masses.html">
                                        Glasses for the masses                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="magic-cambridge.html">
                                        The life changing magic of Cambridge                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="star-_nomadess.html">
                                        A journey under the star of the nomadess                                    </a>
                                </header>
                            </article><!-- /article -->
                                                </div><!-- /.section-content -->
                        <!-- <a href="blog-detail.html" class="read-more">All News</a> -->
                    </aside><!-- /.news-small -->
                    <aside id="archive">
                        <header>
                            <h2>Archive</h2>
                            <ul class="list-links">
                                                            <li>
                                    <a href="../archive_stories/1.html">
                                        December 2018                                    </a>
                                </li>
                                                        </ul>
                        </header>
                    </aside><!-- /archive -->
                </div><!-- /#sidebar -->
            </div><!-- /.col-md-4 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->
                        

<%
    } 
%>

<!-- end Page Content -->

<%@include file="includes/footer.jsp" %>
