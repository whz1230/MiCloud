<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>小米官网</title>
</head>

<frameset rows="150,*,30" frameborder="no" border="0" framespacing="0">
	<frame src="jsp/public/top.jsp" name="top" noresize="noresize" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" />
	<frameset cols="200px,*">
		<frame src="jsp/public/left.jsp" name="left" noresize="noresize" frameborder="0" marginwidth="0" marginheight="0" scrolling="no">
		<frame src="jsp/public/main.jsp" name="right" noresize="noresize" frameborder="0" marginwidth="0" marginheight="0" scrolling="auto" />
	</frameset>
	
	<frame src="jsp/public/foot.jsp" name="foot" noresize="noresize" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" />
</frameset>
</html>
