<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<body>
<%@ include file="common/head.jsp" %>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎</h1>
			<ul class="steps clearfix">
				<li class="finished"><em></em>填写信息</li>
				<li class="last-current"><em></em>操作成功</li>
			</ul>
			<div class="msg">
				<p>恭喜：成功！</p>
				<p>正在进入首页...</p>
				<script type="text/javascript">
					setTimeout("location.href='index.jsp'", 3000);
				</script>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	Copyright &copy; 2010 All Rights Reserved. 
</div>
</body>
</html>
