<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>

<tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon" href="<c:url value="/pages/images/favicon.ico"></c:url>">

<!-- Style css -->
<link rel="stylesheet" type="text/css" href="<c:url value="/pages/css/bootstrap/bootstrap.css"></c:url>">
<link rel="stylesheet" type="text/css" href="<c:url value="/pages/css/customize.css"></c:url>">
<link rel="stylesheet" type="text/css" href="<c:url value="/pages/css/jquery/ui/jquery-ui.css"></c:url>">
<link rel="stylesheet" type="text/css" href="<c:url value="/pages/css/bootstrap/bootstrap-combobox.css"></c:url>">
<link rel="stylesheet" type="text/css" href="<c:url value="/pages/css/jquery/datatable/jquery.dataTables.css"></c:url>">

<!-- Script js -->
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/jquery/jquery.js" />"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/jquery/jquery.maskMoney.js"></c:url>"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/jquery/jquery-ui.js"></c:url>"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/jquery/jquery.blockUI.js" />"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/jquery/jquery.dataTables.min.js"></c:url>"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/bootstrap/bootstrap.min.js"></c:url>"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/bootstrap/bootstrap-combobox.js"></c:url>"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/pages/js/controller/common.js"></c:url>"></script>

<script type="text/javascript">
</script>
	
</head>
<body style="background: #0D5D97;">
	<tiles:insertAttribute name="body" />
</body>
</html>