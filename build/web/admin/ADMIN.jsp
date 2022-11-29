<%-- 
    Document   : ADMIN
    Created on : 13 Aug, 2022, 5:37:28 PM
    Author     : Ruler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
        <link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

	<title>Admin Dashboard</title>

	<link href="./css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
    <% 
        if ((session.getAttribute("uni_id") == null) || (session.getAttribute("uni_id") == "")){
            
    %>
        <script type="text/javascript">
            alert("You aren't logged in ! Please log in to continue.");
            window.location = "../login.jsp";
        </script>
    <%
        } else if(session.getAttribute("power").equals("ADMIN") || session.getAttribute("power").equals("ALUMNI")){

        
    %>
	
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt. executeQuery("select * from tbl_registration as reg left join tbl_department as dept on dept.departmentId=reg.departmentId");
            
        %>
    <div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand text-center" href="index.html">
                                    <span class="align-middle "><img width="100px" src="../uploads/logos/logo7.jpeg" /> </span>
                                </a>

				<ul class="sidebar-nav">

					
					<li class="sidebar-item active">
                                            <a class="sidebar-link" href="ADMIN.jsp">
                                                <i class="align-middle" data-feather="user"></i> <span class="align-middle">Student</span>
                                            </a>
					</li>
                                        <li class="sidebar-item ">
                                            <a class="sidebar-link" href="ADDNEWS.jsp">
                                                <i class="align-middle" data-feather="book"></i><span class="align-middle">News</span>
                                            </a>
					</li>
                                        
                                        <li class="sidebar-item ">
                                            <% if(session.getAttribute("power").equals("ALUMNI")){ %>
                                            <%} else{ %>
                                            <a class="sidebar-link" href="COMMON.jsp">
                                                <i class="align-middle" data-feather="check-square"></i>  <span class="align-middle">Common</span>
                                            </a>
                                            <%}%>
					</li>
                                        <li class="sidebar-item ">
                                            <a class="sidebar-link" href="CONTACT.jsp">
                                                <i class="align-middle" data-feather="check-square"></i>  <span class="align-middle">Common</span>
                                            </a>
					</li>
				</ul>

			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block " href="#" data-bs-toggle="dropdown">
                                                            
                                                            <i class="fa fa-user" data-feather="settings"></i>
                                                        </a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                                                        </a>
							<div class="dropdown-menu dropdown-menu-end">
                                                            <a class="dropdown-item" href="../index.jsp"><i class="align-middle me-1" data-feather="user"></i> Home</a>
								<div class="dropdown-divider"></div>
                                                                <a class="dropdown-item" href="../logout.jsp">Log out</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>

			<main class="container-fluid">
				<div class="p-0">

					<h1 class="h3 mb-3"><strong>Student</strong> Details</h1>

					<div class=" bg-light">
                                            <table class="table" id='myTable'>
                                                <thead class="thead-dark">
                                                  <tr>
                                                    <th scope="col">Sr No.</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">E-Mail</th>
                                                    <th scope="col">Location</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Profession</th>
                                                    <th scope="col">Date Of Birth</th>
                                                    <th scope="col">Department</th>
                                                    <th scope="col">Role</th>
                                                    <th hidden scope="col">Role</th>
                                                    <th scope="col">Action</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        int count=0;
                                                    while(rs.next()){
                                                        
                                                        if(!(rs.getString("power").equals("ADMIN"))){
                                                          count+=1;
                                                    %>
                                                    <tr>
                                                      <th scope="row"><%=count%></th>
                                                      <td><%=rs.getString("name")%></td>
                                                      <td><%=rs.getString("email")%></td>
                                                      <td><%=rs.getString("location")%></td>
                                                      <td>
                                                          <% if(rs.getString("status").equals("0")){%>
                                                            <select onchange="updateStatus(this.value,<%=rs.getString("uni_id")%>)" name="power">
                                                              <option value="0">Pending</option>
                                                              <option value="1">Active</option>
                                                            </select>
                                            
                                                          <% } else {%>
                                                            <select onchange="updateStatus(this.value,<%=rs.getString("uni_id")%>)" name="power">
                                                              <option value="1">Active</option>
                                                              <option value="0">Pending</option>
                                                            </select>
                                                          <% }%>
                                                          
                                                      </td>
                                                      <td><%=rs.getString("profession")%></td>
                                                      <td><%=rs.getString("dob")%></td>
                                                      <td><%=rs.getString("departmentName")%></td>
                                                
                                                      <td id="role<%=rs.getString("uni_id")%>" style="display: none" >
                                                          <select onchange="getSelectVal(this.value,<%=rs.getString("uni_id")%>)" name="power">
                                                              <option value="STUDENT">STUDENT</option>
                                                              <option value="ALUMNI">ALUMNI</option>
                                                              <option value="ADMIN">ADMIN</option>
                                                          </select>
                                                      </td>
                                                      <td id="role2<%=rs.getString("uni_id")%>"><%=rs.getString("power")%></td>
                                                      <td><button id="update<%=rs.getString("uni_id")%>" onclick="updateStudent('<%=rs.getString("uni_id")%>')" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></button>
                                                          <a id="dele<%=rs.getString("uni_id")%>" href="StudentDel.jsp?uni_id=<%=rs.getString("uni_id")%>" class="btn btn-secondary btn-sm"><i class="fa fa-trash"></i></a>
                                                      </td>
                                                      
                                                    </tr>
                                                   
                                                  <%
                                                      }
                                                    }
                                                  %>
                                                </tbody>
                                              </table>

                                              
					</div>

				</div>
			</main>
			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="#" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="./js/app.js"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready( function () {
                $('#myTable').DataTable();
            } );
            function updateStudent(val){
                var role1 = document.getElementById("role"+val);
                var role2 = document.getElementById("role2"+val);
                role1.style.display="flex";
                role2.style.display="none";
            }
            function getSelectVal(val,id){
                window.location.href = "UPDATEROLE.jsp?val="+val+"&id="+id;
            }
        </script>
        <script>
            function updateStatus(val,id){
                window.location.href = "UPDATEACTION.jsp?val="+val+"&id="+id;
            }
        </script>
                                                
    <%
        }else{
    %>
    You Are Not Allow Here
    <%
        }
    %>
</body>

</html>
