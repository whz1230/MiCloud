<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
	File file = new File("C:\\Tomcat6\\webapps\\MI\\mi_files");
	List<String> list = new LinkedList<String>();
	File[] files = file.listFiles();
	for(int i = 0; i < files.length; i++){
		File f = files[i];
		if(f.getName().endsWith(".jpg")){
			list.add(f.getName());
		}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" xml:lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>小米官网——小米手机、红米手机、小米电视官方正品专卖网站</title>
<meta name="viewport" content="width=1226">
<link rel="stylesheet" href="base.min.css">
<link rel="stylesheet" href="index.min.css">
</head>
<body>
<div class="page-main home-main">
<div class="container">

<div id="comment" class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
<div class="box-hd">
<h2 class="title">图片</h2>
<div class="more J_brickNav"><a class="more-link" target="_blank" >查看全部<i class="iconfont"></i></a></div>
</div>
<div class="box-bd J_brickBd">
<ul class="review-list clearfix">
	<c:forEach begin="1" end="10" items="<%=list %>" var="s">
	<li class="review-item "><img src="${s}" width="100%" height="88%" alt="小米自拍杆">
	<p class="author" align="center">来自于 taurus1992 的评价 <span class="date"></span></p>
	<div class="info" align="center">
	<h3 class="title"><a>小米自拍杆</a></h3>
	<span class="sep">|</span>
	<p class="price"><span class="num">49</span>元</p>
	</div>
	</li>

	</c:forEach>
</ul>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("img").click(function(){
		alert(this.width);
	});
});
</script>
</html>
