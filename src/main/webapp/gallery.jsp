<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hostel Images</title>
<!-- Bootstrap CDN(Content Delivery Network) link to get support of BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="navstyles.css">
<style>
/* Custom CSS for image gallery */
.container {
	padding: 0px;
}

.section {
	margin-bottom: 40px;
}

.section-heading {
	color: #333;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.image-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	grid-gap: 20px;
}

.image-container div {
	position: relative;
	overflow: hidden;
}

.image-container img {
	width: 100%;
	height: auto;
	transition: transform 0.3s ease-in-out;
}

.image-container img:hover {
	transform: scale(1.05);
}

.image-name {
	position: absolute;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 5px 10px;
	font-size: 14px;
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
}

.image-container div:hover .image-name {
	opacity: 1;
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
	<div class="container">
		<div class="section">
			<h2 class="section-heading">Zero Floor</h2>
			<div class="image-container">
				<div>
					<img src="images/frontbuilding.jpeg" alt="front building">
					<div class="image-name">Front Building</div>
				</div>
				<div>
					<img src="images/office.jpeg" alt="Office area">
					<div class="image-name">Office</div>
				</div>

				<div>
					<img src="images/kitchen.jpeg" alt="Dinning area">
					<div class="image-name">Dinning</div>
				</div>
				<div>
					<img src="images/diningarea.webp" alt="Dinning area">
					<div class="image-name">Dinning</div>
				</div>

				<div>
					<img src="images/food.jpeg" alt="food ">
					<div class="image-name">food</div>
				</div>
			</div>
		</div>

		<div class="section">
			<h2 class="section-heading">1st Floor</h2>
			<div class="image-container">
				<div>
					<img src="images/room1.jpeg" alt="Room1">
					<div class="image-name">Room1</div>
				</div>
				<div>
					<img src="images/room2.webp" alt="Room2">
					<div class="image-name">Room2</div>
				</div>
				<div>
					<img src="images/room3.webp" alt="Room3">
					<div class="image-name">Room3</div>
				</div>
				<div>
					<img src="images/room4.avif" alt="Room4">
					<div class="image-name">Room4</div>
				</div>
			</div>
		</div>
		<div class="section">
			<h2 class="section-heading">Top Floor</h2>
			<div class="image-container">
				<div>
					<img src="images/playarea.jpeg" alt="playarea">
					<div class="image-name">play area</div>
				</div>
				<div>
					<img src="images/gymarea.webp" alt="gym area">
					<div class="image-name">Room2</div>
				</div>

			</div>
		</div>
		<!-- Middle Floor and Bottom Floor sections follow the same structure -->
	</div>

</body>
</html>
