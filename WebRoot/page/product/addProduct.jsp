<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>��Ӳ�Ʒ</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<script>
function Formfield(id, label){
	this.id=id;
	this.label=label;
}
function verifyForm(){
	var list  = new Array(new Formfield("name", "��Ʒ����"),
	new Formfield("typeName", "��Ʒ���"),
	new Formfield("basePrice", "��Ʒ�׼�"),new Formfield("marketPrice", "��Ʒ�г���"),
	new Formfield("salePrice", "��Ʒ���ۼ�"),//new Formfield("description", "��Ʒ���"),
	new Formfield("styleName", "��ƷͼƬ����ʽ"),new Formfield("productImagePath", "��ƷͼƬ"));
	for(var i=0;i<list.length;i++){
	    var fieldobj = $("#"+list[i].id);
		if(trim(fieldobj.val())==""){
			alert(list[i].label+ "����Ϊ��");
			if(fieldobj.type!="hidden" && fieldobj.focus()) fieldobj.focus();
			return false;
		}
	}
	var imagefile = $("#productImagePath").val();
	var ext = imagefile.substring(imagefile.length-3).toLowerCase();
	if (ext!="jpg" && ext!="gif" && ext!="bmp" && ext!="png"){
		alert("ֻ�����ϴ�gif��jpg��bmp��png��");
		return false; 
	}
    return true;
}

$(function(){
  $("#confirm").click(function(){
    if (verifyForm()){
      document.forms[0].submit();
    } 
  });
});

function change(index) {
  var brandId = $("#brandsSelect").val();
  $("#brandId").val(brandId);
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="fm" action="/core/control/product/add" enctype="multipart/form-data" method="post">
  <input type="hidden" id="typeId" name="type.typeId"/>
  <input type="hidden" id="brandId" name="brand.brandId"/>
  <table width="98%" border="0" cellspacing="1" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"> 
      <td colspan="2" ><font color="#FFFFFF">��Ӳ�Ʒ��</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��Ʒ����  ��</div></td>
      <td width="75%"> <input type="text" id="name" name="product.name" size="50" maxlength="40"/><font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��Ʒ���</div></td>
      <td width="75%"> <input type="text" id="typeName" name="type.name" disabled size="30"/><font color="#FF0000">*</font> 
        <input type="button" name="select" value="ѡ��..." onClick="winOpen('/core/control/product/selectType?type.typeId=', 'select type', 200, 400)">
        (<a href="/core/control/product/type/list" target="_blank">��Ӳ�Ʒ���</a>)
      </td>                                                                                                <!-- ?type.typeId=  ��ֹ��ָ�� -->
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��(�ɹ�)�� ��</div></td>
      <td width="75%"> <input type="text" id="basePrice" name="product.basePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>Ԫ <font color="#FF0000">*</font></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">�г��� ��</div></td>
      <td width="75%"> <input type="text" id="marketPrice" name="product.marketPrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>Ԫ <font color="#FF0000">*</font></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">���ۼ� ��</div></td>
      <td width="75%"> <input type="text" id="salePrice" name="product.salePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>Ԫ <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">���� ��</div></td>
      <td width="75%"> <input type="text" id="code" name="product.code" size="20" maxlength="30"/>(ע:�������ṩ�ı��ڲ�Ʒ���ҵı��)</td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right"><font color="#FF0000">*</font>��ƷͼƬ ��</div></td>
      <td width="75%"> ��ɫ��<input type="text" id="styleName" name="style.name" size="10">
      ͼƬ<input type="file" id="productImagePath" name="fileCtx.file" size="30">
      ѹ��ͼƬ��С��Ĭ��160px��<input type="text" size="4" name="fileCtx.width" value="160" /></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">Ʒ�� ��</div></td>
      <td width="75%"> 
        <select name="brands" style="width:130px" id="brandsSelect" onchange="change(this.selectedIndex);"> 
          <option value="0" selected>--��ѡ��--</option>
          <c:forEach var="brand" items="${brands}">
          <option value="${brand.brandId}">${brand.name}</option>
          </c:forEach>
        </select> 
      (<a href="/core/control/product/brand/list" target="_blank">���Ʒ��</a>)</td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">����˵�� ��</div></td>
      <td width="75%"> <input type="text" id="buyExplain" name="product.buyExplain" size="35" maxlength="30" /></td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%" valign="top"> <div align="right">��Ʒ���<font color="#FF0000">*</font> ��</div></td>
      <td width="75%"><!-- 
      <textarea id="description" name="product.description" cols="80" rows="12"></textarea>
       -->
      <FCK:editor instanceName="product.description" basePath="/fckeditor" value="" width="70%" height="280px;"></FCK:editor>
      </td>
	</tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="button" id="confirm" name="Add" value=" ȷ �� " class="frm_btn">
          &nbsp;&nbsp;<input type="button" name="Button" value=" �� �� " class="frm_btn" onclick="javascript:history.back()">
        </div></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>