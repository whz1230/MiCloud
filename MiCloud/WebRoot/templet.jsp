<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>模版</title>
<script src="<%=path%>/scripts/jquery.js"></script>
<link rel="stylesheet" href="<%=path %>/styles/base.min.css">
<link rel="stylesheet" href="<%=path %>/styles/index.min.css">
<link rel="stylesheet" href="<%=path %>/styles/mi.css">
</head>

<body>
	模版
	<br>
</body>
</html>
