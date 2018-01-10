<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<body>
	<%@ include file="common/head.jsp"%>
	<div id="main" class="wrap">
		<div class="lefter">
			<div class="box">
				<h2>商品分类</h2>
				<dl>
					<%@ include file="common/Navigation.jsp"%>
				</dl>
			</div>
		</div>
		<div id="product" class="main">
			<h1>${goods.g_name}</h1>
			<div class="infos">
				<div class="thumb">
					<img src="${goods.g_bpic}" width="300px" height="300px"/>
				</div>
				<div class="buy">
					<p>
						商城价：<span class="price">￥${goods.g_price }</span>
					</p>
					<p>库 存：${goods.g_count }</p>
					<p>库 存：有货</p>
					<p>库 存：有货</p>
					<p>库 存：有货</p>
					<div class="button">
						<input type="button" name="button" value="" onclick="goBuy(${goods.g_id})" /><a
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
