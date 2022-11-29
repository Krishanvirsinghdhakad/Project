<%@include file="includes/header.jsp" %>

<% 
    if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){ 
%>
    <div class='alert alert-warning'>You aren't logged in ! Please <a class="btn btn-primary btn-xs" href="login.jsp">log in</a> to continue.</div>
<%
    } else {
%>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.html">Home</a></li>
        <li class="active">Notice Board</li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <!--MAIN Content-->
            <div class="col-md-12">
                <div id="page-main">
                    <section class="blog-listing">
                        <header><h1>Notice Board</h1></header>
                        <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                <div class="author">
                                    <blockquote>
                                        <article class="paragraph-wrapper">
                                            <div class="inner">
                                                <h3>Alumni Association Notice </h3>
                                                <header>The annual Alumni Assembly Meeting will take place on November 3, 2017. At the meeting, we will hear from several speakers, hold elections for our 2018 Alumni Board, and vote on proposed amendments to the Alumni Association Constitution and Bylaws. Notices will be sent to assembly members by email, and please check the alumni website at www.bc.edu/lawalumni for more information on this and all other alumni association notices.</header>
                                                <footer>03 Jun, 2019</footer>
                                            </div>
                                        </article>
                                    </blockquote>
                                </div>
                            </div>
                                                    <div class="col-md-6 col-sm-12">
                                <div class="author">
                                    <blockquote>
                                        <article class="paragraph-wrapper">
                                            <div class="inner">
                                                <h3>The ‘Big Man’ Remembered </h3>
                                                <header>Beloved professor and “lawyer’s lawyer” Peter Donovan ’60, admired for his brilliance and adored for his commitment to students, passed away in February but not before his many admirers paid homage to him at a rollicking tribute during Reunion Weekend 2016. “Peter was an authentic. Not a phony facet to him,” said Peter del Vecchio ’81, a former student who helped organize the reunion tribute. “He presented a gruff exterior, but had nothing but pure love.”</header>
                                                <footer>10 Dec, 2018</footer>
                                            </div>
                                        </article>
                                    </blockquote>
                                </div>
                            </div>
                                                    <div class="col-md-6 col-sm-12">
                                <div class="author">
                                    <blockquote>
                                        <article class="paragraph-wrapper">
                                            <div class="inner">
                                                <h3>Professor Ashish Nanda takes over as Director</h3>
                                                <header>We  are  pleased  to  announce  the  appointment  of  Professor  Ashish  Nanda  as  Director  of  the  Indian Institute of Management, Ahmedabad. Prof. Nanda assumed office on September 2, 2013.An alumnus of  the  PGP  1983  batch,  Prof.  Nanda  has  a PhD (Business  Economics) and  AM  (Economics)  from Harvard  University.  He  was  Robert  Braucher  Professor  of  Practice,  Faculty  Director  of  Executive Education,  and  Research  Director  at  the  Program  on  the  Legal  Profession.</header>
                                                <footer>10 Dec, 2018</footer>
                                            </div>
                                        </article>
                                    </blockquote>
                                </div>
                            </div>
                                                    <div class="col-md-6 col-sm-12">
                                <div class="author">
                                    <blockquote>
                                        <article class="paragraph-wrapper">
                                            <div class="inner">
                                                <h3>Live streaming of IIMA Convocation 2017</h3>
                                                <header> Dear Alumni, The 52nd Annual Convocation of the Institute will be held on Saturday, March 25, 2017 at 6.00 PM at the Louis Kahn Plaza, IIMA Main Campus, Ahmedabad. Smt. Shikha Sharma, CEO and Managing Director, Axis Bank Ltd. has kindly consented to be the Chief Guest for the Convocation. We would be delighted to have your presence at the convocation. Click here to download the Convocation 2017 invitation card. Axis Bank Ltd.
</header>
                                                <footer>10 Dec, 2018</footer>
                                            </div>
                                        </article>
                                    </blockquote>
                                </div>
                            </div>
                                                </div><!-- /.row -->
                    </section><!-- /.blog-listing -->
                    <div class="center">
                        <ul class="pagination">
                        <li> </li><li><a class="active" style="color: #FFF">1</a><a href="notices/4.html" data-ci-pagination-page="2">2</a><a href="notices/4.html" data-ci-pagination-page="2" rel="next">Next</a> </li>                        </ul>
                    </div>
                </div><!-- /#page-main -->
            </div><!-- /.col-md-8 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->
        <!-- end Page Content -->

        <% } %>
        
<%@include file="includes/footer.jsp" %>


