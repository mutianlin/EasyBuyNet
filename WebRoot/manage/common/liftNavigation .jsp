<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<dl>
				<dt>用户管理</dt>
				<dd>
					<em><a href="manage/user-add.jsp">新增</a></em>
					<a href="adminServlet?type=user">用户管理</a>
				</dd>
				<dt>商品信息</dt>
				<dd>
					<em><a href="adminServlet?type=productClassAdd">新增</a></em>
					<a href="adminServlet?type=productClass">分类管理</a>
				</dd>
				<dd>
					<em><a href="adminServlet?type=productAdd">新增</a></em>
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
					<em><a href="adminServlet?type=newsAdd">新增</a></em>
					<a href="adminServlet?type=news">新闻管理</a>
				</dd>
			</dl>