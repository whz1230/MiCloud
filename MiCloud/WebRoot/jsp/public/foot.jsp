<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<title>foot</title>
</head>

<body>
		<div align="center">探索黑科技，小米为发烧而生</div>
</body>
</html>
