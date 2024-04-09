package com.servlet;

import java.io.*;

import com.dao.ExpenseDao;
import com.db.hibernateUtil;
import com.entity.Expenses;
import com.entity.User;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/update")
public class UpdateData extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        int id = Integer.parseInt(request.getParameter("id"));
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
        Ex.setId(id);
        ExpenseDao doa=new ExpenseDao(hibernateUtil.getSessionFactory());
        boolean f = doa.updateExpanse(Ex);

        if(f)
        {
            session.setAttribute("msg", "Expense Updated");
            response.sendRedirect("user/ViewExpanse.jsp");
        }
        else {
            session.setAttribute("msg", "Something Went Wrong ");
            response.sendRedirect("user/ViewExpanse.jsp");
        }

    }

}

