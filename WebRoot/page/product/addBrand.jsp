<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>��Ӳ�ƷƷ��</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	if ($("#brandName").val().trim()==""){
		alert("Ʒ�����Ʋ���Ϊ�գ�");
		$("#brandName").focus();
		return false;
	}
	var logoFile = $("#brandLogo").val();
	if(logoFile.trim()!=""){
		var ext = logoFile.substring(logofile.length-3).toLowerCase();
		if (ext!="jpg" && ext!="gif" && ext!="bmp" && ext!="png"){
			alert("ֻ�����ϴ�gif��jpg��bmp��png��");
			return false; 
		}
	} //else {
	   // alert("���ϴ�Logo");
		//return false;
	//}
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/product/brand/add" method="post" enctype="multipart/form-data" onsubmit="return checkfm(this)">
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">���Ʒ�ƣ�</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">Ʒ�����ƣ�</div></td>
      <td width="78%"> <input type="text" id="brandName" name="brand.name" size="50" maxlength="40"/>
        <font color="#FF0000">*</font></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">LogoͼƬ��</div></td>
      <td width="78%"> <input type="file" id="brandLogo" name="fileCtx.file" size="50">
      ���ļ���С���ܳ���10M��<br>
      ��ͼƬ�Կ�ȵȱ���ѹ����������ѹ����Ŀ�ȣ�<input type="text" name="fileCtx.width" value="100" /></td>   <!-- ͼƬ���ƺ�����ʱ�����룬������Ӣ�� -->
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" name="SYS_SET" value=" ȷ �� " class="frm_btn">
          <input type="reset" name="" value=" �� �� " class="frm_btn">
        </div></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>