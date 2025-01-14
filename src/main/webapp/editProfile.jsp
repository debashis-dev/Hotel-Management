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

<title>User Profile</title>
</head>
<body>

	<!-- Navigation Bar -->
	<%@ include file="component/navbar2.jsp"%>

	<div class="container" style="width: 50%"></div>

	<div class="form-group">
		<c:if test="${updateResult==1}">
			<h1 class="font-italic font-weight-bold text-success text-center">User
				Updated Successfully....</h1>
		</c:if>
	</div>

	<div class="container">
		<h1 class="font-italic font-weight-bold text-primary text-center">
			Edit User Details...</h1>
		<form method="post" action="EditProfileServlet">
			<table class="table table-bordered table-striped" style="width: 40%; margin: 0 auto;">
				<%
				User user = (User) session.getAttribute("userObj");
				%>

				<tr>
					<th>UserName:</th>
					<td><input type="text" name="userName"
						value="<%=user.getUserName()%>" readonly></td>
				</tr>
				<tr>
					<th>Name:</th>
					<td><input type="text" name="name"
						value="<%=user.getFullName()%>"></td>
				</tr>
				<tr>
					<th>Password:</th>
					<td><input type="text" name="password"
						value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<th>Email:</th>
					<td><input type="email" name="email"
						value="<%=user.getEmail()%>"></td>
				</tr>
				<tr>
					<th>D.O.B.:</th>
					<td><input type="date" name="dob" value="<%=user.getDob()%>"></td>
				</tr>
				<tr>
					<th>Mobile:</th>
					<td><input type="number" name="mobile"
						value="<%=user.getMobile()%>"></td>
				</tr>
				<tr>
					<th>Address:</th>
					<td><input type="text" name="address"
						value="<%=user.getAddress()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update"></td>
				</tr>
			</table>

		</form>

	</div>
</body>
</html>