<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</style>

<title>GAPP - Login</title>
</head>
<body>
	<div class="container-fluid-full">
		<div class="row-fluid">

			<div class="row-fluid">
				<div class="login-box">
					<div class="icons">
						
					</div>
					<h1 style="text-align:center;">GAPP Login</h1>

					<form:form modelAttribute="user">
						<div class="input-prepend" title="Username">
							<span class="add-on"><i class="halflings-icon user"></i></span>
							<form:input path="emailId" class="input-large span10" type="email" placeholder="Email Id"  /><br/>
							<b><form:errors path="emailId" style="font-size:13px; color:red;"  /></b>
						</div>
						<div class="clearfix"></div>

						<div class="input-prepend" title="Password">
							<span class="add-on"><i class="halflings-icon lock"></i></span>
							<form:input path="password" type="password" class="input-large span10" placeholder="Password"  /><br/>
							<b><form:errors path="password" style="font-size:13px; color:red;" /></b>
						</div>
						<div class="clearfix"></div>

						<div class="button-login">	
							<input class="btn btn-primary" type="submit"
								name="login" value="Login" /></div>
							<div class="clearfix"></div>
					</form:form>
					<hr>
					<!-- <h3>Forgot Password?</h3> -->
					<p>
						<a href="userRegistration.html"><i class="halflings-icon user" style="padding-right: 3px;margin-top: 2px;
						"></i>Sign Up</a>
					</p>
				</div>
				<!--/span-->
			</div>
			<!--/row-->


		</div>
		<!--/.fluid-container-->

	</div>
	<!--/fluid-row-->

</body>
</html>