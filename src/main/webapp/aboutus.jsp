<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<!-- Bootstrap CDN(Content Delivery Network) link to get support of BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom CSS */
body {
	background-color: #f8f9fa;
	color: #333;
}

header {
	background-color: Navy; /* Navy */
	color: #fff;
	text-align: center;
	padding: 20px 0;
	margin-bottom: 20px;
}

main {
	padding: 20px;
}

section {
	margin-bottom: 30px;
	border: 1px solid #ccc; /* Add border */
	border-radius: 10px; /* Add border radius */
	padding: 20px; /* Add padding */
}

h2 {
	color: red; /* Dark purple */
}

footer {
	background-color: red; /* Dark purple */
	color: #fff;
	text-align: center;
	padding: 10px 0;
	position: fixed;
	bottom: 0;
	width: 100%;
}

/* Responsive styling */
@media ( min-width : 768px) {
	main {
		padding-left: 200px; /* Add left padding for larger screens */
	}
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
	<header>
		<h1>About Us</h1>
	</header>

	<main>
		<section id="company">
			<h2>Sathya Technologies</h2>
			<p>We are all Sathya Full Stack Java students.</p>
			<p>Sathya Technologies is a renowned institute offering
				comprehensive training in various technologies.</p>
			<p>Our teacher is Ratan, who is highly experienced and
				knowledgeable in the field.</p>
		</section>

		<section id="students">
			<h2>Students</h2>
			<ul class="list-group">
				<li class="list-group-item"><strong>Debashis</strong></li>
				<li class="list-group-item"><strong>Manikanta</strong></li>
				<li class="list-group-item"><strong>Siva</strong></li>
				<li class="list-group-item"><strong>Kranthi Kumar</strong></li>
				<li class="list-group-item"><strong>Abhishek</strong></li>
			</ul>
		</section>
	</main>

	<%@ include file="component/footer.jsp"%>
</body>
</html>