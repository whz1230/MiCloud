<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>小米帐号 - 登录</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path%>/scripts/jquery.js"></script>
<link rel="stylesheet" href="<%=path %>/styles/mi.css">
</head>
<body class=" zh_CN">
	<br/><br/><br/><br/><br/>
	<div class="lgnheader"><div class="header_tit t_c"><h4 class="header_tit_txt" id="login-title">小米帐号登录</h4></div></div>
	<div>
	<div class="login_area">
		<form action="<%=path%>/servlet/LoginServlet" id="login-main-form" method="post">
			<div class="loginbox c_b">
				<div class="lgn_inputbg c_b">
					<label id="region-code" class="labelbox login_user c_b"> 
						<input style="height: 50px;" class="item_account" type="text" name="username" id="username" placeholder="邮箱/手机号码/小米帐号">
					</label> 
					
					<label class="labelbox pwd_panel c_b"> 
						<input style="height: 50px;" type="password" placeholder="密码" name="password" id="pwd"> 
					</label>
				</div>
				<div class="btns_bg"><input class="btnadpt btn_orange" id="login-button" type="submit" value="立即登录"></div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>