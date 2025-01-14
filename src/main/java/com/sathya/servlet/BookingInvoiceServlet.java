package com.sathya.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.sathya.dao.UserDao;
import com.sathya.entity.BookingDetails;

@WebServlet("/BookingInvoiceServlet")
@MultipartConfig
public class BookingInvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("userName");
		String roomType = request.getParameter("roomType");
		int pricePerDay = Integer.parseInt(request.getParameter("pricePerDay"));
		LocalDate checkInDate = Date.valueOf(request.getParameter("checkIn")).toLocalDate();
		LocalDate checkOutDate = Date.valueOf(request.getParameter("checkOut")).toLocalDate();
		int duration = calculateDaysBetween(checkInDate, checkOutDate);

		Part part = request.getPart("adhaarFront");
		InputStream inputStream = part.getInputStream();
		byte[] aadhaarFront = IOUtils.toByteArray(inputStream);

		Part part1 = request.getPart("adhaarBack");
		InputStream inputStream1 = part1.getInputStream();
		byte[] aadhaarBack = IOUtils.toByteArray(inputStream1);

		String email = new UserDao().getEmail(username);

		double totalRent = (double) duration * pricePerDay;
		double sgst = totalRent * 0.09;
		double cgst = sgst;
		double discount = 0.05 * (totalRent + sgst + cgst);
		double totalPrice = totalRent + sgst + cgst - discount;

		BookingDetails details = new BookingDetails();
		details.setUserName(username);
		details.setRoomType(roomType);
		details.setRentPerDay(pricePerDay);
		details.setCheckInDate(Date.valueOf(checkInDate));
		details.setCheckOutDate(Date.valueOf(checkOutDate));
		details.setDuration(duration);
		details.setTotalRent(totalRent);
		details.setSgst(sgst);
		details.setCgst(cgst);
		details.setDiscount(discount);
		details.setRentToPay(totalPrice);
		details.setAadhaarFront(aadhaarFront);
		details.setAadhaarBack(aadhaarBack);

		HttpSession session = request.getSession(false);
		session.setAttribute("bookingDetails", details);

		RequestDispatcher dispatcher1 = request.getRequestDispatcher("billingInfo.jsp");
		dispatcher1.forward(request, response);

	}

	public static int calculateDaysBetween(LocalDate date1, LocalDate date2) {
		// Calculate the difference using ChronoUnit
		long daysBetween = ChronoUnit.DAYS.between(date1, date2);
		// Return the absolute value to ensure positive number of days
		return ((int) Math.abs(daysBetween)) + 1;
	}

}
