<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<body>
	<%@ include file="common/head.jsp"%>

	<%-- <c:if test="${empty blist}">
		<%
			response.sendRedirect("servlet?type=indexClass");
		%>
	</c:if> --%>
	<c:if test="${empty glist}">
		<%
			response.sendRedirect("servlet?type=index");
		%>
	</c:if>


	<div id="main" class="wrap">
		<div class="lefter">
			<div class="box">
				<h2>商品分类</h2>
				<dl>
					<%@ include file="common/Navigation.jsp"%>
				</dl>
			</div>
			<div class="spacer"></div>
			<div class="last-view">
				<h2>最近浏览</h2>
				<dl class="clearfix">
					<dt>
						<img src="images/product/0_tiny.gif" />
					</dt>
					<dd>
						<a href="product-view.jsp">法国德菲丝松露精品巧克力500g/盒</a>
					</dd>
					<dt>
						<img src="images/product/0_tiny.gif" />
					</dt>
					<dd>
						<a href="product-view.jsp">法国德菲丝松露精品巧克力500g/盒</a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="main">
			<div class="price-off">
				<h2>今日特价</h2>
				<ul class="product clearfix">
					<c:forEach items="${glist}" var="g">
						<li>
							<dl>
								<dt>
									<a href="goodsServlet?type=goods&id=${g.g_id}"
										target="_blank"><img src="images/product/${g.g_id}.jpg" />
									</a>
								</dt>
								<dd class="title">
									<a href="goodsServlet?type=goods&id=${g.g_id}"
										target="_blank">${g.g_name }</a>
								</dd>
								<dd class="price">￥${g.g_price }</dd>
							</dl></li>
					</c:forEach>
				</ul>
			</div>
			<div class="side">
				<div class="news-list">
					<h4>最新公告</h4>
					<ul>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
					</ul>
				</div>
				<div class="spacer"></div>
				<div class="news-list">
					<h4>新闻动态</h4>
					<ul>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
						<li><a href="news-view.jsp" target="_blank">抢钱啦</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="spacer clear"></div>
			<div class="hot">
				<h2>热卖推荐</h2>
				<ul class="product clearfix">

					<c:forEach items="${Hglist}" var="g">
						<li>
							<dl>
								<dt>
									<a href="goodsServlet?type=goods&id=${g.g_id}"
										target="_blank"><img src="images/product/${g.g_id}.jpg" />
									</a>
								</dt>
								<dd class="title">
									<a href="goodsServlet?type=goods&id=${g.g_id}"
										target="_blank">${g.g_name }</a>
								</dd>
								<dd class="price">￥${g.g_price }</dd>
							</dl></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
