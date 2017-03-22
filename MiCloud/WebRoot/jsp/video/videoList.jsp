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
<title>视频列表</title>
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<script src="<%=path%>/scripts/jquery.js"></script>
<style type="text/css">
#pagebar {
	text-align:center;
	font-family: consolas, arial, sans-serif;
	font-size: 16px;
}
</style>
<script type="text/javascript">
function gotopage(currentPage){  	
	var pageSize = document.getElementById("pageSize").value;
	window.location.href = "<%=path%>/servlet/VideoServlet?currentPage=" + currentPage + "&pageSize=" + pageSize;
}	

function play(id){
	$.ajax({
		type:"post",//请求方式
		url:"<%=path%>/servlet/PlayServlet",//发送请求地址
		data:{//发送给数据库的数据
			"id":id,
		},
		//请求成功后的回调函数有两个参数
		success:function(data,textStatus){
			//alert(data);
		}
	});
}
</script>
</head>
<body>
	<div class="page-main home-main">
		<div class="container">
			<div id="video" class="home-video-box xm-plain-box J_itemBox J_videoBox is-visible">
				<div class="box-hd"><h2 class="title">视频</h2></div>
				<ul class="video-list clearfix">
						<c:forEach items="${pagebean.list }" var="v" varStatus="i">
							<li class="video-item">
								<div class="figure figure-img">
									<video src="<%=path%>/${v.relativePath}" width="300" height="169" controls="controls"></video>
								</div>
								<h3 class="title"><a class="J_videoTrigger">${v.name}</a></h3>
								<p class="desc">${v.name}</p>
							</li>
						</c:forEach>
					</ul>
			</div>
		</div>
		<p>&nbsp;</p>
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
		<p>&nbsp;</p>
	</div>
</body>
</html>
