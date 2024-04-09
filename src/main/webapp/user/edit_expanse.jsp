<%@ page import="com.dao.ExpenseDao" %>
<%@ page import="com.db.hibernateUtil" %>
<%@ page import="com.entity.Expenses" %>
<%@ page import="java.util.Date" %>
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
        input[type="time"]::-webkit-calendar-picker-indicator {
            filter: invert(1); /* Invert color to change it */
        }
    </style>

    <link rel="stylesheet" href="../CSS/addExpanse.css">
    <title>Edit Expanse</title>
</head>


<body>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    User user = (User) session.getAttribute("loginUser");
    if(user==null){

        response.sendRedirect("../login.jsp");
    }


%>
<%@include file="../navbar.jsp" %>
<%
int id = Integer.parseInt((request.getParameter("id")));

ExpenseDao dao = new ExpenseDao(hibernateUtil.getSessionFactory());
Expenses exp=dao.getExpenseById(id);
%>

<section class="flex justify-center bg-slate-900 items-center h-screen">
    <div class="bg-gray-800 text-white shadow-md rounded-md mt-2 p-8 max-w-lg w-full">
        <h1 class="text-3xl font-bold text-white mb-6 text-center">Edit Expenses</h1>

        <%  String msg=(String) session.getAttribute("msg");
            if(msg!=null)
            {
        %>

        <div id="alert-3" class="flex items-center p-4 mb-4 text-green-800 rounded-lg bg-green-50 dark:bg-gray-800 dark:text-green-400" role="alert">
            <svg class="flex-shrink-0 w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
            </svg>
            <div class="ms-3 text-sm font-medium">
                <%=msg%> <a href="ViewExpanse.jsp" class=" text-red-500 font-semibold underline hover:no-underline">View Expanses</a>
            </div>

        </div>
        <%
            }
        %>

        <% session.removeAttribute("msg"); %>

        <form action="../update" method ="post" class="space-y-4">
            <div>
                <label  class="font-semibold mb-2">Expense Name </label>
                <input type="text" value="<%= exp.getExpenseName()%>" placeholder="For Movie" class="block  w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70 text-white "
                       name="ExpanseName">
            </div>

            <div>
                <label class="font-semibold mb-2">Amount</label>
                <input type="number" value="<%= exp.getAmount()%>" class="block font-semibold w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70  text-white"
                       placeholder="&#8377; Enter amount" min="0" step="0.1" name="amount">
            </div>

            <div class=" ">
                <label  class="mb-2 font-semibold">Select a date </label>
                <input type="date" value="<%=exp.getDate()%>" name="datepicker"
                       class="block font-semibold w-full p-3 rounded-lg bg-gray-700
                       focus:outline-none focus:ring focus:ring-red-500
                       focus:ring-opacity-70  text-white   ">
            </div>

            <div>
                <label for="timepicker" class="font-semibold  mb-2">Select a time</label>
                <input type="time" value="<%= exp.getTime()%>" id="timepicker" name="timepicker"
                       class="block font-semibold w-full p-3 rounded-lg bg-gray-700 focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70 text-white">
            </div>

            <div class="mb-6">
                <label for="category" class=" font-semibold  mb-2">Choose Category</label>
                <select id="category"  name="category" class="block font-semibold w-full p-3 rounded-lg focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70 bg-gray-700 "
                        text-white onchange="toggleOtherInput()">
                    <option value="<%= exp.getCategory() %>" selected></option>
                    <option value="groceries">Groceries</option>
                    <option value="utilities">Utilities</option>
                    <option value="rent">Rent</option>
                    <option value="transportation">Transportation</option>
                    <option value="entertainment">Entertainment</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div id="otherInput" class="mb-6 hidden">
                <label for="otherCategory" class="font-semibold mb-2">Other Category</label>
                <input type="text" id="otherCategory" name="category"
                       class="block font-semibold w-full p-3 rounded-lg focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70 bg-gray-700 "
                       placeholder="Enter Other ">
            </div>
                <input type="hidden" name="id" value="<%=exp.getId()%>">

            <button
                    class="text-white w-full bg-red-500 hover:bg-red-400 rounded-lg px-5 py-2 outline-none text-center font-medium"
                    type="submit">Update
            </button>

        </form>
    </div>

</section>


<script>
    function toggleOtherInput() {
        var category = document.getElementById("category").value;
        var otherInput = document.getElementById("otherInput");

        if (category === "other") {
            otherInput.classList.remove("hidden");
        } else {
            otherInput.classList.add("hidden");
        }
    }
</script>



</body>
</html>