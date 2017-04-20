<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<oscache:flush scope="application" />   <!-- ���ҳ�滺�� -->
<html>
<head>
<title>��Ʒ�б�</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<script type="text/javascript" src="/js/jquery.js"></script>
	<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms[0].submit();
	}
	
	function selectAll(){
      var ids = document.getElementsByName("productIds");
      if(document.forms[0].all.checked){
        for(i=0; i<ids.length; i++){
          ids[i].checked = "checked";
        }
      }else{
        for(i=0; i<ids.length; i++){
          ids[i].checked = "";
        }
      }
    }
	
	function actionEvent(action){ 
		var form = document.forms[0];
		if(hasSelected(form.all, form.productIds)){
			form.action="/control/product/" + action;
			$("#currentPage").remove();
			$("#query").remove();
			form.submit();
		}else{
			alert("��ѡ��Ҫ�����ļ�¼");
		}
	}
	
	/*
	 * �ж��Ƿ�ѡ���˼�¼
     */
	function hasSelected(allobj,items){
	    var state = allobj.checked;
	    if(items.length){
	    	for(var i=0;i<items.length;i++){
	    		if(items[i].checked) return true;
	    	}
	    }else{
	    	if(items.checked) return true;
	    }
	    return false;
	}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<form action="/control/product/list" method="post">
  <input id="currentPage" type="hidden" name="pageCtx.currentPage">
  
  <!-- ȷ����ҳʱҲִ�в�ѯ -->
  <input id="query" type="hidden" name="query" value="${query }">
  <input type="hidden" name="product.name" value="${product.name }"/>
  <input type="hidden" name="type.typeId" value="${type.typeId }"/>
  <input type="hidden" name="minBasePrice" value="${minBasePrice }"/>
  <input type="hidden" name="maxBasePrice" value="${maxBasePrice }"/>
  <input type="hidden" name="minSalePrice" value="${minSalePrice }"/>
  <input type="hidden" name="maxSalePrice" value="${maxSalePrice }"/>
  <input type="hidden" name="product.code" value="${product.code }"/>
  <input type="hidden" name="brand.brandId" value="${brand.brandId }"/>

  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="11"  bgcolor="6f8ac4" align="right">
    	<%@ include file="/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="7%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��ƷID</font></div></td>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
      <td width="5%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�޸�</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��Ʒ����</font></div></td>
      <td width="6%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
	  <td width="10%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��������</font></div></td>
	  <td width="7%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">�׼�</font></div></td>
	  <td width="7%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">���ۼ�</font></div></td>
	  <td width="6%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">����</font></div></td>
	  <td width="6%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">�Ƽ�</font></div></td>
	  <td width="12%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">ͼƬ</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${products}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> &nbsp;&nbsp;&nbsp;<INPUT TYPE="checkbox" NAME="productIds" value="${entry.productId}">${entry.productId }</td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.code }</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="/control/product/brand/simpleList?listVar=updateProduct&product.productId=${entry.productId }&brandId=${entry.brand.brandId}">
	  <img src="/images/edit.gif" width="15" height="16" border="0"></a></div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.name }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.clickCount }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.type.name }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.basePrice }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.salePrice }</div></td>
	  <td bgcolor="f5f5f5" align="center"><c:if test="${entry.visible}">����</c:if><c:if test="${!entry.visible}">ͣ��</c:if></td>
	  <td bgcolor="f5f5f5" align="center"><c:if test="${entry.commend}">�Ƽ�</c:if><c:if test="${!entry.commend}">--</c:if></td>
	  <td bgcolor="f5f5f5"> <div align="center"><a href="/control/product/style/list?product.productId=${entry.productId}">��ƷͼƬ����</a></div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="11" align="center">
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="8%">&nbsp;&nbsp;&nbsp;<INPUT TYPE="checkbox" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if>
             name="all" onclick="selectAll();"/>ȫѡ</td>
            <td width="92%">
              <input type="button" class="frm_btn" onClick="location.href='/control/product/brand/simpleList?listVar=addProduct'" value="��Ӳ�Ʒ"> &nbsp;&nbsp;
			  <input name="query" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if> type="button" class="frm_btn" id="query" onClick="location.href='/control/product/brand/simpleList?listVar=queryProduct'" value=" �� ѯ "> &nbsp;&nbsp;
              <input name="visible" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if> type="button"
               class="frm_btn" onClick="javascript:actionEvent('visible')" value=" �� �� "> &nbsp;&nbsp;
              <input name="disvisible" type="button" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if> class="frm_btn" 
              onClick="javascript:actionEvent('disvisible')" value=" �� �� "> &nbsp;&nbsp;
              <input name="commend" type="button" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if> class="frm_btn" 
              onClick="javascript:actionEvent('commend')" value=" �� �� "> &nbsp;&nbsp;
              <input name="uncommend" type="button" <c:if test="${fn:length(products)<1}">disabled="disabled"</c:if> class="frm_btn"
				onClick="javascript:actionEvent('uncommend')" value=" ���Ƽ� "> &nbsp;&nbsp;
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>