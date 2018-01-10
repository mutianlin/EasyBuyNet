<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eleven.entity.*" %>
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
				<li class="current"><a href="manage/user.jsp">用户</a></li>
				<li><a href="manage/product.jsp">商品</a></li>
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
		您现在的位置：<a href="index.jsp">易买网</a> &gt; 管理后台
	</div>
	<div id="main" class="wrap">
		<div id="menu-mng" class="lefter">
			<div class="box">
				<!-- 左侧导航栏 -->
				<%@ include file="common/liftNavigation .jsp"%>
			</div>
		</div>
		<div class="main">
			<h2>修改用户</h2>
			<div class="manage">
				<form method="post" action="adminServlet?type=userDoUpdate&updateById=${updateUser.id }">
					<table class="form">
						<tr>
							<td class="field">用户名：</td>
							<td><input type="text" class="text" name="userName"
								value="${updateUser.account}" readonly="readonly" /></td>
						</tr>
						<tr>
							<td class="field">姓名：</td>
							<td><input type="text" class="text" name="name"
								value="${updateUser.userName}" /></td>
						</tr>
						<tr>
							<td class="field">密码：</td>
							<td><input type="passWord" class="text" name="passWord"
								value="${updateUser.password}" /></td>
						</tr>
						<tr>
							<td class="field">性别：</td>
							<td><c:choose>
									<c:when test="${updateUser.sex eq '男'}">
										<input type="radio" name="sex" value="1" checked="checked" />男 
								<input type="radio" name="sex" value="0" />女
							</td>
							</c:when>
							<c:when test="${updateUser.sex eq '女'}">
								<input type="radio" name="sex" value="1" />男 
								<input type="radio" name="sex" value="0" checked="checked" />女</td>
							</c:when>
							<c:otherwise>
								<input type="radio" name="sex" value="1" />男 
								<input type="radio" name="sex" value="0" />女</td>
							</c:otherwise>
							</c:choose>

						</tr>
						<tr>
							<td class="field">出生日期：</td>
							<script type="text/javascript">
								<%
								Object u = request.getAttribute("updateUser");
								User user = (User) u;
								
								String birth1 = user.getBirth();
								if(birth1!=null){
								String[] birth = birth1.split("\\.");
								System.out.println(birth1+"\n"+birth.length);
								System.out.println(birth[0]+birth[1]+birth[2]);
								if(birth.length==3){
								%>
								var y = $("select[name='birthyear'] > [value='<%=birth[0] %>']");
								var m = $("select[name='birthmonth'] > [value='<%=birth[1] %>']");
								var d = $("select[name='birthday'] > [value='<%=birth[2] %>']");
								<%}
								}else{%>
								var y = $("select[name='birthyear'] > [value='2010']");
								var m = $("select[name='birthmonth'] > [value='12']");
								var d = $("select[name='birthday'] > [value='12']");
								<%}%>
								y.selected=true;
								m.selected=true;
								d.selected=true;
							</script>
							<td><%@ include file="common/date.jsp"%>
							</td>
						</tr>
						<tr>
							<td class="field">手机号码：</td>
							<td><input type="text" class="text" name="mobile"
								value="${updateUser.phone}" /></td>
						</tr>
						<tr>
							<td class="field">送货地址：</td>
							<td><input type="text" class="text" name="address"
								value="${updateUser.address}" /></td>
						</tr>
						<tr>
							<td class="field">头像：</td>
							<td><input type="file" class="text" name="photo" /></td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit"
									name="submit" value="更新" /> </label></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
