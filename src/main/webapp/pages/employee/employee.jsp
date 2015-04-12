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
		
		$('#fileupload').fileupload({
	        dataType: 'json',
	        done: function (e, data) {
	        	if(data.result == 'null'){
	        		$.jGrowl("Upload image failed!", "error");
	        		return false;
	        	}
	        	
	        	$("#preview-avatar").attr("src", "getImage/"+data.result.id);
	        	reloadEmployeeList();
	        },
	        progressall: function (e, data) {
	            var progress = parseInt(data.loaded / data.total * 100, 10);
	            $('#progress .bar').css(
	                'width',
	                progress + '%'
	            );
	        }
	    });
	});
</script>
<form action="updateEmployee" method="post" id="employee-form">
<table class="table table-hover table-bordered">
	<tr>
		<th>Full Name</th>
		<th>Phone</th>
		<th>Contact</th>
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
		<td><input type="text" class="form-control required-field" name="joinDate" value="${emp.joinDate}" readonly="readonly"></td>
		<td><input type="text" class="form-control" name="empSkills" value="${emp.empSkills}"></td>
		<td width="10%">
			<img alt="preview-avatar" src="getImage/${emp.image.id}" class="img-responsive" id="preview-avatar">			
			<input id="fileupload" type="file" name="content" data-url="uploadFile">
			<div id="progress">
			    <div class="bar" style="width: 0%;"></div>
			</div>
		</td>
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