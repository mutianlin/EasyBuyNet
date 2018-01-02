<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
					<c:forEach items="${blist}" var="b">
					<tr id="product_id_${b.c_id}">
						<td class="thumb">
						<img src="images/product/${b.c_name}.jpg" width="54px" height="54px" />
						<a href="goodsServlet?type=goods&name=${b.c_name}">${b.c_name}</a>
						</td>
						<td class="price" id="price_id_${b.c_id}"><span>￥${b.c_money}</span>
						<input type="hidden" value="${b.c_price}" /></td>
						<td class="number">
							<dl>
								<dt>
									<input id="number_id_${b.c_id}" type="text" name="number" value="${b.c_count}" />
								</dt>
								<dd onclick="reloadPrice(${b.c_id},true);">修改</dd>
							</dl></td>
						<td class="delete"><a href="javascript:delShopping(${b.c_id});">删除</a>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="button">
					<input type="submit" value="" />
				</div>
			</form>
		</div>
		<!-- <script type="text/javascript">
			document.write("Cookie中记录的购物车商品ID：" + getCookie("product")
					+ "，可以在动态页面中进行读取");
		</script> -->
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
