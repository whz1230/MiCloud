<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>模版</title>
<script src="<%=path%>/scripts/jquery.js"></script>
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<link rel="stylesheet" href="<%=path%>/styles/mi.css">
<style>
body {
	font-family: Verdana;
}
.container {
	margin-left:auto;
	margin-right:auto;
	width:1140px;
}
div.img {
	margin-left: 18px;
	margin-bottom: 14px;
	height: auto;
	width: auto;
	float: left;
	text-align: center;
	border-top: 1px solid #ffac13;
}

div.img img {
	display: inline;
	margin: 3px;
}
div.img img:hover {
	z-index: 2;
	-webkit-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
	-webkit-transform: translate3d(0, -2px, 0);
	transform: translate3d(0, -2px, 0);
}

div.img a:hover img {
}

div.desc {
	text-align: center;
	font-weight: normal;
	width: 190px;
	font-size: 14px;
	margin: 10px 5px 10px 5px;
}
</style>
</head>
<body>
	<div class="container">
	<c:forEach items="${list }" var="vo" varStatus="i">
	<div class="img">
		<a target="_blank" href="/i/tulip_ballade.jpg"> 
			<audio  src="<%=path %>/file/fileData.do?id=${vo.id}" controls="controls">
			</audio>
		</a>
		<div class="desc">${vo.description }</div>
	</div>
	</c:forEach>
	</div>
</body>
</html>
