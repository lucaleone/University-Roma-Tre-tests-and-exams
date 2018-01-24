<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: rgb(35, 35, 35); color: white;">

	<c:forEach  var="pref" begin="0" items="${prefs}">
	<div>
		${pref}
		<a href="managePref?${pref}">accetta</a>
	</div>
	</c:forEach>

</body>
</html>