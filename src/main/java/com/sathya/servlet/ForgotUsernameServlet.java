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

@WebServlet("/ForgotUsernameServlet")
public class ForgotUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Date dob = Date.valueOf(request.getParameter("dob"));
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		String emailSubject = "Forgot Username";

		String username = new UserDao().getUsername(name, email, dob, mobile);

		if (username != null) {
			request.setAttribute("receiverEmail", email);
			request.setAttribute("emailSubject", emailSubject);
			request.setAttribute("emailBody", "UserName: " + username);
			RequestDispatcher dispatcher = request.getRequestDispatcher("EmailServiceServlet");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("result", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("forgotUsername.jsp");
			dispatcher.forward(request, response);
		}

	}

}
