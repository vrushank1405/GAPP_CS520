<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- start: CSS -->
<link id="bootstrap-style" href="../css/bootstrap.min.css"
	rel="stylesheet">
<link href="../css/bootstrap-responsive.min.css" rel="stylesheet">
<link id="base-style" href="../css/style.css" rel="stylesheet">
<link id="base-style-responsive" href="../css/style-responsive.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<!-- end: CSS -->
<style>
/* .table-row
	{
	background-color: silver;
} */
.table-striped tbody>tr:nth-child(odd)>td, .table-striped tbody>tr:nth-child(odd)>th
	{
	background-color: #f9f9f9;
}
</style>
<title>GAPP - Student Application</title>
</head>
<body>
	<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="../user/student.html"><span>GAPP</span></a>

				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<!-- start: User Dropdown -->
						<li class="dropdown"><a class="btn dropdown-toggle"
							data-toggle="dropdown" href="#"> <i
								class="halflings-icon white user"></i> ${sessionScope.Name} <span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title"><span>Account
										Settings</span></li>
								<li><a href="#"><i class="halflings-icon user"></i>
										Profile</a></li>
								<li><a href="../login.html"><i
										class="halflings-icon off"></i> Logout</a></li>
							</ul></li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->

			</div>
		</div>
	</div>
	<!-- start: Header -->

	<div class="container-fluid-full">
		<div class="row-fluid">

			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="../user/student.html"><i
								class="icon-bar-chart"></i><span class="hidden-tablet">
									Dashboard</span></a></li>
						<li><a class="dropmenu" href="#"><i class="icon-tasks"></i><span
								class="hidden-tablet"> Application</span></a>
							<ul>
								<li><a class="submenu"
									href="../student/viewStudentApplication.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Manage Application</span></a></li>
								<li><a class="submenu"
									href="../student/addStudentApplication.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Add Application</span></a></li>
							</ul></li>

					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->

			<!-- start: Content -->
			<div id="content" class="span10" style="margin-bottom: 27%;">


				<ul class="breadcrumb">

					<li><i class="icon-home"></i> <a href="../user/student.html">Home</a>
						<i class="icon-angle-right"></i></li>
					<li><a href="#">View Application</a></li>
				</ul>
				<div style="margin-bottom: 10px; text-align: right;">
					<a href="../student/addStudentApplication.html" title=""
						data-rel="tooltip" class="btn btn-warning"
						data-original-title="Add Application">Add Application</a>
				</div>

				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="box-header" data-original-title>
							<h2>
								<i class="halflings-icon user"></i><span class="break"></span>Application
							</h2>
							<div class="box-icon">
								<!-- <a href="#" class="btn-setting"><i
									class="halflings-icon wrench"></i></a> -->
								<a href="#" class="btn-minimize"><i
									class="halflings-icon chevron-up"></i></a>
								<!-- <a href="#" class="btn-close"><i
									class="halflings-icon remove"></i></a> -->

							</div>
						</div>
						<div class="box-content">
							<c:if test="${fn:length(application) == 0}">
								<div class="alert alert-info">
									<!-- <button type="button" class="close" data-dismiss="alert">×</button> -->
									<strong>No</strong> Application Submitted.
								</div>
							</c:if>
							<c:if test="${fn:length(application) gt 0}">
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>Department</th>
											<th>Program</th>
											<th>Term</th>
											<th>Status</th>
											<th>Submitted Date</th>
											<th>View</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${application}" var="row">
											<tr class="${row.submit?'':'table-row' }">

												<td class="center">${row.program.dept.departmentName}</td>
												<td class="center">${row.program.programName}</td>
												<td class="center">${row.term.termName}</td>
												<c:choose>
													<c:when test="${row.submit}">
														<td class="center"><label class="label label-success">${row.status.statusName}</label></td>
													</c:when>
													<c:otherwise>
														<td class="center"><label
															class="label label-important">Not Submitted</label></td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${row.submit}">
														<td class="center"><fmt:formatDate
																value="${row.createdOn}" pattern="M/d/yyyy" /></td>
													</c:when>
													<c:otherwise>
														<td class="center"><label>Not Yet Submitted</label></td>
													</c:otherwise>
												</c:choose>

												<td class="center"><a class="btn btn-success"
													href="../student/viewStudentApplicationDetails.html?Id=${row.applicationId}"
													title="View"> <i class="halflings-icon white zoom-in"></i>
												</a></td>
												<c:choose>
													<c:when test="${row.submit}">
														<td class="center"></td>
													</c:when>
													<c:otherwise>
														<td><a class="btn btn-info"
															href="../student/editStudentApplication.html?appId=${row.applicationId}"
															title="Edit Department"> <i
																class="halflings-icon white edit"></i>
														</a></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
					<!--/span-->

				</div>
				<!--/row-->




			</div>
			<!--/.fluid-container-->

			<!-- end: Content -->
		</div>
		<!--/#content.span10-->
	</div>
	<!--/fluid-row-->

	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
				class="btn btn-primary">Save changes</a>
		</div>
	</div>

	<div class="clearfix"></div>

	<footer>

	<p></p>

	</footer>


	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery-migrate-1.0.0.min.js"></script>

	<script src="../js/jquery-ui-1.10.0.custom.min.js"></script>

	<script src="../js/jquery.ui.touch-punch.js"></script>

	<script src="../js/modernizr.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- <script src="../js/jquery.dataTables.min.js"></script> -->
	<script src="../js/jquery.chosen.min.js"></script>
	<script src="../js/jquery.uniform.min.js"></script>
	<script src="../js/jquery.cleditor.min.js"></script>
	<script src="../js/jquery.elfinder.min.js"></script>
	<script src="../js/jquery.noty.js"></script>
	<script src="../js/jquery.raty.min.js"></script>
	<script src="../js/jquery.uploadify-3.1.min.js"></script>
	<script src="../js/jquery.imagesloaded.js"></script>
	<script src="../js/jquery.masonry.min.js"></script>
	<script src="../js/jquery.sparkline.min.js"></script>
	<script src="../js/custom.js"></script>
	<!-- end: JavaScript-->

</body>
</html>