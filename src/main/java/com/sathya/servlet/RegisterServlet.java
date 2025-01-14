package com.sathya.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sathya.dao.UserDao;
import com.sathya.entity.User;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("userName");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		Date dob = Date.valueOf(request.getParameter("dob"));
		String address = request.getParameter("address");

		User user = new User();
		user.setUserName(userName);
		user.setFullName(name);
		user.setPassword(password);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setDob(dob);
		user.setAddress(address);

		UserDao dao = new UserDao();

		int userCheck = dao.searchUser(userName);
		int emailCheck = dao.searchEmail(email);
		if (userCheck == 0 && emailCheck == 0) {
			int result = dao.save(user);

			if (result == 1) {
				request.setAttribute("registerResult", result);
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			} else {
				response.setContentType("text/html");
				PrintWriter writer = response.getWriter();
				writer.println("<html><body>");
				writer.println("<h2>Registartion Failed....</h2>");
				writer.println("</body></html>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}
		} 
		else if(emailCheck == 1){
			request.setAttribute("emailCheck", emailCheck);
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.include(request, response);
		}
		else {
			request.setAttribute("userCheck", userCheck);
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.include(request, response);
		}
	}

}
