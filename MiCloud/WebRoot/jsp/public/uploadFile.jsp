<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>上传图片</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path%>/scripts/jquery.js"></script>
<link rel="stylesheet" href="<%=path %>/styles/mi.css">
<script type="text/javascript">
$(document).ready(function(){
	//显示用户
	$("#login-button").click(function(){
		$("#login-main-form").submit();
	});
});

</script>
</head>
<body class=" zh_CN">
	<div class="lgnheader"><div class="header_tit t_c"><h4 class="header_tit_txt" id="login-title">上传图片</h4></div></div><br/>
	<div>
	<div class="login_area">
		<form action="<%=path%>/servlet/ImageServlet" enctype="multipart/form-data" id="login-main-form" method="post">
			<div class="loginbox c_b">
				<div class="lgn_inputbg c_b">
					<label id="region-code" class="labelbox login_user c_b"> 
						<input style="height:45px;width: 100%;" class="item_account" type="file" name="image" id="image" placeholder="上传图片">
					</label> 
					
					<label class="labelbox pwd_panel c_b"> 
						<input style="height:45px;" type="text" placeholder="图片说明" name="description" id="pwd"> 
					</label>
				</div>
				<div class="btns_bg"><input class="btnadpt btn_orange" id="login-button" type="button" value="上传"></div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>