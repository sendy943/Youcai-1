<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<UL>
	<c:forEach items="${history}" var="p" varStatus="s">
		<LI class="bx">${s.count}.<a href="/core/front/product/detailShow?productId=${p.productId}" target="_blank" >${p.name}</a></LI></c:forEach>			
</UL>