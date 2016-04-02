<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>GAPP - Department Program</title>
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
				</a> <a class="brand" href="../user/admin.html"><span>GAPP</span></a>

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
						<li><a href="../user/admin.html"><i
								class="icon-bar-chart"></i><span class="hidden-tablet">
									Dashboard</span></a></li>
						<li><a class="dropmenu" href="#"><i class="icon-tasks"></i><span
								class="hidden-tablet"> Department</span></a>
							<ul>
							<li><a class="submenu"
									href="../department/viewDepartment.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Manage Department</span></a></li>
								<li><a class="submenu"
									href="../department/viewDepartmentProgram.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Manage Program</span></a></li>

								<li><a class="submenu"
									href="../department/viewAdditionalInfo.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Manage Additional Info</span></a></li>

							</ul></li>

					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->

			<!-- start: Content -->
			<div id="content" class="span10" style="margin-bottom: 27%;">


				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="../user/admin.html">Home</a> <i
						class="icon-angle-right"></i></li>
					<li>
						<!-- <i class="icon-edit"></i> --> <a href="#">Add Department Program</a>
					</li>
				</ul>

				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="box-header" data-original-title>
							<h2>
								<i class="halflings-icon edit"></i><span class="break"></span>Program
							</h2>
							<div class="box-icon">
								<!-- <a href="#" class="btn-setting"><i
									class="halflings-icon wrench"></i></a> <a href="#"
									class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
								<a href="#" class="btn-close"><i
									class="halflings-icon remove"></i></a> -->
							</div>
						</div>
						<div class="box-content">
							<form action="/gapp/department/addDepartmentProgram.html"
								class="form-horizontal" method="post">
								<div class="control-group">
									<label class="control-label" for="selectError3">Department</label>
									<div class="controls">
										<select id="selectError3" name="deptId">
											<c:forEach items="${dept}" var="row">
												<option value="${row.departmentId }">${row.departmentName }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="typeahead">Name </label>
									<div class="controls">
										<input type="text" name="programName" required="required" class="input-xlarge focused" />
										<br />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">Save
										changes</button>
									<button type="reset" class="btn">Cancel</button>
								</div>

							</form>

						</div>
					</div>
					<!--/span-->

				</div>
				<!--/row-->
			</div>
			<!-- end: Content -->
		</div>
		<!--/#content.span10-->
	</div>
	<!--/fluid-row-->

	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Message</h3>
		</div>
		<div class="modal-body">

			<h2 class="label label-success">Department Program Added Successfully.</h2>

		</div>
		<div class="modal-footer">
			<a href="../department/viewDepartmentProgram.html" class="btn btn-primary">Close</a>
			<!-- <a href="#"
				class="btn btn-primary">Save changes</a> -->
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
	<script src="../js/jquery.dataTables.min.js"></script>
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

	<c:if test="${modalShow != null }">
		<script>
			//$('.btn-setting').click(function(e){
			//	e.preventDefault();
			$('#myModal').modal('show');
			//	});
		</script>
	</c:if>

</body>
</html>