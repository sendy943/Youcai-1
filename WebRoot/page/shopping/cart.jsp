<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�в���-���ﳵ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<LINK href="/core/css/new_cart.css" rel="stylesheet" type="text/css">
<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css">
	<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
/** ��ȡ��ָ���ַ���Ϊǰ׺�������ֶμ��� **/
/** ���������ʽ�Ƿ���ȷ(����1-4λ����һ�����ֱ�����1-9) **/
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

/** ��֤���������ֶ� **/
function validateAmount(){
	var amounts = getInputsByname("amount_", "text");
	if(amounts.length==0){
		alert("����û�й�����Ʒ");
		return false;
	}else{
		for (var i = 0; i < amounts.length; i++) {
			var amount = amounts[i];
			if(amount.value==null || amount.value.trim()==""){
				alert("\n���������Ʒ��,�е���Ʒ��������Ϊ��,����д��������");
				amount.focus();
				return false;
			}else if(amount.value=="0"){
				alert("\n���������Ʒ��,�е���Ʒ��������Ϊ0,���������Ҫ����Ʒ,����ɾ����");
				amount.select();
				return false;
			}else if(!numericFormat(amount.value)){
				alert("\n�����������з���������,�����");
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
          <TD width="14%" align="left"><a href="/core/shopping/cart/clear"><img style="CURSOR:hand;" alt="��չ��ﳵ" src="/core/images/buy/az-empty-shoppingcard.gif" border="0"></a></TD>
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
        <TD width="457"><STRONG>�ҵĹ��ﳵ�����Ʒ--���Ϲ���</STRONG></TD>
        <TD width=112><DIV align=center><STRONG>�г���</STRONG></DIV></TD>
        <TD width=181><DIV align=center><STRONG>�۸�</STRONG></DIV></TD>
        <TD width=73><DIV align=right><STRONG>����</STRONG></DIV></TD>
        <TD width=66>&nbsp;</TD>
      </TR>
<!-- loop begin -->
<c:forEach items="${sessionScope.cart.items}" var="item"> 
       <TR vAlign="top">
        <TD><STRONG><a href="/core/front/product/detailShow?productId=${item.product.productId }" target="_blank">${item.product.name}</A></STRONG> <span class="h3color"><c:forEach items="${item.product.styles}" var="style">[��ɫ��${style.name}]</c:forEach></span><BR><BR></TD>
        <TD width="112" align="center"><SPAN class="price" title="��${item.product.marketPrice}Ԫ"><FONT color="black"><S><B>��${item.product.marketPrice}Ԫ</B></S></FONT></SPAN></TD>
        <TD width="181"><P align="center"><SPAN class="price"><B>��${item.product.salePrice} Ԫ</B></SPAN> <BR>
          Ϊ����ʡ��<SPAN class=price>��${item.product.savedPrice}Ԫ </SPAN><BR> </P></TD>
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
          <td width="9%" align="right"><DIV align="right"><SPAN class="price"><STRONG><B><FONT color="black">����:</FONT></B></STRONG></SPAN></DIV></td>
          <td width="11%" align="right"><DIV align="center"><SPAN class="price"><STRONG><B class="price"><FONT color="black">${cart.totalSalePrice } Ԫ</FONT></B></STRONG></SPAN></DIV></td>
          <td width="8%" align="right"><DIV align="right"><SPAN class="price"><STRONG><B><FONT color="black">��ʡ:</FONT></B></STRONG></SPAN></DIV></td>
          <td width="12%" align="right"><DIV align="center"><SPAN class="price"><STRONG><B class="price">${cart.totalSavedPrice } Ԫ</B></STRONG></SPAN></DIV></td>
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
