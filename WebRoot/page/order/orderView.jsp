<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�����鿴</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
<style type="text/css">
<!--
body {font-size: 12px;line-height:16px}
a:link { color: #3300FF; 
     text-decoration: underline;  }    
    
a {color: #3300FF; 
     text-decoration: underline; }
     
a:hover { color: #FF6600; 
           text-decoration: underline; }

A.subnav:link {
	FONT-SIZE: 12px; COLOR: #330000; LINE-HEIGHT: 155%; TEXT-DECORATION: none
}
A.subnav:visited {
	FONT-SIZE: 12px; COLOR: #330000; LINE-HEIGHT: 155%; TEXT-DECORATION: none
}
A.subnav:active {
	FONT-SIZE: 12px; COLOR: #330000; LINE-HEIGHT: 155%; TEXT-DECORATION: none
}
A.subnav:hover {
	FONT-SIZE: 12px; COLOR: #330000; LINE-HEIGHT: 155%; TEXT-DECORATION: underline
}
.frm_btn
{
    BORDER-TOP-WIDTH: 1px;
    BORDER-LEFT-WIDTH: 1px;
    BORDER-BOTTOM-WIDTH: 1px;
    COLOR: #ffffff;
    BACKGROUND-COLOR: #4289cb;
    BORDER-RIGHT-WIDTH: 1px
}
-->
</style>
<script  src="/core/js/FoshanRen.js"></script>
	<script type="text/javascript">
	function ActionEvent(methodName, orderId){
	    window.location.href = '/control/order/'+ methodName+ '?order.orderId='+ orderId;
	}
	function deleteOrderItem(oitemId, orderId){
		if(confirm('\n��ȷ��ɾ��������?')){
			window.location.href ="/control/order/deleteOrderItem?oitemId="+ oitemId+"&order.orderId="+orderId;
		}
	}
	</script>   
  </head>
  
  <body>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#333333">
  <tr>
    <td><table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="59%"><strong>������:</strong>${order.orderId } <font color="red">(${order.state.name })</font></td>
        <td width="41%" align="right"><strong>����ʱ��:</strong>${order.createDate }</td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="2">
        <tr>
          <td colspan="4" bgcolor="#FFFFFF"><strong>��������Ϣ </strong> <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updateBuyer.jsp?orderId=${order.orderId }&buyerId=${buyer.buyerId }&name=${buyer.buyerName }&gender=${buyer.gender }&address=${buyer.address }&postalcode=${buyer.postalcode }&phone=${buyer.phone }&mobile=${buyer.mobile }">�޸�</a></c:if></td>
          <td align="center" bgcolor="#FFFFFF">֧����ʽ</td>
          <td colspan="2" bgcolor="#FFFFFF">${order.paymentWay.name }  <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updatePaymentWay.jsp?orderId=${order.orderId }&paymentWay=${order.paymentWay }&deliverWay=${acceptor.deliverWay }">�޸�</a></c:if></td>
        </tr>
        <tr>
          <td width="13%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="24%" bgcolor="#FFFFFF">${buyer.buyerName }��${buyer.gender.name }��</td>
          <td width="12%" align="center" bgcolor="#FFFFFF">��ϵ�绰</td>
          <td width="18%" bgcolor="#FFFFFF">${buyer.phone }</td>
          <td width="12%" align="center" bgcolor="#FFFFFF">��ϵ�ֻ�</td>
          <td colspan="2" bgcolor="#FFFFFF">${buyer.mobile }</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">��ַ</td>
          <td colspan="3" bgcolor="#FFFFFF">${buyer.address }</td>
          <td align="center" bgcolor="#FFFFFF">�ʱ�</td>
          <td colspan="2" bgcolor="#FFFFFF">${buyer.postalcode }</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����Ҫ��</td>
          <td colspan="6" bgcolor="#FFFFFF">${order.note}</td>
        </tr>
        <tr>
          <td colspan="4" bgcolor="#FFFFFF"><strong>�ջ�����Ϣ</strong> <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updateAcceptor.jsp?orderId=${order.orderId }&acceptorId=${acceptor.acceptorId }&name=${acceptor.acceptorName }&gender=${acceptor.gender }&address=${acceptor.address }&postalcode=${acceptor.postalcode }&email=${acceptor.email }&phone=${acceptor.phone }&mobile=${acceptor.mobile }">�޸�</a></c:if></td>
          <td align="center" bgcolor="#FFFFFF">�ͻ���ʽ</td>
          <td colspan="2" bgcolor="#FFFFFF">${acceptor.deliverWay.name }  <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updateDeliverWay.jsp?orderId=${order.orderId }&deliverWay=${acceptor.deliverWay }&paymentWay=${order.paymentWay }">�޸�</a></c:if></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td bgcolor="#FFFFFF">${acceptor.acceptorName }</td>
          <td align="center" bgcolor="#FFFFFF">��ϵ�绰</td>
          <td bgcolor="#FFFFFF">${acceptor.phone }</td>
          <td align="center" bgcolor="#FFFFFF">��ϵ�ֻ�</td>
          <td colspan="2" bgcolor="#FFFFFF">${acceptor.mobile }</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">��ַ</td>
          <td colspan="3" bgcolor="#FFFFFF">${acceptor.address }</td>
          <td align="center" bgcolor="#FFFFFF">�ʱ�</td>
          <td colspan="2" bgcolor="#FFFFFF">${acceptor.postalcode }</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">ʱ��Ҫ��</td>
          <td colspan="6" bgcolor="#FFFFFF">${acceptor.requirement }</td>
        </tr>
        <tr>
          <td colspan="4" bgcolor="#FFFFFF"><strong>��������Ʒ</strong></td>
          <td align="center" bgcolor="#FFFFFF"></td>
          <td colspan="2" bgcolor="#FFFFFF">
		  </td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">��Ʒ���</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF">��Ʒ����</td>
          <td align="center" bgcolor="#FFFFFF">����</td>
          <td width="16%" align="center" bgcolor="#FFFFFF">����</td>
          <td width="5%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
<c:forEach items="${order.items}" var="item">
        <tr>
          <td align="center" bgcolor="#FFFFFF">${item.productId }</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF">${item.productName } <font color="red">[${item.styleName }]</font></td>
          <td align="center" bgcolor="#FFFFFF">��${item.productPrice }</td>
          <td align="center" bgcolor="#FFFFFF">${item.amount } <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updateProductAmount.jsp?oitemId=${item.itemId }&orderId=${order.orderId }&amount=${item.amount }">�޸�</a></c:if></td>
          <td align="center" bgcolor="#FFFFFF"><c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="JavaScript:deleteOrderItem('${item.itemId }','${order.orderId }')">ɾ��</a></c:if></td>
        </tr>
</c:forEach>
        <tr>
          <td colspan="7" align="right" bgcolor="#FFFFFF"><p>��Ʒ�ϼƣ���${order.productTotalPrice }Ԫ&nbsp;&nbsp;���ͷѣ���${order.deliverFee }Ԫ <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}"><a href="/core/page/order/updateDeliverFee.jsp?orderId=${order.orderId}&deliverFee=${order.deliverFee }">�޸�</a></c:if>&nbsp;&nbsp;�����ϼƣ���${order.totalPrice }Ԫ<br />
            
			&nbsp;&nbsp;<strong>Ӧ����</strong>��${order.payableFee }Ԫ</p>          </td>
        </tr>
      </table></td>
  </tr>
</table>
<br />
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="2">
  <tr>
    <td width="15%" bgcolor="#FFFFFF">
    <c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}">
	<input type="button" class="frm_btn" value="ȡ������" onclick="JavaScript:ActionEvent('cancelOrder', '${order.orderId }')"/>&nbsp;
     </c:if><c:if test="${order.state=='WAITCONFIRM'}">
    <input type="button" class="frm_btn" value="���ͨ��" onclick="JavaScript:ActionEvent('confirmOrder', '${order.orderId }')"/>&nbsp;	
    </c:if>
    <c:if test="${order.state=='WAITPAYMENT' || (order.state=='DELIVERED' && order.paymentWay=='COD')}">
    <input type="button" class="frm_btn" value="����ȷ���Ѹ���" onclick="JavaScript:ActionEvent('confirmPayment', '${order.orderId }')"/>&nbsp;	
    </c:if>
    <c:if test="${order.state=='ADMEASUREPRODUCT'}">
    <input type="button" class="frm_btn" value="�ȴ�����" onclick="JavaScript:ActionEvent('turnWaitDeliver', '${order.orderId }')"/>&nbsp;	
    </c:if>
    <c:if test="${order.state=='WAITDELIVER'}">
    <input type="button" class="frm_btn" value="�Ѿ�����" onclick="JavaScript:ActionEvent('turnDelivered', '${order.orderId }')"/>&nbsp;	
    </c:if>
    <c:if test="${order.state=='DELIVERED' && order.paymentWay!='COD'}">
    <input type="button" class="frm_btn" value="�Ѿ��ջ�" onclick="JavaScript:ActionEvent('turnReceived', '${order.orderId }')"/>&nbsp;	
    </c:if>
    <input type="button" class="frm_btn" value="��ӡ����" onclick="JavaScript:winOpen('/core/control/order/showPrintUI?order.orderId=${order.orderId }','��ӡ',700,450)"/>&nbsp;
	<c:if test="${order.state!='RECEIVED' && order.state!='CANCEL'}">
	<input type="button" class="frm_btn" value="�����˳�" onclick="JavaScript:window.location.href='/core/control/order/unlockOrder?order.orderId=${order.orderId }'"/>
	</c:if>
	</td>
  </tr>
</table>
<br />
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td colspan="2"  bgcolor="6f8ac4"><FONT COLOR="#FFFFFF">�ͷ�����</FONT> &nbsp; <input type="button" class="frm_btn" value="�ͷ�����" onclick="JavaScript:window.location.href='/core/control/order/showAddMessageUI?orderId=${order.orderId}'"/></td>
  </tr>
  <tr>
    <td width="30%" align="center" bgcolor="#FFFFCC">������/ʱ��</td>
    <td width="70%" align="center" bgcolor="#FFFFCC">����</td>
  </tr>
  <c:forEach items="${order.msgs}" var="msg">
  <tr>
    <td>${msg.empName } / ${msg.createDate }</td>
    <td >${msg.content }</td>
  </tr>
  <tr><td colspan="2" height="1" bgcolor="#BBC9FF"></td></tr></c:forEach>
</table>
<p>&nbsp;</p>
  </body>
</html>
