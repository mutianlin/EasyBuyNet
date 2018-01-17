<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header" class="wrap">
	<div id="logo">
		<a href="index.jsp"><img src="images/logo.gif" />
		</a>
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
				<%
					System.out.print("username为");
							System.out.println(session.getAttribute("user"));
				%>
				<a href="#">${user.getAccount()}</a>
				<a href="servlet?type=logout">登出</a>
			</c:otherwise>
		</c:choose>

		<a href="guestbook.jsp">留言</a>
	</div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="">首页</a></li>
			<c:forEach items="${blist}" var="b" begin="0" end="6">
			<li class=""><a href="javascript:;" onclick="myonclink(this,${b.b_id});">${b.b_name}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
		<c:forEach items="${blist}" var="b">
			<c:forEach items="${slist}" var="s">
				<c:if test="${s.sb_id eq b.b_id}">
					<li class="displaynone" id="top${b.b_id}"><a href="#">${s.s_name}</a></li>
				</c:if>
			</c:forEach>
		</c:forEach>
			<!-- <li class="first"><a href="#">音乐</a>
			</li>
			<li class="last"><a href="#">Investor Relations</a>
			</li> -->
		</ul>
	</div>
</div>
<div id="position" class="wrap">
</div>