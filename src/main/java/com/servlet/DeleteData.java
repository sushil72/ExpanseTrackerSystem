package com.servlet;

import java.io.*;

import com.dao.ExpenseDao;
import com.db.hibernateUtil;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = "/deleteExpanse")
public class DeleteData extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    int id = Integer.parseInt(request.getParameter("id"));

    ExpenseDao Dao = new ExpenseDao(hibernateUtil.getSessionFactory());
    boolean f = Dao.DeleteExpanse(id);
    HttpSession session=request.getSession();
    if(f)
    {
        session.setAttribute("msg", "deleted Successfully ");
        response.sendRedirect("user/ViewExpanse.jsp");
    }
    else {
        session.setAttribute("msg", "something went wrong  ");
        response.sendRedirect("user/ViewExpanse.jsp");
    }
    }

}