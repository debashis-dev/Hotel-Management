<%@page import="com.sathya.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CDN(Content Delivery Network) link to get support of BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
<style>
th {
	background-color: #36c;
	color: #fff;
	text-align: left;
}

table {
	width: 50%; /* Adjust the width as needed */
	border-collapse: collapse;
	margin: 0 auto; /* Center the table horizontally */
}
</style>
<title>User Profile</title>
</head>
<body>

	<!-- Navigation Bar -->
	<%@ include file="component/navbar2.jsp"%>
	<c:if test="${userObj == null }">
		<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div class="form-group">
		<h1 class="font-italic font-weight-bold text-primary text-center">User
			Details...</h1>
	</div>

	<div class="form-group">
		<c:if test="${updateResult==1}">
			<h1 class="font-italic font-weight-bold text-success text-center">User
				Updated Successfully....</h1>
		</c:if>
	</div>
	<div class="container" style="width: 50%">
		<table class="table table-bordered table-striped">
			<%
			User user = (User) session.getAttribute("userObj");
			%>

			<tr>
				<th>UserName:</th>
				<td><%=user.getUserName()%></td>
			</tr>
			<tr>
				<th>Name:</th>
				<td><%=user.getFullName()%></td>
			</tr>
			<tr>
				<th>Password:</th>
				<td><%=user.getPassword()%></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><%=user.getEmail()%></td>
			</tr>
			<tr>
				<th>D.O.B.:</th>
				<td><%=user.getDob()%></td>
			</tr>
			<tr>
				<th>Mobile:</th>
				<td><%=user.getMobile()%></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td><%=user.getAddress()%></td>
			</tr>
		</table>

		<a class="btn btn-primary" href="editProfile.jsp">Edit Profile</a>
	</div>
</body>
</html>