<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸Ķ�������ϵ����Ϣ</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/js/jquery.js"></SCRIPT>
<script language="JavaScript">
$(function(){
  for(i=1;i<=2;i++) {
    if($("#buyerGender").val()==$("#bg"+i).val()) $("#bg"+i).attr("checked", "checked");
  }
})
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/control/order/updateBuyer" method="post">
  <input type="hidden" name="order.orderId" value="${param.orderId }"/>
  <input type="hidden" name="buyer.buyerId" value="${param.buyerId }"/>
  <input type="hidden" id="buyerGender" value="${param.gender }"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸Ķ�������ϵ����Ϣ��</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��ϵ�����ƣ�</div></td>
      <td width="78%"> <input type="text" name="buyer.buyerName" value="${param.name }" size="20" maxlength="30"/>
        <input type="radio" id="bg1" name="buyerGender" value="MAN">����
        <input type="radio" id="bg2" name="buyerGender" value="WOMEN">Ůʿ
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��ϵ�˵�ַ��</div></td>
      <td width="78%"> <input type="text" name="buyer.address" value="${param.address }" size="50" maxlength="100"/>
        <font color="#FF0000">*</font></td>
    </tr>
        <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ʱࣺ</div></td>
      <td width="78%"> <input type="text" name="buyer.postalcode" value="${param.postalcode }" size="8" maxlength="6"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">������</div></td>
      <td width="78%"> <input type="text" name="buyer.phone" value="${param.phone }" size="20" maxlength="20"/></td>
    </tr>
        <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ֻ���</div></td>
      <td width="78%"><input type="text" name="buyer.mobile" value="${param.mobile }" size="20" maxlength="11"/></td>
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