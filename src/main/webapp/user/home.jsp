<%@ page import="com.dao.ExpenseDao" %>
<%@ page import="com.db.hibernateUtil" %>
<%@ page import="org.w3c.dom.stylesheets.LinkStyle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="com.entity.Expenses" %>
<%@ page import="com.entity.Income" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/leading.css">
    <%@ include file="../components/components.jsp" %>
    <title>User Home </title>
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    User user = (User) session.getAttribute("loginUser");
%>
<%
    if(user==null)
    {
        response.sendRedirect("../login.jsp");
    }
%>

<%

    ExpenseDao dao = new ExpenseDao(hibernateUtil.getSessionFactory());
    List<BigInteger> incomeData = dao.fetchIncomeArray(user);
    List<BigInteger> expensData = dao.fetchExpenseArray(user);
    System.out.println(incomeData);
%>

<% if (incomeData.isEmpty()) {
%> <%@ include file="../navbar.jsp" %>

<div class="min-h-screen flex justify-center  bg-gradient-to-r  from-slate-900 to-slate-700">
    <h1 class="text-white text-2xl text-center mt-40">
        <span class="text-4xl font-semibold text-red-500"> Wellcome Mr. <%=user.getNameString()%></span> <br> currently you dont have any data <br> Add incomes and Expenses to get the visuals </h1>
</div>
<%
}else {
%>

<%@ include file="../navbar.jsp" %>


<section>
    <%
        long totalIncome = dao.getIncome(user);
        long totalExpense = dao.TotalExpanses(user);
        float percent = ((float) totalExpense / totalIncome) * 100;
        String spentPercent = String.format("%.1f", percent);
    %>
    <div class="bg-slate-800 container p-4   h-fit ">
        <div class="widgets flex mt-7  justify-evenly">

            <div class="bg-gray-700 rounded-lg p-4 shadow-md">
                <div class="flex items-center justify-between">

                    <div class="flex items-center">

                        <span class="text-3xl text-blue-300 font-semibold mr-2">₹</span>
                        <h3 class="text-3xl text-blue-400 font-semibold"><%=totalIncome%>
                        </h3>
                    </div>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300 mr-1" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5 13l4 4L19 7"/>
                        </svg>
                        <p class="text-green-300 text-sm font-semibold">+15% this month</p>
                    </div>
                </div>
                <p class="text-blue-300 mt-2">Total Income</p>
            </div>

            <div class="bg-gray-700 rounded-lg p-4 shadow-md">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <span class="text-3xl text-red-400 font-semibold mr-2">₹</span>
                        <h3 class="text-3xl text-red-400 font-semibold"><%=totalExpense%>
                        </h3>
                    </div>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300 mr-1" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5 13l4 4L19 7"/>
                        </svg>
                        <p class="text-green-300 text-sm font-semibold">+21% this month</p>
                    </div>
                </div>
                <p class="text-red-300 mt-2">Total Expanse</p>
            </div>

            <div class="bg-gray-700 rounded-lg p-4 shadow-md">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <span class="text-3xl text-gray-300 text-green-300 font-semibold mr-2">₹</span>
                        <h3 class="text-3xl text-green-300 text-gray-100 font-semibold"><%=totalIncome - totalExpense%>
                        </h3>
                    </div>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300 mr-1" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5 13l4 4L19 7"/>
                        </svg>
                        <p class="text-green-300 text-sm font-semibold">+10% this month</p>
                    </div>
                </div>
                <p class="text-gray-300 mt-2">Current Balance </p>
            </div>

            <div class="bg-gray-700 rounded-lg p-4 shadow-md">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <span class="text-3xl text-gray-300 font-semibold mr-2">₹</span>
                        <h3 class="text-3xl text-gray-100 font-semibold"><%=spentPercent%>%</h3>
                    </div>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300 mr-1" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5 13l4 4L19 7"/>
                        </svg>
                        <p class="text-green-300 text-sm font-semibold">+20% this month</p>
                    </div>
                </div>
                <p class="text-gray-300 mt-2">Income Spent</p>
            </div>
        </div>

        <div class="charts mt-7 flex p-4 gap-8 justify-around ">
            <!-- chart1 -->
            <div class="container mx-auto py-8">
                <!-- <h1 class="text-2xl text-white font-bold mb-4">Income and Expenses</h1> -->
                <div class="bg-gray-700 p-4 rounded-lg shadow-lg">
                    <canvas id="lineChart" class="w-full h-64"></canvas>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    // Sample data (replace with your actual data)
                    var data = {
                        labels: ["January", "February", "March", "April", "May", "June", "July"],
                        datasets: [{
                            label: "Income",
                            fill: false,
                            lineTension: 0.6,
                            backgroundColor: "rgba(75,192,192,0.4)",
                            borderColor: "rgba(75,192,192,1)",
                            borderCapStyle: 'butt',
                            borderDash: [],
                            borderDashOffset: 0.0,
                            borderJoinStyle: 'miter',
                            pointBorderColor: "rgba(75,192,192,1)",
                            pointBackgroundColor: "#fff",
                            pointBorderWidth: 1,
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgba(75,192,192,1)",
                            pointHoverBorderColor: "rgba(220,220,220,1)",
                            pointHoverBorderWidth: 2,
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHitRadius: 10,
                            data: <%=incomeData%>,
                        },
                            {
                                label: "Expenses",
                                fill: false,
                                lineTension: 0.6,
                                backgroundColor: "rgba(255,99,132,0.4)",
                                borderColor: "rgba(220,53,69,1)",
                                borderCapStyle: 'butt',
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: 'miter',
                                pointBorderColor: "rgba(255,99,132,1)",
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 1,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(255,99,132,1)",
                                pointHoverBorderColor: "rgba(220,220,220,1)",
                                pointHoverBorderWidth: 2,
                                pointStyle: 'circle',
                                pointRadius: 5,
                                pointHitRadius: 10,
                                data: <%=expensData%>,
                            }]
                    };

                    // Chart options
                    var options = {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    // beginAtZero: true,
                                    suggestedMin : 10000,
                                    suggestedMax : 100000,
                                    fontColor: 'white' // Color of y-axis labels
                                }
                            }],
                            xAxes: [{
                                ticks: {
                                    fontColor: 'white' // Color of x-axis labels
                                }
                            }]
                        },
                        style: {
                            colors: '#f2f5f3' // Set the text color of x-axis labels to white
                        },
                        legend: {
                            labels: {
                                fontColor: 'white' // Color of dataset labels
                            }
                        },

                        animation: {
                            duration: 2000 // Animation duration (in milliseconds)
                        }
                    };

                    // Create line chart
                    var ctx = document.getElementById("lineChart").getContext("2d");
                    var myLineChart = new Chart(ctx, {
                        type: 'line',
                        data: data,
                        options: options
                    });
                });
            </script>

            <!-- cart2 -->
            <%
                Map<String, Integer> expcg = dao.getExpensesByCategoryForUser(user);
                StringBuilder labelsBuilder = new StringBuilder();
                StringBuilder dataBuilder = new StringBuilder();
                for (Map.Entry<String, Integer> entry : expcg.entrySet()) {
                    labelsBuilder.append("'").append(entry.getKey()).append("',");
                    dataBuilder.append(entry.getValue()).append(",");
                }
                String labels = labelsBuilder.toString();
                String data = dataBuilder.toString();
                // Remove trailing comma
                if (labels.length() > 0) {
                    labels = labels.substring(0, labels.length() - 1);
                }
                if (data.length() > 0) {
                    data = data.substring(0, data.length() - 1);
                }
            %>

                        <div class="container mx-auto py-8">
                            <!-- <h1 class="text-2xl font-bold mb-4">Income and Expenses</h1> -->
                            <div class="bg-gray-700 p-4 rounded-lg shadow-lg">
                                <canvas id="doughnutChart" class="w-full h-64"></canvas>
                            </div>
                        </div>

            <script>
                $(document).ready(function () {
                    var categories = [<%= labels %>];
                    var expensesData = [<%= data %>];

                    var data = {
                        labels: categories,
                        datasets: [{
                            data: expensesData, // Corrected to use expensesData directly
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.5)',
                                'rgba(54, 162, 235, 0.5)',
                                'rgba(255, 206, 86, 0.5)',
                                'rgba(75, 192, 192, 0.5)',
                                'rgba(153, 102, 255, 0.5)',
                                'rgba(255, 159, 64, 0.5)'
                            ]
                        }]
                    };

                    // Chart options
                    var options = {
                        legend: {
                            labels: {
                                fontColor: 'white' // Color of dataset labels
                            }
                        },
                        animation: {
                            animateRotate: true, // Enable rotation animation
                            duration: 2000 // Animation duration (in milliseconds)
                        }
                    };

                    // Create doughnut chart
                    var ctx = document.getElementById("doughnutChart").getContext("2d");
                    var myDoughnutChart = new Chart(ctx, {
                        type: 'doughnut',
                        data: data,
                        options: options
                    });
                });
            </script>

        </div>

        <!-- chart 3 -->

        <div class="flex gap-6 justify-between">
            <div class="max-w-screen-2xl flex gap-6 ml-6">

                <%
                    // Import necessary Java packages


                    // Define the date format pattern
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

                    // Get the current date
                    LocalDate currentDate = LocalDate.now();

                    // Format the current date as per the specified pattern
                    String formattedDate = currentDate.format(formatter);
                %>

                <div class="py-6" inline-datepicker data-date="<%=formattedDate  %>"></div>
                <div class="events bg-gray-700 rounded-lg w-full  px-14 py-4 mt-6 mb-6 ">
                    <h2 class="text-blue-400 text-2xl font-semibold ">Important Events</h2>
                    <button id="addEventBtn" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-2 rounded mt-4 ml-12 text-sm">
                        Add Event
                    </button>
                    <ul class="mt-2 text-white " id="eventList">

                    </ul>
                </div>
                <script>
                    // Add an event listener to the "Add Event" button
                    document.getElementById('addEventBtn').addEventListener('click', function () {
                        // Prompt the user to enter event details
                        var eventDescription = prompt('Enter event description:');

                        // Get the selected date from the inline date picker
                        // Prompt the user to enter the day of the event
                        var eventDay = prompt('Enter day of the event:');

                        // Get the current month and year
                        var currentDate = new Date();
                        var currentMonth = ('0' + (currentDate.getMonth() + 1)).slice(-2); // Adding leading zero if needed
                        var currentYear = currentDate.getFullYear();

                        // Concatenate current month and year with the entered day
                        var eventDate = currentMonth + '/' + eventDay + '/' + currentYear;
                        // Create a new list item element
                        var listItem = document.createElement('li');

                        // Set the text content of the list item to the event description and date
                        listItem.textContent = eventDescription + ' - Date: ' + eventDate;

                        // Append the list item to the event list
                        document.getElementById('eventList').appendChild(listItem);
                    });
                </script>

            </div>

            <div class="w-1/2 rounded-lg bg-gray-700 ">
                <canvas id="incomeExpenseChart"></canvas>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Sample data (replace with your actual data)
                    const incomeData = <%=incomeData%>;
                    const expenseData = <%=expensData%>;
                    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];

                    // Create chart data
                    const data = {
                        labels: months,
                        datasets: [
                            {
                                label: 'Income',
                                backgroundColor: '#4287f5',
                                // borderColor: 'rgba(255, 99, 132, 1)',
                                borderWidth: 1,
                                data: incomeData
                            },
                            {
                                label: 'Expenses',
                                backgroundColor: '#f54e42',
                                // borderColor: 'rgba(255, 135, 132, 1)',
                                borderWidth: 1,
                                data: expenseData
                            }
                        ]
                    };

                    // Create chart options
                    const options = {
                        legend: {
                            labels: {
                                fontColor: 'white' // Change color of legend labels
                            }
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    fontColor: 'rgba(255, 255, 255)' // Change color of y-axis labels
                                }
                            }],
                            xAxes: [{
                                ticks: {
                                    fontColor: 'rgba(255, 255, 255)' // Change color of x-axis labels
                                }
                            }]
                        }
                    };

                    // Get the canvas element
                    const ctx = document.getElementById('incomeExpenseChart').getContext('2d');

                    // Create the bar chart
                    const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: options
                    });
                });
            </script>
        </div>




    </div>

    <!-- recent txn/// -->

    <div class="relative overflow-x-auto text-white shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 ">
            <caption class="p-5 text-lg font-semibold text-left rtl:text-right t  text-white bg-gray-700">
                Recent Transactions

            </caption>
            <thead class="text-xs  uppercase rounded- bg-gray-500 text-white">
            <tr>
                <th scope="col" class="px-6 py-3">
                    Expense Name
                </th>
                <th scope="col" class="px-6 py-3">
                    Action
                </th>
                <th scope="col" class="px-6 py-3">
                    Category
                </th>
                <th scope="col" class="px-6 py-3">
                    Amount
                </th>
                <th scope="col" class="px-6 py-3">
                    Date
                </th>
            </tr>
            </thead>
            <tbody>
            <%
                Income letestIncome = dao.getLatestIncome(user);
            %>
            <tr class=" border-b bg-gray-600 text-white font-semibold border-gray-700">
                <th scope="row"
                    class="px-6 py-4 font-medium  whitespace-nowrap text-white">
                    <%=letestIncome.getSoursce()%>
                </th>
                <td class="px-6 text-green-300 py-4">
                    Income
                </td>
                <td class="px-6  py-4">
                    --
                </td>
                <td class="px-6 py-4">
                    ₹<%=letestIncome.getAmount()%>
                </td>
                <td class="px-6 py-4">
                    <%=letestIncome.getIncome_date()%>
                </td>
            </tr>
            <%
                List<Expenses> expenses = dao.getLetestExpense(user, 5);
                if (expenses != null) {
                    for (Expenses exp : expenses) {
            %>
            <tr class=" border-b bg-gray-600 text-white font-semibold border-gray-700">
                <th scope="row"
                    class="px-6 py-4 font-medium  whitespace-nowrap text-white">
                    <%=exp.getExpenseName()%>
                </th>
                <td class="px-6 text-red-300 py-4">
                    Expense
                </td>
                <td class="px-6  py-4">
                    <%=exp.getCategory()%>
                </td>
                <td class="px-6 py-4">
                    ₹<%=exp.getAmount()%>
                </td>
                <td class="px-6 py-4">
                    <%=exp.getDate()%>/
                    <%=exp.getTime()%>
                </td>

            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No recent transactions found</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</section>
<%
    }
%>

</body>
</html>