<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸Ķ�����������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script language="JavaScript">
$(function(){
  for(i=1;i<=2;i++) {
    if($("#acceptorGender").val()==$("#ag"+i).val()) $("#ag"+i).attr("checked", "checked");
  }
})
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/order/updateAcceptor" method="post">
  <input type="hidden" name="order.orderId" value="${param.orderId }"/>
  <input type="hidden" name="acceptor.acceptorId" value="${param.acceptorId }"/>
  <input type="hidden" id="acceptorGender" value="${param.gender }"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸Ķ�����������Ϣ��</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ռ������ƣ�</div></td>
      <td width="78%"> <input type="text" name="acceptor.acceptorName" value="${param.name }" size="20" maxlength="30"/>
        <input type="radio" id="ag1" name="acceptorGender" value="MAN">����
        <input type="radio" id="ag2" name="acceptorGender" value="WOMEN">Ůʿ
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ջ��˵�ַ��</div></td>
      <td width="78%"> <input type="text" name="acceptor.address" value="${param.address }" size="50" maxlength="100"/>
        <font color="#FF0000">*</font></td>
    </tr>
        <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ʱࣺ</div></td>
      <td width="78%"> <input type="text" name="acceptor.postalcode" value="${param.postalcode }" size="8" maxlength="6"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�������䣺</div></td>
      <td width="78%"> <input type="text" name="acceptor.email" value="${param.email }" size="20" maxlength="50"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">������</div></td>
      <td width="78%"> <input type="text" name="acceptor.phone" value="${param.phone }" size="20" maxlength="20"/></td>
    </tr>
        <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ֻ���</div></td>
      <td width="78%"> <input type="text" name="acceptor.mobile" value="${param.mobile }" size="20" maxlength="11"/></td>
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