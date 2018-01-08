<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function-manage.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
	<div class="help"><a href="index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="manage/index.jsp">首页</a></li>
			<li class="current"><a href="manage/user.jsp">用户</a></li>
			<li><a href="manage/product.jsp">商品</a></li>
			<li><a href="manage/order.jsp">订单</a></li>
			<li><a href="manage/guestbook.jsp">留言</a></li>
			<li><a href="manage/news.jsp">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员pillys您好，今天是2012-12-21，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<%@ include file="common/liftNavigation .jsp" %>
		</div>
	</div>
	<div class="main">
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>Email</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
					<c:forEach items="${userlist}" var="u">
						<tr>
							<td class="first w4 c">${u.id}</td>
							<td class="w1 c">${u.userName}</td>
							<td class="w2 c">${u.sex}</td>
							<td>${u.email}</td>
							<td class="w4 c">${u.phone}</td>
							<td class="w1 c">
								<a href="adminServlet?type=userUpdate&updateById=${u.id}">修改</a>
								<a href="javascript:Delete(user,${u.id});">删除</a>
							</td>
						</tr>
					</c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2010 All Rights Reserved. 
</div>
</body>
</html>
