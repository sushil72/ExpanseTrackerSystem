package com.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.hibernateUtil;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Signin extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("started");
		String emailString=request.getParameter("uname");
		String passwordString=request.getParameter("upass");
		
//		User user= new User();
		UserDao ud=new UserDao(hibernateUtil.getSessionFactory());
		User user =ud.loginUser(emailString, passwordString);	
		
		HttpSession session=request.getSession();
		if(user==null)
		{
			session.setAttribute("loginMsg", "Invalid User and password");
			response.sendRedirect("login.jsp");
		}else {
			session.setAttribute("loginUser", user);
			response.sendRedirect("user/home.jsp");
		}
		
	}

}
