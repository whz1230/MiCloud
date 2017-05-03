<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path%>/styles/base.min.css">
<link rel="stylesheet" href="<%=path%>/styles/index.min.css">
<script src="<%=path%>/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//显示用户
	$("#more-img").click(function(){
		$(this).attr("href","<%=path%>/servlet/ImageServlet");
	});
	//more-video
	$("#more-video").click(function(){
		$(this).attr("href","<%=path%>/servlet/VideoServlet");
	});
	//more-book
	$("#more-book").click(function(){
		$(this).attr("href","<%=path%>/servlet/BookServlet");
	});
});

</script>
<style type="text/css">
      .dc { 
      		margin-left: 10px;
      	  }
	</style>
</head>

<body onload="">
	<ul style="width: 200px;">
    	<li>
    		<a href="#" onclick="test(children[0])">分类管理
    			<div class="dc">
	    			<a href="${pageContext.request.contextPath }/manager/addcategory.jsp"  target="right">添加分类</a><br/>
	    			<a href="${pageContext.request.contextPath }/manager/CategoryServlet?method=getAll"  target="right">查看分类</a><br/>
	    		</div>
    		</a>
    	</li>
    	
    	<br/><br/>
    	
    	<li>
    		<a href="#" onclick="test(children[0])">图书管理
    			<div class="dc">
	    				<a href="${pageContext.request.contextPath }/manager/BookServlet?method=forAddUI"  target="right">添加图书</a><br/>
	    				<a href="${pageContext.request.contextPath }/manager/BookServlet?method=list"  target="right">查看图书</a>
	    		</div>
    		</a>
    	</li>
    	
    	<br/><br/>
    	
    	<li>
    		<a href="#" onclick="test(children[0])">订单管理
	    		<div class="dc">
	    			<a href="${pageContext.request.contextPath }/manager/OrderServlet?method=getAll&state=false"  target="right">待处理订单</a><br/>
	    			<a href="${pageContext.request.contextPath }/manager/OrderServlet?method=getAll&state=true"  target="right">已发货订单</a><br/>
	    		</div>
    		</a>
    	</li>
    	
    	<br/><br/>
    	
    </ul>
	<br>
</body>
</html>
