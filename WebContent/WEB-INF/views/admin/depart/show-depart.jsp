<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-md-3">
	<ul class="list-group">
		<a class="list-group-item list-group-item-action"
			href="admin/user/show-user.htm"><s:message code="global.aside.usermana"/></a>
		<a class="list-group-item list-group-item-action"
			href="admin/staff/show-staff.htm"><s:message code="global.aside.staffmana"/></a>
		<a class="list-group-item list-group-item-action active"
			href="admin/depart/show-depart.htm"><s:message code="global.aside.departmana"/></a>
		<a class="list-group-item list-group-item-action"
			href="admin/record/show-record.htm?type=0"><s:message code="global.aside.recordmana" /></a>
	</ul>
</div>
<div class="col-md-9">
	<div class="table-scroll">
		<table class="table table-striped text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col"><s:message code="admin.depart.table.col2"/></th>
					<th scope="col"><s:message code="admin.depart.table.col3"/></th>
					<th scope="col" colspan="2"><s:message code="admin.depart.table.col4"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${departs.size()-1}" varStatus="stt"
					var="depart" items="${departs}">
					<tr>
						<td>${stt.index+1}</td>
						<td>${depart.id}</td>
						<td>${depart.name}</td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="window.location.href='admin/depart/update-depart/${depart.id}.htm'">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								<s:message code="admin.depart.btnupdate"/>
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-danger"
								onclick="deleteDepart('${depart.id.trim()}','${depart.name}');">
								<i class="fa fa-trash" aria-hidden="true"></i>
								<s:message code="admin.depart.btndel"/>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button onclick="window.location.href='admin/depart/add-depart.htm';"
		type="button" class="btn btn-success m-3 float-right">
		<i class="fa fa-plus" aria-hidden="true"></i>
		<s:message code="admin.depart.btnInsert"/>
	</button>
</div>
<script type="text/javascript">
		function deleteDepart(id, name) {
			Swal.fire({
				  title: 'Are you sure?',
				  text: "Are you sure delete depart '"+name+"'!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
		        if (result.value) {
		        	window.location.href = "admin/depart/delete/"+id+".htm";
		        } else if(result.dismiss === Swal.DismissReason.cancel){
		        	Swal.fire(
		        		      'Cancelled',
		        		      'Depart is safe :)',
		        		      'error'
		        		    )
		        }
		    });
		}
	</script>
