<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<title>GAPP - Add Application</title>
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
					<li>
						<!-- <i class="icon-edit"></i> --> <a href="#">Add Application</a>
					</li>
				</ul>
				<c:choose>
					<c:when test="${showDetail == 0}">
						<span class="label label-warning"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Application
								Detail</h3></span>
						<span class="label"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Student
								Detail</h3></span>
						<span class="label"><h3>Education Detail</h3></span>
					</c:when>
					<c:when test="${showDetail == 1}">
						<span class="label"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Application
								Detail</h3></span>
						<span class="label label-warning"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Student
								Detail</h3></span>
						<span class="label"><h3>Education Detail</h3></span>
					</c:when>
					<c:when test="${showDetail == 2}">
						<span class="label"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Application
								Detail</h3></span>
						<span class="label"
							style="margin-right: 20px; margin-bottom: 10px;"><h3>Student
								Detail</h3></span>
						<span class="label label-warning"><h3>Education Detail</h3></span>
					</c:when>

				</c:choose>



				<c:if test="${showDetail == 0}">
					<form action="/gapp/student/addStudentApplication.html"
						class="form-horizontal" method="post"
						enctype="multipart/form-data">
						<div class="row-fluid sortable">
							<div class="box span12">
								<div class="box-header" data-original-title>
									<h2>
										<i class="halflings-icon edit"></i><span class="break"></span>Application
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

									<div class="control-group">
										<label class="control-label" for="selectError3">Department</label>
										<div class="controls">
											<select id="selectError3" name="deptId"
												onchange="return getPrograms();">
												<c:forEach items="${dept}" var="row">
													<c:choose>
														<c:when test="${SelectedValue == row.departmentId }">
															<option value="${row.departmentId }" selected="selected">${row.departmentName }</option>
														</c:when>
														<c:otherwise>
															<option value="${row.departmentId }">${row.departmentName }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="selectError3">Program</label>
										<div class="controls">
											<select id="selectdp" name="deptProgram">

											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="selectError3">Term</label>
										<div class="controls">
											<select id="selectpt" name="programTerm">
												<c:forEach items="${programTerm}" var="row">
													<option value="${row.termId}">${row.termName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--/span-->

						<!-- Start  Academic Info -->
						<div class="row-fluid sortable">
							<div class="box span12">
								<div class="box-header" data-original-title>
									<h2>
										<i class="halflings-icon edit"></i><span class="break"></span>Academic
										Records
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

									<div class="control-group">
										<label class="control-label" for="selectError3">GPA<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="gpa" required="required"
												class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="selectError3">Is
											International Student</label>
										<div class="controls">
											<!-- <label class="checkbox inline"> -->
											<div class="checker" id="uniform-inlineCheckbox1"
												style="margin-top: 8px !important">
												<input type="checkbox" id="inlineCheckbox1"
													name="IsInternationalStudent" onclick="ShowHideDiv(this)">

											</div>
											<!-- </label> -->
										</div>
									</div>
									<div class="control-group" id="toeflshow"
										style="display: none;">
										<label class="control-label" for="selectError3">Toefl</label>
										<div class="controls">
											<input type="text" name="toefl" value="0"
												class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="selectError3">Transcript<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="file" name="transcript" required="required"
												class='input-file uniform_on' id='fileInput' />
											<!-- required="required"  -->
										</div>
									</div>
									
									
								</div>
							</div>
							<!-- End Additional Info -->
						</div>


						<!-- Start  Additional Info -->
						<div class="row-fluid sortable">
							<div class="box span12">
								<div class="box-header" data-original-title>
									<h2>
										<i class="halflings-icon edit"></i><span class="break"></span>Addiitonal
									</h2>
									<div class="box-icon">
										<!-- <a href="#" class="btn-setting"><i
									class="halflings-icon wrench"></i></a> <a href="#"
									class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
								<a href="#" class="btn-close"><i
									class="halflings-icon remove"></i></a> -->
									</div>
								</div>
								<div class="box-content" id="addInfo"></div>
							</div>
							<!-- End Additional Info -->
						</div>
						<!--/row-->
						<div class="form-actions">
							<input type="hidden" value="0" name="formId">
							<button type="submit" class="btn btn-primary">Save &
								Continue</button>
							<button type="reset" class="btn btn-primary">Reset</button>

						</div>

					</form>
				</c:if>

				<c:if test="${showDetail == 1}">
					<form action="/gapp/student/addStudentDetail.html"
						class="form-horizontal" method="post">
						<div class="row-fluid sortable">
							<div class="box span12">
								<div class="box-header" data-original-title>
									<h2>
										<i class="halflings-icon edit"></i><span class="break"></span>Student
										Detail
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

									<div class="control-group">
										<label class="control-label">First Name<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="fname" class="input-xlarge focused"
												required="required" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Last Name<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="lname" class="input-xlarge focused"
												required="required" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">CIN</label>
										<div class="controls">
											<input type="text" name="cin" class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Email Id<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="emailId"
												class="input-xlarge focused" required="required" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Phone Number<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="phoneNo"
												class="input-xlarge focused" required="required" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Date of Birth<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="dob" id="datepicker"
												class="input-xlarge focused" required="required" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Gender</label>
										<div class="controls">
											<select name="gender">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Citizenship<span class="help-inline">*</span></label>
										<div class="controls">
											<input type="text" name="citizenship"
												class="input-xlarge focused" required="required" />
										</div>
									</div>
									<div class="form-actions">
										<input type="hidden" value="${applicationId}" name="appStID">
										<button type="submit" class="btn btn-primary">Save &
											Continue</button>
										<button type="reset" class="btn btn-primary">Reset</button>

									</div>

								</div>
							</div>
						</div>
						<!--/span-->
					</form>
				</c:if>

				<c:if test="${showDetail == 2}">
					<form action="/gapp/student/addStudentEducation.html"
						class="form-horizontal" method="post">
						<div class="row-fluid sortable">
							<div class="box span12">
								<div class="box-header" data-original-title>
									<h2>
										<i class="halflings-icon edit"></i><span class="break"></span>Education
										Detail
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

									<div class="control-group">
										<label class="control-label">Institution</label>
										<div class="controls">
											<input type="text" name="collegeName"
												class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Duration</label>
										<div class="controls">
											<input type="text" name="duration"
												class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Degree</label>
										<div class="controls">
											<input type="text" name="degree" class="input-xlarge focused" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Major</label>
										<div class="controls">
											<input type="text" name="major" class="input-xlarge focused" />
										</div>
									</div>
									<c:if test="${ShowAllField == 1 }">
										<div class="alert alert-info">
											<!-- <button type="button" class="close" data-dismiss="alert">×</button> -->
											<strong>Please enter all values.</strong>
										</div>
									</c:if>

									<div class="form-actions">
										<input type="hidden" name="appEdId" value="${EduAppId}" />
										<button type="submit" name="buttonClicked"
											class="btn btn-primary" value="add">Add</button>

									</div>


								</div>
							</div>
						</div>
						<c:if test="${showError == 1 }">
							<div class="alert alert-info">
								<!-- <button type="button" class="close" data-dismiss="alert">×</button> -->
								<strong>Please insert atleast one education record.</strong>
							</div>
						</c:if>
						<c:if test="${fn:length(EducationRecords) gt 0}">
							<div class="box-content">

								<table
									class="table table-striped table-bordered bootstrap-datatable datatable">
									<thead>
										<tr>
											<th>Institution</th>
											<th>Duration</th>
											<th>Degree</th>
											<th>Major</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${EducationRecords}" var="entry">
											<tr>
												<td>${entry.collegeName}</td>
												<td class="center">${entry.timePeriod}</td>
												<td class="center">${entry.degreeEarned}</td>
												<td class="center">${entry.major}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<div class="form-actions">
							<button type="submit" name="buttonClicked" value="save"
								class="btn btn-primary">Save</button>
							<button type="submit" name="buttonClicked" value="submit"
								class="btn btn-primary">Submit</button>

						</div>

						<!--/span-->
					</form>
				</c:if>
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

			<h2 class="label label-success">Application Saved Successfully.</h2>

		</div>
		<div class="modal-footer">
			<a href="../student/viewStudentApplication.html" class="btn btn-primary">Close</a>
			<!-- <a href="#"
				class="btn btn-primary">Save changes</a> -->
		</div>
	</div>

<div class="modal hide fade" id="myModalSubmit">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Message</h3>
		</div>
		<div class="modal-body">

			<h2 class="label label-success">Application Submit Successfully.</h2>

		</div>
		<div class="modal-footer">
			<a href="../student/viewStudentApplication.html" class="btn btn-primary">Close</a>
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
	<script src="../js/fullcalendar.min.js"></script>
	<script src="../js/jquery.knob.modified.js"></script>
	<script src="../js/retina.js"></script>
	<script src="../js/custom.js"></script>
	<!-- end: JavaScript-->

	<c:if test="${modelShowSave != null }">
		<script>
			//$('.btn-setting').click(function(e){
			//	e.preventDefault();
			$('#myModal').modal('show');
			//	});
		</script>
	</c:if>
	
	<c:if test="${modelShowSubmit != null }">
		<script>
			//$('.btn-setting').click(function(e){
			//	e.preventDefault();
			$('#myModalSubmit').modal('show');
			//	});
		</script>
	</c:if>

	<script type="text/javascript">
		function getPrograms() {
			var id = $('#selectError3').val();

			$.ajax({
				type : "POST",
				url : "/gapp/student/getStudentProgram.html",
				datatype : "json",
				data : "deptId=" + id,
				success : function(response) {
					var listItems = "";
					for (var i = 0; i < response.length; i++) {
						listItems += "<option value='" + response[i][0]+ "'>"
								+ response[i][1] + "</option>";
					}
					$("#selectdp").html(listItems);
					getAdditionalInfo(id);
				},
				error : function(e) {
					//alert('Error: ' + e);
				}
			});

			//alert(id);
		}

		function getAdditionalInfo(deptId) {
			$.ajax({
				type : "POST",
				url : "/gapp/student/getAdditionalInfoByDept.html",
				datatype : "json",
				data : "deptId=" + deptId,
				success : function(response) {
					//alert(response);
					ShowAdditionalInfo(response);
				},
				error : function(e) {
					//alert('Error: ' + e);
				}
			});

		}

		function ShowAdditionalInfo(response) {
			var listItems = "";
			if (response.length > 0) {
				for (var i = 0; i < response.length; i++) {
					listItems += "<div class='control-group'>";
					listItems += "<label class='control-label' for='selectError3'>"
							+ response[i][1] + "</label>";
					listItems += "	<div class='controls'>";
					var req = "";
					if (response[i][3] == true) {
						req = "required='required'";
					}
					if (response[i][2] == "Number") {
						listItems += "<input type='number' name='"+response[i][1]+"' "+req+"	class='input-xlarge focused' /><br/>";
					} else if (response[i][2] == "File") {
						listItems += "<input class='input-file uniform_on' id='fileInput' name='file' type='file' "+req+">";

					} else {
						listItems += "<input type='text' name='"+response[i][1]+"' "+req+"	class='input-xlarge focused' /><br/>";
					}
					listItems += "</div>";
					listItems += "</div>";
				}
			} else {
				listItems += "<div class='alert alert-info'><strong>No</strong> Additional Info.</div>";
			}
			$("#addInfo").html(listItems);
		}

		$(document).ready(function() {
			getPrograms();
		});

		$(function() {
			$("#inlineCheckbox1").click(function() {
				if ($(this).is(":checked")) {
					$("#toeflshow").show();
				} else {
					$("#toeflshow").hide();
				}
			});
		});

		$(function() {
			$("#datepicker").datepicker();
		});
	</script>


</body>
</html>