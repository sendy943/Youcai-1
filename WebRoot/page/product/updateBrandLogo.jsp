<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸Ĳ�ƷƷ��</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	if ($("#brandLogo").val().trim()==""){
		alert("���ϴ�Logo");
		return false;
	}
	var logoFile = $("#brandLogo").val();
	if(logoFile.trim()!=""){
		var ext = logoFile.substring(logofile.length-3).toLowerCase();
		if (ext!="jpg" && ext!="gif" && ext!="bmp" && ext!="png"){
			alert("ֻ�����ϴ�gif��jpg��bmp��png��");
			return false; 
		}
	}
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/product/brand/updateLogo" method="post" enctype="multipart/form-data" onsubmit="return checkfm(this)">
<input type="hidden" name="brand.brandId" value="${param.brandId }">
<br>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸�Ʒ�ƣ�</font></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">LogoͼƬ���ļ���С���ܳ���10M����</div></td>
      <td width="78%"> <input type="file" id="brandLogo" name="fileCtx.file" size="50"><font color="#FF0000">*</font><br/>
      ��ͼƬ�Կ�ȵȱ���ѹ����������ѹ����Ŀ�ȣ�<input type="text" name="fileCtx.width" value="100" /><br>
     <c:if test="${!empty param.logoPath}">ԭLOGOͼƬ��<img src="${param.logoPath}" width="100">
     </c:if> </td>
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