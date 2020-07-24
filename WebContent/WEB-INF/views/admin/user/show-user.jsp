<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-md-3">
	<ul class="list-group">
		<a class="list-group-item list-group-item-action active"
			href="admin/user/show-user.htm"><s:message
				code="global.aside.usermana" /></a>
		<a class="list-group-item list-group-item-action"
			href="admin/staff/show-staff.htm"><s:message
				code="global.aside.staffmana" /></a>
		<a class="list-group-item list-group-item-action"
			href="admin/depart/show-depart.htm"><s:message
				code="global.aside.departmana" /></a>
		<a class="list-group-item list-group-item-action"
			href="admin/record/show-record.htm?type=0"><s:message
				code="global.aside.recordmana" /></a>
	</ul>
</div>
<div class="col-md-9">
	<div class="table-scroll">
		<table class="table table-striped text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col"><s:message code="admin.user.table.col2" /></th>
					<th scope="col"><s:message code="admin.user.table.col3" /></th>
					<th scope="col"><s:message code="admin.user.table.col4" /></th>
					<th scope="col" colspan="2"><s:message
							code="admin.user.table.col5" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${listUser.size()-1}" varStatus="stt"
					var="user" items="${listUser}">
					<tr>
						<td>${stt.index+1}</td>
						<td>${user.username}</td>
						<td class="algin-center"><input style="width: 100px;"
							type="password"
							class="form-control-plaintext text-center mx-auto"
							id="inputPassword" name="password" readonly placeholder="Text"
							value="${user.password}"></td>
						<td>${user.fullName}</td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="window.location.href='admin/user/update-user/${user.username}.htm'">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								<s:message code="admin.user.btnupdate" />
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-danger"
								onclick="deleteUser('${user.username}','${loginUser.username}');">
								<i class="fa fa-trash" aria-hidden="true"></i>
								<s:message code="admin.user.btndel" />
							</button>
						</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	<div class="row">
		<div class="col-sm-7">
			<form action="admin/user/find.htm" method="get">
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="find"
						placeholder="Please enter username"
						aria-label="Please enter username" aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">
							<i class="fa fa-search" aria-hidden="true"></i>
							&nbsp;Find</button>
					</div>
				</div>
			</form>
		</div>

		<div class="col-sm-5">
			<button onclick="window.location.href='admin/user/add-user.htm';"
				type="button" class="btn btn-success float-right">
				<i class="fa fa-plus" aria-hidden="true"></i>
				<s:message code="admin.user.btnInsert" />
			</button>
		</div>
	</div>
</div>
<script type="text/javascript">
		function deleteUser(username,myusername) {
			if(username.trim().toUpperCase() === myusername.trim().toUpperCase()){
				Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: 'Unable to delete yourself',
					})
			} else {
				Swal.fire({
					  title: 'Are you sure?',
					  text: "
			Are you sure delete
			user '"+username+"' !",
					  icon: 'warning',
					  showCancelButton:
			true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes, delete
			it!'
					}).then((result)=>
			{ if (result.value) { window.location.href =
			"admin/user/delete/"+username.trim()+".htm"; } else if(result.dismiss
			=== Swal.DismissReason.cancel){ Swal.fire( 'Cancelled', 'Your user is
			safe :)', 'error' ) } }); } }
			</script>