package com.sathya.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sathya.dao.UserDao;
import com.sathya.entity.User;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		
		int updateResult = new UserDao().updateUserDetails(user);
		request.setAttribute("updateResult", updateResult);
		
		if(updateResult==1) {
			HttpSession session = request.getSession(false);
			session.setAttribute("userObj", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("editProfile.jsp");
			dispatcher.forward(request, response);			
		}
		
		
	}

}
