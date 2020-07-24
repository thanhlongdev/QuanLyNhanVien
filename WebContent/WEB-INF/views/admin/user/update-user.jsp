<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Insert_Update User</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
	src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js"></script>
<script
	src="https://unpkg.com/sweetalert2@7.1.3/dist/sweetalert2.all.js"></script>
<style>
body {
	background: rgb(63, 94, 251);
	background: radial-gradient(circle, rgba(63, 94, 251, 1) 0%,
		rgba(252, 70, 107, 1) 100%);
}

.main-div {
	background-color: white;
	width: 550px;
}
</style>
</head>
<body>
	<div class="container-fluid d-flex justify-content-center">
		<div
			class="row mt-5 d-flex justify-content-center main-div rounded-lg">
			<form method="post" action="user/update-user.htm" name="submitForm"
				class="main-form needs-validation" style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3><s:message code="admin.user.form.updtitle"/></h3>
				</div>
				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputText"><s:message code="admin.user.form.username"/></label>
					<input type="text" class="form-control-plaintext validated"
						id="inputText" name="username" placeholder="<s:message code="admin.user.form.username"/>"
						value="${user.username}" readonly="readonly" required>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputPassword"><s:message code="admin.user.form.password"/></label> 
					<input type="password" class="form-control validated"
						id="inputPassword" name="password" placeholder="<s:message code="admin.user.form.password"/>"
						value="${user.password}" required>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputFullname"><s:message code="admin.user.form.fullname"/></label>
					<input type="text" class="form-control validated"
						id="inputFullname" name="fullName" placeholder="<s:message code="admin.user.form.fullname"/>"
						value="${user.fullName}" required>
				</div>
				<button class="btn btn-danger mb-3 ml-3 float-right"
					onclick="window.location.href='admin/user/show-user.htm'"
					type="button"><s:message code="admin.user.form.btnExit"/></button>
				<button class="btn btn-primary mb-3 float-right" type="submit"><s:message code="admin.user.form.updtitle"/></button>
			</form>
		</div>
	</div>
	<c:remove var="user" />
	<script>
	
	bootstrapValidate('#inputText',"min:5:Enter at least 5 Characters")
	bootstrapValidate('#inputText',"max:10:Enter no more than 10 characters!")
	
	bootstrapValidate('#inputPassword',"min:8:Enter at least 8 Characters")
	bootstrapValidate('#inputPassword',"max:10:Enter no more than 10 characters!")
	
	bootstrapValidate('#inputFullname',"min:10:Enter at least 5 Characters")
	bootstrapValidate('#inputFullname',"max:50:Enter no more than 50 characters!")
	
		var form = document.querySelector('.needs-validation');
	 	var check = document.getElementsByClassName("is-invalid")

        form.addEventListener('submit', function (event) {
            event.preventDefault();
            event.stopPropagation();
            if (form.checkValidity() === true && check.length == 0) {
                alert()
            }
            form.classList.add('was-validated');
        });

        function alert() {
            swal({
                title: "Are you sure?",
                text: "You want to update ?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Update User!",
                cancelButtonText: "No, cancel plx!"
            }).then((result) => {
                if (result.value) {
                	 document.submitForm.submit();
                } else {
                    swal("Cancelled", "Your infomation wasn't submit", "error");
                }
            });
        }

    </script>
</body>
</html>