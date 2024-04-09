package com.servlet;

import java.io.*;

import com.dao.ExpenseDao;
import com.db.hibernateUtil;
import com.entity.Income;
import com.entity.User;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "incomeServletServlet", value = "/incomeServlet")
public class incomeServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Source = request.getParameter("source");
        long amount= Long.parseLong(request.getParameter("amount"));
        String date = request.getParameter("datepicker");

        Income income=new Income();
        income.setSoursce(Source);
        income.setIncome_date(date);
        income.setAmount(amount);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        income.setUser(user);

        ExpenseDao dao = new ExpenseDao(hibernateUtil.getSessionFactory());
        boolean f= dao.addIncome(income);

        if(f)
        {
            session.setAttribute("msg", "IncomeAdded successfully");
            response.sendRedirect("user/add_income.jsp");
        }
        else {
            session.setAttribute("msg", "Something Went wrong");
            response.sendRedirect("user/add_income.jsp");
        }
    }

}