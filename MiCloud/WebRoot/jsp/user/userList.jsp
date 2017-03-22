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
<title>用户列表</title>
<style type="text/css">
table.hovertable {
	font-family: consolas, arial, sans-serif;
	font-size: 14px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table.hovertable th {
	background-color: #F8F8FF;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.hovertable tr {
	background-color: FFFFFF;
}

table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
#pagebar {
	text-align:center;
	font-family: consolas, arial, sans-serif;
	font-size: 16px;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var otrs = document.getElementsByTagName('tr');
		for ( var i = 0; i < otrs.length; i++) {
			(function(obj) {
				obj.onmouseover = function() {
					obj.style.backgroundColor = '#F5F5F5 ';
				};
				obj.onmouseout = function() {
					obj.style.backgroundColor = 'FFFFFF';
				};
			})(otrs[i]);
		}
	};
</script>

<script type="text/javascript">
function gotopage(currentPage){  	
	var pageSize = document.getElementById("pageSize").value;
	window.location.href = "<%=path%>/servlet/UserServlet?currentPage=" + currentPage + "&pageSize=" + pageSize;
}
</script>
</head>
<body>
	<form action="">
		<table class="hovertable" style="width: 90%;margin: 0 auto;">
			<tr>
				<th width="5%;">序号</th>
				<th>用户名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>邮箱</th>
				<th>地址</th>
			</tr>
			<c:forEach items="${pagebean.list}" var="u" varStatus="i">
				<tr style="text-align: center;">
					<td>${i.index+1 }</td>
					<td>${u.username }</td>
					<td>${u.age }</td>
					<td>${u.sex }</td>
					<td>${u.email }</td>
					<td>${u.address }</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<div id="pagebar">
			共[${pagebean.totalRecord }]条记录, 
			每页<input type="text" id="pageSize" value="${pagebean.pageSize }" onchange="gotopage(${pagebean.currentPage })" style="width: 30px" maxlength="3">条, 
			共[${pagebean.totalPage }]页, 当前[${pagebean.currentPage }]页 &nbsp;&nbsp;&nbsp; 
			<a href="javascript:void(0)" onclick="gotopage(${pagebean.previousPage })">上一页</a>
			<c:forEach var="pagenum" items="${pagebean.pageBar}">
				<c:if test="${pagenum == pagebean.currentPage}">
					<font color="red">${pagenum }</font>
				</c:if>

				<c:if test="${pagenum != pagebean.currentPage}">
					<a href="javascript:void(0)" onclick="gotopage(${pagenum })">${pagenum }</a>
				</c:if>
			</c:forEach>
			<a href="javascript:void(0)" onclick="gotopage(${pagebean.nextPage })">下一页</a> 
			去第<input type="text" id="pagenum" style="width: 30px">页 
			<input type="button" value=" GO " onclick="gotopage(document.getElementById('pagenum').value)">
		</div>
	</form>

</body>
</html>
