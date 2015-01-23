<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon"
	href="<c:url value="/images/favicon.ico"></c:url>">

<!-- Style css -->
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.structure.min.css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.theme.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css.map">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/jquery.jgrowl.min.css">

<!-- Script js -->
<script type="text/javascript" charset="utf8" src="./javascript/lib/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="./javascript/lib/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf8" src="./javascript/lib/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="./javascript/lib/jquery.jgrowl.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});

	function openDialog(el) {
		$(el).dialog({
			modal : true,
			width : 1300,
			height : 250,
			resizable : false
		});
	}

	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value.trim() || '');
			} else {
				o[this.name] = this.value.trim() || '';
			}
		});
		return o;
	};
	
	function validateRequired(form){
		var invalid = false;
		$(form).find(".required-field").each(function(){
			if($(this).val() == ""){
				$.jGrowl("Please fill up all required fields!", { header: 'Error' });
				$(this).css("border","1px solid red");
				invalid = true;
			}else{
				$(this).css("border","");
			}
		});
		
		return invalid;
	}
</script>
</head>
<div class="header">
	<tiles:insertAttribute name="header" ignore="true" />
</div>
<div class="body">
	<tiles:insertAttribute name="body" />
</div>
<div class="footer">
	<tiles:insertAttribute name="footer" ignore="true" />
</div>
</html>