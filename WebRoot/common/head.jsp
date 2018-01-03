<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header" class="wrap">
	<div id="logo">
		<a href="index.jsp"><img src="images/logo.gif" /></a>
	</div>
	<div class="help">
		<c:choose>
			<c:when test="${empty user }">
			<a href="login.jsp" class="shopping">购物车</a>
				<a href="login.jsp">登录</a>
				<a href="register.jsp">注册</a>
			</c:when>
			<c:otherwise>
			<a href="goodsServlet?type=buycar" class="shopping">购物车</a>
			<%System.out.print("username为");
			System.out.println(session.getAttribute("user")); %>
				<a href="#">${user.getAccount()}</a>
				<a href="servlet?type=logout">登出</a>
			</c:otherwise>
		</c:choose>

		<a href="guestbook.jsp">留言</a>
	</div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="#">首页</a></li>
			<li><a href="#">图书</a></li>
			<li><a href="#">百货</a></li>
			<li><a href="#">品牌</a></li>
			<li><a href="#">促销</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first"><a href="#">音乐</a></li>
			<li><a href="#">影视</a></li>
			<li><a href="#">少儿</a></li>
			<li><a href="#">动漫</a></li>
			<li><a href="#">小说</a></li>
			<li><a href="#">外语</a></li>
			<li><a href="#">数码相机</a></li>
			<li><a href="#">笔记本</a></li>
			<li><a href="#">羽绒服</a></li>
			<li><a href="#">秋冬靴</a></li>
			<li><a href="#">运动鞋</a></li>
			<li><a href="#">美容护肤</a></li>
			<li><a href="#">家纺用品</a></li>
			<li><a href="#">婴幼奶粉</a></li>
			<li><a href="#">饰品</a></li>
			<li class="last"><a href="#">Investor Relations</a></li>
		</ul>
	</div>
</div>