<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>��ѯ����</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/control/order/list" method="post" onsubmit="return checkfm(this)">
<input type="hidden" name="query" value="true"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">��ѯ������</font></td>
    </tr>
     <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�����ţ�</div></td>
      <td width="78%"> <input type="text" name="order.orderId" size="20" maxlength="16"/></td>
    </tr>
   <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">����״̬��</div></td>
      <td width="78%"><select name="order.state">
        <option value="">=====ȫ��״̬=====</option>
      	<option value="CANCEL">��ȡ��</option>
      	<option value="WAITCONFIRM">�����</option>
      	<option value="WAITPAYMENT">�ȴ�����</option>
      	<option value="ADMEASUREPRODUCT">�������</option>
      	<option value="WAITDELIVER">�ȴ�����</option>
      	<option value="DELIVERED">�ѷ���</option>
      	<option value="RECEIVED">���ջ�</option>
      </select></td>
    </tr> 
   <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�û�����</div></td>
      <td width="78%"> <input type="text" name="order.user.name" size="20" maxlength="20"/></td>
    </tr> 
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ջ������ƣ�</div></td>
      <td width="78%"> <input type="text" name="acceptor.acceptorName" size="20" maxlength="30"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">������������</div></td>
      <td width="78%"> <input type="text" name="buyer.buyerName" size="20" maxlength="10"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" name="SYS_SET" value=" �� ѯ " class="frm_btn">
        </div></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>