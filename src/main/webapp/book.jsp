<%@page import="java.time.LocalDate"%>
<%@page import="com.sathya.dao.HotelDAO"%>
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
<link rel="stylesheet" type="text/css" href="NewFile.css">
<link rel="stylesheet" type="text/css" href="style.css">
<script src="bookingValidation.js" type="text/javascript"></script>
</head>
<body class="bodyclass">
	<c:if test="${userObj == null }">
		<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<div class="container mt-5">
		<form method="post" action="BookingInvoiceServlet"
			class="col-md-6 mx-auto" enctype="multipart/form-data"
			onsubmit="return check()">
			<h3>Book Room</h3>
			<div class="form-group">
				<%
				String username = (String) session.getAttribute("username");
				System.out.println("username: " + username);
				String roomType = request.getParameter("type");
				%>
				<label>User Name:</label> <input type="text" name="userName"
					id="userName" class="form-control" value="${username}" readonly>
			</div>
			<div class="form-group">
				<label>Book Room:</label> <input type="text" name="roomType"
					id="roomType" class="form-control" value="<%=roomType%>" readonly>
			</div>
			<div class="form-group">
				<label>Available Rooms:</label> <input type="number"
					name="availableRooms" id="availableRooms" class="form-control"
					value=<%=new HotelDAO().getAvailableRooms(roomType)%> readonly>
			</div>
			<div class="form-group">
				<label>Price per Day:</label> <input type="number"
					name="pricePerDay" id="pricePerDay" class="form-control"
					value="<%=new HotelDAO().rentPerDay(roomType)%>" readonly>
			</div>

			<div class="form-group">
				<label for="checkIn">Check In Date:</label> <input type="date"
					name="checkIn" id="checkIn" class="form-control"
					value="<%=LocalDate.now()%>" required>
			</div>

			<div class="form-group">
				<label for="checkOut">Check Out Date:</label> <input type="date"
					name="checkOut" id="checkOut" class="form-control" required>
			</div>

			<div class="form-group">
				<label for="adhaarNum">Upload Aadhaar Front:</label> <input
					type="file" name="adhaarFront" id="adhaarFront"
					class="form-control" accept="image/*" required>
			</div>

			<div class="form-group">
				<label for="adhaarNum">Upload Aadhaar Back:</label> <input
					type="file" name="adhaarBack" id="adhaarBack" class="form-control"
					accept="image/*" required>
			</div>

			<div class="form-group">
				<input type="submit" value="Confirm Booking"
					class="btn btn-primary btn-block">
			</div>
			<div class="form-group">
				<a href="home.jsp" class="btn btn-danger btn-block"
					style="display: inline-block; width: 90%;">Cancel</a>
			</div>
		</form>
	</div>
</body>
</html>