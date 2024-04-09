<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/output.css">
	<%@ include file="components/components.jsp"%>
<title>Login</title>

</head>

<body>
	<section
		class="dark:bg-slate-900 min-h-screen flex justify-center items-center ">
		<div
			class="w-1/2 min-h-screen  items-center flex flex-col  justify-center  px-6 py-8 mx-auto md:h-screen">
			<a href="index.jsp"
				class="  p-5  flex items-center leading-8 tracking-widest  text-2xl font-semibold text-white "><i
				class="fa-solid fa-wallet font-bold text-4xl m-2  text-red-400"></i>Finance
				Flare </a>
			<div
				class="w-full rounded-lg shadow dark:border  dark:bg-gray-800 dark:border-gray-700  sm:max-w-md  md:mt-0 ">
				<div class="p-6 space-y-4 md:space-y-6 sm:p-8 ">

					<h1
						class=" text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
						Sign in to your account</h1>

					<%
					String msg = (String) session.getAttribute("loginMsg");
					if(msg!=null)
					{
						%>
						
						<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
  <strong class="font-bold">alert!</strong>
  <span class="block sm:inline"> <%=msg %></span>
  <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
    <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/></svg>
  </span>
</div>
						
						 <%
					}
					%>

					<%
					session.removeAttribute("loginMsg");
					%>
					<form action="login" method="post" class="space-y-4 md:space-y-6">
						<div>
							<label class="text-white block text-sm font-medium mb-2">Your
								Email</label> <input type="email" required name="uname"
								class="sm:text-sm rounded-lg w-full p-2.5 bg-gray-700 
                            text-white font-semibold focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70
                             "
								placeholder="name@company.com">
						</div>

						<div>
							<label class="text-white block text-sm font-medium mb-2">Your
								Password</label> <input type="password" aria-required="true" name="upass"
								class="sm:text-sm rounded-lg w-full p-2.5 bg-gray-700 
                             text-white font-semibold  focus:outline-none focus:ring focus:ring-red-500 focus:ring-opacity-70
                             "
								placeholder="••••••••••" required="">
							<!-- bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required=""> -->
						</div>

						<div class="flex justify-between">
							<div class="flex items-start space-x-2">

								<div>
									<input type="checkbox" name="checkbox"
										class="w-4 h-4 rounded-lg focus:ring  focus:ring-red-400  ">
									<!-- "w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800" -->
								</div>
								<div>
									<label for="remember" class="text-white font-medium">Remember
										me </label>
								</div>
							</div>
							<div>
								<a href="#" class="text-red-500 hover:underline">Forget
									Password ?</a>
							</div>
						</div>
						<button
							class="text-white w-full bg-red-500 hover:bg-red-400 rounded-lg px-5 py-2 outline-none text-center font-medium"
							type="submit">Sign in</button>


						<p class="text-gray-400 font-medium">
							Don't have account yet ? <a href="register.jsp"
								class="text-red-500 hover:underline font-semibold">Sign up</a>
						</p>
					</form>
				</div>

			</div>


		</div>
		
	</section>
</body>

</html>