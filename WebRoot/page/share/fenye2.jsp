<%@ page pageEncoding="gbk"%>
<!-- ���ſ����۷�ҳ2
     1...2 3 4 5 6...80 ��һҳ ��һҳ -->
<c:if test="${pageCtx.pageList.endPage > pageCtx.pageListSize}"><a href="javascript:toPage('1')">[1]</a>...</c:if>
<c:forEach begin="${pageCtx.pageList.startPage}" end="${pageCtx.pageList.endPage}" var="p">
  <c:if test="${pageCtx.currentPage==p}"><b>${p}</b></c:if>
  <c:if test="${pageCtx.currentPage!=p}"><a href="javascript:toPage('${p}')">[${p}]</a></c:if>&nbsp;
</c:forEach>
<c:if test="${pageCtx.pageList.endPage < pageCtx.totalPages}">...<a href="javascript:toPage('${pageCtx.totalPages }')">[${pageCtx.totalPages }]</a></c:if>
<c:if test="${pageCtx.prePage!=0}"><a href="javascript:toPage('${pageCtx.prePage}')">&nbsp;��һҳ</a></c:if>
<c:if test="${pageCtx.nextPage!=0}"><a href="javascript:toPage('${pageCtx.nextPage}')">&nbsp;��һҳ</a></c:if>