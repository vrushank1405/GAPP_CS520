<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="css/bootstrap-responsive.min.css" rel="stylesheet"> -->
<link id="base-style" href="css/style.css" rel="stylesheet">
<!-- <link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet"> -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<style type="text/css">
body {
	background: url(img/bg-login.jpg) !important;
	}
	.login-box .add-on {
	background: #EEE !important;
	}
</style>

<title>GAPP - Registration</title>
</head>
<body>
<div class="container-fluid-full">
		<div class="row-fluid">

			<div class="row-fluid">
				<div class="login-box">
					<div class="icons">
						
					</div>
					<h1 style="text-align:center;">Registration</h1>

					<form:form modelAttribute="user">
					
						<div class="input-prepend" title="FirstName">
							<span class="add-on"><i class="halflings-icon user"></i></span>
							<form:input path="first_name" class="input-large span10"  placeholder="First Name" required="required"  /><br/>
							
						</div>
						<div class="clearfix"></div>
					
					
						<div class="input-prepend" title="LastName">
							<span class="add-on"><i class="halflings-icon user"></i></span>
							<form:input path="last_name" class="input-large span10"  placeholder="Last Name" required="required" /><br/>
							
						</div>
						<div class="clearfix"></div>
					
						<div class="input-prepend" title="Email Id">
							<span class="add-on"><i class="halflings-icon envelope"></i></span>
							<form:input path="emailId" class="input-large span10" type="email" placeholder="Email Id" required="required"  /><br/>
						 <b><form:errors path="emailId" style="font-size:13px; color:red;"  /></b>
						</div>
						<div class="clearfix"></div>

						<div class="input-prepend" title="Password">
							<span class="add-on"><i class="halflings-icon lock"></i></span>
							<form:input path="password" type="password" class="input-large span10" placeholder="Password" required="required"  /><br/>
							
						</div>
						<div class="clearfix"></div>

						<div class="button-login">	
							<input class="btn btn-primary" type="submit"
								name="register" value="Register" /></div>
							<div class="clearfix"></div>
					</form:form>
					<hr>
					
				</div>
				<!--/span-->
			</div>
			<!--/row-->


		</div>
		<!--/.fluid-container-->

	</div>
	<!--/fluid-row-->
	
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Message</h3>
		</div>
		<div class="modal-body">

			<h2 class="label label-success">You have registered successfully.
			</h2>

		</div>
		<div class="modal-footer">
			<a href="/gapp/login.html" class="btn btn-primary">Close</a>
			<!-- <a href="#"
				class="btn btn-primary">Save changes</a> -->
		</div>
	</div>
	
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>

	<script src="js/jquery-ui-1.10.0.custom.min.js"></script>

	<script src="js/jquery.ui.touch-punch.js"></script>

	<script src="js/modernizr.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/jquery.chosen.min.js"></script>
	<script src="js/jquery.uniform.min.js"></script>
	<script src="js/jquery.cleditor.min.js"></script>
	<script src="js/jquery.elfinder.min.js"></script>
	<script src="js/jquery.noty.js"></script>
	<script src="js/jquery.raty.min.js"></script>
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<script src="js/jquery.imagesloaded.js"></script>
	<script src="js/jquery.masonry.min.js"></script>
	<script src="js/jquery.sparkline.min.js"></script>
	<script src="js/custom.js"></script>
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