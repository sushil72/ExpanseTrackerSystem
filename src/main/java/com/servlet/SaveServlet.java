package com.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.ExpenseDao;
import com.db.hibernateUtil;
import com.entity.Expenses;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpSession;

@WebServlet("/addExpense")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		String Expense_name=request.getParameter("ExpanseName");
		int  amount = Integer.parseInt( request.getParameter("amount"));
		String date = request.getParameter("datepicker");
		String time = request.getParameter("timepicker");
		String category = request.getParameter("category");
		
		HttpSession session= request.getSession();
	  User user=(User)session.getAttribute("loginUser");
		
		
		Expenses Ex = new Expenses();
		Ex.setExpenseName(Expense_name);
		Ex.setAmount(amount);
		Ex.setDate(date);
		Ex.setTime(time);
		Ex.setCategory(category);
		Ex.setUser(user);
		
		ExpenseDao doa=new ExpenseDao(hibernateUtil.getSessionFactory());
		boolean f = doa.saveExpense(Ex);
		
		if(f)
		{
			session.setAttribute("msg", "Expense Added");
			response.sendRedirect("user/addExpanse.jsp");
		}
		else {
			session.setAttribute("msg", "Something Went Wrong");
			response.sendRedirect("user/addExpenses.jsp");
		}
		
	}

}
