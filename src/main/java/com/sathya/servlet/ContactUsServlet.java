package com.sathya.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sathya.dao.HotelDAO;
import com.sathya.entity.Contact;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String comments = request.getParameter("comments");
		String username = (String) request.getSession(false).getAttribute("username");
		System.out.println("CUN: "+username);
		
		Contact contact = new Contact(username, name, mobile, comments);
		int result = new HotelDAO().saveContact(contact);
		
		if(result==1)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("contactussubmit.html");
			dispatcher.forward(request, response);
		}
		else {
			request.setAttribute("contactResult", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("contactus.jsp");
			dispatcher.forward(request, response);
		}
	}

}
