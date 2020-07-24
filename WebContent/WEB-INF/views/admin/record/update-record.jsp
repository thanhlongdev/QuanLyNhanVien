<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<form method="post" action="admin/record/update.htm"
				name="submitForm" class="main-form needs-validation"
				style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3><s:message code="admin.record.form.updtitle"/></h3>
				</div>
				<div class="form-group">
					<input type="hidden" name="id" value="${record.id}">
					<input type="hidden" name="staffId" value="${record.staff.id}"> 
					<label for="inputText"><s:message code="admin.record.table.col5"/></label>
						<input type="text" class="form-control validated" id="inputText"
							placeholder="Text" value="${record.staff.id} - ${record.staff.name}" required>
					</select>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputGender">
						<s:message code="admin.record.table.col2"/>
					</label><br>
					<div class="form-check-inline">
						<label class="form-check-label" for="radio2"> <input
							type="radio" class="form-check-input" id="radio1" name="type"
							value="true" ${record.type?"checked":""}>Khen Thưởng (Prise)
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="radio2"> <input
							type="radio" class="form-check-input" id="radio2" name="type"
							value="false" ${record.type?"":"checked"}>Kỷ Luật (Discipline)
						</label>
					</div>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputPassword">
						<s:message code="admin.record.table.col4"/>
					</label> <input type="date" class="form-control validated"
						id="datePicker" name="date" placeholder="Text" value="${record.date}" readonly required>
				</div>

				<div class="form-group my-3">
					<label for="exampleFormControlTextarea1">
						<s:message code="admin.record.table.col3"/>
					</label>
					<textarea name="reason" class="form-control" id="note" rows="3"
						required> ${record.reason} </textarea>
				</div>

				<button class="btn btn-danger mb-3 ml-3 float-right"
					onclick="window.location.href='admin/record/show-record.htm?type=0'"
					type="button"><s:message code="admin.record.form.btnExit"/></button>
				<button class="btn btn-primary mb-3 float-right" type="submit">
					<s:message code="admin.record.form.updtitle"/>
				</button>
			</form>
		</div>
	</div>
	<script>
		
	bootstrapValidate('#note',"min:5:Enter at least 5 Characters")
	bootstrapValidate('#note',"max:50:Enter no more than 50 characters!")
	
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
                confirmButtonText: "Yes, Create Record!",
                cancelButtonText: "No, cancel plx!"
            }).then((result) => {
                if (result.value) {
                	 document.submitForm.submit();
                } else {
                    swal("Cancelled", "Your infomation wasn't submit", "error");
                }
            });
        }
	 	if (document.getElementById("datePicker").valueAsDate == null) {
			document.getElementById('datePicker').valueAsDate = new Date(
					new Date().getFullYear(), new Date().getMonth(),
					new Date().getDay());
		}
    </script>
</body>
</html>