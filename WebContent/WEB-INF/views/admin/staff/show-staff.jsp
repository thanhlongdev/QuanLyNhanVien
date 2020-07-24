<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<fmt:setLocale value="vi-VN" scope="session"/>
<div class="col-md-3">
	<ul class="list-group">
		<a class="list-group-item list-group-item-action"
			href="admin/user/show-user.htm"><s:message code="global.aside.usermana"/></a>
		<a class="list-group-item list-group-item-action active"
			href="admin/staff/show-staff.htm"><s:message code="global.aside.staffmana"/></a>
		<a class="list-group-item list-group-item-action"
			href="admin/depart/show-depart.htm"><s:message code="global.aside.departmana"/></a>
		<a class="list-group-item list-group-item-action"
			href="admin/record/show-record.htm?type=0"><s:message code="global.aside.recordmana" /></a>
	</ul>
</div>
<div class="col-md-9">
	<div class="table-scroll">
		<table style="width: 1800px" class="table table-striped">
			<thead class="thead-dark text-center">
				<tr>
					<th scope="col">#</th>
					<th scope="col"><s:message code="admin.staff.table.col2"/></th>
					<th scope="col"><s:message code="admin.staff.table.col3"/></th>
					<th scope="col"><s:message code="admin.staff.table.col4"/></th>
					<th scope="col"><s:message code="admin.staff.table.col5"/></th>
					<th scope="col"><s:message code="admin.staff.table.col6"/></th>
					<th scope="col"><s:message code="admin.staff.table.col7"/></th>
					<th scope="col"><s:message code="admin.staff.table.col8"/></th>
					<th scope="col"><s:message code="admin.staff.table.col9"/></th>
					<th scope="col"><s:message code="admin.staff.table.col10"/></th>
					<th scope="col"><s:message code="admin.staff.table.col11" /></th>
					<th scope="col" colspan="2"><s:message code="admin.staff.table.col12"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${listStaff.size()-1}" varStatus="stt"
					var="staff" items="${listStaff}">
					<tr>
						<td class="text-center">${stt.index+1}</td>
						<td>${staff.id}</td>
						<td>${staff.name}</td>
						<td>${staff.gender == true?'Nam (Male)':'Nữ (Female)'}
						<td><fmt:formatDate value="${staff.birthday}" /></td>
						<td>${staff.email}</td>
						<td>${staff.photo}</td>
						<td class="text-right">${staff.phone}</td>
						<td class="text-right"><fmt:formatNumber
								value="${staff.slary}" type="currency" /></td>
						<td class="text-center">${staff.depart.name}</td>
						<td>${staff.note}</td>
						<td style="width: 150px;">
							<button type="button" class="btn btn-primary"
								onclick="window.location.href='admin/staff/update-staff/${staff.id.trim()}.htm'">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
								<s:message code="admin.staff.btnupdate"/>
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-danger"
								onclick="deleteStaff('${staff.name}','${staff.id}');">
								<i class="fa fa-trash" aria-hidden="true"></i>
								<s:message code="admin.staff.btndel"/>
							</button>
						</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	<button onclick="window.location.href='admin/staff/add-staff.htm';"
		type="button" class="btn btn-success m-3 float-right">
		<i class="fa fa-plus" aria-hidden="true"></i> <s:message code="admin.staff.btnInsert"/>
	</button>
</div>
<script type="text/javascript">
	function deleteStaff(name,id) {
		Swal.fire({
			  title: 'Are you sure?',
			  text: "Are you sure delete Staff '"+name+"' !",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
	        if (result.value) {
	        	window.location.href = "admin/staff/delete/"+id.trim()+".htm";
	        } else if(result.dismiss === Swal.DismissReason.cancel){
	        	Swal.fire(
	        		      'Cancelled',
	        		      'Your user is safe :)',
	        		      'error'
	        		    )
	        }
	    });
	}
</script>
