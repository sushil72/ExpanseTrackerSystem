<%@page import="com.entity.User"%>
<nav class="dark:bg-gray-900 border-b-2">

<%
        User u = (User) session.getAttribute("loginUser");

%>

        <div class="w-full flex flex-wrap items-center justify-between space-between p-4">
            <% if(u!=null)
            {
            %>
            <a href="index.jsp" class="flex-none flex items-center space-x-3 rtl:space-x-reverse">
                <i class="fa-solid fa-wallet text-red-500 text-3xl"></i>
                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Finance Flair</span>
            </a>
        <% } else{ %>
                <a href="index.jsp" class="flex-none flex items-center space-x-3 rtl:space-x-reverse">
                    <i class="fa-solid fa-wallet text-red-500 text-3xl"></i>
                    <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Finance Flair</span>
                </a>
            <%

        }%>

          
          <div class="flex-none hidden w-full md:block md:w-auto" id="navbar-default border">
            <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
              <% if(u!=null)
              {
                  %> <li>
                <a href="home.jsp"
                   class="block ml-3 py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent
                md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500
                dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                    <i class="fa-solid fa-house"></i>Home</a>
            </li>  <%
              }else {
                  %><li>
                <a href="index.jsp"
                   class="block ml-3 py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent
                md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500
                dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                    <i class="fa-solid fa-house"></i>Home</a>
            </li>  <%
              }
              %>


             
              <%
              	if(u!=null)
              	{
              		%> <li><a href="addExpanse.jsp"
                class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 
                md:hover:bg-transparent md:border-0 md:hover:text-blue-700 
                md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 
                dark:hover:text-white md:dark:hover:bg-transparent"><i class="fa-solid fa-plus"></i>Add Expense</a> 
                </li>
                <li>
                    <a href="add_income.jsp" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100
                md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white
                md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white
                md:dark:hover:bg-transparent"><i class="fa-solid fa-plus"></i>Add Income</a>
                </li>
                <li>
                <a href="ViewExpanse.jsp" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100
                md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white 
                md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white 
                md:dark:hover:bg-transparent"><i class="fa-solid fa-eye"></i>Show Expenses</a>
              </li>
                <% 
              	}else{
              		%><li> <a href="login.jsp" 
                class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 
                md:hover:bg-transparent md:border-0 md:hover:text-blue-700 
                md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 
                dark:hover:text-white md:dark:hover:bg-transparent"><i class="fa-solid fa-plus"></i>Add Expense</a>  </li>
                
                
              <li>
                <a href="login.jsp" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100
                 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white 
                 md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white 
                 md:dark:hover:bg-transparent"><i class="fa-solid fa-eye"></i>Show Expenses</a>
              </li>
                
                <% 
              	}
              %>
                
             
            </ul>
          </div>
          
           <div class="flex-none mr-6 flex space-x-3">
            <%
            
            if (u != null) {
            %>
            <span  class="text-white font-semibold hover:text-blue-500 ">
            	<i class="fa-solid fa-user "></i><%= u.getNameString() %></span>

               <a href="..//LogoutServlet"   class="text-white font-semibold ">
                   <i class="fa-solid fa-right-from-bracket"></i> Logout
               </a>



               <%
            } else {
            %>
            <a href="login.jsp" class="text-white  font-semibold hover:text-blue-500">Login</a>
            <a href="register.jsp" class="text-white font-semibold hover:text-blue-500">Register</a>
            <%
            }
            %>
        </div>
        </div>
      </nav>