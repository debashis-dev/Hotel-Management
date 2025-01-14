package com.sathya.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sathya.dao.UserDao;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		Date dob = Date.valueOf(request.getParameter("dob"));
		String emailSubject = "Forgot Password";

		String password = new UserDao().getPassword(username, email, dob);

		if (password != null) {
			request.setAttribute("receiverEmail", email);
			request.setAttribute("emailSubject", emailSubject);
			request.setAttribute("emailBody", "Password: " + password);
			RequestDispatcher dispatcher = request.getRequestDispatcher("EmailServiceServlet");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("result", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
			dispatcher.forward(request, response);
		}
	}
}
