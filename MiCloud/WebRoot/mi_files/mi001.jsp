<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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

<div class="site-topbar">
	<div class="container">
		<div class="topbar-nav">
			<a>小米网</a><span class="sep">|</span>
			<a>MIUI</a><span class="sep">|</span>
			<a>米聊</a><span class="sep">|</span>
			<a>游戏</a><span class="sep">|</span>
			<a>多看阅读</a><span class="sep">|</span>
			<a>云服务</a><span class="sep">|</span>
			<a>小米网移动版</a><span class="sep">|</span>
			<a>问题反馈</a><span class="sep">|</span>
			<a>Select Region</a>
		</div>
		<div class="topbar-cart" id="J_miniCartTrigger">
			<a class="cart-mini" id="J_miniCartBtn" ><i class="iconfont"></i>购物车<span class="cart-mini-num J_cartNum">（0）</span></a>
		</div>
		<div class="topbar-info" id="J_userInfo">
			<a class="link">登录</a><span class="sep">|</span>
			<a class="link">注册</a>
		</div>
	</div>
</div>

<div class="site-header">

<div class="container">
<div class="header-logo">
<a class="logo ir" title="小米官网" >小米官网</a>
<div class="doodle doodle-20160429" style="display: block;">
<a class="link-block">预约小米Max</a></div>
</div>
<div class="header-nav">
<ul class="nav-list J_navMainList clearfix">
	<li id="J_navCategory" class="nav-category"><a class="link-category" href="http://list.mi.com/" data-stat-id="d7d79a744cdeefa8"
		onclick="_msq.push([&#39;trackEvent&#39;, &#39;79fe2eae924d2a2e-d7d79a744cdeefa8&#39;, &#39;//list.mi.com&#39;, &#39;pcpid&#39;]);"><span class="text">全部商品分类</span></a>
	<div class="site-category">
	</div>
	</li>
	<li class="nav-item">
	<a class="link" href="javascript:void(0);"><span class="text">小米手机</span><span class="arrow"></span></a>
	</li>
	<li class="nav-item">
	<a class="link" href="javascript:void(0);"><span class="text">红米手机</span><span class="arrow"></span></a>
	</li>
</ul>
</div>

<div class="header-search">
    <form id="J_searchForm" class="search-form clearfix" method="get">
 		<label for="search" class="hide">站内搜索</label>
        <input class="search-text" type="search" id="search" name="keyword"  >
        <input type="submit" class="search-btn iconfont" value="">
     </form>
</div>
</div>
</div>


<div class="page-main home-main">
<div class="container">

<div id="comment" class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
<div class="box-hd">
<h2 class="title">图片</h2>
<div class="more J_brickNav"><a class="more-link" target="_blank" >查看全部<i class="iconfont"></i></a></div>
</div>
<div class="box-bd J_brickBd">
<ul class="review-list clearfix">
	<li class="review-item "><img src="Img408291701.jpg" width="100%" height="88%" alt="小米自拍杆">
	<p class="author" align="center">来自于 taurus1992 的评价 <span class="date"></span></p>
	<div class="info" align="center">
	<h3 class="title"><a>小米自拍杆</a></h3>
	<span class="sep">|</span>
	<p class="price"><span class="num">49</span>元</p>
	</div>
	</li>

	<li class="review-item "><img src="A84302CK5RII0031.jpg" width="100%" height="88%">
	<p class="author">来自于 taurus1992 的评价 <span class="date"></span></p>
	<div class="info">
	<h3 class="title"><a>小米自拍杆</a></h3>
	<span class="sep">|</span>
	<p class="price"><span class="num">49</span>元</p>
	</div>
	</li>

	<li class="review-item"><img src="547c2b2b8447f20003.jpg" width="100%" height="88%">
	<p class="author">来自于 taurus1992 的评价 <span class="date"></span></p>
	<div class="info">
	<h3 class="title"><a>小米自拍杆</a></h3>
	<span class="sep">|</span>
	<p class="price"><span class="num">49</span>元</p>
	</div>
	</li>

	<li class="review-item"><img src="15270055.jpg" width="100%" height="88%">
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
<h2 class="title">内容</h2>
<div class="more J_brickNav"><a class="more-link" target="_blank" >查看全部<i class="iconfont"></i></a></div>
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
<div class="more J_brickNav"><a class="more-link" target="_blank" >查看全部<i class="iconfont"></i></a></div>
</div>
<div class="box-bd J_brickBd">
<ul class="video-list clearfix">
	<li class="video-item">
	<div class="figure figure-img">
	<a class="J_videoTrigger">
		<img src="T1k9CgB7Av1RXrhCrK.jpg" width="296" height="180"> <span class="play"><i class="iconfont"></i></span>
	</a>
	</div>
	<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
	<p class="desc">小米Max沈腾爆笑预告全集</p>
	</li>
	
	<li class="video-item">
	<div class="figure figure-img">
	<a class="J_videoTrigger">
		<img src="T1k9CgB7Av1RXrhCrK.jpg" width="296" height="180"> <span class="play"><i class="iconfont"></i></span>
	</a>
	</div>
	<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
	<p class="desc">小米Max沈腾爆笑预告全集</p>
	</li>
	
	<li class="video-item">
	<div class="figure figure-img">
	<a class="J_videoTrigger">
		<img src="T1k9CgB7Av1RXrhCrK.jpg" width="296" height="180"> <span class="play"><i class="iconfont"></i></span>
	</a>
	</div>
	<h3 class="title"><a class="J_videoTrigger">笑喷了，沈腾爆笑出演，6集联播</a></h3>
	<p class="desc">小米Max沈腾爆笑预告全集</p>
	</li>
	
	<li class="video-item">
	<div class="figure figure-img">
	<a class="J_videoTrigger">
		<img src="T1k9CgB7Av1RXrhCrK.jpg" width="296" height="180"> <span class="play"><i class="iconfont"></i></span>
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



</body>
</html>
