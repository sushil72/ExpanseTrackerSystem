<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../components/components.jsp" %>
    <meta charset="UTF-8">
    <style>
        /* Target the calendar icon within the input field */
        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1); /* Invert color to change it */
        }

    </style>

    <link rel="stylesheet" href="../CSS/addExpanse.css">
    <title>Add Expanse</title>
</head>


<body>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@include file="../navbar.jsp" %>
<%
    User user = (User) session.getAttribute("loginUser");
    if(user==null)
        response.sendRedirect("../login.jsp");
%>
<section class="flex justify-center bg-slate-900 items-center h-screen">
    <div class="bg-gray-800 text-white shadow-md rounded-md mt-2 p-8 max-w-lg w-full">
        <h1 class="text-3xl font-bold text-white mb-6 text-center">Add Income</h1>

        <%  String msg=(String) session.getAttribute("msg");
            if(msg!=null)
            {
        %>

        <div id="alert-3" class="flex items-center p-4 mb-4 text-green-800 rounded-lg bg-green-50 dark:bg-gray-800 dark:text-green-400" role="alert">
            <svg class="flex-shrink-0 w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
            </svg>
            <span class="sr-only">Info</span>
            <div class="ms-3 text-sm font-medium">
                <%=msg%>
            </div>

        </div>
        <%
            }
        %>

        <% session.removeAttribute("msg"); %>

        <form action="../incomeServlet" method ="post" class="space-y-4">
            <div>
                <label for="" class="font-semibold mb-2">Income source </label>
                <input type="text" placeholder="For Movie" class="block  w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70 text-white "
                       name="source">
            </div>

            <div>
                <label for="" class="font-semibold mb-2">Amount</label>
                <input type="number" class="block font-semibold w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70  text-white "
                       placeholder="&#8377; Enter amount" min="0" step="0.1" name="amount">
            </div>

            <div class=" ">
                <label for="datepicker" class="mb-2 font-semibold">Select a date </label>
                <input type="date" name="datepicker"
                       class="block font-semibold w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70  text-white   ">
            </div>



            <button
                    class="text-white w-full bg-red-500 hover:bg-red-400 rounded-lg px-5 py-2 outline-none text-center font-medium"
                    type="submit">Add Income
            </button>

        </form>
    </div>

</section>

</body>
</html>