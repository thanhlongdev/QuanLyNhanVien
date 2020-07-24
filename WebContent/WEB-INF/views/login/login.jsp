<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<!--=================================2 ==============================================================-->
<link rel="icon" type="image/png" href="<c:url value='resource/login/images/icons/favicon.ico'/>"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/animate/animate.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/select2/select2.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/vendor/daterangepicker/daterangepicker.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/css/util.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/login/css/main.css'/>">
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login/submit.htm"
					method="POST">
					<span class="login100-form-title p-b-43">
					
						<c:choose>
							<c:when test="${empty message}">
								Login To Continue
							</c:when>
							<c:otherwise>
								${message}
							</c:otherwise>
						</c:choose>
						<c:remove var="message"/>
					</span>
						<div class="wrap-input100 validate-input"
						data-validate="Valid username is required">
						<input class="input100" type="text" name="username"> <span
							class="focus-input100"></span> <span class="label-input100">Username</span>
					</div>
						<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"> <span
							class="focus-input100"></span> <span class="label-input100">Password</span>
					</div>
						<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> Remember me </label>
						</div>
						<div>
							<a href="#" class="txt1"> Forgot Password? </a>
						</div>
			</div>


			<div class="container-login100-form-btn">
				<button class="login100-form-btn">Login</button>
			</div>
			</form>

			<div class="login100-more"
				style="background-image: url('<c:url value='resource/login/images/bg-01.jpg'/>');"></div>
		</div>
	</div>
	</div>





	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/animsition/js/animsition.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value='resource/login/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/select2/select2.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/daterangepicker/moment.min.js'/>"></script>
	<script
		src="<c:url value='resource/login/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='resource/login/vendor/countdowntime/countdowntime.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='resource/login/js/main.js'/>"></script>
</body>
</html>