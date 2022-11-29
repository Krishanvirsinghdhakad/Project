<%-- 
    Document   : teachers
    Created on : Nov 12, 2019, 9:47:39 PM
    Author     : singdho
--%>

<%@include file="includes/header.jsp" %>

<style>
    .search-box .btn {
        margin-top: 23px;
        margin-right: 20px;
        padding: 8px 34px;
    }
    
    .search-box #event-search-form .form-group {
        width: 78%;
    }
</style>

        <!-- Page Content -->
        <!-- Breadcrumb -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Teachers</li>
    </ol>
</div>
<!-- end Breadcrumb -->

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div id="page-main">
                    <section id="members">
                        <header><h1>Search Teacher</h1></header>
                        <section id="event-search">
                            <div class="search-box">
				<form action="" method="post" class="form-inline" id="event-search-form" accept-charset="utf-8">
                                    <div class="from-row">
                                        <div class="form-group">
                                            <label>Department</label>
                                            <select name="department">
                                                <option value="">Select Department</option>
                                            												<option value="2019">2019</option>
		                                    												<option value="2018">2018</option>
		                            </select>
                                        </div>
                                        
                                        <button type="submit" class="btn pull-right">Search</button> 
                                    </div>
                                    
                                </form> 
                                
                                <form action="" method="post" class="form-inline" id="event-search-form" accept-charset="utf-8">
                                    <div class="from-row">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name"placeholder="Enter name" type="text">
                                        </div>
                                        
                                        <button type="submit" class="btn pull-right">Search</button> 
                                    </div>
                                    
                                </form> 
                                
                            </div>
                        </section>
                        
                        <section class="course-listing" id="courses">
                        
                            <section id="course-list">
                            <div class="table-responsive">
                                <h3 style="margin-bottom: 5px; text-align: center; margin-top: 35px;">Departments</h3>
                                    <div class="table-responsive">
                                        <table class="table table-hover course-list-table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                    
                                                <tr>
                                                    <td class="course-title">Mobile Number</td>
                                       
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Email</td>
                                       
                                                    
                                                </tr>
                                    
                                    
                                    
                                                <tr>
                                                    <td class="course-title">Present Address</td>
                                                
                                                    
                                                </tr>
                                                
                                                <tr>
                                                    <td class="course-title">Permanent Address</td>
                                                
                                                    
                                               
                                                </tr>
                                    
                                    
                                                
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                        </section>
                    </section>
                        
                        <div class="center">
	                        <ul class="pagination">
	                        <li> </li><li><a class="active" style="color: #FFF">1</a><a href="https://venus.t1m9m.com/alumni/4" data-ci-pagination-page="2">2</a><a href="https://venus.t1m9m.com/alumni/8" data-ci-pagination-page="3">3</a><a href="https://venus.t1m9m.com/alumni/4" data-ci-pagination-page="2" rel="next">Next</a> </li>	                        </ul>
	                    </div>
                    </section>
                </div>
            </div>

<%@include file="includes/sidebar.jsp" %>
            
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
<!-- end Page Content -->

<script>
	// alert('HEY!');
</script>
        <!-- end Page Content -->
        <!-- Footer -->

        
<%@include file="includes/footer.jsp" %>