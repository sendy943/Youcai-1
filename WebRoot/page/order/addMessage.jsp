<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>��Ӷ�������</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	/*var message = document.forms[0].message;
	if(message.value.trim()=="") {
		alert("�������ݲ���Ϊ��");
		try{
			message.focus();
		}catch(e){}
		return false;
	}*/
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/order/addMsg" method="post" onsubmit="return checkfm(this)">
<input type="hidden" name="order.orderId" value="${param.orderId }"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">��Ӷ������ԣ�</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��������(100������)��</div></td>
      <td width="78%"> <textarea rows="5" cols="60" name="msg.content"></textarea>
        <font color="#FF0000">*</font></td>
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