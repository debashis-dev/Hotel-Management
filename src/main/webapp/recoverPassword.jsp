<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recover Password</title>
</head>
<body>
	<c:if test="${password == null}">
		<h1 style="color: red;">Invalid Details....Please check your details again</h1>
	</c:if>

	<c:if test="${password != null}">
		<h1 style="color: green;">Your Password sent to your email.....Kindly Check your email</h1>
	</c:if>
	<a href="login.jsp">Click here to Login</a>
</body>
</html>