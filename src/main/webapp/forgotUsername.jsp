<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<style>
    /* CSS for scrollable form */
    .container {
        width: 500px;
        max-height: 90vh; /* Set maximum height to 80% of viewport height */
        position: fixed; /* Set position to fixed */
        top: 40%; /* Center vertically */
        left: 50%; /* Center horizontally */
        transform: translate(-50%, -50%); /* Center the container */
        background: linear-gradient(to bottom, LemonChiffon, LightCyan);
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow-y: auto; /* Enable vertical scrolling */
    }

    .container form {
        text-align: left; /* Center form inputs */
    }

    .container form label {
        display: block; /* Make labels display as block elements */
        margin-bottom: 10px; /* Add space between labels */
    }

    .container form input,
    .container form textarea {
        width: calc(100% - 20px); /* Set input width to 100% minus padding */
        margin-bottom: 15px; /* Add space between inputs */
        padding: 5px; /* Add padding */
    }
</style>
</head>
<body class="bodyclass">
    <!-- Login Form -->
    <div class="container">
        <h2>Forgot UserName</h2>
        <c:if test="${result==0}">
            <h1 class="font-italic font-weight-bold text-danger text-center">
                Invalid Details....Please Try Again !</h1>
        </c:if>
        <form method="post" action="ForgotUsernameServlet">
            <div class="form-group">
                <label for="name" class="form-label">Full Name:</label> <input
                    type="text" name="name" id="name" class="form-control"
                    placeholder="Enter Full Name" required>
            </div>
            <div class="form-group">
                <label for="email" class="form-label">Email Id:</label> <input
                    type="email" name="email" id="email" class="form-control"
                    placeholder="Enter Email Id" required>
            </div>
            <div class="form-group">
                <label for="dob" class="form-label">Date of Birth:</label> <input
                    type="date" name="dob" id="dob" class="form-control"
                    placeholder="Enter Date of Birth" required>
            </div>
            <div class="form-group">
                <label for="mobile" class="form-label">Mobile:</label> <input
                    type="number" name="mobile" id="mobile" class="form-control"
                    placeholder="Enter Mobile Number" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <div class="form-group text-center ">
                <a href="login.jsp" class="text-decoration-none"> Login</a>
            </div>
        </form>
    </div>
</body>
</html>
