<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@include file="includes/header.jsp" %>

<style>
.quote {
    position: relative;
    padding: 0 40px 0 50px;
}
.quote .fa-quote-left {
    position: absolute;
    top: 50%;
    margin-top: -22px;
    color: #34a7c1;    
}

.quote .fa-quote-right {
    position: absolute;
    top: 49%;
    margin-top: -22px;
    color: #34a7c1;    
}

.quote .fa-quote-left {
    left:30px;
}
.quote .fa-quote-right {
    right: 426px;
}

.p{
    color: #fff;
    text-align: justify;
    width: 410px;
    margin-left: 49px;
    margin-bottom: 20px;
    float: left;
}

.professor-thumbnail {
    border: 2px solid whitesmoke;
    padding: 8px;
    margin-bottom: 25px;
}

</style>
		
       <!-- Page Content -->
        <div id="page-content">
    <!-- Slider -->
    <div id="homepage-carousel">
        <div class="container">
            <div class="homepage-carousel-wrapper">
                <div class="row">
                    <div class="col-md-6 col-sm-7">

                        <div class="image-carousel">
                            
<%   
            try {
            String id = "", title = "", name = "", path = "";
            
            int i = 0;
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from tbl_slider");
                         
            
            while (rs.next()){
                i++;
                               
                id    = rs.getString("id");
                title = rs.getString("title");
                name  = rs.getString("name");
                path  = rs.getString("path");
                
%>  
                        <div class="image-carousel-slide">
                            <img src="slider_images/<%=name%>" alt="Slider Images" style="width: 555px; height: 320px;">
                        </div>
<%      } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%>  
                              
                            
                         
                        </div><!-- /.slider-image -->

                    </div><!-- /.col-md-6 -->
                    <div class="col-md-6 col-sm-5">
                        <div class="slider-content">
                            <div class="row">
                                
                                <div class="col-md-12" style="min-height: 324px;">
                                    
                                    <div class="quote"> <i class="fa fa-quote-left"></i><h2>Hello</h2> <i class="fa fa-quote-right"></i>
                                    </div>
                                    
                                    <div class="solution" style="width: 730px;">
                                    
                                    <p class="p">At SSM College of Engineering, we  shape the students not merely as technical manpower but highly motivated creative professionals with highest degree of skillful knowledge blended with rich ethical values .We do not confine our teaching learning process to imparting theoretical knowledge alone but put the student to extensive laboratory work, expose them to the actual world of work through technical visits ,practical trainings, industry based and innovative projects and internships. The rich record of holding co-curricular and extra-curricular activities in the institution and interaction with high profile personalities from different walks of life through interactive programmes, extension lectures and expert lectures brace the students with high quality communication skills and challenge facing qualities.
It is truly a life experience. We invite you to explore our dynamic and diverse community by paying a visit at your convenience <br>
                                        <b style="line-height: 40px; font-size: 15px;"> - Professor Dr. Md. Alauddin</b></p>
                                    
                                    <img src="uploads/vc sir/vc_sir.jpg" style="float: right; height: 175px; width: 190px; margin-right: 45px; margin-top: 3px; border: 1px dashed #fff; border-radius: 3px;" alt="" />
                                    </div>
                                       
                                    
                                </div><!-- /.col-md-12 -->
                                
                            </div><!-- /.row -->
                        </div><!-- /.slider-content -->
                    </div><!-- /.col-md-6 -->
                </div><!-- /.row -->
                <div class="background"></div>
            </div><!-- /.slider-wrapper -->
            <div class="slider-inner"></div>
        </div><!-- /.container -->
    </div>
    <!-- end Slider -->

    <!-- News, Events, About -->
    <div class="block">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <section class="news-small" id="news-small">
                        <header>
                            <h2>Stories</h2>
                        </header>
                        <div class="section-content">
						                            <article>
                                <figure class="date">
									<i class="fa fa-calendar"></i> 12-10-2018								</figure>
                                <header>
									<a href="story/magic-cambridge.html">The life changing magic of Cambridge</a>
                                </header>
                            </article>
                                                    <article>
                                <figure class="date">
									<i class="fa fa-calendar"></i> 12-10-2018								</figure>
                                <header>
									<a href="story/glasses-masses.html">Glasses for the masses</a>
                                </header>
                            </article>
                                                    <article>
                                <figure class="date">
									<i class="fa fa-calendar"></i> 12-10-2018								</figure>
                                <header>
									<a href="story/star-_nomadess.html">A journey under the star of the nomadess</a>
                                </header>
                            </article>
                                                </div><!-- /.section-content -->
                        <!-- <a href="index.html" class="read-more stick-to-bottom">All News</a> -->
                    </section><!-- /.news-small -->
                </div><!-- /.col-md-4 -->
                <div class="col-md-4 col-sm-6">

                    <section class="events small" id="events-small">
                        <header>
                            <h2>Events</h2>
                            <!-- <a href="index.html" class="link-calendar">Calendar</a> -->
                        </header>
                        <div class="section-content">
        <%   
            try {
            String id = "", title = "", time = "", hashtag = "", file = "";
            
            int i = 0;
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from tbl_event order by date desc limit 3");
                         
            
            while (rs.next()){
                i++;
                               
                id    = rs.getString("id");
                title = rs.getString("title");
                time  = rs.getString("time");
                hashtag = rs.getString("hashtag");
                file  = rs.getString("file");
                 
        %>
						                            <article class="event nearest">

                                <figure class="date">
<%
    
    String date1 = "";
    Connection conn3 = DB.getConnection();
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%b') as 'date' FROM tbl_event where id = '" + id + "'");
    while (rs3.next()) {
        date1 = rs3.getString("date");
%>
                                        <div class="month"><%=date1%></div>
<% } %>
<%
    String date = "";
    Connection conn2 = DB.getConnection();
    Statement st2 = conn2.createStatement();

    ResultSet rs2 = st2.executeQuery("select DATE_FORMAT(date, '%d') as 'date' FROM tbl_event where id = '" + id + "'");
    while (rs2.next()) {
        date = rs2.getString("date");
%>
                                        <div class="day"><%=date%></div>
                                    </figure>
<% } %>
                                <aside>
                                    <header>
                                        <a href="eventdetails.jsp?id=<%= id %>">
											<%= title %>                                       </a>
                                    </header>
                                    <div class="additional-info">#<%= hashtag %></div>
                                </aside>
 
                            </article>
                                <%       } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%>
                                                    
                                                </div><!-- /.section-content -->
                                                
         
                    </section><!-- /.events-small -->
                </div><!-- /.col-md-4 -->
                <div class="col-md-4 col-sm-12">
                    <section id="about">
                        
<%   
    try {
    String title = "", description = "", image = "";

    Connection con = DB.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from tbl_about where id = '1'");


    while (rs.next()){

        title       = rs.getString("title");
        description = rs.getString("description");
        image       = rs.getString("image");
                
%>  

                        <header>
                            <h2>About <%=title%></h2>
                        </header>
                        <div class="section-content">
                            <img src="about_images/<%=image%>" alt="About" style="height: 118px; width: 360px;" class="add-margin">
                            <p><%=description%></p>
                        </div><!-- /.section-content -->
<%                                
    } }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }   
%>
                    </section><!-- /.about -->
                </div><!-- /.col-md-4 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div>
    <!-- end News, Events, About -->

    <!-- Our Professors, Gallery -->
    <div class="block">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <section id="our-professors">
                        <header>
                            <h2>Our Alumni</h2>
                        </header>
                        <div class="section-content">
                            <div class="professors">
                                
                                <article class="professor-thumbnail">
                                    <figure class="professor-image">
										<a href="alumnus/rajkumarcwd.html">
																					<img style="width: 80px !important" src="assets/dummy.png" alt="">
																				</a>
									</figure>
                                    <aside>
                                        <header>
                                            <a href="alumnus/rajkumarcwd.html">
												Rajkumar                                            </a>
                                            <div class="divider"></div>
                                            <figure class="professor-description"></figure>
                                        </header>
                                        <a href="alumnus/rajkumarcwd.html" class="show-profile">
											Show Profile
                                        </a>
                                    </aside>
                                </article>
                                
                                <article class="professor-thumbnail">
                                    <figure class="professor-image">
										<a href="alumnus/kishore.html">
																					<img style="width: 80px !important" src="assets/dummy.png" alt="">
																				</a>
									</figure>
                                    <aside>
                                        <header>
                                            <a href="alumnus/kishore.html">
												Kishore S                                            </a>
                                            <div class="divider"></div>
                                            <figure class="professor-description"></figure>
                                        </header>
                                        <a href="alumnus/kishore.html" class="show-profile">
											Show Profile
                                        </a>
                                    </aside>
                                </article>
                                                        </div><!-- /.professors -->
                        </div><!-- /.section-content -->
                    </section><!-- /.our-professors -->
                </div><!-- /.col-md-4 -->

                <div class="col-md-8 col-sm-8">
                    <section id="gallery">
                        <header>
                            <h2>Gallery</h2>
                        </header>
                        <div class="section-content">
                            <ul class="gallery-list">
							                                <li>
									<a href="uploads/gallery/home10.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_home10.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g14.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g14.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g13.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g13.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g12.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g12.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g11.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g11.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g10.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g10.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g9.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g9.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g8.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g8.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g7.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g7.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g6.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g6.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g5.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g5.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g4.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g4.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g3.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g3.jpg" alt="">
									</a>
                                </li>
							                                <li>
									<a href="uploads/gallery/a2g2.jpg" class="image-popup">
										<img src="uploads/gallery/thumb_a2g2.jpg" alt="">
									</a>
                                </li>
							                            </ul>
                        </div><!-- /.section-content -->
                    </section><!-- /.gallery -->
                </div><!-- /.col-md-4 -->

            </div><!-- /.row -->
        </div><!-- /.container -->
    </div>
    <!-- end Our Professors, Gallery -->
</div>
        <!-- end Page Content -->
        
<%@include file="includes/footer.jsp" %>