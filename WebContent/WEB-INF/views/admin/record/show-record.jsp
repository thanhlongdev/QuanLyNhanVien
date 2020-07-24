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
		<a class="list-group-item list-group-item-action"
			href="admin/depart/show-depart.htm"><s:message code="global.aside.departmana"/></a>
		<a class="list-group-item list-group-item-action active"
			href="admin/record/show-record.htm?type=0"><s:message code="global.aside.recordmana" /></a>
	</ul>
</div>
<div class="col-md-9">
	<div class="table-scroll">
		<table class="table table-striped text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col"><s:message code="admin.record.table.col2"/></th>
					<th scope="col"><s:message code="admin.record.table.col3"/></th>
					<th scope="col"><s:message code="admin.record.table.col4"/></th>
					<th scope="col"><s:message code="admin.record.table.col5"/></th>
					<th scope="col" colspan="2"><s:message code="admin.record.table.col6"/></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty listRecord}">
						<c:forEach begin="0" end="${listRecord.size()-1}" varStatus="stt"
							var="record" items="${listRecord}">
							<tr>
								<td>${stt.index+1}</td>
								<td>${record.type?"Khen Thưởng (Prise)":"Kỷ Luật (Discipline)"}</td>
								<td>${record.reason}</td>
								<td><fmt:formatDate value="${record.date}" /></td>
								<td>${record.staff.name}</td>
								<td>
									<button type="button" class="btn btn-primary"
										onclick="window.location.href='admin/record/update/${record.id}.htm'">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
										<s:message code="admin.record.btnupdate"/>
									</button>
								</td>
								<td>
									<button type="button" class="btn btn-danger"
										onclick="deleteRecord(${record.id})">
										<i class="fa fa-trash" aria-hidden="true"></i>
										<s:message code="admin.record.btndel"/>
									</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<td colspan="6">KHÔNG CÓ THÔNG TIN</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<div class="dropdown float-left">
		<button class="btn btn-secondary dropdown-toggle" type="button"
			id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"><s:message code="admin.record.table.col2"/></button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<a class="dropdown-item" href="admin/record/show-record.htm?type=0"><s:message code="admin.record.cbo.type0"/></a> 
			<a class="dropdown-item" href="admin/record/show-record.htm?type=1"><s:message code="admin.record.cbo.type2"/></a>
			<a class="dropdown-item" href="admin/record/show-record.htm?type=2"><s:message code="admin.record.cbo.type1"/></a>
		</div>
	</div>

	<button onclick="window.location.href='admin/record/add-record.htm';"
		type="button" class="btn btn-success m-3 float-right">
		<i class="fa fa-plus" aria-hidden="true"></i> <s:message code="admin.record.form.addtitle"/>
	</button>
</div>
<script type="text/javascript">
	function deleteRecord(id) {
		Swal.fire({
			  title: 'Are you sure?',
			  text: "Are you sure delete this record ?!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
	        if (result.value) {
	        	window.location.href = "admin/record/delete/"+id+".htm";
	        } else if(result.dismiss === Swal.DismissReason.cancel){
	        	Swal.fire(
	        		      'Cancelled',
	        		      'Record is safe :)',
	        		      'error'
	        		    )
	        }
	    });
	}
</script>
