<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'brandList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<script type="text/javascript" src="/core/js/jquery.js"></script>
	<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms[0].submit();
	}
//-->
</script>
</head>
  
<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<form action="/core/control/product/brand/list" method="post">
  <input id="currentPage" type="hidden" name="pageCtx.currentPage">
  
  <!-- ȷ����ҳʱҲִ�в�ѯ -->
  <input type="hidden" name="query" value="${query }">
  <input type="hidden" name="brand.name" value="${brand.name }">
  
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="4" bgcolor="6f8ac4" align="right">
    	<%@ include file="/page/share/fenye.jsp" %> 
   </td></tr>
    <tr>
      <td width="30%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
	  <td width="50%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">Logo</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${brands}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${entry.brandId}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.name}</div>
        <div align="right"><a href="/core/page/product/updateBrandName.jsp?brandId=${entry.brandId }&name=${entry.name }">
	    <img src="/core/images/edit.gif" width="15" height="16" border="0"></a></div></td>
	  <td bgcolor="f5f5f5"> <div align="center">
	    <c:if test="${empty entry.logoPath}">û��logo</c:if>
	    <c:if test="${!empty entry.logoPath}"><img src="${entry.logoPath }" width="36"></c:if>
	    <a href="/core/page/product/updateBrandLogo.jsp?brandId=${entry.brandId }&logoPath=${entry.logoPath }">
	    <img src="/core/images/edit.gif" width="15" height="16" border="0"></a></div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="4" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="5%"></td>
              <td width="85%">
              <input type="button" class="frm_btn" onClick="location.href='/core/page/product/addBrand.jsp'" value="���Ʒ��"> &nbsp;&nbsp;
			  <input type="button" <c:if test="${fn:length(brands)<1}">disabled="disabled"</c:if> class="frm_btn" onClick="location.href='/core/page/product/queryBrand.jsp'" value=" �� ѯ "> &nbsp;&nbsp;
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
