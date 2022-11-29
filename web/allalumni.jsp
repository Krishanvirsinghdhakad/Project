<%@include file="includes/header.jsp" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
        if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){
            
    %>
        <script type="text/javascript">
            alert("You aren't logged in ! Please log in to continue.");
            window.location = "./login.jsp";
        </script>
    <%
        }
    %>
        <!-- Page Content -->
        <!-- Breadcrumb -->
        
    <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt. executeQuery("select * from tbl_registration where uni_id="+session.getAttribute("uni_id")+" and power='STUDENT'");
            String payment = "";
            while(rs.next()){
                payment = rs.getString("payment");
            }
            
    %>
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">All Alumni</li>
    </ol>
</div>

<!-- Page Content -->
<div id="page-content">
    <div class="container">
        <div class="row">
  <%
if(payment.equals("0")){
                %>
                <script>
                    window.location.href="./gateway/pay.jsp";
                </script>
            <%
            }else{
    
%>          <div class="col-md-8">
                <div id="page-main">
                    <section id="members">
                        <header><h1>Alumni</h1></header>
                        <section id="event-search">
                            <div class="search-box">
								<form action="#" method="post" class="form-inline" id="event-search-form" accept-charset="utf-8">
                                    <div class="from-row">
                                        <div class="form-group">
                                            <label>Batch</label>
                                            <select name="batch">
                                                <option value="">Select Class</option>
                                            												<option value="2019">2019</option>
		                                    												<option value="2018">2018</option>
		                                    												<option value="2017">2017</option>
		                                    												<option value="2016">2016</option>
		                                    												<option value="2015">2015</option>
		                                    												<option value="2014">2014</option>
		                                    												<option value="2013">2013</option>
		                                    												<option value="2012">2012</option>
		                                    												<option value="2011">2011</option>
		                                    												<option value="2010">2010</option>
		                                    												<option value="2009">2009</option>
		                                    												<option value="2008">2008</option>
		                                    												<option value="2007">2007</option>
		                                    												<option value="2006">2006</option>
		                                    												<option value="2005">2005</option>
		                                    												<option value="2004">2004</option>
		                                    												<option value="2003">2003</option>
		                                    												<option value="2002">2002</option>
		                                    												<option value="2001">2001</option>
		                                    												<option value="2000">2000</option>
		                                    												<option value="1999">1999</option>
		                                    												<option value="1998">1998</option>
		                                    												<option value="1997">1997</option>
		                                    												<option value="1996">1996</option>
		                                    												<option value="1995">1995</option>
		                                    												<option value="1994">1994</option>
		                                    												<option value="1993">1993</option>
		                                    												<option value="1992">1992</option>
		                                    												<option value="1991">1991</option>
		                                    												<option value="1990">1990</option>
		                                    												<option value="1989">1989</option>
		                                    												<option value="1988">1988</option>
		                                    												<option value="1987">1987</option>
		                                    												<option value="1986">1986</option>
		                                    												<option value="1985">1985</option>
		                                    												<option value="1984">1984</option>
		                                    												<option value="1983">1983</option>
		                                    												<option value="1982">1982</option>
		                                    												<option value="1981">1981</option>
		                                    												<option value="1980">1980</option>
		                                    												<option value="1979">1979</option>
		                                    												<option value="1978">1978</option>
		                                    												<option value="1977">1977</option>
		                                    												<option value="1976">1976</option>
		                                    												<option value="1975">1975</option>
		                                    												<option value="1974">1974</option>
		                                    												<option value="1973">1973</option>
		                                    												<option value="1972">1972</option>
		                                    												<option value="1971">1971</option>
		                                    												<option value="1970">1970</option>
		                                    												<option value="1969">1969</option>
		                                    												<option value="1968">1968</option>
		                                    												<option value="1967">1967</option>
		                                    												<option value="1966">1966</option>
		                                    												<option value="1965">1965</option>
		                                    												<option value="1964">1964</option>
		                                    												<option value="1963">1963</option>
		                                    												<option value="1962">1962</option>
		                                    												<option value="1961">1961</option>
		                                    												<option value="1960">1960</option>
		                                    												<option value="1959">1959</option>
		                                    												<option value="1958">1958</option>
		                                    												<option value="1957">1957</option>
		                                    												<option value="1956">1956</option>
		                                    												<option value="1955">1955</option>
		                                    												<option value="1954">1954</option>
		                                    												<option value="1953">1953</option>
		                                    												<option value="1952">1952</option>
		                                    												<option value="1951">1951</option>
		                                    												<option value="1950">1950</option>
		                                    												<option value="1949">1949</option>
		                                    												<option value="1948">1948</option>
		                                    												<option value="1947">1947</option>
		                                    												<option value="1946">1946</option>
		                                    												<option value="1945">1945</option>
		                                    												<option value="1944">1944</option>
		                                    												<option value="1943">1943</option>
		                                    												<option value="1942">1942</option>
		                                    												<option value="1941">1941</option>
		                                    												<option value="1940">1940</option>
		                                    												<option value="1939">1939</option>
		                                    												<option value="1938">1938</option>
		                                    												<option value="1937">1937</option>
		                                    												<option value="1936">1936</option>
		                                    												<option value="1935">1935</option>
		                                    												<option value="1934">1934</option>
		                                    												<option value="1933">1933</option>
		                                    												<option value="1932">1932</option>
		                                    												<option value="1931">1931</option>
		                                    												<option value="1930">1930</option>
		                                    												<option value="1929">1929</option>
		                                    												<option value="1928">1928</option>
		                                    												<option value="1927">1927</option>
		                                    												<option value="1926">1926</option>
		                                    												<option value="1925">1925</option>
		                                    												<option value="1924">1924</option>
		                                    												<option value="1923">1923</option>
		                                    												<option value="1922">1922</option>
		                                    												<option value="1921">1921</option>
		                                    												<option value="1920">1920</option>
		                                    												<option value="1919">1919</option>
		                                    												<option value="1918">1918</option>
		                                    												<option value="1917">1917</option>
		                                    												<option value="1916">1916</option>
		                                    												<option value="1915">1915</option>
		                                    												<option value="1914">1914</option>
		                                    												<option value="1913">1913</option>
		                                    												<option value="1912">1912</option>
		                                    												<option value="1911">1911</option>
		                                    												<option value="1910">1910</option>
		                                    												<option value="1909">1909</option>
		                                    												<option value="1908">1908</option>
		                                    												<option value="1907">1907</option>
		                                    												<option value="1906">1906</option>
		                                    												<option value="1905">1905</option>
		                                    												<option value="1904">1904</option>
		                                    												<option value="1903">1903</option>
		                                    												<option value="1902">1902</option>
		                                    												<option value="1901">1901</option>
		                                    												<option value="1900">1900</option>
		                                                                                </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name"placeholder="Enter name" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn pull-right">Search</button>
                                </form>                            
                            </div>
                            
                        </section>
                        <section id="our-speakers">
                            <div class="row">
                                <div class="col-md-12">
								                                    <div class="col-md-6">
                                        <div class="author-block course-speaker">
                                            <a href="https://venus.t1m9m.com/alumnus/rajkumarcwd">
                                                <figure class="author-picture">
                                                													<img src="assets/dummy.png" alt="">
												                                                </figure>
                                            </a>
                                            <article class="paragraph-wrapper">
                                                <div class="inner">
                                                    <header>
                                                        <a href="https://venus.t1m9m.com/alumnus/rajkumarcwd">
															Rajkumar                                                        </a>
                                                    </header>
                                                    <figure>
														                                                    </figure>
                                                    <p></p>
                                                    <a href="https://venus.t1m9m.com/alumnus/rajkumarcwd" class="btn btn-framed btn-small btn-color-grey">Full Bio</a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                                                    <div class="col-md-6">
                                        <div class="author-block course-speaker">
                                            <a href="https://venus.t1m9m.com/alumnus/kishore">
                                                <figure class="author-picture">
                                                													<img src="assets/dummy.png" alt="">
												                                                </figure>
                                            </a>
                                            <article class="paragraph-wrapper">
                                                <div class="inner">
                                                    <header>
                                                        <a href="https://venus.t1m9m.com/alumnus/kishore">
															Kishore S                                                        </a>
                                                    </header>
                                                    <figure>
														                                                    </figure>
                                                    <p></p>
                                                    <a href="https://venus.t1m9m.com/alumnus/kishore" class="btn btn-framed btn-small btn-color-grey">Full Bio</a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                                                    <div class="col-md-6">
                                        <div class="author-block course-speaker">
                                            <a href="https://venus.t1m9m.com/alumnus/admin">
                                                <figure class="author-picture">
                                                													<img src="assets/dummy.png" alt="">
												                                                </figure>
                                            </a>
                                            <article class="paragraph-wrapper">
                                                <div class="inner">
                                                    <header>
                                                        <a href="https://venus.t1m9m.com/alumnus/admin">
															Ahsan Tariq                                                        </a>
                                                    </header>
                                                    <figure>
														Hero                                                    </figure>
                                                    <p>Good job</p>
                                                    <a href="https://venus.t1m9m.com/alumnus/admin" class="btn btn-framed btn-small btn-color-grey">Full Bio</a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                                                    <div class="col-md-6">
                                        <div class="author-block course-speaker">
                                            <a href="https://venus.t1m9m.com/alumnus/dokoh">
                                                <figure class="author-picture">
                                                													<img src="assets/dummy.png" alt="">
												                                                </figure>
                                            </a>
                                            <article class="paragraph-wrapper">
                                                <div class="inner">
                                                    <header>
                                                        <a href="https://venus.t1m9m.com/alumnus/dokoh">
															Minerva Riddle                                                        </a>
                                                    </header>
                                                    <figure>
														Medical officer                                                    </figure>
                                                    <p>Omnis commodo quia tempora asperiores adipisci eveniet ut et voluptate unde quia laborum TeneturOmnis commodo quia tempora asperiores adipisci eveniet ut et</p>
                                                    <a href="https://venus.t1m9m.com/alumnus/dokoh" class="btn btn-framed btn-small btn-color-grey">Full Bio</a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                                                </div>
                            </div>
                        </section>
                        <div class="center">
	                        <ul class="pagination">
	                        <li> </li><li><a class="active" style="color: #FFF">1</a><a href="https://venus.t1m9m.com/alumni/4" data-ci-pagination-page="2">2</a><a href="https://venus.t1m9m.com/alumni/8" data-ci-pagination-page="3">3</a><a href="https://venus.t1m9m.com/alumni/4" data-ci-pagination-page="2" rel="next">Next</a> </li>	                        </ul>
	                    </div>

                    </section>
                </div>
            </div>

<%@include file="includes/sidebar.jsp" %>
<%}%>            
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