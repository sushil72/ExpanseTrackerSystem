<%@ page import="com.dao.ExpenseDao" %>
<%@ page import="com.db.hibernateUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Expenses" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@include file="../components/components.jsp" %>

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
<% ExpenseDao dao = new ExpenseDao(hibernateUtil.getSessionFactory()); %>

    <section class="bg-gray-900 p-3 sm:p-5 h-screen">
        <div class="bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">

            <div class="relative overflow-hidden  shadow-md bg-gray-800 sm:rounded-lg">
                <div
                        class="flex flex-col px-4 py-3 space-y-3 lg:flex-row lg:items-center lg:justify-between lg:space-y-0 lg:space-x-4">
                    <div class="flex items-center flex-1 space-x-4">
                        <h5>
                            <span class="text-gray-300 font-semibold">Total Entries:</span>
                            <span class="dark:text-white"><%=dao.getCount(user) %></span>
                        </h5>
                        <h5>
                            <span class="text-gray-300 font-semibold" >Total income:</span>
                            <span class="dark:text-green-500 font-semibold font-medium">₹ <%=dao.getIncome(user)%> </span>
                        </h5>
                    </div>
                    <div
                            class="flex flex-col flex-shrink-0 space-y-3 md:flex-row md:items-center lg:justify-end md:space-y-0 md:space-x-3">
                        <button type="button"
                                class="flex text-white bg-blue-700 rounded-md px-3 py-2 hover:bg-blue-500 font-semibold ">
                            <a href="addExpanse.jsp"> Add new Expense </a>
                        </button>
                        <button type="button"
                                class="flex items-center justify-center flex-shrink-0 px-3 py-2 text-sm font-medium
                                text-gray-900 bg-white border border-gray-200 rounded-lg focus:outline-none
                                hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200
                                dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600
                                dark:hover:text-white dark:hover:bg-gray-700">

                            <h5>
                                <span class="text-gray-300 font-semibold ">Total Expenses:</span>
                                <span class="dark:text-red-400 font-semibold font-medium">₹ <%= dao.TotalExpanses(user)%> </span>
                            </h5>
                        </button>

                        <button type="button" id="export-csv"
                                class="flex items-center justify-center flex-shrink-0 px-3 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                            <svg class="w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24"
                                 stroke-width="2" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25
                                      0 0021 18.75V16.5m-13.5-9L12 3m0 0l4.5 4.5M12 3v13.5" />
                            </svg>
                            Export
                        </button>
                    </div>
                </div>
                <div class="overflow-x-auto">

                    <table class="w-full text-sm text-left text-gray-300 ">
                        <!-- w-full text-sm text-left text-gray-500 dark:text-gray-400 -->
                        <thead class="text-sm uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-4 py-3">Expense name</th>
                            <th scope="col" class="px-4 py-3">Category</th>
                            <th scope="col" class="px-4 py-3">Date</th>
                            <th scope="col" class="px-4 py-3">time</th>
                            <th scope="col" class="px-4 py-3">amount</th>
                            <th scope="col" class="px-4 py-3">
                                Actions
                            </th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                                List<Expenses> list = dao.getAllExpenseByUser(user);
                                for (Expenses ex : list) {
                        %>
                        <tr class="border-b dark:border-gray-700">
                            <th scope="row" class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <%= ex.getExpenseName() %> &#34;
                            </th>
                            <td class="px-4 font-semibold py-3"><%= ex.getCategory() %></td>
                            <td class="px-4 font-semibold py-3"><%= ex.getDate() %></td>
                            <td class="px-4 font-semibold py-3"><%= ex.getTime() %></td>
                            <td class="px-4 font-semibold py-3"> ₹ <%= ex.getAmount() %></td>
                            <td class="px-4 font-semibold py-3 flex items-center gap-2">
                                <button class="bg-blue-700 p-1 font-semibold w-1/2 rounded-md hover:bg-blue-500"><a href="edit_expanse.jsp?id=<%=ex.getId()%>" >Edit</a></button>

<%--                                    <input type="hidden" name="id" value="<%= ex.getId()%>">--%>
<%--                                    <button type="submit" class="bg-red-700 p-1 w-1/2 font-semibold rounded-md hover:bg-red-500">Delete</button>--%>

                                <button name="id" class="bg-red-700 p-1 w-1/2 font-semibold rounded-md hover:bg-red-500"><a href="../deleteExpanse?id=<%= ex.getId()%>" >Delete</a></button>
                            </td>
                        </tr>
                        <%

                            }
                        %>
                        </tbody>

                    </table>

                </div>

            </div>
        </div>
    </section>


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
<script>
    document.getElementById('export-csv').addEventListener('click', function() {
        exportToCSV();
    });

    function exportToCSV() {
        const rows = document.querySelectorAll('table tr');
        let csvContent = '';
        const includedColumns = [0, 1,2,3,4];
        rows.forEach(row => {
            const rowData = Array.from(row.children)
                .filter((cell, index) => includedColumns.includes(index)) // Filter out unwanted columns
                .map(cell => cell.innerText);
            csvContent += rowData.join(',') + '\n';
        });

        const blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]), csvContent], { type: 'text/csv;charset=utf-8' });
        saveAs(blob, 'table_data.csv');
    }
</script>
</body>
</html>