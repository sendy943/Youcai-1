<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��Ʒ������</title>
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
    <form id="typeList" action="/core/control/product/type/list" method="post">
    <input id="currentPage" type="hidden" name="pageCtx.currentPage">
    
    <!-- ȷ����ҳʱҲִ�в�ѯ -->
    <input type="hidden" name="type.name" value="${type.name }">
    <input type="hidden" name="query" value="${query }">
    
    <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="6"  bgcolor="6f8ac4" align="right">
     <%@ include file="/page/share/fenye.jsp" %>
     </td></tr>
    <tr>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
      <td width="5%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�޸�</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��Ʒ�������</font></div></td>
	  <td width="10%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�����¼����</font></div></td>
	  <td width="15%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">��������</font></div></td>
	  <td nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��ע</font></div></td>
    </tr>
    <c:forEach items="${types}" var="type">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${type.typeId }</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="/core/page/product/updateProductType.jsp?typeId=${type.typeId }&name=${type.name }&note=${type.note }&currentPage=${pageCtx.currentPage }">
	  <img src="/core/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href='/core/control/product/type/list?parentId=${type.typeId }'>${type.name }</a>
      <c:if test="${fn:length(type.childTypes)>0 }"><font color="red">����${fn:length(type.childTypes) }�����ࣩ</font></c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center"><a href="/core/page/product/addProductType.jsp?parentId=${type.typeId }&parentName=${type.name }">���������</a></div></td>
	  <td bgcolor="f5f5f5" align="center">${type.parent.name }</td>
	  <td bgcolor="f5f5f5">${type.note }</td>
	</tr>
	</c:forEach>
	<tr> 
      <td bgcolor="f5f5f5" colspan="6" align="center">
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="5%"></td>
            <td width="85%">
              <input name="AddDic" type="button" class="frm_btn" id="AddDic" onClick="location.href='core/page/product/addProductType.jsp?parentId=${param.parentId }'" value="������"> &nbsp;&nbsp;
			  <input name="query" type="button" class="frm_btn" id="query" onClick="location.href='/core/page/product/queryProductType.jsp'" value=" �� ѯ "> &nbsp;&nbsp;
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
  </body>
</html>
