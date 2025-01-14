<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact us</title>
<!-- Bootstrap CDN(Content Delivery Network) link to get support of BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="navstyles.css">
<style>
.contact-form {
	max-width: 500px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.contact-form h2 {
	margin-bottom: 20px;
	color: #007bff;
}

.form-group label {
	font-weight: bold;
	color: #495057;
}

input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

textarea {
	height: 150px;
}
</style>
</head>
<body>
	<%@ include file="component/navbar2.jsp"%>
	<c:if test="${userObj == null }">
		<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div class="container contact-form">
		<h2 style="text-align: center;">Contact us</h2>

		<c:if test="${contactResult==0}">
			<h1 class="font-italic font-weight-bold text-danger text-center">
				Form Saving Failed....Please try again</h1>
		</c:if>
		<form method="post" action="ContactUsServlet">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="mobile">Mobile:</label> <input type="number" id="mobile"
					name="mobile" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="comments">Comments:</label>
				<textarea id="comments" name="comments" class="form-control"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

</body>
</html>