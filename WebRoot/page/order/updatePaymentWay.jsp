<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸Ķ�����֧����ʽ</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script language="JavaScript">
$(function(){
  for(i=1;i<=4;i++) {
    if($("#paymentWay").val()==$("#p"+i).val()) $("#p"+i).attr("checked", "checked");
  }
})
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/order/updatePaymentWay" method="post">
  <input type="hidden" name="order.orderId" value="${param.orderId }"/>
  <input type="hidden" id="paymentWay" value="${param.paymentWay }"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td > <font color="#FFFFFF">�޸Ķ�����֧����ʽ��</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td><input type="radio" id="p1" name="paymentWay" value="NET"/>����֧��</td>
    </tr>
    <c:if test="${param.deliverWay!='GENERALPOST' && param.deliverWay!='EMS' }">
    <tr bgcolor="f5f5f5"> 
      <td><input type="radio" id="p2" name="paymentWay" value="COD"/>��������</td>
    </tr></c:if>
    <tr bgcolor="f5f5f5"> 
      <td><input type="radio" id="p3" name="paymentWay" value="BANKREMITTANCE"/>���е��</td>
    </tr>
     <tr bgcolor="f5f5f5"> 
      <td><input type="radio" id="p4" name="paymentWay" value="POSTOFFICEREMITTANCE"/>�ʾֻ��</td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" name="SYS_SET" value=" ȷ �� " class="frm_btn">
        </div></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>