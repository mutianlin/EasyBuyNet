<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<body>
	<%@ include file="head.jsp"%>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">易买网</a> &gt; <a href="product-list.jsp">图书音像</a>
		&gt; 图书
	</div>
	<div id="main" class="wrap">
		<div class="lefter">
			<div class="box">
				<h2>商品分类</h2>
				<dl>
					<%@ include file="Navigation.jsp"%>
				</dl>
			</div>
		</div>
		<div id="product" class="main">
			<h1>铁三角 Audio-Technica ATH-EQ300M-SV 银色 挂耳式耳机</h1>
			<div class="infos">
				<div class="thumb">
					<img src="images/product/0.jpg" />
				</div>
				<div class="buy">
					<p>
						商城价：<span class="price">￥99.00</span>
					</p>
					<p>库 存：有货</p>
					<p>库 存：有货</p>
					<p>库 存：有货</p>
					<p>库 存：有货</p>
					<div class="button">
						<input type="button" name="button" value="" onclick="goBuy(1)" /><a
							href="#">放入购物车</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="introduce">
				<h2>
					<strong>商品详情</strong>
				</h2>
				<div class="text">
					sdf<br /> sdf<br />
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
