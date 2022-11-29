<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@include file="includes/header.jsp" %>

<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){ 
%>
    <script type="text/javascript">
        alert("You aren't logged in ! Please log in to continue.");
        window.location = "login.jsp";
    </script>
<%
    } else {
%>

<% 
        String uni_id = "", status = "";
        Connection conn4 = DB.getConnection();
        Statement st4 = conn4.createStatement();
        ResultSet rs4;  
        rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + session.getAttribute("uni_id") + "'");
        
        while (rs4.next()){
                status = rs4.getString("status");
                int s = Integer.parseInt(status);
            if (s == 0){
                response.sendRedirect("loginerror.jsp");

            } else {
%>

<style>
    .events.images .event .event-thumbnail .event-image .image-wrapper img {
        width: auto;
        height: 165px;
}
</style>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Events</li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div class="col-md-8">
                <div id="page-main">
                    <section class="events images" id="events">
                        <header><h1>Events</h1></header>
                        <div class="section-content">
<%! 
    public int Converter(String str) { int convrtr=0; if(str==null) { str="0"; } else if((str.trim()).equals(    "null")) { str="0"; } else if(str.equals("")) { str="0"; } try{ convrtr=Integer.parseInt(str); } catch(      Exception e) { } return convrtr; } 
%>

                            

<%   
    try {
    String id = "", title = "", venue = "", file = "", para1 = "";

    Connection con = DB.getConnection();
    
    ResultSet rsPgin = null; ResultSet rsRwCn = null; PreparedStatement psPgintn=null; PreparedStatement psRwCn=null;  int iSwRws=3; int iTotSrhRcrds=4; int iTotRslts=Converter(request.getParameter("iTotRslts")); int iTotPags=Converter(request.getParameter("iTotPags")); int iPagNo=Converter(request.getParameter("iPagNo")); int cPagNo=Converter(request.getParameter("cPagNo")); int iStRsNo=0; int iEnRsNo=0; if(iPagNo==0) { iPagNo=0; } else{ iPagNo=Math.abs((iPagNo-1)*iSwRws); }




    
    String sqlPgintn = "select * from tbl_event order by date asc limit "+iPagNo+","+iSwRws+"";
    
    psPgintn=con.prepareStatement(sqlPgintn); 
    rsPgin=psPgintn.executeQuery(); 
    String sqlRwCnt="SELECT COUNT(*) as cnt from tbl_event"; 
    psRwCn=con.prepareStatement(sqlRwCnt); 
    rsRwCn=psRwCn.executeQuery();
    
    if(rsRwCn.next())
      {
		iTotRslts=rsRwCn.getInt("cnt");
      }



    while (rsPgin.next()){
        
        id    = rsPgin.getString("id");
        title = rsPgin.getString("title");
        venue = rsPgin.getString("venue");
        file  = rsPgin.getString("file");
        para1 = rsPgin.getString("para1");

%>
                            <article class="event">
                                <div class="event-thumbnail">
                                    <figure class="event-image">
                                        <div class="image-wrapper">
                                            <img src="event_images/<%=file%>">
                                        </div>
                                    </figure>

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
                                </div>
                                <aside>
                                    <header>
                                        <a href="event/Harper_Lectures.jsp">
                                            <%=title%>                                       </a>
                                    </header>
                                    <div class="additional-info">
                                        <span class="fa fa-map-marker"></span> <%=venue%></div>
                                    <div class="description">
                                        <p><%=para1%></p>
                                    </div>
                                    <a href="eventdetails.jsp?id=<%= id %>" class="btn btn-framed btn-color-grey btn-small">View Detail</a>
                                </aside>
                            </article><!-- /.event -->
                            
<%       }
%>
                                                       
                        </div><!-- /.section-content -->
                    </section><!-- /.events-images -->

                    <% try{ if(iTotRslts<(iPagNo+iSwRws)) { iEnRsNo=iTotRslts; } else { iEnRsNo=(iPagNo+iSwRws); } iStRsNo=(iPagNo+1); iTotPags=((int)(Math.ceil((double)iTotRslts/iSwRws))); } catch(Exception e) { e.printStackTrace(); } %>

                    
                    <div class="center">
                        <ul class="pagination">
<% int i=0; int cPge=0; if(iTotRslts!=0) { cPge=((int)(Math.ceil((double)iEnRsNo/(iTotSrhRcrds*iSwRws)))); int prePageNo=(cPge*iTotSrhRcrds)-((iTotSrhRcrds-1)+iTotSrhRcrds); if((cPge*iTotSrhRcrds)-(iTotSrhRcrds)>0) { %>


<li><a href="events.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>" data-ci-pagination-page="">Previous</a> </li>

<%
        }
%>

<%                
    if(iTotPags != 1){
%>
     
<li><a href="events.jsp?iPagNo=<%=1%>" data-ci-pagination-page="">First Page</a></li>
<%
        }
%>
            
<% for(i=((cPge*iTotSrhRcrds)-(iTotSrhRcrds-1));i<=(cPge*iTotSrhRcrds);i++)
                {
			if(i==((iPagNo/iSwRws)+1))
          	{
%>
<li><a href="events.jsp?iPagNo=<%=i%>" class="active" style="color: #FFF"><%=i%></a></li>

<%
          	}
			else if(i<=iTotPags)
          	{
%>
<li><a href="events.jsp?iPagNo=<%=i%>" data-ci-pagination-page=""><%=i%></a></li>

<% 
          	}
        }
	
		if(iTotPags>iTotSrhRcrds && i<iTotPags)
        {
%>
     
<li><a href="events.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>" data-ci-pagination-page="">Next</a></li>
<%
        }
      
%>
<%                
    if(iTotSrhRcrds > iTotPags){
%>
     
<li><a href="events.jsp?iPagNo=<%= iTotPags %>" data-ci-pagination-page="">Last Page</a></li>
<%
        }
%>
                        </ul>
                    </div>
                </div><!-- /#page-main -->
            </div><!-- /.col-md-8 -->
            
<% try{ if(psPgintn!=null){ psPgintn.close(); } if(rsPgin!=null){ rsPgin.close(); }	if(psRwCn!=null){ psRwCn.close(); } if(rsRwCn!=null){ rsRwCn.close(); } if(con!=null){ con.close(); } } catch(Exception e) { e.printStackTrace(); } %>

<%      } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%>   

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
                                    <a href="story/glasses-masses.jsp">
                                        Glasses for the masses                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="story/magic-cambridge.jsp">
                                        The life changing magic of Cambridge                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="story/star-_nomadess.jsp">
                                        A journey under the star of the nomadess                                    </a>
                                </header>
                            </article><!-- /article -->
                                                </div><!-- /.section-content -->
                        <!-- <a href="blog-detail.html" class="read-more">All News</a> -->
                    </aside><!-- /.news-small -->
                </div><!-- /#sidebar -->
            </div><!-- /.col-md-4 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>

<!-- end Page Content -->
        <!-- end Page Content -->
        
<% } } } %>
        
<%@include file="includes/footer.jsp" %>
        