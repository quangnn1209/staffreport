<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {
		reloadEmployeeList();
		
		$("#add-employee").on("click", function(){
			$.ajax({
			  url: "getEmployeeById"
			}).done(function(html) {
				openDialog("<div>"+html+"</div>");
			});
		});
		
		$("#search-employee").on("click", function(){
			reloadEmployeeList();
		});
	});
	
	function reloadEmployeeList(){
		getListObject("getEmployees", $("#search-employee-form"), $("#employee-list"));
	}
</script>
<form class="navbar-form navbar-left" role="search" id="search-employee-form">
  <div class="form-group">
    <input type="text" class="form-control" placeholder="Type employee name to search" size="35" name="empFullName">
  </div>
  <button type="button" class="btn btn-default" id="search-employee">Search</button>
</form>
<div id="employee-list">
</div>
<button class="btn btn-default" type="button" id="add-employee">Add</button>