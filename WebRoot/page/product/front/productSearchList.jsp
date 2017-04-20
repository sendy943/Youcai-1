<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>�в��� ͼ������</title>    
	<link href="/css/global/header01.css" rel="stylesheet" type="text/css" />
	<link href="/css/product/list.css" rel="stylesheet" type="text/css" />	
	<link href="/css/global/topsell.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/jquery.js"></script>
<script>
$(function(){
  $("#scanHistory").html("���ڼ���...");
  $("#scanHistory").load("/front/product/findScanHistory");
});
</script>
</head>

<body class="ProducTypeHome2" onload='$("#index").css("background", "");'>
	<jsp:include page="/page/share/Head.jsp"/>
    <div id="position">�����ڵ�λ��: <a href="/" name="linkHome">�в���</a> &gt;&gt; <em>��Ʒ��ѯ���</em> ��${pageCtx.totalRecords}����
	</div>

    <!--ҳ���������������-->
    <div class="browse_left">
		 <div class="browse">
	          <div class="browse_t">��������������Ʒ</div>
			  <ul id="scanHistory"></ul>
	     </div>
    </div>
    <!--ҳ���Ҳ�����б��ֿ�ʼ-->
    <div class="browse_right">
	     <div id="divNaviTop" class="number">
	          <div class="number_l">���²�ѯ��<span class='number_white'>${pageCtx.totalRecords}</span>�������ÿҳ��ʾ<span class="number_white">${pageCtx.maxResults}</span>��</div>
		      <div class="turnpage">
                <div><em>��${pageCtx.currentPage}ҳ</em></div>
		      </div>
	     </div>
<!---------------------------LOOP START------------------------------>
<s:iterator value="products" var="entry">	
		<div class="goodslist">
          <div class="goods"><a href="/front/product/detailShow?productId=${entry.productId }" target="_blank">
            <img title="����鿴��ϸ��Ϣ" src='<s:property value="#entry.styles.{productImagePath}[0]" />' alt="${entry.name}" width="140" height="168"  border="0"/></a>
          </div>
          <div class="goods_right">
               <h2><a href="/front/product/detailShow?productId=${entry.productId }" target="_blank" title="����鿴��ϸ��Ϣ">${entry.name} [<c:forEach items="${entry.styles}" var="style">${style.name},</c:forEach>...]</a>&nbsp;&nbsp;&nbsp;/*${entry.type.name }*/ <c:if test="${!empty entry.brand}">Ʒ�ƣ�${entry.brand.name}</c:if></h2>
	           <div class="content"><c:out value="${fn:substring(entry.description,0,200) }" escapeXml="false"/></div>
          </div>
          <div class="empty_box"></div>
          <div class="message_bottom" style="text-align:right;">
			   <div class="buy"><s>��${entry.marketPrice}</s>��<strong><em>��${entry.salePrice}</em></strong>����ʡ��${entry.savedPrice}</div>
	      </div>
        </div>
</s:iterator>
<!----------------------LOOP END------------------------------->	
	     <div id="divNaviBottom" class="page_number">
	     <div class="turnpage turnpage_bottom">
	     <c:if test="${pageCtx.pageList.startPage!=1}"><a href="topage('1')">��ҳ</a></c:if>
	     <c:if test="${pageCtx.prePage!=0}"><a href="topage('${pageCtx.prePage}')">��һҳ</a></c:if>
	     <c:forEach begin="${pageCtx.pageList.startPage}" end="${pageCtx.pageList.endPage}" var="p">
           <c:if test="${pageCtx.currentPage==p}"><div class='red'>${p}</div></c:if>
           <c:if test="${pageCtx.currentPage!=p}"><div class="page"><a href="topage('${p}')">[${p}]</a></div></c:if>
         </c:forEach>
         <c:if test="${pageCtx.nextPage!=0}"><a href="topage('${pageCtx.nextPage}')">��һҳ</a></c:if>
         <c:if test="${pageCtx.pageList.endPage!=pageCtx.totalPages}"><a href="topage('${pageCtx.totalPages }')">βҳ</a></c:if>
		<div>&nbsp;&nbsp;</div>��ת����
		<select name="selectPage" class="kuang" onchange="javaScript:topage(this.value)">
				<c:forEach begin="1" end="${pageCtx.totalPages}" var="p">
				<option value="${p}" <c:if test="${pageCtx.currentPage==p}">selected</c:if>> ${p} </option></c:forEach>
		</select>ҳ
		<script>
		<!--
		function topage(p){
			window.location.href='/front/product/search?pageCtx.currentPage='+p+"&word=${param.word }";
		}
		//-->
		</script>
         </div>
	     </div>
    </div>
	<jsp:include page="/page/share/Foot.jsp" />
</body>
</html>