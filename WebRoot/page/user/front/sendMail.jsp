<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�в���-��������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
	<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<link href="/core/css/global/getpassword.css" rel="stylesheet" type="text/css"/>
<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
<!--
#errorMessage{padding:8px 0px 5px 25px;color:#009900}
-->
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
function validateForm(form){
    var username = document.getElementById("username").value;
	if(username==null || trim(username)==""){
		alert("��Ա������Ϊ��");
		document.getElementById("username").focus();
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
                <TD vAlign=top align=left width=10 bgColor=#ddddcc><IMG height=28  src="/core/images/login/az-tan-top-left-round-corner.gif" width=10 border=0></TD>
                <TD vAlign=bottom noWrap width="20%" bgColor=#ddddcc 
                  height=28><SPAN class=title>����������&nbsp;&nbsp;</SPAN></TD>
                <TD vAlign=bottom align=right width="79%" 
                bgColor=#ddddcc>&nbsp;</TD>
                <TD vAlign=top align=right width=10 bgColor=#ddddcc><IMG height=28 src="/core/images/login/az-tan-top-right-round-corner.gif" width=10 border=0></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
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
                        <form action="/front/user/xx" method="post" name="getp" onsubmit="javascript:return validateForm(this)">
                        <TABLE cellSpacing=4 cellPadding=4 width="100%" border=0>
                          <TBODY>
                          <TR align=left>
                            <TD class="font-error" colSpan=3></TD></TR>
                          <TR align=left>
                            <TD class="font14" colSpan=3>�����������𣿲����ż���ֻҪ3���Ϳ����������������룬�򵥷��㡣</TD>
                          </TR>
                          <TR align=left>
                            <TD colSpan=3><SPAN 
                              class="font-step">��һ����</SPAN><STRONG 
                              class="font14b">��������ע��ʱ��д�Ļ�Ա�����������</STRONG></TD></TR>
                          <TR align=left>
                            <TD class="font12b" align="right" width="27%">��Ա��</TD>
                            <TD width="39%"><INPUT type="text" id="username" maxLength="20" size="30" name="user.name"></TD>
                            <TD width="34%"><INPUT id="Image1" type="image" alt="����" src="/core/images/login/az-continue-arrow.gif" border=0 name=image1> </TD>
                          </TR>
                          <TR align=left>
                            <TD colSpan=3>
                              <HR class=dashes noShade SIZE=1>
                            </TD></TR>
                          <TR align=left>
                            <TD class=font9 colSpan=3>
                              <P class=font9> ��������������Ҳ���ʹ��ע��ʱ��E-mail��<A class=a-your-account href="/mapping/user/reg.htm">���鴴��һ�����ʻ�</A>��</P></TD></TR></TBODY></TABLE>
</form>
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="65%" bgColor=#ddddcc border=0 align="center">
        <TBODY>
        <TR vAlign=bottom>
          <TD align=left bgColor=#ddddcc height=10><IMG height=10 src="/core/images/login/az-tan-bottom-left-round-corner.gif" width=10 
            border=0></TD>
          <TD align=right bgColor=#ddddcc height=10><IMG height=10 src="/core/images/login/az-tan-bottom-right-round-corner.gif" width=10 
            border=0></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<jsp:include page="/page/share/Foot.jsp" />
  </body>
</html>
