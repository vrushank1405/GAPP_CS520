<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Spring MVC Example</title>
</head>
<body>
Welcome to Spring MVC.
<table>
<tr><th>ID</th><th>Username</th><th>Enabled</th></tr>
   <c:forEach items="${users}" var="user">   
<tr>
  <td>${user.departmentId}</td> 
  <td>${user.count}</td>
</tr>
   </c:forEach> 
</body>
</html>