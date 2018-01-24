<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: rgb(35, 35, 35); color: white">
	<h1>New Product888</h1>
	<form action="PersistenceController" method="get">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome" /></td>
			</tr>
			<tr>
				<td>Prezzo:</td>
				<td><input type="text" name="prezzo" /></td>
			</tr>
		</table>
		<br> <input style="color: red; width: 150px" type="submit"
			name="sumbit" value="crea" />
	</form>
</body>
</html>