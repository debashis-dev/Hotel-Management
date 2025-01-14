function registerValidations() {
	var name = document.getElementById("name").value;
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmpassword").value;
	var email = document.getElementById("email").value;
	var mobile = document.getElementById("mobile").value;
	var userName = document.getElementById("userName").value;
	var address = document.getElementById("address").value;

	// Password and confirm password checking
	if (name.trim() === "" || password.trim() === "" || confirmPassword.trim() === "" || email.trim() === "" || mobile.trim() === "" || userName.trim() == "" || address.trim() === "") {
		alert("Please enter all values");
		return false;
	}

	if (password !== confirmPassword) {
		alert("Password and confirm password must be the same");
		return false;
	}

	// Password strength check (example: minimum 8 characters, starts with uppercase character, contains atleast one symbol and one number)
	var symbolRegex = /[^a-zA-Z0-9]/
	var numberRegex = /[0-9]/;
	if (password.length < 8) {
		alert("Password must be at least 8 characters long");
		return false;
	}
	else if (password.charAt(0).toUpperCase() != password.charAt(0)) {
		alert("Password Should starts with an Upper case letter");
		return false;
	}
	else if (!numberRegex.test(password)) {
		alert("Password must contains atleast one number");
		return false;
	}
	else if (!symbolRegex.test(password)) {
		alert("Password must contains atleast one special character");
		return false;
	}

	// Email format validation using regular expression
	var emailRegex = /^[^\s@]+@gmail\.com$/;
	if (!emailRegex.test(email)) {
		alert("Enter a valid Gmail address");
		return false;
	}

	// Mobile number length check
	if (mobile.length !== 10) {
		alert("Mobile number must be 10 digits long");
		return false;
	}

	return true; // Validation passed
}
