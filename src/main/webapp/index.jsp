<%--<%@page import="com.db.hibernateUtil"%>--%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.mysql.cj.Session"%>
<html>
<head>
	  <%@ include file="components/components.jsp" %>
	  <title>Home</title>

</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<div id="index.html"
	 class="container relative min-h-screen bg-gradient-to-r px-28 py-2 from-slate-900 to-slate-700 ">
	<nav class="flex text-white items-center ">
		<img src="images/logo.jpg" class="w-20 rounded-full " alt="">
		<ul class="flex-1 text-center ">
			<li class="inline-block px-5 font-bold list-none hover:text-red-400 "><a href="index.jsp">Home </a></li>
			<li class="inline-block px-5 font-bold list-none hover:text-red-400 "><a href="#services">services</a></li>
			<li class="inline-block px-5 font-bold list-none hover:text-red-400 "><a href="#about">About</a></li>
			<!-- <li class="inline-block px-5 font-bold list-none hover:text-red-400"><a href="#">Contact</a></li> -->
		</ul>
		<div>
			<li class="inline-block px-5 list-none font-bold hover:text-red-400"><a href="login.jsp">Login</a></li>
			<li class="inline-block px-5 list-none font-bold hover:text-red-400"><a href="register.jsp">Register</a></li>
		</div>

	</nav>

	<div class="mt-48 ">
		<h1 class="text-6xl text-white font-bold">Take the control <br> over your <span
				class="text-red-400">Expenses</span></h1>
		<p class="text-gray-400  mt-2 font-semibold text-xl  w-1/2">Welcome to Personal Finance Tracker, your
			personal finance companion designed to help you manage your money effortlessly.</p>
		<div class="mt-10">
			<a href="login.jsp" class="rounded-3xl  bg-red-500 py-3 px-8 text-white font-semibold hover:bg-transparent hover:border-red-300 hover:border
                 inline-block">Login</a>
			<a href="register.jsp" class="text-white font-medium ml-2 hover:text-red-400">Register Now <span><i
					class="fa-solid fa-check"></i></span></a>
		</div>
	</div>


	<!-- right images -->
	<div>

		<img src="images/img2.png"
			 class="w-full xl:w-1/2 shadow-lg  rounded-lg xl:absolute bottom-20 right-2 top-36 z-0" alt="">
		<img src="images/img3.png" class="w-full xl:w-1/2 shadow-lg rounded-lg xl:absolute bottom-10 right-2"
			 alt="">
	</div>




</div>

<section>
	<div id="services" class="container ">
		<h1 class="text-center mt-5 text-5xl font-semibold ">Our services</h1>
		<div class="flex flex-wrap mt-14 gap-10 justify-evenly  px-14">
			<div class="w-1/4 border  px-14 py-10  rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/divided.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Personalized Financial Tracking</h1>
				<p class="text-base  text-gray-800 font-normal leading-normal text-justify mt-2">"Track your income
					and expenses effortlessly with our personalized finance tracker. Categorize transactions, set
					budget limits, and gain insights into your spending habits to make informed financial
					decisions".</p>
			</div>

			<div class="w-1/4 border  px-14 py-10 rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/budget.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Comprehensive Financial Analysis</h1>
				<p class="text-base   text-gray-800 font-normal leading-normal text-justify mt-2">"Gain valuable
					insights into your financial health with comprehensive analysis tools. Visualize your spending
					patterns, identify areas for improvement, and make data-driven decisions to optimize your
					finances."</p>
			</div>

			<div class="w-1/4 border  px-14 py-10 rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/data-scientist.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Personalized Financial Advice</h1>
				<p class="text-base  text-gray-800 font-normal leading-normal text-justify mt-2">"Receive
					personalized financial advice tailored to your unique financial situation. Our expert
					recommendations help you make smart financial choices and reach your goals faster."</p>
			</div>

			<div class="w-1/4 border  px-14 py-10 rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/valuation.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Secure Data Management</h1>
				<p class="text-base  text-gray-800 font-normal leading-normal text-justify mt-2">"Rest assured
					knowing that your financial data is safe and secure with our encrypted data management system.
					Sync your data across devices with confidence, knowing that your privacy is our top priority."
				</p>
			</div>

			<div class="w-1/4 border  px-14 py-10 rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/growth.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Secure Data Management</h1>
				<p class="text-base  text-gray-800 font-normal leading-normal text-justify mt-2">"Rest assured
					knowing that your financial data is safe and secure with our encrypted data management system.
					Sync your data across devices with confidence, knowing that your privacy is our top priority."
				</p>
			</div>


			<div class="w-1/4 border  px-14 py-10 rounded-lg border-gray-700 bg-gray-100 hover:transform hover:scale-110 transition-transform duration-300">
				<div class="flex justify-center">
					<img src="images/loan.png" class="w-16 mb-5 " alt="">

				</div>
				<h1 class="text-2xl font-semibold ">Goal Setting and Monitoring:</h1>
				<p class="text-base  text-gray-800 font-normal leading-normal text-justify mt-2">"Set realistic financial goals and monitor your progress every step of the way. Whether you're saving for a vacation, a new home, or retirement, our tracker helps you stay on track and achieve your aspirations."
				</p>
			</div>
		</div>

		<!-- about us -->

	</div>

	<div id="about" class="bg-gray-800 bg-gradient-to-r px-28 py-2 mt-7 from-slate-900 to-slate-700">
		<h1 class="text-center mt-5 text-5xl font-semibold text-white">About Us</h1>
		<div class="flex mt-10 gap-10 justify-center">
			<div class=" max-w-2xl bg-gray-100  flex justify-center items-center mt-10 border border-white rounded-lg">
				<p class=" text-justify text-xl p-10 ">
					Welcome to Expense Tracker , your ultimate tool for managing your finances efficiently and effectively. Whether you're a seasoned investor or just starting on your financial journey, our platform is designed to empower you to take control of your money and achieve your financial goals.
				</p>
			</div>
			<div class="w-1/2">
				<h1 class="text-4xl text-center font-semibold text-red-500">Our Mission</h1>
				<p class="text-white text-justify mt-1  text-lg p-10">At Expense tracker , our mission is simple: to provide individuals with the tools and resources they need to make informed financial decisions and build a secure financial future. We believe that financial well-being is within reach for everyone, and we're committed to helping you turn your financial aspirations into reality.</p>
			</div>
		</div>
		<div class="mt-10 border border-white p-10 rounded-xl">
			<h1 class="text-3xl text-white">Key Feature</h1>
			<p class="text-white mt-4">With Expense tracker , you'll enjoy a range of powerful features, including:

				Expense Tracking: Easily track your income and expenses, categorize transactions, and gain insights into your spending habits.
				Budget Management: Set personalized budgets for different categories and track your progress in real-time.
				Goal Setting: Define your financial goals and create actionable plans to achieve them, whether it's saving for a dream vacation, buying a home, or building an emergency fund.
				Investment Tracking: Monitor the performance of your investment portfolio, track stock prices, and stay informed about market trends.
				Secure Data Encryption: Rest assured knowing that your financial data is safe and secure with end-to-end encryption and advanced security measures.</p>
		</div>
	</div>


</section>
<footer class="bg-gray-800 text-white py-4">
	<div class="container mx-auto">
		<p class="text-center">&copy; 2024 Your Company. All rights reserved. | Designed by <a href="https://example.com" target="_blank" class="text-red-500  font-semibold">Susheel Kumar</a></p>
	</div>
</footer>
<script>
	document.querySelectorAll('a[href^="#"]').forEach(anchor => {
		anchor.addEventListener('click', function(e) {
			e.preventDefault();

			const target = document.querySelector(this.getAttribute('href'));
			if (target) {
				window.scrollTo({
					top: target.offsetTop,
					behavior: 'smooth'
				});
			}
		});
	});
</script>



</body>
</html>
