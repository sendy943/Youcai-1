<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${product.name}-�в���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="${product.name}">
	<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css">
	<link href="/core/css/product/product.css" rel="stylesheet" type="text/css">
	<link href="/core/css/global/topcommend.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/core/js/jquery.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(function(){
  $("#commenddetail").html("���ڼ���...");
  $("#scanHistory").html("���ڼ���...");
  $("#commenddetail").load("/core/front/product/findTopSale", {typeId:"${product.type.parent.typeId}"});
  $("#scanHistory").load("/core/front/product/findScanHistory");
});

function change(index) {
  var color = $("#colorSelect").val();
  var productId = $("#productId").val();
  location.href="/core/front/product/detailShow?&color=" + color + "&productId=" + productId;
}
</SCRIPT>

<link rel="stylesheet" href="/core/css/product/MagicZoom.css" type="text/css" media="screen" />
    <style>
	img {
		border-width: 0px;
	}
	</style>
<script src="/core/js/mz-packed.js" type="text/javascript"></script>
  </head>
  
  <body onload='$("#index").css("background", "");'>
<jsp:include page="/page/share/Head.jsp"/>
<div id="ContentBody"><!-- ҳ������ -->
<c:set var="out" value="&gt;&gt; <em>${product.name}</em>"/><c:forEach items="${types}" var="t" varStatus="s">
		<c:set var="out" value=" &gt;&gt; <a href='/front/product/list?type.typeId=${t.typeId}'>${t.name}</a> ${out}"/>
	</c:forEach>
	 	 <div id="position"> �����ڵ�λ�ã�<a href="/" name="linkHome">�в���</a> <span id="uc_cat_spnPath"><c:out value="${out}" escapeXml="false"></c:out></span></div>
 <div class="browse_left"><!-- ҳ������ ��� --> 
        <!-- ���������Ʒ -->
	 <div class="browse">
	      <div class="browse_t">��������������Ʒ</div>
	      <ul id="scanHistory"></ul>
	 </div>
	<!--��Ʒ�Ƽ� start -->
	<DIV id="topcommend" align="left">
	       <DIV id="newtop"><IMG height=13 src="/core/images/global/sy2.gif" width=192></DIV>
	       <DIV id="newlist">
		  <DIV id="newmore">
		    <DIV class="title">��Ʒ�Ƽ�</DIV>
		  </DIV>
			<span id="commenddetail">
			</span>
		</DIV>
	</DIV>
</div><!-- ҳ������ ���end -->
	
 <div id="Right" ><!-- ҳ������ �ұ� -->
<form action="/core/shopping/cart/buy" method="post">
<INPUT TYPE="hidden" id="productId" name="productId" value="${param.productId}">
<INPUT TYPE="hidden" id="typeId" name="typeId" value="${param.typeId }">
<INPUT TYPE="hidden" id="styleId" name="styleId" value="${styleId }">
    <div id="browse_left">
      <div style="float:left;">
      <a href='<s:property value="style.productPrototypeImagePath" />' title="MagicZoom: Super bike" class="MagicZoom"><img src='/core<s:property value="style.productImagePath" />'/></a>
      </div>
	  <div class="right_right" style="float:left;">									
	    <div class="right_title"><b>${product.name}</b></div>
	    <div class=""><ul><li class="li2">��Ʒ��ţ�${product.productId}<font color="#CC0000">���绰����ר�ã�</font> <c:if test="${!empty product.brand}">Ʒ�ƣ�${product.brand.name}</c:if></li></ul></div>
	    <br><div class="">��ɫ��
	    <s:if test="styles.size>1">
	    <select id="colorSelect" onchange="change(this.selectedIndex);">
	      <s:iterator value="styles" var="s">
	      <option <c:if test="${s==style}">selected</c:if>>${s.name }</option></s:iterator>
	    </select>&nbsp;
	    </s:if>
	    <s:else><s:property value="styles.{name}[0]"/>&nbsp; </s:else>
	    </div>
		<div class="right_desc">
		  <ul>
			<li style="width:320px;">�г��ۣ�<s>${product.marketPrice}</s> Ԫ <font color='#ff6f02'>��վ�ۣ�<b>${product.salePrice} Ԫ</b></font> ��ʡ��<font color='#ff6f02'>${product.savedPrice }</font> Ԫ										</li>
		  	<li class="right_img"><INPUT TYPE="image" src="/core/images/global/sale.gif"></li>
			<li class="guopiprice">[ <IMG src="/core/images/global/2j4.gif" border="0">&nbsp;<A href="#" target="_blank">����˵��</A> ]&nbsp;&nbsp;&nbsp;&nbsp;[ <IMG src="/core/images/global/2j4.gif" border="0">&nbsp;<A href="#" target="_blank">���ʽ</A> ]</li>
		  </ul>									
	    </div>
      </div>
  </div>
</form>
<div class='right_blank'></div><div class='right_title1'>��Ʒ˵��</div><div class='right_content'>${product.description}</div>
</div><!-- ҳ������ �ұ� end -->

</div><!-- ҳ������ end -->
<jsp:include page="/page/share/Foot.jsp" />
</body>
</html>
