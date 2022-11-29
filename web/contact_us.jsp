<%@include file="includes/header.jsp" %>

<!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.html">Home</a></li>
        <li class="active">Contact Us</li>
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
                    <section id="contact">
                                            <header><h1>Contact Us</h1></header>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <h3>Venus Alumni Association</h3>
                                    <br>
                                    <span>4877 Spruce Drive</span>
                                    <br>
                                    <span>West Newton, PA 15089</span>
                                    <br>
                                    <abbr title="Telephone">Telephone:</abbr> +1 (734) 123-4567                                    <br>
                                    <abbr title="Email">Email:</abbr> <a href="mailto:Snigdho2011@gmail.com">Snigdho2011@gmail.com</a>
                                </address>
                                <div class="icons">
                                    <a href="https://twitter.com/t1m9m" target="_blank">
                                        <i class="fa fa-twitter" style="color: #55acee"></i>
                                    </a>
                                    <a href="https://www.facebook.com/t1m9mofficial" target="_blank">
                                        <i class="fa fa-facebook" style="color: #3b5998"></i>
                                    </a>
                                    <a href="https://www.linkedin.com/in/t1m9m/" target="_blank">
                                        <i class="fa fa-linkedin" style="color: #007bb5"></i>
                                    </a>
                                    <a href="https://www.youtube.com/channel/UCSOsUZOu64EJrypoU3MJRjQ" target="_blank">
                                        <i class="fa fa-youtube-play" style="color: #bb0000"></i>
                                    </a>
                                </div><!-- /.icons -->
                                <hr>
                                <p>As for any undergraduate, the first year passed in a blur of textbooks, lectures and nights out. The atmosphere at Cambridge was like nothing I’d ever experienced before: everyone seemed to share a common desire to debate.</p>
                            </div>
                            <div class="col-md-6">
                                <div class="map-wrapper">
                                    
                               
                                    
                                    
                                    <iframe width="100%" height="350" src="https://maps.google.com/maps?width=100%&amp;height=350&amp;hl=en&amp;q=Mawlana%20Bhashani%20Science%20and%20Technology%20University+(alumni)&amp;ie=UTF8&amp;t=&amp;z=16&amp;iwloc=B&amp;output=embed" frameborder="0" style="border:0"></iframe>
                                    
                                    
                                </div>
                            </div>
                        </div>
                                        </section>
                    <section id="contact-form" class="clearfix">
                        <header><h2>Send Us a Message</h2></header>
                        <form action="admin/contact_details.jsp" method="post" name="contact_us" class="contact-form" data-parsley-validate="true" accept-charset="utf-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <div class="controls">
                                            <label for="name">Your Name</label>
                                            <input type="text" name="name" id="name" data-parsley-required="true">
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->
                                </div><!-- /.col-md-4 -->
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <div class="controls">
                                            <label for="email">Your Email</label>
                                            <input type="email" name="email" id="email" data-parsley-required="true">
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->
                                </div><!-- /.col-md-4 -->
                            </div><!-- /.row -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="controls">
                                            <label for="message">Your Message</label>
                                            <textarea name="message" id="message" style="resize: none" maxlength="666" data-parsley-required="true"></textarea>
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->
                                </div><!-- /.col-md-4 -->
                            </div><!-- /.row -->
                            <div class="pull-right">
                                <input type="submit" class="btn btn-color-primary" id="submit" value="Send Us a Message">
                            </div><!-- /.form-actions -->
                        </form>                    </section>
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
                </div><!-- /#sidebar -->
            </div><!-- /.col-md-4 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->
        <!-- end Page Content -->
        
<%@include file="includes/footer.jsp" %>