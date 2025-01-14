<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="NewFile.css">
<script src="register_validations.js"></script>
</head>
<body class="bodyclass">

	<!-- Registration Form -->
	<div class="container">
		<h2>User Registration</h2>
		<c:if test="${userCheck==1}">
			<h1 class="font-italic font-weight-bold text-danger text-center">
				UserName is already present...Change the username</h1>
		</c:if>
		<c:if test="${emailCheck==1}">
				<h1 class="font-italic font-weight-bold text-danger text-center">
				Email is already registered...Change the Email</h1>
			</c:if>
		<form method="post" action="./RegisterServlet"
			onsubmit="return registerValidations() ">

			<div class="form-group">
				<label for="name" class="form-label">Full Name:</label> <input
					type="text" name="name" id="name" class="form-control"
					placeholder="Enter name" required>
			</div>
			<div class="form-group">
				<label for="name" class="form-label">Username:</label> <input
					type="text" name="userName" id="userName" class="form-control"
					placeholder="Enter username" required>
			</div>
			<div class="form-group">
				<label for="password" class="form-label">Password:</label> <input
					type="password" name="password" id="password" class="form-control"
					placeholder="Enter password" required>
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="form-label">Confirm
					Password:</label> <input type="password" name="confirmpassword"
					id="confirmpassword" class="form-control"
					placeholder="Confirm password" required>
			</div>
			<div class="form-group">
				<label for="email" class="form-label">Email:</label> <input
					type="email" name="email" id="email" class="form-control"
					placeholder="Enter email" required>
			</div>
			<div class="form-group">
				<label for="mobile" class="form-label">Mobile:</label> <input
					type="number" name="mobile" id="mobile" class="form-control"
					placeholder="Enter mobile" required>
			</div><div class="form-group">
				<label for="mobile" class="form-label">Date of Birth:</label> <input
					type="date" name="dob" id="dob" class="form-control"
					placeholder="Enter Date of Birth" required>
			</div>
			<div class="form-group">
				<label for="address" class="form-label">Address:</label>
				<textarea name="address" id="address" class="form-control"
					placeholder="Enter Complete address" rows="4" cols="50" required></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>

			<div class="already-registered">
				<p>
					Already Registered? <a href="login.jsp">Login Here</a>
				</p>
			</div>
		</form>
	</div>
</body>
</html>