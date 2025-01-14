function check() {
	const checkInDate = document.getElementById("checkIn").value;
	const checkOutDate = document.getElementById("checkOut").value;
	const today = new Date().toISOString().split('T')[0];
	if (checkInDate < today) {
		alert("Check-in date cannot be less than today's date.");
		return false;
	}
	if (checkOutDate < checkInDate) {
		alert("Check-out date cannot be less than check-in date.");
		return false;
	}
	return true;
}
