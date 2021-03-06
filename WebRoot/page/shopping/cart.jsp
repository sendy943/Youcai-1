<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>有才网-购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<LINK href="/core/css/new_cart.css" rel="stylesheet" type="text/css">
<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css">
	<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
/** 获取以指定字符串为前缀的输入字段集合 **/
/** 数字输入格式是否正确(长度1-4位，第一个数字必须是1-9) **/
function numericFormat(strNumber){   
  var newPar=/^[1-9]\d{0,3}$/;
  return newPar.test(strNumber);
} 

function getInputsByname(name, etype){//
	var inputs = document.getElementsByTagName("input");
	var texts = new Array();
	var y = 0;
	for (var i = 0; i < inputs.length; i++) {
	  if (inputs[i].type == etype && inputs[i].name!=null && inputs[i].name.substring(0, name.length) == name) {
			texts[y] = inputs[i];
			y++;
		}
	}
	return texts;
}
function settleAccounts(){
	if(validateAmount()){		
		var form = document.forms["buycart"];
		form.action="/core/customer/shopping/cart/settleAccounts";
		form.submit();
	}
}

function modifyAmount(){
	if(validateAmount()){		
		var form = document.forms["buycart"];
		form.action="/shopping/cart/updateAmount";
		form.submit();
	}
}

/** 验证购买数量字段 **/
function validateAmount(){
	var amounts = getInputsByname("amount_", "text");
	if(amounts.length==0){
		alert("您还没有购买商品");
		return false;
	}else{
		for (var i = 0; i < amounts.length; i++) {
			var amount = amounts[i];
			if(amount.value==null || amount.value.trim()==""){
				alert("\n您购买的商品中,有的商品购买数量为空,请填写购买数量");
				amount.focus();
				return false;
			}else if(amount.value=="0"){
				alert("\n您购买的商品中,有的商品购买数量为0,如果您不需要该商品,可以删除它");
				amount.select();
				return false;
			}else if(!numericFormat(amount.value)){
				alert("\n购买数量含有非数字数据,请更正");
				amount.select();
				return false;
			}
		}
	}
	return true;
}
//-->
</SCRIPT>
  </head>
  
  <body onload='$("#index").css("background", "");'>
    <jsp:include page="/page/share/Head.jsp"/>
<BR>
<TABLE cellSpacing=0 cellPadding=5 width="98%" border="0" align="center">
  <TR>
    <TD><TABLE cellSpacing=0 cellPadding=0 width="96%" border=0>
      <TBODY>
        <TR>
          <TD width="58%">&nbsp;</TD>
          <TD width="14%" align="left"><a href="/core/shopping/cart/clear"><img style="CURSOR:hand;" alt="清空购物车" src="/core/images/buy/az-empty-shoppingcard.gif" border="0"></a></TD>
          <TD width="15%" align=left><a href="/core/front/product/list?type.typeId=2"><img src="/core/images/buy/as-s-continus.gif" width="116" height="22" border="0"></a></TD>
          <TD width="13%" align=right><img style="cursor:hand;" src="/core/images/buy/az-by-split.gif" width="116" height="22" onClick="javascript:settleAccounts()"/></TD>
        </TR>
      </TBODY>
    </TABLE></TD>
  </TR>

  <TR>
    <TD><FORM id="buycart" name="buycart" action="" method="post">
    <input type="hidden" name="directUrl" value="${param.directUrl }" />
    <input type="hidden" name="note" value="${param.note }" />
    <TABLE cellSpacing=0 cellPadding=6 width="100%" border=0> 
      <TR bgColor=#d7ebff>
        <TD width="457"><STRONG>我的购物车里的商品--马上购买</STRONG></TD>
        <TD width=112><DIV align=center><STRONG>市场价</STRONG></DIV></TD>
        <TD width=181><DIV align=center><STRONG>价格</STRONG></DIV></TD>
        <TD width=73><DIV align=right><STRONG>数量</STRONG></DIV></TD>
        <TD width=66>&nbsp;</TD>
      </TR>
<!-- loop begin -->
<c:forEach items="${sessionScope.cart.items}" var="item"> 
       <TR vAlign="top">
        <TD><STRONG><a href="/core/front/product/detailShow?productId=${item.product.productId }" target="_blank">${item.product.name}</A></STRONG> <span class="h3color"><c:forEach items="${item.product.styles}" var="style">[颜色：${style.name}]</c:forEach></span><BR><BR></TD>
        <TD width="112" align="center"><SPAN class="price" title="￥${item.product.marketPrice}元"><FONT color="black"><S><B>￥${item.product.marketPrice}元</B></S></FONT></SPAN></TD>
        <TD width="181"><P align="center"><SPAN class="price"><B>￥${item.product.salePrice} 元</B></SPAN> <BR>
          为您节省：<SPAN class=price>￥${item.product.savedPrice}元 </SPAN><BR> </P></TD>
        <TD align="center" width="73"><INPUT type="text" style="WIDTH: 30px" maxLength="3" value="${item.amount}"  name="amount_${item.product.productId}_<c:forEach items='${item.product.styles}' var='style'>${style.styleId}</c:forEach>" onkeypress="javascript:InputIntNumberCheck()" onblur="modifyAmount();"></TD>
        <TD width="66"><a href="/core/shopping/cart/delete?typeId=${param.typeId }&productId=${item.product.productId}&styleId=<c:forEach items="${item.product.styles}" var="style">${style.styleId}</c:forEach>&directUrl=${param.directUrl }"><img height="17" src="/core/images/buy/delete.gif" width="45" border="0"></a></TD>
      </TR>
      <TR vAlign="top">
        <TD colSpan="5"><IMG height=1 src="/core/images/buy/green-pixel.gif" width="100%" border="0"></TD>
      </TR>
</c:forEach>
<!-- loop end -->	  
    </TABLE>
    </FORM>
      <table width="96%" border="0" align="left">
        <tr>
          <td width="60%" align="right">&nbsp;</td>
          <td width="9%" align="right"><DIV align="right"><SPAN class="price"><STRONG><B><FONT color="black">共计:</FONT></B></STRONG></SPAN></DIV></td>
          <td width="11%" align="right"><DIV align="center"><SPAN class="price"><STRONG><B class="price"><FONT color="black">${cart.totalSalePrice } 元</FONT></B></STRONG></SPAN></DIV></td>
          <td width="8%" align="right"><DIV align="right"><SPAN class="price"><STRONG><B><FONT color="black">节省:</FONT></B></STRONG></SPAN></DIV></td>
          <td width="12%" align="right"><DIV align="center"><SPAN class="price"><STRONG><B class="price">${cart.totalSavedPrice } 元</B></STRONG></SPAN></DIV></td>
        </tr>
        <tr>
          <td colspan="3" align="right">&nbsp;</td>
          <td colspan="2" align="right"><img style="CURSOR:hand;" src="/core/images/buy/az-by-split.gif" width="116" height="22" onClick="javascript:settleAccounts()"></td>
        </tr>
      </table></TD>
  </TR>
</TABLE>
<br>
<jsp:include page="/page/share/Foot.jsp" />
  </body>
</html>
