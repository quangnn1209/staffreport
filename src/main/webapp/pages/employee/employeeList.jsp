<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".edit-row-btn").on("click", function(){
			$.ajax({
			  url: "getEmployeeById",
			  data:{
				  id:$(this).attr("id")
			  }
			}).done(function(html) {
				openDialog("<div>"+html+"</div>");
			});
		});
		$(".del-row-btn").on("click", function(){
			var thiz = $(this);
			if(confirm("Do you want delete this employee?")){
				$.ajax({
				  url: "deleteEmployee",
				  type: "POST",
				  data:{
					  id:thiz.attr("id")
				  }
				}).always(function(data) {
					$.jGrowl(data);
				}).success(function(){
					thiz.parents("tr:first").remove();
				});
			}			
		});
		
		$(".watch-productivity").on("click", function(){
			$.ajax({
			  url: "getProductivityByEmpId",
			  data:{
				  id:$(this).attr("id")
			  }
			}).done(function(html) {
				openDialog("<div>"+html+"</div>", 300, 400);
			});
		});
	});
</script>
<table class="table table-hover">
	<tr>
		<th>No.</th>
		<th>Full Name</th>
		<th>Phone</th>
		<th>Contact</th>
		<th>Productivity</th>
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
			<td>${emp.empPhone}</td>
			<td>${emp.empContact}</td>
			<td>
				<button class="btn btn-default watch-productivity" id="${emp.empId}">Watch</button>
			</td>
			<td>${emp.joinDate}</td>
			<td>${emp.empSkills}</td>
			<td width="10%">
				<img alt="preview-avatar" src="getImage/${emp.image.id}" class="img-thumbnail">
			</td>
			<td>${emp.division.divisionName}</td>
			<td>${emp.team.teamName}</td>
			<td><i class="glyphicon glyphicon-pencil edit-row-btn" id="${emp.empId}"></i></td>
			<td><i class="glyphicon glyphicon-trash del-row-btn" id="${emp.empId}"></i></td>
		</tr>
	</c:forEach>
</table>