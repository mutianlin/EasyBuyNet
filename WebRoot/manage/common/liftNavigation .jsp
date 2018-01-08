<%@ page pageEncoding="utf-8"%>
<dl>
				<dt>用户管理</dt>
				<dd>
					<em><a href="adminServlet?type=user-add">新增</a></em>
					<a href="adminServlet?type=user">用户管理</a>
				</dd>
				<dt>商品信息</dt>
				<dd>
					<em><a href="manage/productClass-add">新增</a></em>
					<a href="manage/productClass.jsp">分类管理</a>
				</dd>
				<dd>
					<em><a href="adminServlet?type=product-add">新增</a></em>
					<a href="adminServlet?type=product">商品管理</a>
				</dd>
				<dt>订单管理</dt>
				<dd>
					<a href="adminServlet?type=order">订单管理</a>
				</dd>
				<dt>留言管理</dt>
				<dd>
					<a href="adminServlet?type=guestbook">留言管理</a>
				</dd>
				<dt>新闻管理</dt>
				<dd>
					<em><a href="adminServlet?type=news-add">新增</a></em>
					<a href="adminServlet?type=news">新闻管理</a>
				</dd>
			</dl>