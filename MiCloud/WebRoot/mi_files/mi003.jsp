<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小米网</title>
<style type="text/css">
table.hovertable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table.hovertable th {
	background-color: #c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.hovertable tr {
	background-color: #d4e3e5;
}

table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var otrs = document.getElementsByTagName('tr');
		for ( var i = 0; i < otrs.length; i++) {
			(function(obj) {
				obj.onmouseover = function() {
					obj.style.backgroundColor = '#ffff66';
				};
				obj.onmouseout = function() {
					obj.style.backgroundColor = '#d4e3e5';
				};
			})(otrs[i]);
		}
	};
</script>
</head>
<body>
	<form action="">
		<table class="hovertable" style="width: 100%;">
			<tr>
				<th>Info Header 1</th>
				<th>Info Header 2</th>
				<th>Info Header 3</th>
			</tr>
			<c:forEach begin="1" end="20">
				<tr>
					<td>Item 1A</td>
					<td>Item 1B</td>
					<td>Item 1C</td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>
