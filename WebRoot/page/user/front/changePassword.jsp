<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�в���-��������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
<link href="/css/global/header01.css" rel="stylesheet" type="text/css"/>
<link href="/css/global/getpassword.css" rel="stylesheet" type="text/css"/>
<SCRIPT LANGUAGE="JavaScript">
<!--
function validateForm(form){
	var password = form.password.value;
	var confirm_password = form.confirm_password.value;
	if(password==null || trim(password)==""){
		alert("�����벻��Ϊ��");
		form.password.focus();
		return false;
	}
	if(password.length<6 || password.length>16){
		alert("����ĳ��Ȳ���ȷ,��ȷ�ĳ���Ϊ6-16λ�ַ�");
		form.password.focus();
		return false;
	}
	if(password!=confirm_password){
		alert("������������벻һ�£����������롣");
		form.password.focus();
		return false;
	}
	return true;
}
//-->
</SCRIPT>

  </head>
  
  <body>
    <jsp:include page="/page/share/Head.jsp"/>
<TABLE cellSpacing=15 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=bottom><NOBR><A class=ablue2  href="/customer/center.go">�ҵ��ʻ�</A></NOBR><SPAN class=important> &gt; </SPAN><NOBR class=font-title>��������</NOBR></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=15 cellPadding=0 width="100%" border=0 align="center">
  <TBODY>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="65%" border=0 align="center">
        <TBODY>
        <TR>
          <TD vAlign=top width="99%" colSpan=4>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left width=10 bgColor=#ddddcc><IMG height=28  src="/images/login/az-tan-top-left-round-corner.gif" width=10 border=0></TD>
                <TD vAlign=bottom noWrap width="20%" bgColor=#ddddcc 
                  height=28><SPAN class=title>����������&nbsp;&nbsp;</SPAN></TD>
                <TD vAlign=bottom align=right width="79%" 
                bgColor=#ddddcc>&nbsp;</TD>
                <TD vAlign=top align=right width=10 bgColor=#ddddcc><IMG height=28 src="/images/login/az-tan-top-right-round-corner.gif" width=10 border=0></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE id="" cellSpacing=0 cellPadding=0 width="65%" bgColor=#ddddcc 
      border=0 align="center">
        <TBODY>
        <TR bgColor=#ddddcc>
          <TD vAlign=top bgColor=#ddddcc>
            <TABLE cellSpacing=3 cellPadding=0 width="100%" align=center 
            bgColor=#ddddcc border=0>
              <TBODY>
              <TR>
                <TD vAlign=top bgColor=#ffffff>
                  <TABLE class=font9 height=200 cellSpacing=10 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <form action="/front/user/changePassword" method="post" onsubmit="javascript:return validateForm(this)">
						<INPUT TYPE="hidden" NAME="method" value="changepassword">
						<INPUT TYPE="hidden" NAME="username" value="${username}">
						<INPUT TYPE="hidden" NAME="validateCode" value="${validateCode }">
                              <table border="0" cellpadding="4" cellspacing="4" width="100%">
                                <tbody>
                                <tr align="left">
                                  <td colspan="3" class="font-error"></td>
                                </tr>
                                <tr align="left">
                                  <td colspan="3"><p><span class="font-step">���һ����</span><span class="font14b">��������������</span></p></td>
                                </tr>
                                <tr align="left">
                                  <td colspan="3" class="font9">�����¶�������ѯ����״̬���ʻ���Ϣʱ�������������롣</td>
                                </tr>
                                <tr align="left">
                                  <td class="font12b" align="right" width="21%">������������</td>
                                  <td width="31%"><input type="password" name="password" maxlength="16" size="30"></td>
                                  <td class="font9" width="48%">����Ҫ����Ӣ����ĸ��a-z��Сд���ɣ�������������(0-9)����ҳ���Ϊ6-16λ�ַ�</td>
                                </tr>
                                <tr align="left">
                                  <td class="font12b" align="right">��������һ��</td>
                                  <td><input type="password" name="confirm_password" maxlength="16" size="30"></td>
                                  
                                </tr>
                                <tr align="left">
                                  <td>&nbsp;</td>
                                  <td align="right">
                                  	<input type="image" alt="���" src="/images/login/az-finish.gif" border=0 name="image1" ID=Image1/>
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                  </tbody></table>
</form>
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="65%" bgColor=#ddddcc border=0 align="center">
        <TBODY>
        <TR vAlign=bottom>
          <TD align=left bgColor=#ddddcc height=10><IMG height=10 src="/images/login/az-tan-bottom-left-round-corner.gif" width=10 
            border=0></TD>
          <TD align=right bgColor=#ddddcc height=10><IMG height=10 src="/images/login/az-tan-bottom-right-round-corner.gif" width=10 
            border=0></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<jsp:include page="/page/share/Foot.jsp" />
  </body>
</html>
