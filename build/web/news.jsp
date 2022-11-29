<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="includes/header.jsp" %>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">News</li>
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
                    <section class="blog-listing" id="blog-listing">
                        <header><h1>News</h1></header>
                        <div class="row">
<%! 
    public int Converter(String str) { int convrtr=0; if(str==null) { str="0"; } else if((str.trim()).equals(    "null")) { str="0"; } else if(str.equals("")) { str="0"; } try{ convrtr=Integer.parseInt(str); } catch(      Exception e) { } return convrtr; } 
%>

                            

<%   
    try {
    String id = "", title = "", venue = "", file = "", para1 = "";

    Connection con = DB.getConnection();
    
    ResultSet rsPgin = null; ResultSet rsRwCn = null; PreparedStatement psPgintn=null; PreparedStatement psRwCn=null;  int iSwRws=4; int iTotSrhRcrds=4; int iTotRslts=Converter(request.getParameter("iTotRslts")); int iTotPags=Converter(request.getParameter("iTotPags")); int iPagNo=Converter(request.getParameter("iPagNo")); int cPagNo=Converter(request.getParameter("cPagNo")); int iStRsNo=0; int iEnRsNo=0; if(iPagNo==0) { iPagNo=0; } else{ iPagNo=Math.abs((iPagNo-1)*iSwRws); }

    String sqlPgintn = "select * from tbl_news order by date asc limit "+iPagNo+","+iSwRws+"";
    
    psPgintn=con.prepareStatement(sqlPgintn); 
    rsPgin=psPgintn.executeQuery(); 
    String sqlRwCnt="SELECT COUNT(*) as cnt from tbl_news"; 
    psRwCn=con.prepareStatement(sqlRwCnt); 
    rsRwCn=psRwCn.executeQuery();
    
    if(rsRwCn.next())
      {
		iTotRslts=rsRwCn.getInt("cnt");
      }



    while (rsPgin.next()){
        
        id    = rsPgin.getString("id");
        title = rsPgin.getString("title");
        file  = rsPgin.getString("file");
        para1 = rsPgin.getString("para1");

%>
                            <div class="col-md-6 col-sm-6">

                                <article class="blog-listing-post">
                                    <figure class="blog-thumbnail">
<%
    
    String date = "";
    Connection conn3 = DB.getConnection();;
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%d-%m-%Y') as 'date' FROM tbl_news where id = '" + id + "'");
    while (rs3.next()) {
        date = rs3.getString("date");
%>
                                        <figure class="blog-meta">
                                            <span class="fa fa-clock-o"></span>
                                            <%=date%>                                       
                                        </figure>
<% } %>
                                        <div class="image-wrapper">
                                            <a href="newsdetails.jsp?id=<%= id %>">
                                                <img src="news_images/<%=file%>">
                                            </a>
                                        </div>
                                    </figure>
                                    <aside>
                                        <header>
                                            <a href="newsdetails.jsp?id=<%= id %>">
                                                <h3><%=title%></h3>
                                            </a>
                                        </header>
                                        <div class="description">
                                            <p><%=para1%></p>
                                        </div>
                                        <a href="newsdetails.jsp?id=<%= id %>" class="read-more stick-to-bottom">Read More</a>
                                    </aside>
                                </article><!-- /article -->
                            </div><!-- /.col-md-6 -->
<%       }
%>                                                  
                        </div><!-- /.row -->
                    </section><!-- /.blog-listing -->
                    
                    <% try{ if(iTotRslts<(iPagNo+iSwRws)) { iEnRsNo=iTotRslts; } else { iEnRsNo=(iPagNo+iSwRws); } iStRsNo=(iPagNo+1); iTotPags=((int)(Math.ceil((double)iTotRslts/iSwRws))); } catch(Exception e) { e.printStackTrace(); } %>
                    
                    <div class="center">
                        <ul class="pagination">
<% int i=0; int cPge=0; if(iTotRslts!=0) { cPge=((int)(Math.ceil((double)iEnRsNo/(iTotSrhRcrds*iSwRws)))); int prePageNo=(cPge*iTotSrhRcrds)-((iTotSrhRcrds-1)+iTotSrhRcrds); if((cPge*iTotSrhRcrds)-(iTotSrhRcrds)>0) { %>


<li><a href="news.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>" data-ci-pagination-page="">Previous</a> </li>

<%
        }
%>

<%                
    if(iTotPags != 1){
%>
     
<li><a href="news.jsp?iPagNo=<%=1%>" data-ci-pagination-page="">First Page</a></li>
<%
        }
%>
            
<% for(i=((cPge*iTotSrhRcrds)-(iTotSrhRcrds-1));i<=(cPge*iTotSrhRcrds);i++)
                {
			if(i==((iPagNo/iSwRws)+1))
          	{
%>
<li><a href="news.jsp?iPagNo=<%=i%>" class="active" style="color: #FFF"><%=i%></a></li>

<%
          	}
			else if(i<=iTotPags)
          	{
%>
<li><a href="news.jsp?iPagNo=<%=i%>" data-ci-pagination-page=""><%=i%></a></li>

<% 
          	}
        }
	
		if(iTotPags>iTotSrhRcrds && i<iTotPags)
        {
%>
     
<li><a href="news.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>" data-ci-pagination-page="">Next</a></li>
<%
        }
      
%>
<%                
    if(iTotSrhRcrds > iTotPags){
%>
     
<li><a href="news.jsp?iPagNo=<%= iTotPags %>" data-ci-pagination-page="">Last Page</a></li>
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
                                    <a href="story/glasses-masses.html">
                                        Glasses for the masses                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="story/magic-cambridge.html">
                                        The life changing magic of Cambridge                                    </a>
                                </header>
                            </article><!-- /article -->
                                                    <article>
                                <figure class="date">
                                    <i class="fa fa-calendar"></i>
                                    12-10-2018                                </figure>
                                <header>
                                    <a href="story/star-_nomadess.html">
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
                                    <a href="archive_stories/1.html">
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
        <!-- end Page Content -->
        
<%@include file="includes/footer.jsp" %>