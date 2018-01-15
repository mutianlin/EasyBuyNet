<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/function-manage.js"></script>
</head>
<body>
	<div id="header" class="wrap">
		<div id="logo">
			<img src="images/logo.gif" />
		</div>
		<div class="help">
			<a href="index.jsp">返回前台页面</a>
		</div>
		<div class="navbar">
			<ul class="clearfix">
				<li><a href="manage/index.jsp">首页</a></li>
				<li><a href="manage/user.jsp">用户</a></li>
				<li class="current"><a href="manage/product.jsp">商品</a></li>
				<li><a href="manage/order.jsp">订单</a></li>
				<li><a href="manage/guestbook.jsp">留言</a></li>
				<li><a href="manage/news.jsp">新闻</a></li>
			</ul>
		</div>
	</div>
	<div id="childNav">
		<div class="welcome wrap">管理员pillys您好，今天是2012-12-21，欢迎回到管理后台。</div>
	</div>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.html">易买网</a> &gt; 管理后台
	</div>
	<div id="main" class="wrap">
		<div id="menu-mng" class="lefter">
			<div class="box">
				<%@ include file="common/liftNavigation .jsp"%>
			</div>
		</div>
		<div class="main">
			<h2>分类管理</h2>
			<div class="manage">
				<table class="list">
					<tr>
						<th>ID</th>
						<th>分类名称</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${blist}" var="b">
						<tr style="background-color: #ffeeee">
							<td class="first w4 c">${b.b_id }</td>
							<td>${b.b_name }</td>
							<td class="w1 c"><a href="productClass-modify.jsp">修改</a> <a
								href="javascript:Delete('bClassD',${b.b_id });">删除</a></td>
						</tr>
						<c:forEach items="${slist}" var="s">
							<c:if test="${s.sb_id == b.b_id }">
								<tr  style="background-color: #fffefe">
									<td class="first w4 c">${s.s_id }</td>
									<td class="childClass">${s.s_name }</td>
									<td class="w1 c"><a href="productClass-modify.jsp">修改</a>
										<a href="javascript:Delete('sClassD',${s.s_id });">删除</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>