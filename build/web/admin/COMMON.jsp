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
        } else if(session.getAttribute("power").equals("ADMIN")){

        
    %>
	
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","root");
            Statement stmt = conn.createStatement();
            Statement stmt1 = conn.createStatement();
            ResultSet department = stmt.executeQuery("select * from tbl_department");
            ResultSet department1 = stmt1.executeQuery("select * from tbl_department");;
            Statement stmt2 = conn.createStatement();
            ResultSet batch = stmt2.executeQuery("select * from tbl_batch left join tbl_department on tbl_department.departmentId=tbl_batch.departmentId");
            
        %>
    <div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand text-center" href="index.html">
                                    <span class="align-middle "><img width="100px" src="../uploads/logos/logo7.jpeg" /> </span>
                                </a>


				<ul class="sidebar-nav">

					<li class="sidebar-item ">
                                            <a class="sidebar-link" href="ADMIN.jsp">
                                                <i class="align-middle" data-feather="user"></i> <span class="align-middle">Student</span>
                                            </a>
					</li>
                                        <li class="sidebar-item">
                                            <a class="sidebar-link" href="ADDNEWS.jsp">
                                                <i class="align-middle" data-feather="paperclip"></i> <span class="align-middle">News</span>
                                            </a>
					</li>
                                        <li class="sidebar-item active">
                                            <% if(session.getAttribute("power").equals("ALUMNI")){ %>
                                            <%} else{ %>
                                            <a class="sidebar-link" href="COMMON.jsp">
                                                <i class="align-middle" data-feather="check-square"></i>  <span class="align-middle">Common</span>
                                            </a>
                                            <%}%>
					</li>
                                        <li class="sidebar-item ">
                                            <a class="sidebar-link" href="CONTACT.jsp">
                                                <i class="align-middle" data-feather="check-square"></i>  <span class="align-middle">Contact</span>
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

			<main class="content ">
				<div class="container-fluid p-0">
                                    <div class="row">
                                        <div class="col-10">
                                            <h1 class="h3 mb-3"><strong>Common</strong> Details</h1>
                                        </div>
                                        <div class="col-2">
                                            
                                        </div>
                                    </div>
                                      
					<div class="container-fluid bg-light">
                                            <div class="row ">
                                                <div class="col my-3">
                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo"><i class="fa fa-plus"></i> Add Department</button>
                                            <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog ">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form method="post" action="action/AddDept.jsp">
                                                        <div class="form-group">
                                                          <label for="recipient-name" class="col-form-label">Department Name:</label>
                                                          <input type="text" class="form-control form-control-sm" name="departmentName" id="recipient-name">
                                                        </div>
                                                        <div class="form-group">
                                                            <button class="btn btn-primary">Submit</button>
                                                        </div>
                                                      </form>
                                                    </div>
                                                    
                                                  </div>
                                                </div>
                                              </div>
                                                </div>
                                                    <div class="col my-3">
                                                    <button class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo"><i class="fa fa-plus"></i> Add Batch</button>
                                            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog ">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLabel">Add Batch</h5>
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="./action/AddBatch.jsp" method="post"> 
                                                        <div class="form-group">
                                                          <label for="recipient-name" class="col-form-label">Batch Name</label>
                                                          <input type="text" class="form-control form-control-sm" name="batchName" id="recipient-name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label">Department Name</label>
                                                            <select class="form-control form-control-sm" name="deptId" >
                                                                <option> Select</option>
                                                                <%
                                                                while(department1.next()){
                                                                %>
                                                                <option value="<%=department1.getString("departmentId")%>"> <%=department1.getString("departmentName")%></option>
                                                                <%}%>
                                                            </select>
                                                        </div>
                                                        
                                                        <div class="form-group">
                                                            <button class="btn btn-primary">Submit</button>
                                                        </div>
                                                      </form>
                                                    </div>
                                                    
                                                  </div>
                                                </div>
                                              </div>
                                                    
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <table class="table" id='myTable'>
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th>Sr No</th>
                                                                <th>Department Name</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                int count =0;
                                                                while(department.next()){
                                                                    count+=1;
                                                            %>
                                                            <tr>
                                                                <td><%=count%></td>
                                                                <td><%=department.getString("departmentName")%></td>
                                                                <td>
                                                                    <button class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></button>
                                                                    <a href="action/DeleteDept.jsp?id=<%=department.getString("departmentId")%>" class="btn btn-secondary btn-sm" ><i class="fa fa-trash"></i></a>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                }
                                                            %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col">
                                                    <table class="table" id='myTable2'>
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th>Sr No</th>
                                                                <th>Batch Name</th>
                                                                <th>Department Name</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                int count2=0;
                                                                while(batch.next()){
                                                                    
                                                                count2+=1;
                                                            %>
                                                            <tr>
                                                                <td><%=count2%></td>
                                                                <td><%=batch.getString("batchName")%></td>
                                                                <td><%=batch.getString("departmentName")%></td>
                                                                <td>
                                                                    <a href="action/DelBatch.jsp?id=<%=batch.getString("batchId")%>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>
                                                                    <a class="btn btn-secondary btn-sm" href="action/DelBatch.jsp?id=<%=batch.getString("batchId")%>" ><i class="fa fa-trash"></i></a>
                                                                </td>
                                                            </tr>
                                                            <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
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
            $(document).ready( function () {
                $('#myTable2').DataTable();
            } );
        </script>
        <script>
            $(document).ready(function(){
                
            })
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
