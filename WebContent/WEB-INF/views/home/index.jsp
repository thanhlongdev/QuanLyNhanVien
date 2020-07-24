<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>HOME PAGE FOR USER</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/png" href="<c:url value='resource/login/images/icons/favicon.ico'/>"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resource/home/assets/css/main.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://reactiveraven.github.io/jqBootstrapValidation/js/jqBootstrapValidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://kit.fontawesome.com/2705abeb1d.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="index.html" class="logo">JAVA5</a>
			<nav id="nav">
				<c:choose>
					<c:when test="${empty loginUser}">
						<button class="btn btn-btn-primary"
							onclick="window.location.href='login/index.htm'">LOGIN</button>
					</c:when>
					<c:otherwise>
						<div class="dropdown float-right">
							<button class="btn btn-primary dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-user-shield"></i> Hi,
								${loginUser.username}
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="admin/user/show-user.htm"> <i
									class="fa fa-user-circle-o" aria-hidden="true"></i> Admin Page
								</a> <a class="dropdown-item" href="login/logout.htm"> <i
									class="fa fa-sign-out" aria-hidden="true"></i> Log out
								</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</nav>
			<a href="#navPanel" class="navPanelToggle"><span
				class="fa fa-bars"></span></a>
		</div>
	</header>

	<!-- Banner -->
	<section id="banner">
		<h1>Welcome to Java5</h1>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style1 special">
		<div class="inner">
			<header>
				<h2>TOP 10 STAFF HAVE THE BEST PROFILE</h2>
			</header>
			<div style="font-family: cursive;" class="flex flex-5">
				<c:forEach var="staff" items="${topStaff}">
					<div class="box person">
						<div class="image round">
							<img width="100" src='<c:url value="resource/avatar/${staff.photo}"/>' alt="Person 1" />
						</div>
						<h3>${staff.name}</h3>
						<p>${staff.depart.name}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<div class="flex">
				<div class="copyright">
					&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
					Images: <a href="https://unsplash.com">Unsplash</a>.
				</div>
				<ul class="icons">
					<li><a href="https://www.facebook.com/thanh.long.0310" target="_blank" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
				</ul>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="resource/home/assets/js/jquery.min.js"></script>
	<script src="resource/home/assets/js/skel.min.js"></script>
	<script src="resource/home/assets/js/util.js"></script>
	<script src="resource/home/assets/js/main.js"></script>
</body>
</html>