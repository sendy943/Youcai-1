<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�в���-�������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<LINK href="/core/css/new_cart.css" rel="stylesheet" type="text/css">
<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>

  </head>
  
  <body onload='$("#index").css("background", "");'>
    <jsp:include page="/page/share/Head.jsp"/>
<BR>
<h1>������:${order.orderId }${param.orderId },Ӧ�����:${order.payableFee }${param.payableFee }Ԫ</h1>
<br>
��ѡ��ĸ��ʽΪ"����֧��",������Ϳ��Խ���<a href="#"><font color="red">����֧��</font></a>.
<br>ȥ<a href="/core/page/shopping/myOrder.jsp">�ҵ��˻�</a>�鿴������ϸ<br/>
<jsp:include page="/page/share/Foot.jsp" />
  </body>
</html>
