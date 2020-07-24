<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Add User</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
			<form method="post" action="admin/user/add-user.htm"
				name="submitForm" class="main-form needs-validation"
				style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3><s:message code="admin.user.form.addtitle"/></h3>
				</div>
				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputText"><s:message code="admin.user.form.username"/></label> 
					<input type="text" class="form-control validated"
						id="inputText" name="username" placeholder="<s:message code="admin.user.form.username"/>" maxlength="10"
						minlength="5" required>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputPassword"><s:message code="admin.user.form.password"/></label>
					<input type="password" class="form-control validated"
						id="inputPassword" name="password" placeholder="<s:message code="admin.user.form.password"/>"
						maxlength="10" minlength="8" required>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputFullname"><s:message code="admin.user.form.fullname"/></label>
					<input type="text" class="form-control validated"
						id="inputFullname" name="fullName" placeholder="<s:message code="admin.user.form.fullname"/>"
						maxlength="50" minlength="10" required>
				</div>
				<button class="btn btn-danger mb-3 ml-3 float-right"
					onclick="window.location.href='admin/user/show-user.htm'"
					type="button"><s:message code="admin.user.form.btnExit"/></button>
				<button class="btn btn-primary mb-3 float-right" type="submit"><s:message code="admin.user.form.addtitle"/></button>
			</form>
		</div>
	</div>
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
	    })

        function alert() {
            swal({
                title: "Are you sure?",
                text: "You want to save ?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Create User!",
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