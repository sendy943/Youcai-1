<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>ע���û��б�</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<script type="text/javascript" src="/js/jquery.js"></script>
	<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms[0].submit();
	}
	
	function selectAll(){
      var ids = document.getElementsByName("names");
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
		if(hasSelected(form.all, form.names)){
			form.action="/control/user/" + action;
			$("#currentPage").remove();
			$("#query").remove();
			form.submit();
		}else{
			alert("��ѡ��Ҫ�����ļ�¼");
		}
	}
	
	/*
	 * �ж��Ƿ�ѡ���˼�¼
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
<form action="/control/user/list" method="post">
<input id="currentPage" type="hidden" name="pageCtx.currentPage">
  
  <!-- ȷ����ҳʱҲִ�в�ѯ -->
  <input id="query" type="hidden" name="query" value="${query }">
  <input type="hidden" name="user.realname" value="${user.realname }"/>
  <input type="hidden" name="user.name" value="${user.name }"/>
  <input type="hidden" name="user.email" value="${user.email }"/>
  
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="7" bgcolor="6f8ac4" align="right">
    	<%@ include file="/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">ѡ��</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�û���</font></div></td>
      <td width="15%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��ʵ����</font></div></td>
	  <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�Ա�</font></div></td>
	  <td width="22%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��������</font></div></td>
	  <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">ע��ʱ��</font></div></td>
	  <td width="7%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">״̬</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${users}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center"><input type="checkbox" name="names" value="${entry.name}"></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.realname }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.gender.name }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.email }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.regTime }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible}">����</c:if><c:if test="${!entry.visible}">����</c:if></div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr>
      <td bgcolor="f5f5f5" colspan="7" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="10%"><input type="checkbox" onclick="javascript:selectAll();" name="all">ȫѡ</td>
              <td width="85%">
<input type="button" value=" �� �� " class="frm_btn" onclick="javascript:actionEvent('delete')">&nbsp;&nbsp;
<input type="button" value=" �� �� " class="frm_btn" onclick="javascript:actionEvent('enable')">
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>