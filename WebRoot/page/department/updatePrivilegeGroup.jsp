<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸�Ȩ����</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	if (trim(form.name.value)==""){
		alert("Ȩ�������Ʋ���Ϊ�գ�");
		form.name.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/privilegegroup/update" method="post" onsubmit="return checkfm(this)">
<input type="hidden" name="groupId" value="${groupId }"/>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸�Ȩ���飺</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">Ȩ�������ƣ�</div></td>
      <td width="78%"> <input type="text" name="name" value="${privilegeGroup.name }" size="20" maxlength="20"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">ѡ��Ȩ�ޣ�</div></td>
      <td width="78%"> <c:forEach items="${privileges}" var="privilege" varStatus="statu">
		<input type="checkbox" name="ids" value="${privilege.id.module},${privilege.id.privilege}"
		<c:forEach items="${selectedPrivileges}" var="sp"><c:if test="${sp==privilege}">checked</c:if></c:forEach>
		>${privilege.name}��<c:if test="${statu.count%4==0}"><br></c:if>
	  </c:forEach></td>
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