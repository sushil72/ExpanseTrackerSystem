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

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameString = request.getParameter("uname");
		String emailString = request.getParameter("uemail");
		String passwordString =  request.getParameter("upass");
		String checkerString=request.getParameter("check");
		

		User user1=new User();
		user1.setNameString(nameString);
		user1.setCheckerString(checkerString);
		user1.setEmailString(emailString);
		user1.setPasswordString(passwordString);
		
//		System.out.println(nameString);
		
		HttpSession session =request.getSession();
		UserDao ud1 = new UserDao(hibernateUtil.getSessionFactory());
		if(ud1.SaveUser(user1))
		{
			
//		System.out.println("success");
			session.setAttribute("msg", "Registration Succesful ");
			response.sendRedirect("register.jsp");
		}
		else {
//			System.out.println("Failed");
			session.setAttribute("msg", "Something went wrong ");
			response.sendRedirect("register.jsp");
		}
			
	}

}
