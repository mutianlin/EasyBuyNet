<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
		<div class="main">
			<div class="guestbook">
				<h2>全部留言</h2>
				<ul>
					<li>
						<dl>
							<dt>那个什么衣服贵吗</dt>
							<dd class="author">
								网友：张三丰 <span class="timer">2010:10:10 20:00:01</span>
							</dd>
							<dd>不贵</dd>
						</dl></li>
					<li>
						<dl>
							<dt>那个什么衣服贵吗</dt>
							<dd class="author">
								网友：张三丰 <span class="timer">2010:10:10 20:00:01</span>
							</dd>
							<dd>不贵</dd>
						</dl></li>
					<li>
						<dl>
							<dt>那个什么衣服贵吗</dt>
							<dd class="author">
								网友：张三丰 <span class="timer">2010:10:10 20:00:01</span>
							</dd>
							<dd>不贵</dd>
						</dl></li>
				</ul>
				<div class="clear"></div>
				<div class="pager">
					<ul class="clearfix">
						<li><a href="#">上一页</a>
						</li>
						<li class="current">1</li>
						<li><a href="#">2</a>
						</li>
						<li><a href="#">3</a>
						</li>
						<li><a href="#">4</a>
						</li>
						<li><a href="#">5</a>
						</li>
						<li><a href="#">下一页</a>
						</li>
					</ul>
				</div>
				<div id="reply-box">
					<form>
						<table>
							<tr>
								<td class="field">昵称：</td>
								<td><input class="text" type="text" name="guestName" />
								</td>
							</tr>
							<tr>
								<td class="field">留言标题：</td>
								<td><input class="text" type="text" name="guestTitle" />
								</td>
							</tr>
							<tr>
								<td class="field">留言内容：</td>
								<td><textarea name="guestContent"></textarea>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><label class="ui-blue"><input type="submit"
										name="submit" value="提交留言" /> </label>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">Copyright &copy; 2010 All Rights Reserved.</div>
</body>
</html>
