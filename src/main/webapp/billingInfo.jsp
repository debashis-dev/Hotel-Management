<!DOCTYPE html>
<%@page import="com.sathya.entity.BookingDetails"%>
<html>
<head>
<meta charset="UTF-8">
<title>Billing Invoice</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: mediumpurple;
	/* Set the background color to mediumpurple */
	padding-top: 50px;
}

.invoice-container {
	background-color: #ffffff;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding: 30px;
	margin: 0 auto;
	max-width: 800px;
}

.invoice-header {
	background-color: #343a40;
	color: #ffffff;
	padding: 20px;
	text-align: center;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	margin-top: -50px;
	margin-bottom: 30px;
}

.invoice-header h1 {
	font-size: 24px;
	font-weight: bold;
}

.invoice-table {
	width: 100%;
	border-collapse: collapse;
}

.invoice-table th, .invoice-table td {
	border: 1px solid #dee2e6;
	padding: 10px;
	font-weight: bold; /* Make td elements bold */
}

.invoice-table th {
	background-color: #343a40;
	color: #ffffff;
	text-align: left;
}

.payment-button {
	display: block;
	margin: 20px auto;
	text-align: center;
}

.payment-button a {
	padding: 10px 20px;
	font-size: 18px;
	font-weight: bold; /* Make button text bold */
	background-color: #007bff;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none; /* Remove underline */
	transition: background-color 0.3s; /* Smooth transition */
}

.payment-button a:hover {
	background-color: #0056b3; /* Darker background on hover */
}

@media ( max-width : 576px) {
	.invoice-header h1 {
		font-size: 20px;
	}
}
</style>
</head>
<body>
	<%@ include file="component/navbar2.jsp" %>
	<div class="container">
		<form action="BookingConfirmServlet" method="post">
			<div class="invoice-container">
				<div class="invoice-header">
					<h1>Billing Invoice</h1>
				</div>
				<table class="table invoice-table">
					<%
					BookingDetails details = (BookingDetails) session.getAttribute("bookingDetails");
					%>
					<tr>
						<th>Type of Room</th>
						<td><%=details.getRoomType()%></td>
					</tr>
					<tr>
						<th>Room Rent Per day</th>
						<td><%=details.getRentPerDay()%></td>
					</tr>
					<tr>
						<th>Check In date</th>
						<td><%=details.getCheckInDate()%></td>
					</tr>
					<tr>
						<th>Check Out date</th>
						<td><%=details.getCheckOutDate()%></td>
					</tr>
					<tr>
						<th>Duration</th>
						<td><%=details.getDuration()%></td>
					</tr>
					<tr>
						<th>Total rent</th>
						<td><%=details.getTotalRent()%></td>
					</tr>
					<tr>
						<th>CGST</th>
						<td><%=details.getCgst()%></td>
					</tr>
					<tr>
						<th>SGST</th>
						<td><%=details.getSgst()%></td>
					</tr>
					<tr>
						<th>Discount</th>
						<td><%=details.getDiscount()%></td>
					</tr>
					<tr>
						<th>Total Amount to Pay</th>
						<td><%=details.getRentToPay()%></td>
					</tr>
				</table>
				<div class="payment-button">
					<button type="submit" class="btn btn-primary">Proceed to
						Payment</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
