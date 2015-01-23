<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<form action="doLogin" method="post" class="form-inline">
	<table  class="table table-hover">
		<tr>
			<th>User name</th>
			<td> <input type="text" maxlength="50" name="username"/> </td>
		</tr>
		<tr>
			<th>Password</th>
			<td> <input type="password" maxlength="50" name="password"/> </td>
		</tr>
		<tr>
			<td colspan="2"> <button class="btn btn-default">Login</button> </td>
		</tr>
	</table>
</form>
</body>
</html>