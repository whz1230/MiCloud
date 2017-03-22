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
</script>
</head>

<body onload="">
	<div class="page-main home-main">
		<div class="container">
			<div id="comment" class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
				<div class="box-hd"><h2 class="title">图片</h2>
					<div class="more J_brickNav"><a href="javascript:void(0);" id="more-img" class="more-link" target="_blank">查看全部<i class="iconfont"></i></a></div>
				</div>
				<div class="box-bd J_brickBd">
					<ul class="review-list clearfix">
						<li class="review-item ">
							<img src="<%=path %>/upload/image/1997f448793541978a60a592ba8dcaa01.png" width="100%" height="88%" alt="小米自拍杆">
							<p class="author" align="center">来自于 taurus1992 的评价 <span class="date"></span></p>
							<div class="info" align="center">
								<h3 class="title"><a>小米自拍杆</a></h3>
								<span class="sep">|</span>
								<p class="price"><span class="num">49</span>元</p>
							</div>
						</li>

						<li class="review-item ">
							<img src="<%=path %>/upload/image/1997f448793541978a60a592ba8dcaa01.png" width="100%" height="88%">
							<p class="author">来自于 taurus1992 的评价 <span class="date"></span></p>
							<div class="info">
								<h3 class="title"><a>小米自拍杆</a></h3>
								<span class="sep">|</span>
								<p class="price"><span class="num">49</span>元</p>
							</div></li>

						<li class="review-item">
							<img src="<%=path %>/upload/image/1997f448793541978a60a592ba8dcaa01.png" width="100%" height="88%">
							<p class="author">来自于 taurus1992 的评价 <span class="date"></span></p>
							<div class="info">
								<h3 class="title"><a>小米自拍杆</a></h3>
								<span class="sep">|</span>
								<p class="price"><span class="num">49</span>元</p>
							</div>
						</li>

						<li class="review-item">
							<img src="<%=path %>/upload/image/1997f448793541978a60a592ba8dcaa01.png" width="100%" height="88%">
							<p class="author">来自于 taurus1992 的评价 <span class="date"></span></p>
							<div class="info">
								<h3 class="title"><a>小米自拍杆</a></h3>
								<span class="sep">|</span>
								<p class="price"><span class="num">49</span>元</p>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div id="content" class="home-content-box xm-plain-box J_itemBox J_contentBox is-visible">
				<div class="box-hd">
					<h2 class="title">小说</h2>
					<div class="more J_brickNav"><a id="more-book" href="javascript:void(0);" class="more-link" target="_blank">查看全部<i class="iconfont"></i></a></div>
				</div>
				<div class="box-bd J_brickBd">
					<ul class="content-list clearfix">
						<li class="content-item content-item-book">
							<img class="" src="20120524153027349.jpg" width="100%" height="100%">
						</li>
						<li class="content-item content-item-theme">
							<img class="" src="f2695e85bc2a6b4f25995f443e608a9e.jpg" width="100%" height="100%">
						</li>
						<li class="content-item content-item-game">
							<img class="" src="0U35C5Y-1.jpg" width="100%" height="100%">
						</li>

						<li class="content-item content-item-app">
							<img class="" src="Img444587292.jpg" width="100%" height="100%">
						</li>
					</ul>
				</div>
			</div>

			<div id="video" class="home-video-box xm-plain-box J_itemBox J_videoBox is-visible">
				<div class="box-hd">
					<h2 class="title">视频</h2>
					<div class="more J_brickNav"><a href="javascript:void(0);" class="more-link" target="_blank" id="more-video">查看全部<i class="iconfont"></i></a></div>
				</div>
				<div class="box-bd J_brickBd">
					<ul class="video-list clearfix">
						<li class="video-item">
							<div class="figure figure-img">
								<a href="javascript:void(0);" id="" name="#" class="J_channel-video"> 
									<img src="<%=path%>/jsp/video/video_files/cms_14800668624625_HOUlf.jpg" width="606" height="360" alt="漂亮的米兔故事机，能讲故事还能微信互动" /> 
									<span class="play" onclick="play('${img.id}');"><i class="iconfont">&#xe601;</i></span> 
								</a>
							</div>
							<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
							<p class="desc">小米Max沈腾爆笑预告全集</p>
						</li>

						<li class="video-item">
							<div class="figure figure-img">
								<a href="javascript:void(0);" id="" name="#" class="J_channel-video"> 
									<img src="<%=path%>/jsp/video/video_files/cms_14800668624625_HOUlf.jpg" width="606" height="360" alt="漂亮的米兔故事机，能讲故事还能微信互动" /> 
									<span class="play" onclick="play('${img.id}');"><i class="iconfont">&#xe601;</i></span> 
								</a>
							</div>
							<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
							<p class="desc">小米Max沈腾爆笑预告全集</p>
						</li>
						
						<li class="video-item">
							<div class="figure figure-img">
								<a href="javascript:void(0);" id="" name="#" class="J_channel-video"> 
									<img src="<%=path%>/jsp/video/video_files/cms_14800668624625_HOUlf.jpg" width="606" height="360" alt="漂亮的米兔故事机，能讲故事还能微信互动" /> 
									<span class="play" onclick="play('${img.id}');"><i class="iconfont">&#xe601;</i></span> 
								</a>
							</div>
							<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
							<p class="desc">小米Max沈腾爆笑预告全集</p>
						</li>
						
						<li class="video-item">
							<div class="figure figure-img">
								<a href="javascript:void(0);" id="" name="#" class="J_channel-video"> 
									<img src="<%=path%>/jsp/video/video_files/cms_14800668624625_HOUlf.jpg" width="606" height="360" alt="漂亮的米兔故事机，能讲故事还能微信互动" /> 
									<span class="play" onclick="play('${img.id}');"><i class="iconfont">&#xe601;</i></span> 
								</a>
							</div>
							<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
							<p class="desc">小米Max沈腾爆笑预告全集</p>
						</li>
						
					</ul>
					
				</div>
			</div>

		</div>
	</div>
	<br>
</body>
</html>
