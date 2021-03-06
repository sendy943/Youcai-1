<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<oscache:flush scope="application" />   <!-- 清空页面缓存 -->
<html>
<head>
<title>产品样式显示</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<script type="text/javascript" src="/core/js/jquery.js"></script>
	<script language="JavaScript">
<!--
	function selectAll(){
      var ids = document.getElementsByName("styleIds");
      if(document.forms[0].all.checked){
        for(i=0; i<ids.length; i++){
          ids[i].checked = "checked";
        }
      }else{
        for(i=0; i<ids.length; i++){
          ids[i].checked = "";
        }
      }
    }
	
	function actionEvent(action){ 
		var form = document.forms[0];
		if(hasSelected(form.all, form.styleIds)){
			form.action="/control/product/style/" + action;
			form.submit();
		}else{
			alert("请选择要操作的记录");
		}
	}
	
	/*
	 * 判断是否选择了记录
     */
	function hasSelected(allobj,items){
	    var state = allobj.checked;
	    if(items.length){
	    	for(var i=0;i<items.length;i++){
	    		if(items[i].checked) return true;
	    	}
	    }else{
	    	if(items.checked) return true;
	    }
	    return false;
	}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<form action="" method="post">
  <input type="hidden" name="product.productId" value="${product.productId }">
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr>
      <td width="8%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">选择</font></div></td>
      <td width="8%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">修改</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">颜色</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">在售状态</font></div></td>
	  <td width="37%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">产品图片</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${styles}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center"><INPUT TYPE="checkbox" NAME="styleIds" value="${entry.styleId}"/>${entry.styleId}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="/core/page/product/updateProductStyle.jsp?styleId=${entry.styleId }&productId=${product.productId }&name=${entry.name }&imagePath=${entry.productImagePath }">
	  <img src="/core/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible}">在售</c:if><c:if test="${!entry.visible}">停售</c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center"><img src="/core${entry.productImagePath}" width="50"></div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="11" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="8%">&nbsp;&nbsp;&nbsp;<INPUT TYPE="checkbox" <c:if test="${fn:length(styles)<1}">disabled="disabled"</c:if>
             name="all" onclick="selectAll();"/>全选</td>
              <td width="85%">
              <input type="button" class="frm_btn" onClick="javascript:window.location.href='/core/page/product/addProductStyle.jsp?productId=${product.productId }'" value="添加产品图片"> &nbsp;&nbsp;
              <input name="visible" type="button"
              <c:if test="${fn:length(styles)<1}">disabled="disabled"</c:if>
               class="frm_btn" onClick="javascript:actionEvent('visible')" value=" 上 架 "> &nbsp;&nbsp;
              <input name="disable" type="button" class="frm_btn" 
              <c:if test="${fn:length(styles)<1}">disabled="disabled"</c:if>
              onClick="javascript:actionEvent('disvisible')" value=" 下 架 "> &nbsp;&nbsp;
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>