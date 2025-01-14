<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// Get the current page URL
		var currentUrl = window.location.href;

		// Loop through each nav link and compare its href attribute with the current page URL
		$(".navbar-nav .nav-link").each(function() {
			var linkUrl = $(this).attr("href");

			// Check if the current page URL contains the link's URL
			if (currentUrl.indexOf(linkUrl) !== -1) {
				// If it matches, add the 'active' class to the parent li element
				$(this).parent().addClass("active");
			}
		});
	});
</script>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
	<div class="container">
		<h5 style="color: white;">HOTEL WORLD</h5>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp">Home</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="profile.jsp">Profile</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="previousBookings.jsp">Previous Bookings</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="gallery.jsp">Gallery</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="aboutus.jsp">About Us</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="contactUs.jsp">Contact Us</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LogoutServlet">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>

<style>
/* Additional styles for the navbar */
.navbar {
	border-radius: 3px; /* Add rounded corners */
}

.navbar-brand {
	font-size: 24px; /* Increase font size for brand */
}

.navbar-nav .nav-link {
	font-size: 18px; /* Increase font size for links */
	padding: 10px 15px; /* Add padding to links */
	margin-left: 10px; /* Add margin between links */
}

.navbar-nav .nav-item.active .nav-link {
	background-color: rgba(255, 255, 255, 0.2); ! important;
	/* Change background color of active link */
	color: black !important; /* Change text color of active link */
	font-weight: bold; /* Make text bold for active link */
	border-radius: 5px;
}

.navbar-nav .nav-link:hover {
	background-color: #8B0000; /* Change background color on hover */
	border-radius: 5px;
	color: lime !important;
}

.navbar-toggler {
	border: none; /* Remove border from toggler */
}

.navbar-toggler-icon {
	background-color: white; /* Change color of toggler icon */
}

.navbar-collapse {
	justify-content: flex-end; /* Align links to the right */
}

.navbar-nav {
	align-items: center; /* Center links vertically */
}

body {
	padding-top: 70px;
	/* Add padding to the top to prevent content from being hidden behind navbar */
}
</style>
