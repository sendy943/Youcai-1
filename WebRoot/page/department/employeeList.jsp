<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>Ա����ʾ</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<script type="text/javascript" src="/js/jquery.js"></script>
	<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms[0].submit();
	}
</script>
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<form action="/control/employee/list" method="post">
  <input id="currentPage" type="hidden" name="pageCtx.currentPage">
  
  <!-- ȷ����ҳʱҲִ�в�ѯ -->
  <input type="hidden" name="query" value="${query }">
  <input type="hidden" name="departmentId" value="${departmentId }">
  <input type="hidden" name="employee.name" value="${employee.name }">
  <input type="hidden" name="employee.realname" value="${employee.realname }">
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="11" bgcolor="6f8ac4" align="right">
    	<%@ include file="/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="5%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�޸�</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�û���</font></div></td>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����Ȩ��</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
      <td width="5%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�Ա�</font></div></td>
      <td width="12%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��ϵ�绰</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�����ʼ�</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">���֤��</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��Ƭ</font></div></td>
      <td bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">��������</font></div></td>
      <td width="9%" bgcolor="6f8ac4"></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${employees}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">
      <c:if test="${entry.visible && !empty entry.department || entry.name == 'admin'}">
      <yc:permission privilege="update" module="employee">
      <a href="/control/employee/showUpdateUI?name=${entry.name}">
	  <img src="/images/edit.gif" width="15" height="16" border="0"></a></yc:permission></c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible && !empty entry.department}">
      <yc:permission privilege="privilegeSet" module="employee">
      <a href="/control/employee/showPrivilegeGroupSetUI?name=${entry.name}">����Ȩ��</a></yc:permission></c:if></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.realname}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.gender.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.phone}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.email}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.idCard.cardNo}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${!empty entry.empImagePath}"><img src="${entry.empImagePath}" width="80" border="0"></c:if></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.name != 'admin'}"><c:if test="${empty entry.department}"><font color="red">�ò����ѳ���</font></c:if>${entry.department.name}</c:if></div></td>
      <td bgcolor="f5f5f5"> <div align="center">
      <c:if test="${entry.name != 'admin'}">
      <c:if test="${entry.visible && !empty entry.department}">
      <yc:permission privilege="delete" module="employee">
      <a href="#" onclick="if(confirm('ȷ����ְ��')) location.href='/control/employee/leave?name=${entry.name}'">��־Ϊ��ְ</a>
      </yc:permission></c:if>
       <c:if test="${!entry.visible}"><font color="red">����ְ</font></c:if>
      </c:if>
      </div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="11" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="5%"></td>
              <td width="85%">
              <yc:permission privilege="add" module="employee">
              <input type="button" class="frm_btn" onClick="javascript:window.location.href='/control/employee/showAddUI'" value="���Ա��"> &nbsp;&nbsp;
              </yc:permission>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>