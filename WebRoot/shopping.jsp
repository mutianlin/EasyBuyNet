﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<body>
	<%@ include file="common/head.jsp"%>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">易买网</a> &gt; 购物车
	</div>
	<div class="wrap">
		<div id="shopping">
			<form action="shopping-result.jsp">
				<table>
					<tr>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>购买数量</th>
						<th>操作</th>
					</tr>
					<tr id="product_id_1">
						<td class="thumb"><img src="images/product/0_tiny.gif" /><a
							href="product-view.jsp">铁三角 Audio-Technica ATH-EQ300M-SV 银色
								挂耳式耳机</a>
						</td>
						<td class="price" id="price_id_1"><span>￥99.00</span> <input
							type="hidden" value="99" /></td>
						<td class="number">
							<dl>
								<dt>
									<input id="number_id_1" type="text" name="number" value="1" />
								</dt>
								<dd onclick="reloadPrice(1,true);">修改</dd>
							</dl></td>
						<td class="delete"><a href="javascript:delShopping(1);">删除</a>
						</td>
					</tr>
				</table>
				<div class="button">
					<input type="submit" value="" />
				</div>
			</form>
		</div>
		<script type="text/javascript">
			document.write("Cookie中记录的购物车商品ID：" + getCookie("product")
					+ "，可以在动态页面中进行读取");
		</script>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
