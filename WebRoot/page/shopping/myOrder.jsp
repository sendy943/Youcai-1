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
	<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/core/js/jquery.js"></script>
	<script>
$(function(){
  setInterval(updateTime, 1000);
})

 function updateTime(){
   document.getElementById('now').innerHTML = new Date().toLocaleString();
 }
	</script>
  </head>
  
  <body>
    <jsp:include page="/page/share/Head.jsp"/>
    <hr>
    <div style="font-size:16;">
   <span id="now" style="color:red;font-weight:bold;"></span>
    <br><br>
    <b>�����޸Ķ��������µ����ǵĿͷ���222-88888888</b><br>
    </div>
  </body>
</html>
