<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("[name=joinDate]").datepicker({
			dateFormat: "yy-mm-dd"
		});
		
		$("#save-btn").on("click", function(){
			if(validateRequired($("#employee-form"))){
				return false;
			}
			
			$.ajax({
			  url: "updateEmployee",
			  type: "POST",
			  contentType : 'application/json; charset=utf-8',
			  dataType : 'json',
			  data: JSON.stringify($("#employee-form").serializeObject())			  
			}).always(function(data) {
				$.jGrowl(data.responseText);
				reloadEmployeeList();
			});
		});
	});
</script>
<form action="updateEmployee" method="post" id="employee-form">
<table class="table table-hover table-bordered">
	<tr>
		<th>Full Name</th>
		<th>Phone</th>
		<th>Contact</th>
		<th>Status</th>
		<th>Join Date</th>
		<th>Skills</th>
		<th>Avatar</th>
		<th>Division</th>
		<th>Team</th>
	</tr>
	<tr>
		<td><input type="hidden" name="empId" value="${emp.empId}"/><input type="text" class="form-control required-field" name="empFullName" value="${emp.empFullName}"></td>
		<td><input type="text" class="form-control" name="empPhone" value="${emp.empPhone}"></td>
		<td><input type="text" class="form-control" name="empContact" value="${emp.empContact}"></td>
		<td><input type="text" class="form-control" name="empStatus" value="${emp.empStatus}"></td>
		<td><input type="text" class="form-control required-field" name="joinDate" value="${emp.joinDate}" readonly="readonly"></td>
		<td><input type="text" class="form-control" name="empSkills" value="${emp.empSkills}"></td>
		<td><input type="text" class="form-control" name="empAvatar" value="${emp.empAvatar}"></td>
		<td>
			<select name="division[divisionId]">
				<c:forEach items="${divisions }" var="division">
					<option value="${division.divisionId}" ${emp.division.divisionName eq division.divisionName ? 'selected="selected"':'' }>${division.divisionName}</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="team[teamId]">
				<c:forEach items="${teams}" var="team">
					<option value="${team.teamId}" ${emp.team.teamName eq team.teamName ? 'selected="selected"':'' }>${team.teamName}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<button class="btn btn-default" type="button" id="save-btn">Save</button>
</form>