<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv="pragma" content="no-cache">
<META http-equiv="Cache-Control" content="no-cache, must-revalidate">
<META http-equiv="expires" content="Wed, 26 Feb 2006 08:21:57 GMT">
<TITLE>�в���-�������ģ�ѡ��֧����ʽ</TITLE>
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/js/jquery.js"></SCRIPT>
<link href="/css/global/paymentWay.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
$(function(){
  if($("#d2").is(":checked")||$("#d3").is(":checked")){
    $("#time").show();
    $("#cod").show();
  }else{
    $("#time").hide();
    $("#cod").hide();
  }
  if($("#d1").is(":checked")||$("#d4").is(":checked")){
    $("#time").hide();
    $("#cod").hide();
  }
  
  $("#d2").click(function(){
    $("#time").show();
    $("#cod").show();
  });
  $("#d3").click(function(){
    $("#time").show();
    $("#cod").show();
  });
  $("#d1").click(function(){
    $("#time").hide();
    $("#cod").hide();
  });
  $("#d4").click(function(){
    $("#time").hide();
    $("#cod").hide();
  });
  
  for(i=1;i<=4;i++){
    if($("#d"+i).val()==$("#deliverWay").val()) {
      $("#d"+i).attr("checked", "checked");
      if(i==2 || i==3) {
        $("#time").show();
        for(j=1;j<=5;j++){
          if($("#r"+j).val()==$("#requirement").val()) {
            $("#r"+j).attr("checked", "checked");
          } 
        }
        $("#cod").show();
      }
    } 
    if($("#p"+i).val()==$("#paymentWay").val()) $("#p"+i).attr("checked", "checked");
  }
})

function sendForm(){
  if($("input[name='deliverWay']:checked").length==0){
    alert("��ѡ���ͻ���ʽ");
  }else if($("input[name='paymentWay']:checked").length==0){
    alert("��ѡ��֧����ʽ");
  }else{
    document.forms[0].submit();
  }
}
/** ����ֵ���ö���checked״̬Ϊtrue **/
	function setSelectRadioByValue(radioObject, value){
		if(typeof(radioObject.value)=="undefined"){
			for(var i=0;i<radioObject.length;i++){
				if(radioObject[i].value==value){
					radioObject[i].checked=true;
					break;
				}
			}
		}else{
			if(radioObject.value==value) radioObject.checked=true;
		}
	}
//-->
</SCRIPT>
</HEAD>

<BODY">
<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
  <TBODY>
  <TR>
    <TD><a href="/index.jsp"><IMG src="/images/global/yc.jpg" ></a> 
	&nbsp;&nbsp;<IMG height=36 src="/images/buy/az-s-checkout-payment-banne.gif" > 
	</TD>
  </TR>
  </TBODY>
</TABLE>
<BR>
<form action="/customer/shopping/manage/savePaymentWay" method="post">
<input type="hidden" name="directUrl" value="${param.directUrl }" />

<input id="deliverWay" type="hidden" value="${deliverWay }">
<input id="paymentWay" type="hidden" value="${paymentWay }">
<input id="requirement" type="hidden" value="${requirement }">

<TABLE cellSpacing=0 cellPadding=0 width="66%" align="center" border=0>
  <TBODY>
  <TR>
    <TD>
<SPAN class=h1><STRONG>��ѡ�������ͻ���֧����ʽ:</STRONG></SPAN> 
      <TABLE height=31 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD>
            <DIV align=right><IMG onClick="javascript:sendForm()" height="22" src="/images/buy/az-sfl-shipping-to-this-boo.gif" vspace=5 border=0 style="CURSOR: hand;">
        </DIV></TD></TR>
	 </TBODY></TABLE>
<A name="deliverWay"></A>
      <TABLE cellSpacing=1 cellPadding=1 width="100%" bgColor="#eeeecc" border=0><TBODY>
        <TR>
          <TD bgColor="#ffffff">
            <TABLE cellSpacing=0 cellPadding=4 width="100%" border=0>
              <TBODY>
              <TR bgColor="#eeeecc">
                <TD colSpan=2><STRONG>&nbsp;�ͻ���ʽ</STRONG></TD></TR>
				<tr>
				 <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="d1" name="deliverWay" value="GENERALPOST"/></TD>
				 <TD vAlign="middle" ><B>ƽ��</B> (����:10.0Ԫ)&nbsp;&nbsp;��֧�ֻ������ע:������ͣ���Ҫ�������ʾ����ᣬʱ���Գ�</TD>
				</tr>
				<tr>
				<TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="d2" name="deliverWay" value="EXPRESSDELIVERY""/></TD>
				 <TD vAlign="middle" ><B>����ͻ����� </B> (����:10.0Ԫ)&nbsp;&nbsp;֧�ֻ������� &nbsp;&nbsp;ע:200�����п��Ե�����ֳ��в��ܵ���</TD>
				</tr>
				<tr>
				<TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="d3" name="deliverWay" value="EXIGENCEEXPRESSDELIVERY"" /></TD>
				 <TD vAlign="middle" ><B>�Ӽ�����ͻ�����</B> (����:10.0Ԫ)&nbsp;&nbsp;֧�ֻ�������&nbsp;&nbsp;ע:200�����п��Ե�����ֳ��в��ܵ���</TD>
				</tr>
				<tr>
				 <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="d4" name="deliverWay" value="EMS"/></TD>
				 <TD vAlign="middle" ><B>�����ؿ�ר��EMS</B> (����:10.0
				 Ԫ)&nbsp;&nbsp;��֧�ֻ�������&nbsp;&nbsp;ע:�ʺ����������޷�����ĳ��У�ʱ��3-5��������</TD>
				</tr>
				<tr>
				  <TD colspan="2" vAlign="middle" class="big14">
				  
				  <TABLE cellSpacing=0 cellPadding=3 width="86%" align="center" id="time" border=0>
                    <TBODY>
                      <TR>
                        <TD align=left colSpan=2 style="FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BORDER-BOTTOM: #000000 1px solid">ʱ��Ҫ��(ע:����ͻ�ʱ�����ر�Ҫ����ע��)</TD>
                      </TR>
                      <TR>
                        <TD align=right><input type="radio" id="r1" name="requirement" value="�����ա�˫��������վ����ͻ�"/></TD>
                        <TD align=left width="96%">�����ա�˫��������վ����ͻ�</TD>
                      </TR>
                      <TR class=category-row-shaded>
                        <TD align=right><input type="radio" id="r2" name="requirement" value="ֻ˫���ա������ͻ�"/></TD>
                        <TD align=left>ֻ˫���ա������ͻ�(�����ղ�����)</TD>
                      </TR>
                      <TR>
                        <TD align=right><input type="radio" id="r3" name="requirement" value="ֻ�������ͻ�(˫���ա����ղ�����)"/></TD>
                        <TD align=left>ֻ�������ͻ�(˫���ա����ղ�����) (ע��д��¥/���õ�ַ�ͻ���ѡ��)</TD>
                      </TR>
                      <TR class=category-row-shaded>
                        <TD align=right><input type="radio" id="r4" name="requirement" value="ѧУ��ַ/��ַ����û�ˣ��뾡����������ʱ���ͻ�"/></TD>
                        <TD align=left>ѧУ��ַ/��ַ����û�ˣ��뾡����������ʱ���ͻ� (ע���ر��ſ��ܻᳬ��Ԥ���ͻ�����)</TD>
                      </TR>
                      <TR>
                        <TD align=right><input type="radio" id="r5" name="requirement" value="other"></TD>
                        <TD align=left><P>����˵����
                           <input type="text" id="other" name="deliverNote" value="${deliverNote }" maxlength="100" size="40" onfocus="javascript:setSelectRadioByValue(this.form.requirement,'other')"/>
                        </P></TD>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
				  </tr>
			</TBODY></TABLE>
		  </TD>
		</TR>
	 </TBODY></TABLE>
<br><A name="paymentWay"></A>
      <TABLE cellSpacing=1 cellPadding=1 width="100%" bgColor=#eeeecc border=0><TBODY>
        <TR>
          <TD bgColor=#ffffff>
            <TABLE cellSpacing=0 cellPadding=4 width="100%" border=0>
              <TBODY>
              <TR bgColor=#eeeecc>
                <TD colSpan=2><STRONG>&nbsp;֧����ʽ</STRONG></TD>
			 </TR>
			 <TR>
                <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="p1" name="paymentWay" value="NET"/> </TD>
                <TD vAlign="middle" ><B>����֧��</B>  �ױ�֧��</TD>
			  </TR>
              <TR id="cod">
                <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="p2" name="paymentWay" value="COD"/> </TD>
                <TD><B>��������</B></TD>
			  </TR>
			  <TR>
                <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="p3" name="paymentWay" value="BANKREMITTANCE"/> </TD> 
                <TD><B>���е��</B>  ������: �����������׸߿Ƽ���չ���޹�˾<BR>����������: 
                  ��ͨ�����ϵ�֧��<BR>�����ʺ�: 110060974018001084072</TD></TR>
              <TR>
                <TD class="big14" vAlign="middle" align="right" width="10%"><input type="radio" id="p4" name="paymentWay" value="POSTOFFICEREMITTANCE"/></TD> 
                <TD><B>�ʾֻ��</B><BR>�տ��˵�ַ��<FONT COLOR="#FF9900">�����г�����������ʮ�ַ�2��¥�������ҵ428��</FONT>&nbsp;&nbsp;�տ���������<FONT COLOR="#FF9900">��С��</FONT>&nbsp;&nbsp;�տ����ʱࣺ<FONT COLOR="#FF9900">100016</FONT><BR>���ڻ���˼��������ע�����Ķ�����/�û���(�ǳ���Ҫ)<BR></TD></TR>
			 </TBODY></TABLE>
  </TABLE>
			</TD></TR></TBODY></TABLE><BR>
      <TABLE height=31 cellSpacing=0 cellPadding=0 width="66%" border=0 align="center">
        <TBODY>
        <TR>
          <TD>
            <DIV align=right><IMG onClick="javascript:sendForm()" height="22" src="/images/buy/az-sfl-shipping-to-this-boo.gif" vspace=5 border=0 style="CURSOR: hand;"> 
        </DIV></TD></TR></TBODY></TABLE>
</form>

</BODY></HTML>