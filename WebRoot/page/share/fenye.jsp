<%@ page pageEncoding="gbk"%>
<!-- ���ſ����۷�ҳ1---��ҳ�ص㣺��ǰҳ������λ��ҳ���б���м�
     �ܼ�¼����80�� | ÿҳ��ʾ��8�� | ��ҳ����10  1 2 3 4 5 6 7 8 9 10 -->
<font color="#FFFFFF">
�ܼ�¼��:${pageCtx.totalRecords}�� | ÿҳ��ʾ:${pageCtx.maxResults}�� | ��ҳ��:${pageCtx.totalPages}ҳ</font>��
<c:forEach begin="${pageCtx.pageList.startPage}" end="${pageCtx.pageList.endPage}" var="p">
    <c:if test="${pageCtx.currentPage==p}"><b><font color="#FFFFFF">${p} </font></b></c:if>
    <c:if test="${pageCtx.currentPage!=p}"><a href="javascript:toPage('${p}')" class="a03">[${p}] </a></c:if>
</c:forEach>


