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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<title>top</title>
<script src="<%=path%>/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//显示用户
		$("#bt4").click(function(){
			$(this).attr('href','<%=path%>/servlet/UserServlet');
		});
		//上传文件
		$("#bt5").click(function(){
			var args = ["","",1,"",window];  
			var url = "<%=path%>/jsp/public/uploadFile.jsp";
			window.showModalDialog(url,args,"dialogHeight:400px;dialogWidth:600px;center:yes;help:no;resizable:no;scroll:no;status:no;");
		});
	});

</script>


</head>

<body>

	<div class="site-header">
		<div class="container">
			<div class="header-logo">
				<img id="logo" alt="小米官网" src="<%=path%>/images/logo.jpg" style="width: 55px;height: 55px;">
				<div class="doodle doodle-20160429" style="display: block;">
					<a class="link-block">预约小米Max</a>
				</div>
			</div>
			<div class="header-nav" style="border: 1px solid red;">
				<ul class="nav-list J_navMainList clearfix">
					<li id="J_navCategory" class="nav-category">
						<a class="link-category" href="javascript:void(0);"  onclick=""><span class="text">全部商品分类</span></a>
						<div class="site-category"></div>
					</li>
					<li class="nav-item"><a id="bt1" class="link" href="javascript:void(0);" target="main"><span class="text">图片</span><span class="arrow"></span></a></li>
					<li class="nav-item"><a id="bt2" class="link" href="javascript:void(0);" target="main"><span class="text">小说</span><span class="arrow"></span></a></li>
					<li class="nav-item"><a id="bt3" class="link" href="javascript:void(0);" target="main"><span class="text">视频</span><span class="arrow"></span></a></li>
					<li class="nav-item"><a id="bt4" class="link" href="javascript:void(0);" target="main"><span class="text">用户</span><span class="arrow"></span></a></li>
					<li class="nav-item"><a id="bt5" class="link" href="javascript:void(0);" target="main"><span class="text">上传图片</span><span class="arrow"></span></a></li>
				</ul>
			</div>

		</div>
	</div>
</body>
</html>
