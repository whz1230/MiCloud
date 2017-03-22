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
<title>显示树</title>
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<script src="<%=path%>/scripts/jquery.js"></script>
<script src="<%=path%>/jsp/tree/js/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/jsp/tree/css/xtree.css">
<script type="text/javascript">
<c:forEach var="category" items="${list }">
<c:if test="${category.depth==1}">
	var tree = new WebFXTree('${category.name}');
	tree.action = "<%=path%>/tree/queryById.do?id=${category.id}";
	tree.target = "right";
</c:if>

<c:if test="${category.depth==2}">
	var node${category.depth} = new WebFXTreeItem('${category.name}');
	tree.add(node${category.depth});
	node${category.depth}.action = "<%=path%>/tree/queryById.do?id=${category.id}";
	node${category.depth}.target = "right";
</c:if>

<c:if test="${category.depth>2}">
	var node${category.depth} = new WebFXTreeItem('${category.name}');  //node3
	node${category.depth-1}.add(node${category.depth});
	node${category.depth}.action = "<%=path%>/tree/queryById.do?id=${category.id}";
	node${category.depth}.target = "right";
</c:if>
</c:forEach>
document.write(tree);
</script>
</head>
<body>
</body>
</html>
