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
<title>图片列表</title>
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
	window.location.href = "<%=path%>/servlet/ImageServlet?currentPage=" + currentPage + "&pageSize=" + pageSize;
}	

function viewImage(id){
	window.location.href = "<%=path%>/file/view.do?id=" + id;
}
</script>
</head>
<body>
	<div class="page-main home-main">
		<div class="container">
			<div id="comment" class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
				<div class="box-hd"><h2 class="title">图片</h2></div>
				<div class="box-bd J_brickBd">
					<ul class="review-list clearfix">
					<c:forEach items="${list }" var="file" varStatus="i">
					
						<li class="review-item ">
							<img src="<%=path %>/file/fileDate.do?id=${file.id}" width="100%" height="98%" alt="" onclick="viewImage('${file.id}');">
							<div class="info" align="center">
								<h3 class="title"><a>${file.name}</a></h3>
								<span class="sep">|</span>
								<p class="price"><span class="num">${file.uploadTime}</span>元</p>
							</div>
						</li>
					<c:if test="${i.count%4 == 0}">
	  					<div style="clear: both;"></div>
	  					<br/>
	  				</c:if>	
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
