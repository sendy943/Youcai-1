<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>����ѯ</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<script type="text/javascript" src="/core/js/jquery.js"></script>
<script language="JavaScript">
function checkfm(form){
	if ($("#name").val().trim()==""){
		alert("������Ʋ���Ϊ�գ�");
		$("#name").focus();
		return false;
	}	
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/product/type/list" method="post"  onsubmit="return checkfm(this)">
  <input type="hidden" name="query" value="true">
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"> <font color="#FFFFFF">��ѯ���</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">������ƣ�</div></td>
      <td width="78%"> <input type="text" id="name" name="type.name" size="50" maxlength="50"/>
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