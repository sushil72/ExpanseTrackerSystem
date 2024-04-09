package com.servlet;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LogoutServlettServlet", value = "/LogoutServlet")
public class LogoutServlett extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
                HttpSession session = request.getSession(false);
                if(session!=null)
                {
                    session.removeAttribute("loginUser");
                    session.setAttribute("msg" , "Logout successful");
                    response.sendRedirect("../login.jsp");
                }
    }

}


