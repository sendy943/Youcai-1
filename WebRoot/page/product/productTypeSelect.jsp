<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title> ���ѡ�� </title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/js/jquery.js"></SCRIPT>

<SCRIPT language=JavaScript>
function checkIt(){
	var objForm = document.forms[0];
	var openerDoc = opener.document;
	if (openerDoc){
		openerDoc.getElementById("typeId").value = objForm.dicId.value;
		openerDoc.getElementById("typeName").value = objForm.dicName.value;
	}
	window.close();
}
function getDicName(dicId,strDicName){
	var objForm = document.forms[0];
	objForm.dicId.value = dicId;
	objForm.dicName.value = strDicName;
}
</SCRIPT>
</head>

<body>
<div style="text-align:center;">
��Ʒ����б�,��ѡ�����:<br>
<c:set var="menuOut" value=""/>
<c:forEach items="${menuTypes}" var="menu">
	<c:set var="menuOut" value="&gt;&gt;<a href='/control/product/selectType?type.typeId=${menu.typeId}'>${menu.name}</a>${menuOut}"/>
</c:forEach>
<br>����: <a href="/control/product/selectType?type.typeId=">����Ŀ¼</a><c:out value="${menuOut}" escapeXml="false"/>
<form method="post" name="main" action="">
  <input type="hidden" name="dicId">
  <input type="hidden" name="dicName">
  <table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr><td id="typecontent" align="center">
	    <c:forEach items="${types}" var="type" varStatus="loop">		
		  <c:if test="${fn:length(type.childTypes)>0}">
		  &nbsp;&nbsp;&nbsp;<a href="/control/product/selectType?type.typeId=${type.typeId}"><b>${type.name}</b></a></c:if>
		  <c:if test="${fn:length(type.childTypes)==0}"> <INPUT TYPE="radio" NAME="type" onclick="getDicName('${type.typeId}','${type.name}')">${type.name}</c:if>
	    <br></c:forEach>
	</td></tr>
	<tr><td colspan="2" align="center">
	  <input type='button' name='create' value=" ȷ �� " onClick="javascript:checkIt()">
	  <input type='button' name="cancel" onClick="window.close()" value=" ȡ �� "> 
    </td></tr>
  </table>
</form>
</div>
</body>
</html>