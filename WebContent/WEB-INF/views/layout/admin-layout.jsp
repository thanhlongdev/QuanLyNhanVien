<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>JAVA5_ASSIGNMENT</title>
<link rel="icon" type="image/png" href="<c:url value='resource/login/images/icons/favicon.ico'/>"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://reactiveraven.github.io/jqBootstrapValidation/js/jqBootstrapValidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
.table-scroll {
	display: block;
	height: 95%;
	overflow-y: auto;
	overflow-x: auto;
}
</style>
</head>
<body>
<body onload="bodyMessage(${status})">
	<c:remove var="status" />
	<div class="container-fluid ">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">JAVA 5</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#"><s:message
								code="global.layout.home" /><span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data-lang="vi" >Tiếng
							Việt</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data-lang="en">English</a></li>
				</ul>
				<div class="dropdown float-right">
					<button class="btn btn-primary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-user" aria-hidden="true"></i> Hi,
						${loginUser.username}
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="login/logout.htm"> <i
							class="fa fa-sign-out" aria-hidden="true"></i> <s:message
								code="global.layout.logout" />
						</a>
					</div>
				</div>
			</div>
		</nav>
		<div class="row mt-2">
			<jsp:include page="../${param.view}"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	function bodyMessage(status){
		
		switch (status) {
		case true:
			Swal.fire({
				  position: 'top-end',
				  icon: 'success',
				  title: 'Your work has been saved',
				  showConfirmButton: false,
				  timer: 1500
				})
			break;
		
		case false:
			Swal.fire({
				  position: 'top-end',
				  icon: 'error',
				  title: 'Your work has been error',
				  showConfirmButton: false,
				  timer: 1500
				})
			break;
			
		default:
			break;
		}
	}
	
	$(function(){
		$("a[data-lang]").click(function(){
		var lang = $(this).attr("data-lang");
		$.get("admin/user/show-user.htm?language="+ lang, function(){
		location.reload();
		});
		return false;
		});
	})
</script>
</body>
</html>