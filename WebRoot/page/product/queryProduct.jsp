<%@ page pageEncoding="gbk" %>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>��ѯ��Ʒ</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script type="text/javascript">
function change(index) {
  var brandId = $("#brandsSelect").val();
  $("#brandId").val(brandId);
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="/core/control/product/list" method="post">
<input type="hidden" id="typeId" name="type.typeId"/>
<input type="hidden" id="brandId" name="brand.brandId"/>
<input type="hidden" name="query" value="true">
  <table width="98%" border="0" cellspacing="1" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"> 
      <td colspan="2" ><font color="#FFFFFF">��ѯ��Ʒ��</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��Ʒ����  ��</div></td>
      <td width="75%"> <input type="text" name="product.name" size="50" maxlength="40"/></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��Ʒ���</div></td>
      <td width="75%"> <input type="text" id="typeName" name="type.name" value="" disabled size="30"/><font color="#FF0000">*</font> 
        <input type="button" name="select" value="ѡ��..." onClick="window.open('/control/product/selectType?type.typeId=')">
      </td>                                                                                                <!-- ?type.typeId=  ��ֹ��ָ�� -->
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">��(�ɹ�)��(Ԫ) ��</div></td>
      <td width="75%"> 
��<input type="text" name="minBasePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>
      �� <input type="text" name="maxBasePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>֮��
</td>
    </tr>
	<tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">���ۼ�(Ԫ) ��</div></td>
      <td width="75%"> ��<input type="text" name="minSalePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>
      �� <input type="text" name="maxSalePrice" size="10" maxlength="10" onkeypress="javascript:InputLongNumberCheck()"/>֮��
      </td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="25%"> <div align="right">���� ��</div></td>
      <td width="75%"> <input type="text" name="product.code" size="20" maxlength="30"/>(ע:�������ṩ�ı��ڲ�Ʒ���ҵı��)</td>
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
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" name="edit" value=" ȷ �� " class="frm_btn">
          &nbsp;&nbsp;<input type="button" name="Button" value=" �� �� " class="frm_btn" onclick="javascript:history.back()">
        </div></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>