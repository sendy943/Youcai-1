<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<div id="Head">
  <div id="HeadTop">
    <div id="Logo"><a href="/" target=_top><img alt="�й�����ȫ�Ļ�����Ʒ��������Ʒ���Ͻ���ƽ̨��" src="/core/images/global/yc.jpg" border=0 /></a> </div>
    <div id="HeadNavBar">
      <ul>
        <li class="NoSep"><a id="MyBuyCar"  href="/core/shopping/cart/list" ><font color="blue"><Strong>���ﳵ</Strong></font></a> </li>
        <li><a href="/core/page/user/front/register.jsp?toUI=${param.toUI }" >���û�ע��</a> </li>
        <li><a href="/core/page/user/front/login.jsp">�û���¼</a> </li>
        <c:if test="${!empty sessionScope.user}"> <li><a href="/core/front/user/logout" >�˳�</a> </li></c:if>
        <li><a href="/core/page/shopping/myOrder.jsp">�ҵĶ���</a> </li>
        <li class="phone">�������ߣ�222-88888888</li>
      </ul>
    </div>
  </div>
</div>
<!-- Head End -->