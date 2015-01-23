<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<table class="table table-hover table-bordered">
	<tr>
		<th>No.</th>
		<th>Full Name</th>
		<th>Phone</th>
		<th>Contact</th>
		<th>Status</th>
		<th>Join Date</th>
		<th>Skills</th>
		<th>Avatar</th>
		<th>Division</th>
		<th>Team</th>
		<th colspan="2">Action</th>
	</tr>
	<c:forEach items="${employees}" var="emp" varStatus="status">
		<tr>
			<td>${status.index+1}</td>
			<td>${emp.empFullName}</td>
			<td>${emp.empPhone }</td>
			<td>${emp.empContact }</td>
			<td>${emp.empStatus }</td>
			<td>${emp.joinDate }</td>
			<td>${emp.empSkills }</td>
			<td>${emp.empAvatar }</td>
			<td>${emp.division.divisionName}</td>
			<td>${emp.team.teamName }</td>
			<td><i class="glyphicon glyphicon-pencil"></i></td>
			<td><i class="glyphicon glyphicon-trash"></i></td>
		</tr>
	</c:forEach>
</table>