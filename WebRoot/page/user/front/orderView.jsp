<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��ӭ�����в���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="�в���,�������µ�,ת����">
	<meta http-equiv="description" content="��İ���">
	<link href="/css/global/header01.css" rel="stylesheet" type="text/css">
	<style>
.highlight{   
    color : #fff;   
    background : green;   
}   
	</style>
  </head>
  
  <body>
    <jsp:include page="/page/share/Head.jsp"/>
    <hr><div style="font-size:16;">
   <center>[<b>�����޸Ķ��������µ����ǵĿͷ���222-88888888</b>]<input type="button" style="background:pink;" value=" �� �� " onclick="history.back()"></center><br>
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
          <td colspan="4" bgcolor="#FFFFFF"><strong>��������Ϣ </strong> <a href="">�޸�</a></td>
          <td align="center" bgcolor="#FFFFFF">֧����ʽ</td>
          <td colspan="2" bgcolor="#FFFFFF">${order.paymentWay.name }  <a href="">�޸�</a></td>
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
          <td colspan="4" bgcolor="#FFFFFF"><strong>�ջ�����Ϣ</strong> <a href="">�޸�</a></td>
          <td align="center" bgcolor="#FFFFFF">�ͻ���ʽ</td>
          <td colspan="2" bgcolor="#FFFFFF">${acceptor.deliverWay.name }  <a href="">�޸�</a></td>
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
          <td align="center" bgcolor="#FFFFFF">${item.amount } <a href="">�޸�</a></td>
          <td align="center" bgcolor="#FFFFFF"><a href="">ɾ��</a></td>
        </tr>
</c:forEach>
        <tr>
          <td colspan="7" align="right" bgcolor="#FFFFFF"><p>��Ʒ�ϼƣ���${order.productTotalPrice }Ԫ&nbsp;&nbsp;���ͷѣ���${order.deliverFee }Ԫ <a href="">�޸�</a>&nbsp;&nbsp;�����ϼƣ���${order.totalPrice }Ԫ<br />
            
			&nbsp;&nbsp;<strong>Ӧ����</strong>��${order.payableFee }Ԫ</p>          </td>
        </tr>
      </table></td>
  </tr>
</table>
    </div>
  </body>
</html>
