<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>����Ա��¼</title>
<link href="/core/css/css.css" rel="stylesheet" type="text/css">
<!--<base target="main"> -->
<style type="text/css">
<!--
.style2 {font-size: 12pt}
-->
</style>
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<script language="JavaScript">
<!--
function verifyForm(objForm){
	if (trim(objForm.username.value)==""){
		alert("�û�������Ϊ��!");
		objForm.username.focus();
		return false; 
	}
	if (trim(objForm.password.value)==""){
		alert("���벻��Ϊ��!");
		objForm.password.focus();
		return false; 
	}
	return true;
}
function locateparentwindow(){
	if (window.parent!=null && window.parent.document.URL!=document.URL){
		window.parent.location= document.URL; 
	}
}

//-->
</script>
</head>

<body onload="JavaScript:locateparentwindow()">
<form action="/core/employee/login" method="post" onsubmit="return verifyForm(this);">
  <TABLE align="center" cellSpacing=0 cellPadding=0 width=555 border=0 style="border-collapse: collapse" bordercolor="#111111">
    <TBODY>
      <TR>
        <TD width="588"><TABLE align="center" cellSpacing=0 cellPadding=0 width=558 border=0 style="border-collapse: collapse" bordercolor="#111111">
            <TBODY>
              <TR>
                <TD vAlign=top width="360" height="104">
                    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td colspan="2"><img src="/core/images/admin/Admin_Login1.gif" width="600" height="126"></td>
                      </tr>
                      <tr>
                        <td width="508" valign="top" background="/core/images/admin/Admin_Login2.gif"><table width="508" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="37" colspan="6">&nbsp;</td>
                            </tr>
                            <tr><td width="66">&nbsp;</td><td id="error" style="color:red;"><s:property value="errors.login[0]"/></td></tr>
                            <tr>
                              <td width="75" rowspan="2">&nbsp;</td>
                              <td width="126"><font color="#043BC9">�û����ƣ�</font></td>
                              <td width="39" rowspan="2">&nbsp;</td>
                              <td width="131"><font color="#043BC9">�û����룺</font></td>
                              <td width="34">&nbsp;</td>
                              <td width="103">&nbsp;</td>
                            </tr>
                            <tr>
                              <td><input type="text" name="username" onfocus="document.getElementById('error').style.display='none';" maxlength="30" size="30" value="" class="box1"></td>
                              <td><input type="password" name="password" maxlength="30" size="30" value="" class="box1"></td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                        </table></td>
                        <td><input type="image" name="submit" src="/core/images/admin/Admin_Login3.gif" style="width:92px; HEIGHT: 126px;"></td>
                      </tr>
                    </table>
                </TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</form>
</body>
</html>