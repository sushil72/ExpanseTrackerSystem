<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/register.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script defer src="validation.js"></script>
    <title>Register</title>
</head>

<body>
    <section class="bg-slate-900">
        <div class=" flex flex-col justify-center items-center  px-6 py-8 mx-auto md:h-screen lg:py-0">
            <a href="index.jsp"
                class="   p-5  flex items-center leading-8 tracking-widest  text-2xl font-semibold text-white "><i
                    class="fa-solid fa-wallet font-bold text-4xl m-2  text-red-500"></i>Finance Flair </a>
            <div class="w-full sm:max-w-md bg-gray-800 rounded-lg ">
                <div class="p-6 sm:p-8 space-y-5">
                    <h1 class="text-white font-bold text-2xl">
                        Create an account
                    </h1>

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
    <%=msg%> <a href="login.jsp" class=" text-red-500 font-semibold underline hover:no-underline">Login</a>
  </div>

</div>
						<%
					}
					%>

					 <% session.removeAttribute("msg"); %>

                    <form id="form" action="Register" method="post" class="space-y-4 md:space-y-6 ">
                        <div >
                            <label class="block text-white font-semibold mb-2" for="name">Your full name</label>
                            <input type="text" id="uname" name="uname"  placeholder="Enter your name "
                            class="rounded-lg bg-gray-700 w-full block p-2.5  border-gray-300 placeholder-gray-400 text-white   font-semibold  outline-none   focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70">
                            <div class="error text-red-500"></div>
                        </div>

                        <div >
                            <label class="block text-white font-semibold mb-2" for="name">Your Email</label>
                            <input type="email" id="uemail" name="uemail" placeholder="name@company.com"
                            class="rounded-lg bg-gray-700 w-full block p-2.5  border-gray-300 placeholder-gray-400 text-white   font-semibold  outline-none   focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70">
                            <div class="error text-red-500"></div>

                        </div>

                        <div >
                            <label class="block text-white font-semibold mb-2" for="name">Your Password</label>
                            <input type="password" id="upass" name="upass"  placeholder="••••••••"
                            class="rounded-lg bg-gray-700 w-full block p-2.5  border-gray-300 placeholder-gray-400 text-white   font-semibold  outline-none   focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70">
                            <div class="error text-red-500"></div>

                        </div>

                        <div>
                            <input type="checkbox" id="check" name="check"  class="focus:ring custom-checkbox  focus:ring-red-500 focus:ring-opacity-50 w-4 h-4  ">
                            <label for="" class="text-gray-400">I accept the <a href="#" class="text-red-500 hover:underline">Terms and conditions</a></label>
                            <div class="error text-red-500"></div>

                        </div>
                        <button type="submit" class="w-full text-white bg-red-500 rounded-lg p-2.5 hover:bg-red-400">Create an account</button>

                        <p class="text-gray-400">Already have account? <a href="login.jsp" class="text-red-500 hover:underline">Sign in </a></p>
                    </form>
                </div>
            </div>
        </div>
    </section>



</body>

</html>
