<%@ page pageEncoding="UTF-8"%>
<c:forEach items="${blist}" var="b">
	<dt>${b.b_name }</dt>
	<c:forEach items="${slist}" var="s">
		<c:if test="${s.sb_id == b.b_id }">
			<dd>
				<a href="product-list.jsp">${s.s_name }</a>
			</dd>
		</c:if>
	</c:forEach>
</c:forEach>