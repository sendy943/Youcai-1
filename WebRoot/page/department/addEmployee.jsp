<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>���Ա��</title>
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="/js/ajaxUtils.js"></SCRIPT>
<script language="JavaScript">
function checkName() {
    var name = trim($("#name").val());
    if(name==""){
      $("#checkName").html("�û�������Ϊ��");
	  return false;
    }else if(byteLength(name)<4 || byteLength(name)>20){
	  $("#checkName").html("�û���ӦΪ4-20λ�ַ�");
	  return false;
	}else {
	  
	  /********************************************/
	  $("#checkName").html("�����û����Ƿ��ѱ�ע��...");
	  Ajax.sendRequest("POST", "/control/employee/checkName?name=" + $("#name").val(), null, callback);
      if($("#checkName").text()=="���û�����ע��") return false;
      else return true;
      
	}
	function callback(data){
	  var msg = data.text;
	  if(msg=="��ϲ�����û�����ע��") $("#checkName").css("color", "green");
	  $("#checkName").html(msg);
	}
  }
  
  function checkPass() {
    var password = trim($("#password").val());
    if(password==""){
      $("#checkPass").html("���벻��Ϊ��");
	  return false;
    }else if(byteLength(password)<6 || byteLength(password)>16){
	  $("#checkPass").html("���볤��ӦΪ6-20λ");
	  return false;
	}else{
	  $("#checkPass").html("");
	  return true;
	}
  }
  
  function checkRepass() {
    var password = trim($("#password").val());
    if(checkPass()&&trim($("#repassword").val())!=""&&password!=trim($("#repassword").val())){
	  $("#checkRepass").html("������������벻һ��");
	  return false;
	}else{
	  $("#checkRepass").html("");
	  return true;
	}
  }

function Formfield(id, label, minlen, maxlen){
	this.id=id;
	this.label=label;
	this.minlen=minlen;
	this.maxlen=maxlen;
}
function checkfm(form){
	var list  = new Array(
	  new Formfield("realname", "Ա������", 2, 10),new Formfield("cardNo", "���֤����", 18, 18)
	  ,new Formfield("birthday", "���֤��������", 10, 10),new Formfield("address", "���֤��ַ", 2, 50),new Formfield("phone", "��ϵ�绰", 11, 18));
	for(var i=0;i<list.length;i++){
	    var fieldobj = $("#"+list[i].id);
	    objvalue = trim(fieldobj.val());
		if(objvalue==""){
			alert(list[i].label+ "����Ϊ��");
			if(fieldobj.type!="hidden" && fieldobj.focus()) fieldobj.focus();
			return false;
		}else if(byteLength(objvalue)<list[i].minlen || byteLength(objvalue)>list[i].maxlen){
			if(list[i].minlen != list[i].maxlen) alert(list[i].label+"�ĳ��ȱ�����"+list[i].minlen+"��"+list[i].maxlen+"֮��");
			else alert(list[i].label+"�ĳ��ȱ���Ϊ"+list[i].minlen+"λ");
			return false;
		}
	}
	
	var imagefile = $("#empImagePath").val();
	if(imagefile!=""){
	  var ext = imagefile.substring(imagefile.length-3).toLowerCase();
	  if (ext!="jpg" && ext!="gif" && ext!="bmp" && ext!="png"){
		alert("ֻ�����ϴ�gif��jpg��bmp��png��");
		return false; 
	  }
	}
	
	if($("input[name='departmentId']:checked").length==0){
	  alert('��ѡ����');
	  return false;
	}
	
    return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/control/employee/add" method="post" enctype="multipart/form-data" onsubmit="return checkfm(this);">
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">���Ա����</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��¼�˺ţ�</div></td>
      <td width="78%"> <input type="text" id="name" name="employee.name" size="32" maxlength="32" onblur="checkName();"/>(�˺ŵĳ��ȱ�����4��20֮��,����������)<font color="#FF0000">*</font>
       <div id="checkName" style="color:red;"></div></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��¼���룺</div></td>
      <td width="78%"> <input type="password" id="password" name="employee.password" onblur="checkPass()" size="32" maxlength="32"/>(����ĳ��ȱ�����6��20֮��,����������)
        <font color="#FF0000">*</font><div id="checkPass" style="color:red;"></div></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�ٴ������¼���룺</div></td>
      <td width="78%"> <input type="password" id="repassword" onblur="checkRepass()" size="32" maxlength="32"/>
        <font color="#FF0000">*</font><div id="checkRepass" style="color:red;"></div></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">Ա��������</div></td>
      <td width="78%"> <input type="text" id="realname" name="employee.realname" size="10" maxlength="10"/>
        <font color="#FF0000">*</font>Ա���������ȱ�����2��10֮��</td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�Ա�</div></td>
      <td width="78%"> <input type="radio" name="gender" value="MAN">��
      <input type="radio" name="gender" value="WOMEN">Ů</td>
    </tr> 
	<tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">Ա����Ƭ��</div></td>
      <td width="78%"> <input type="file" id="empImagePath" name="fileCtx.file" size="50"><br>
      ��ͼƬ�Կ�ȵȱ���ѹ����������ѹ����Ŀ�ȣ�Ĭ��160px����<input type="text" size="4" name="fileCtx.width" value="160" />
      </td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">���֤���룺</div></td>
      <td width="78%"> <input type="text" id="cardNo" name="idCard.cardNo" size="20" maxlength="18"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">���֤�������ڣ�</div></td>
      <td width="78%"> <input type="text" id="birthday" name="idCard.birthday" size="20" maxlength="18"/>
        <font color="#FF0000">*</font>��ʽ��1989-03-09</td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">���֤��ַ��</div></td>
      <td width="78%"> <input type="text" id="address" name="idCard.address" size="60" maxlength="100"/>
        <font color="#FF0000">*</font></td>
    </tr>  
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��ϵ�绰��</div></td>
      <td width="78%"> <input type="text" id="phone" name="employee.phone" size="20" maxlength="18"/><font color="#FF0000">*</font></td>
    </tr> 
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�����ʼ���</div></td>
      <td width="78%"> <input type="text" name="employee.email" size="20" maxlength="18"/></td>
    </tr> 
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">ѧ����</div></td>
      <td width="78%"> <input type="text" name="employee.degree" size="10" maxlength="5"/></td>
    </tr>
     <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��ҵԺУ��</div></td>
      <td width="78%"> <input type="text" name="employee.school" size="20" maxlength="20"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">���ڲ��ţ�</div></td>
      <td><!-- ÿ8������,��<br>���з��� -->
      <c:forEach items="${departments}" var="department" varStatus="statu">      
      	<input type="radio" name="departmentId" value="${department.departmentId}">${department.name}	
      	<c:if test="${statu.count%8==0}"><br></c:if>
      </c:forEach>
      </td>
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