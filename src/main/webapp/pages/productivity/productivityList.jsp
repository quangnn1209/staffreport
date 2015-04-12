<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(document).ready(function() {
		editBtnEvent($(".edit-row-btn"));
		
		$("#add-productive").on("click", function(){
			if($(".cancel-row-btn").length > 0){
				return false;
			}
			$("#productive-table").append("<tr>" + $("#productive-table tr:last").html() + "</tr>");
			var row = $("#productive-table tr:last");
			row.find("input:eq(0) input:eq(1)").val("");
			row.find("td:first span").text(parseInt(row.find("td:first span").text())+1);
			row.find("td:eq(1)").html("<input type='text' name='month' size='10'/>");
			row.find("td:last").append('&nbsp;<i class="glyphicon glyphicon-floppy-remove cancel-row-btn"></i>');
			editBtnEvent(row.find(".edit-row-btn"));
			row.find("input[name=month]").datepicker({
				dateFormat: "yy-mm-dd"
			});
			$(".cancel-row-btn").on("click", function(){
				$(this).parents("tr:first").remove();
			});
		});
	});
	
	function editBtnEvent(el){
		el.on("click", function(){
			$.ajax({
			  url: "updateProductivity",
			  type: "POST",
			  contentType : 'application/json; charset=utf-8',
			  dataType : 'json',
			  data: JSON.stringify({
					  id: $(this).parents("tr:first").find("input[name=id]").val(),
					  month: $(this).parents("tr:first").find("input[name=month]").val(),
					  status: $(this).parents("tr:first").find("select[name=status]").val(),
					  employees:JSON.stringify({
						  empId: $(this).parents("tr:first").find("input[name=empId]").val()
						  })
				  })
			}).always(function(data) {
				$.jGrowl(data.responseText);
			});
		});
	}
</script>
<table class="table table-hover" id="productive-table">
	<tr>
		<th>No.</th>
		<th>Month</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${emp.productivities}" var="productiv" varStatus="status">
		<tr>
			<td><span>${status.index+1}</span>
				<input type="hidden" name="id" value="${productiv.id}"/>
			</td>
			<td>
				<span><fmt:formatDate pattern="yyyy-MM" value="${productiv.month}" /></span>
				<input type="hidden" name="month" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${productiv.month}" />"/>
			</td>
			<td>
				<select name="status">
					<option value="P" ${productiv.status == 'P' ? 'selected="selected"':''}>P</option>
					<option value="NP" ${productiv.status == 'NP' ? 'selected="selected"':''}>NP</option>
					<option value="ML" ${productiv.status == 'ML' ? 'selected="selected"':''}>ML</option>
					<option value="RT" ${productiv.status == 'RT' ? 'selected="selected"':''}>RT</option>
				</select>
			</td>
			<td>
				<i class="glyphicon glyphicon-floppy-disk edit-row-btn"></i>
				<input type="hidden" name="empId" value="${productiv.employees.empId}"/>
			</td>
		</tr>
	</c:forEach>
</table>
<!-- <button type="button" class="btn btn-default" id="add-productive">Add</button> -->