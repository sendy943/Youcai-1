<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸����</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/js/jquery.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	if ($("#typeName").val().trim()==""){
		alert("������Ʋ���Ϊ�գ�");
		$("#typeName").focus();
		return false;
	}
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/control/product/type/update" method="post"  onsubmit="return checkfm(this)">
<br><input type="hidden" name="type.typeId" value="${param.typeId }">
    <input type="hidden" name="pageCtx.currentPage" value="${param.currentPage }">
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸����</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">������ƣ�</div></td>
      <td width="78%"> <input type="text" id="typeName" name="type.name" value="${param.name }" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��ע(100������)��</div></td>
      <td width="78%"> <input type="text" id="typeNote" name="type.note" value="${param.note }" size="80" maxlength="100"/>
        </td>
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