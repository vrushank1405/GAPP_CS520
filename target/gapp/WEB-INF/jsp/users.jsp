<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Username</th><th>Enabled</th></tr>
   <c:forEach items="${users}" var="user">   
<tr>
  <td>${user.studentCIN}</td> 
  <td>${user.phoneNumber}</td>
</tr>
   </c:forEach> 
</table>
</body>
</html>
