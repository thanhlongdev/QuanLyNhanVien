<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
}

img {
	width: 500px;
}
</style>
</head>
<body>
	<div class="container-fluid mx-auto w-100 h-100">
		<div class="row mt-5 main-div mx-auto rounded-lg w-90 h-90">
			<div class="col-md ml-5">
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3>
						<i class="fa fa-user-circle" aria-hidden="true"></i>
						<s:message code="admin.staff.form.updtitle"/>
					</h3>
				</div>
				<form method="post" action="admin/staff/update-staff.htm"
					name="submitForm" class="main-form needs-validation"
					style="width: 100%;" enctype="multipart/form-data" novalidate>
					<div class="row my-2">
						<div class="col">
							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputText">
								<s:message code="admin.staff.table.col2"/>
								</label> <input type="text"
									class="form-control-plaintext validated" id="inputText"
									name="id" placeholder="<s:message code="admin.staff.table.col2"/>" value="${staff.id}" readonly>
							</div>

							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputPassword">
								<s:message code="admin.staff.table.col3"/>
								</label> <input type="text" class="form-control validated"
									id="inputStaffName" name="name" placeholder="<s:message code="admin.staff.table.col3"/>"
									value="${staff.name}" required>
							</div>

							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputGender">
								<s:message code="admin.staff.table.col4"/>
								</label><br>
								<div class="form-check-inline">
									<label class="form-check-label" for="radio2"> <input
										type="radio" class="form-check-input" id="radio1"
										name="gender" value="true" ${staff.gender?'checked':''}>Nam (Male)
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label" for="radio2"> <input
										type="radio" class="form-check-input" id="radio2"
										name="gender" value="false" ${staff.gender?'':'checked'}>Nữ (Female)
									</label>
								</div>
							</div>
							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputEmail">Email</label>
								<input type="email" class="form-control validated" id="email"
									name="email" placeholder="Email" value="${staff.email}" required>
							</div>
							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputPhone">
								<s:message code="admin.staff.table.col8"/>
								</label> <input type="text" class="form-control validated"
									maxlength="10" minlength="4" id="phone" value="${staff.phone}"
									name="phone" placeholder="<s:message code="admin.staff.table.col8"/>" required>
							</div>
							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputSalary">
								<s:message code="admin.staff.table.col9"/>
								</label>
								<input type="text" class="form-control validated" id="salary"
									name="salary" placeholder="<s:message code="admin.staff.table.col9"/>" value="<fmt:formatNumber
								value="${staff.slary}" type="NUMBER" groupingUsed = "false" />" required/>
							</div>
						</div>
						<div class="col">
							<div class="form-group my-3" data-plugin="formMaterial">
								<label class="form-control-label" for="inputPassword">
								<s:message code="admin.staff.table.col5"/>
								</label> <input type="date" class="form-control validated"
									id="datePicker" name="birthday" value="${staff.birthday}" placeholder="Text"
									required>
							</div>
							<div class="form-group my-3">
								<label for="exampleFormControlTextarea1">
								<s:message code="admin.staff.table.col11"/>
								</label>
								<textarea name="note" class="form-control" id="note" value="${staff.note}"
									rows="3"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">
								<s:message code="admin.staff.table.col10"/></label> <select
									class="form-control" name="departId" id="combobox">
									<c:forEach var="depart" items="${listDepart}">
										<option value="${depart.id.trim()}" ${depart.id.trim() == staff.depart.id.trim()?"selected":""}>${depart.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Upload</span>
								</div>
								<div class="custom-file">
									<input type="hidden" id="photoName" name="photo"
										value="${staff.photo}"> <input type="file"
										class="custom-file-input" id="inputFile" name="fileUpload">
									<label class="custom-file-label" for="inputGroupFile">Choose
										file</label>
								</div>
							</div>
							<button class="btn btn-primary mb-3" type="submit"><s:message code="admin.staff.btnupdate"/></button>
							<button class="btn btn-danger mb-3" type="button" onclick="window.location.href='admin/staff/show-staff.htm'">
								<s:message code="admin.staff.form.btnExit"/>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md w-30 h-100">
				<div class="my-3 align-center text-center">
					<img class="rounded my-5 mx-auto"
						src="resource/avatar/${staff.photo}" id="staffPhoto"
						alt="khong load duoc anh">
					<h3>
						<i class="fa fa-picture-o" aria-hidden="true"></i> Your Avatar
					</h3>
				</div>
			</div>
		</div>
	</div>

	<script>
	
	bootstrapValidate('#inputText',"min:5:Enter at least 5 Characters")
	bootstrapValidate('#inputText',"max:8:Enter no more than 8 characters!")
	
	bootstrapValidate('#inputFullname',"min:10:Enter at least 10 Characters")
	bootstrapValidate('#inputFullname',"max:50:Enter no more than 50 characters!")
	
	bootstrapValidate('#email',"email:Invalid Email")
	
	bootstrapValidate('#phone',"startsWith:0:Phone number start with 0")
	bootstrapValidate('#phone',"min:10:Phone number containt 10 Characters")
	bootstrapValidate('#phone',"max:10:Phone number containt 10 Characters")
	
 	bootstrapValidate('#salary', 'required:Salary is requied')

	var form = document.querySelector('.needs-validation');
	var check = document.getElementsByClassName("is-invalid")
	form.addEventListener('submit', function(event) {
		event.preventDefault();
		event.stopPropagation();
		if (form.checkValidity() === true) {
			if (check.length == 0) {
				swal({
	                title: "Are you sure?",
	                text: "You want to save ?",
	                type: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: "Yes, Update Staff!",
	                cancelButtonText: "No, cancel plx!"
	            }).then((result) => {
	                if (result.value) {
	                	 document.submitForm.submit();
	                } else {
	                    swal("Cancelled", "Your infomation wasn't submit", "error");
	                }
	            });
			}
		} else {
			form.classList.add('was-validated');
		}
	})
	
		if (document.getElementById("datePicker").valueAsDate == null) {
			document.getElementById('datePicker').valueAsDate = new Date(
					new Date().getFullYear() - 20, new Date().getMonth(),
					new Date().getDay());
		}
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#staffPhoto').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
			var photoName = document.getElementById('inputFile').value;
			photoName = photoName.substring(photoName.lastIndexOf("\\") + 1);
			document.getElementById("photoName").value = photoName;
		}

		$("#inputFile").change(function() {
			readURL(this);
		});

	</script>
</body>
</html>