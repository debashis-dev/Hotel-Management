package com.sathya.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sathya.dao.HotelDAO;
import com.sathya.dao.UserDao;
import com.sathya.entity.BookingDetails;

@WebServlet("/BookingConfirmServlet")
public class BookingConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		BookingDetails details = (BookingDetails) session.getAttribute("bookingDetails");

		String emailSubject = "Booking Details";
		String receiverEmailId = new UserDao().getEmail((String) session.getAttribute("username"));
		String emailBody = "Booking Successful:\n" + "Type of Room: " + details.getRoomType() + "\nRent Per Day: "
				+ details.getRentPerDay() + "\nCheck-In Date: " + details.getCheckInDate() + "\nCheck-Out Date: "
				+ details.getCheckOutDate() + "\nDuration: " + details.getDuration() + "\nTotal Room Rent: "
				+ details.getTotalRent() + "\nCGST: " + details.getCgst() + "\nSGST: " + details.getSgst()
				+ "\nDiscount: " + details.getDiscount() + "\nTotal Amount to Pay: " + details.getRentToPay();
		request.setAttribute("receiverEmail", receiverEmailId);
		request.setAttribute("emailBody", emailBody);
		request.setAttribute("emailSubject", emailSubject);

		new HotelDAO().saveBookingDetails(details);
		int bookResult = new HotelDAO().bookRoom(details.getRoomType());	
		request.setAttribute("bookingStat", bookResult);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("EmailServiceServlet");
		dispatcher.forward(request, response);
	}

}
