<%@page import="com.sathya.dao.UserDao"%>
<%@page import="java.util.Base64"%>
<%@page import="com.sathya.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Previous Bookings</title>
<!-- Bootstrap CDN(Content Delivery Network) link to get support of BootStrap -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="navstyles.css">
</head>
<body>
	<!-- Navigation Bar -->
	<%@ include file="component/navbar2.jsp"%>

	<a href="home.jsp" class="btn btn-info">New Room Booking</a>
	<br>
	<%-- <c:if test="${userObj == null }">
		<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if> --%>
	<table class="table table-bordered table-striped table-responsive">
		<thead class="thead-dark">
			<tr>
				<th>Booking Id</th>
				<th>UserName</th>
				<th>Type of Room</th>
				<th>Price per Day</th>
				<th>CheckIN</th>
				<th>CheckOut</th>
				<th>Duration of Stay</th>
				<th>rent</th>
				<th>sgst</th>
				<th>cgst</th>
				<th>Discount</th>
				<th>Total Price</th>
				<th>Aadhaar Front</th>
				<th>Aadhaar Back</th>
			</tr>
		</thead>
		<tbody>
			<%
			// Get attribute value
			String username = null;
			try{
			User user = (User) session.getAttribute("userObj");
			username = user.getUserName();
			}
			catch(NullPointerException e){
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			%>
			<c:forEach var="details"
				items="<%=new UserDao().previousBookingDetails(username)%>">
				<tr>
					<td>${details.bookingId}</td>
					<td>${details.userName}</td>
					<td>${details.roomType}</td>
					<td>${details.rentPerDay}</td>
					<td>${details.checkInDate}</td>
					<td>${details.checkOutDate}</td>
					<td>${details.duration}</td>
					<td>${details.totalRent}</td>
					<td>${details.sgst}</td>
					<td>${details.cgst}</td>
					<td>${details.discount}</td>
					<td>${details.rentToPay}</td>

					<!-- Display image using img tag -->
					<td><img
						src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(details.aadhaarFront)}"
						Style="max-width: 100px; max-height: 100px;"></td>

					<td><img
						src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(details.aadhaarBack)}"
						Style="max-width: 100px; max-height: 100px;"></td>

					<%-- <td>
                	<a href="./DeleteProductServlet?proId=${product.proId}" class="btn btn-primary">Delete</a>
                	<a href="./EditProductServlet?proId=${product.proId}" class="btn btn-primary">Edit</a>
                </td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>