<%@ page pageEncoding="gbk" import="java.util.Date;"%>
<%@ include file="/page/share/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${type.name} �в���</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="${type.name}">
	<meta http-equiv="description" content="${type.note}">
	
	<link href="/css/global/header01.css" rel="stylesheet" type="text/css">
	<link href="/css/product/list.css" rel="stylesheet" type="text/css" />	
	<link href="/css/global/topsell.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(function(){
  $("#topSale").html("���ڼ���...");
  $("#scanHistory").html("���ڼ���...");
  $("#topSale").load("/front/product/findTopSale", {typeId:"${type.typeId}"});
  $("#scanHistory").load("/front/product/findScanHistory");
});

//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms['productlist'].submit();
	}
</SCRIPT>
</head>

<body class="ProducTypeHome2" onload="javascript:pageInit()">
	<jsp:include page="/page/share/Head.jsp"/> <!-- ����Head.jsp����form�����ʲ��ܽ��˰����������form���� -->
	<form name="productlist" action="/front/product/list" method="post">
	  <input id="currentPage" type="hidden" name="pageCtx.currentPage">
	  <input type="hidden" name="sort" value="${sort }">
	  <input type="hidden" name="type.typeId" value="${type.typeId }">
	  <input type="hidden" name="brandId" value="${brandId }">
	  <input type="hidden" name="showStyle" value="${showStyle }">
	<c:set var="out" value=""/><c:forEach items="${types}" var="type" varStatus="statu">
		<c:if test="${statu.count==1}"><c:set var="out" value=" &gt;&gt; <em>${type.name}</em> ${out}"/></c:if>
		<c:if test="${statu.count>1}"><c:set var="out" value=" &gt;&gt; <a href='/front/product/list?type.typeId=${type.typeId}&sort='>${type.name}</a> ${out}"/></c:if>
	</c:forEach>
    <div id="position">�����ڵ�λ��: <a href="/" name="linkHome">�в���</a> 
    <c:out value="${out}" escapeXml="false"></c:out>��${pageCtx.totalRecords}����
	</div>

    <!--ҳ���������������-->
    <div class="browse_left">
         <div class="browse">
            <div class="browse_t">${type.name}</div>
			
				<h2><span class="gray">����¼�����</span></h2>
				<ul><c:forEach items="${type.childTypes}" var="childtype">						
				<li class='bj_blue'><a href="/front/product/list?type.typeId=${childtype.typeId}">${childtype.name}</a></li></c:forEach></ul>
				<span class="gray"><c:if test="${!empty type.parent.typeId }"><a href="/front/product/list?type.typeId=${type.parent.typeId }">&nbsp;&nbsp;[�����ϼ�����]</a></c:if></span>
	     </div>
	     <div class="browse">
	          <div class="browse_t">���${type.name}</div>
			  <ul id="topSale"></ul>
	     </div>
		 <div class="browse">
	          <div class="browse_t">��������������Ʒ</div>
			  <ul id="scanHistory"></ul>
	     </div>
    </div>
    <!--ҳ���Ҳ�����б��ֿ�ʼ-->
    <oscache:cache> <!-- �����Ʒչʾģ�� -->
    <div class="browse_right">
         <div class="select_reorder" style="height:60px;">
              <div class="reorder_l">��ѡ������ʽ�� <c:if test="${'saleCount_desc'==param.sort}"><strong><em>�����ൽ��</em></strong></c:if><c:if test="${'saleCount_desc'!=param.sort}">
              <a title='����������' href="/front/product/list?sort=saleCount_desc&type.typeId=${type.typeId}&showStyle=${param.showStyle }">�����ൽ��</a></c:if>
			  | <c:if test="${'salePrice_desc'==param.sort}"><strong><em>�۸�ߵ���</em></strong></c:if><c:if test="${'salePrice_desc'!=param.sort}">
			  <a title='�۸�ߵ���' href="/front/product/list?sort=salePrice_desc&type.typeId=${type.typeId}&showStyle=${param.showStyle }">�۸�ߵ���</a></c:if>
			  | <c:if test="${'salePrice_asc'==param.sort}"><strong><em>�۸�͵���</em></strong></c:if><c:if test="${'salePrice_asc'!=param.sort}">
			  <a title='�۸�͵���' href="/front/product/list?sort=salePrice_asc&type.typeId=${type.typeId}&showStyle=${param.showStyle }">�۸�͵���</a></c:if>
			  | <c:if test="${empty param.sort}"><strong><em>����ϼ�ʱ��</em></strong></c:if><c:if test="${!empty param.sort}">
			  <a title='����ϼ�ʱ��' href="/front/product/list?sort=&type.typeId=${type.typeId}&showStyle=${param.showStyle }">����ϼ�ʱ��</a></c:if>
			  &nbsp;&nbsp;��<font color="red">${pageCtx.totalRecords }</font>����¼��ÿҳ��ʾ<font color='red'>${pageCtx.maxResults }</font>����¼</div>
			  <div class="reorder_r">��ʾ��ʽ��<c:if test="${param.showStyle=='imagetext'}"><strong><em>ͼ�İ�</em></strong></c:if><c:if test="${param.showStyle!='imagetext'}">
		      <a href="/front/product/list?sort=${param.sort}&type.typeId=${type.typeId}&brandId=${brandId}&showStyle=imagetext&pageCtx.currentPage=${pageCtx.currentPage }">ͼ�İ�</a></c:if> |
		      <c:if test="${param.showStyle=='imagetext'}"><a href="/front/product/list?sort=${param.sort}&type.typeId=${type.typeId}&brandId=${brandId}&showStyle=image&pageCtx.currentPage=${pageCtx.currentPage }">ͼƬ��</a>
		      </c:if><c:if test="${param.showStyle!='imagetext'}"><strong><em>ͼƬ��</em></strong></c:if>
		      </div>
		    <div class="brand">
				<div class="FindByHint">��<strong>Ʒ��</strong>ѡ��</div>
				<ul class="CategoryListTableLevel1"><c:forEach items="${brands}" var="brand">
				<li><c:if test="${brandId == brand.brandId}">${brand.name}</c:if><c:if test="${brandId != brand.brandId}"><a href="/front/product/list?sort=${param.sort}&type.typeId=${type.typeId}&showStyle=${param.showStyle}&brandId=${brand.brandId}">${brand.name}</a></c:if></li></c:forEach>
				</ul>
			 </div>
		</div>
		<div style="text-align:right;"><%@ include file="/page/share/fenye2.jsp" %></div>
	<div class='goods_pic'>
<!---------------------------LOOP START------------------------------>
<s:iterator value="products" var="entry">	
		<div class="goodslist">
          <div class="goods"><a href="/front/product/detailShow?productId=${entry.productId }" target="_blank">
            <img title="����鿴��ϸ��Ϣ" src='<s:property value="#entry.styles.{productImagePath}[0]" />' alt="${entry.name}" width="140" height="168"  border="0"/></a>
          </div>
          <div class="goods_right">
               <h2><a href="/front/product/detailShow?productId=${entry.productId }" target="_blank" title="����鿴��ϸ��Ϣ">${entry.name} [<c:forEach items="${entry.styles}" var="style">${style.name},</c:forEach>...]</a>&nbsp;&nbsp;&nbsp;/*${entry.type.name }*/ <c:if test="${!empty entry.brand}">Ʒ�ƣ�${entry.brand.name}</c:if></h2>
	           <div class="content"><c:out value="${fn:substring(entry.description2,0,200) }" escapeXml="false"/></div>
          </div>
          <div class="empty_box"></div>
          <div class="message_bottom" style="text-align:right;">
			   <div class="buy"><s>��${entry.marketPrice}</s>��<strong><em>��${entry.salePrice}</em></strong>����ʡ��${entry.savedPrice}</div>
	      </div>
        </div>
</s:iterator>
<!----------------------LOOP END------------------------------->
		<div class='emptybox'></div>
	</div>
	<div style="text-align:right;"><%@ include file="/page/share/fenye2.jsp" %></div>
  </div>
    </oscache:cache>
	<jsp:include page="/page/share/Foot.jsp" />
	</form>
</body>
</html>