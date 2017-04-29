<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<html>
<head>
<title>�����б�</title>
<link rel="stylesheet" href="/core/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="/core/js/FoshanRen.js"></SCRIPT>
<SCRIPT language=JavaScript src="/core/js/jquery.js"></SCRIPT>
<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function toPage(page){
		$("#currentPage").val(page);
		document.forms[0].submit();
	}
	
	function selectAll(){
      var ids = document.getElementsByName("orderIds");
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
		if(hasSelected(form.all, form.orderIds)){
			form.action="/control/order/" + action;
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
<form action="/core/control/order/list" method="post">
  <input id="currentPage" type="hidden" name="pageCtx.currentPage">
  
  <!-- ȷ����ҳʱҲִ�в�ѯ -->
  <input id="query" type="hidden" name="query" value="${query }">
  <input type="hidden" name="order.orderId" value="${order.orderId }"/>
  <input type="hidden" name="order.state" value="${order.state }"/>
  <input type="hidden" name="order.user.name" value="${order.user.name }"/>
  <input type="hidden" name="acceptor.acceptorName" value="${acceptor.acceptorName }"/>
  <input type="hidden" name="buyer.buyerName" value="${buyer.buyerName }"/>
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="12" bgcolor="6f8ac4" align="right">
    	<%@ include file="/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <c:if test="${showButton}">
      <td width="4%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">ѡ��</font></div></td>
      </c:if>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">������</font></div></td>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">��Ʒ�ܽ��</font></div></td>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�����ܽ��</font></div></td>
	  <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">���ͷ�</font></div></td>
	  <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">Ӧ������</font></div></td>
	  <td width="15%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�µ�ʱ��</font></div></td>
	  <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">֧��״̬</font></div></td>
	  <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">֧����ʽ</font></div></td>
	  <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�˿�</font></div></td>
	  <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">״̬</font></div></td>
	  <td bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${orders}" var="entry">
    <tr>
      <c:if test="${showButton}">
      <td bgcolor="f5f5f5"> <div align="center"><input type="checkbox" name="orderIds" value="${entry.orderId}"></div></td>
      </c:if>
      <td bgcolor="f5f5f5"> <div align="center">${entry.orderId}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.productTotalPrice }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.totalPrice}</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.deliverFee }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.payableFee }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.createDate }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> <c:if test="${entry.paymentState}">��֧��</c:if><c:if test="${!entry.paymentState}">δ֧��</c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center"> ${entry.paymentWay.name }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${entry.user.name }</div></td>
	  <td bgcolor="pink"> <div align="center">${entry.state.name }</div></td>
	  <td bgcolor="f5f5f5"> <div align="center">
	  <c:if test="${empty entry.lockUser}">
		 <a href="/core/control/order/view?order.orderId=${entry.orderId}">���붩��</a>
	  </c:if>
	  <c:if test="${!empty entry.lockUser && entry.lockUser==employee.name}">
		 <a href="/core/control/order/view?order.orderId=${entry.orderId}">��������</a>
	  </c:if>
	  <c:if test="${!empty entry.lockUser && entry.lockUser!=employee.name}">
		 <font color="red">�����ѱ�${entry.lockUser }����</font>
	  </c:if>
	  </div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <c:if test="${showButton}">
    <tr>
      <td bgcolor="f5f5f5" colspan="12" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="10%"><input type="checkbox" onclick="selectAll()" name="all">ȫѡ</td>
            <td width="85%">
             	 <yc:permission privilege="unlockAll" module="order">
             	 <input type="button" class="frm_btn" value="��������" onclick="actionEvent('unlockAll')"> &nbsp;&nbsp;
             	 </yc:permission>
              </td>
          </tr>
        </table></td>
    </tr>
    </c:if>
  </table>
</form>
</body>
</html>