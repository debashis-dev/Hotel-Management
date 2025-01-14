package com.sathya.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sathya.dao.UserDao;
import com.sathya.entity.User;

@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserDao dao = new UserDao();

		int userNameCheck = dao.searchUser(username);
		String passwordCheck = dao.getPassword(username);
		int passCheck = 1;
		if (!(password.equals(passwordCheck)))
			passCheck = 0;

		if (userNameCheck == 0) {
			request.setAttribute("userStatus", userNameCheck);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} else if (passCheck == 0) {
			request.setAttribute("passwordStatus", passCheck);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

		User userObj = null;
		userObj = dao.findDetails(username, password);

		HttpSession session = request.getSession();
		session.setAttribute("userObj", userObj);
		session.setAttribute("username", username);

		if (userObj != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("result", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.include(request, response);
		}
	}

}
