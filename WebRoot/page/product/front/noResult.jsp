<%@ page pageEncoding="gbk"%>
<%@ include file="/page/share/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>����</title>    
	<link href="/core/css/global/header01.css" rel="stylesheet" type="text/css" />
	<link href="/core/css/product/list.css" rel="stylesheet" type="text/css" />	
	<link href="/core/css/global/topsell.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/core/js/jquery.js"></script>
<script>
$(function(){
  $("#scanHistory").html("���ڼ���...");
  $("#scanHistory").load("/core/front/product/findScanHistory");
});
</script>
</head>

<body class="ProducTypeHome2" onload="javascript:pageInit()">
	<jsp:include page="/page/share/Head.jsp"/>
    <div id="position">�����ڵ�λ��: <a href="/" name="linkHome">�в���</a> &gt;&gt; <em>��Ʒ��ѯ���</em> ��${pageCtx.totalRecords}����
	</div>

    <!--ҳ���������������-->
    <div class="browse_left">
		 <div class="browse">
	          <div class="browse_t">�����������Ʒ</div>
			  <ul id="scanHistory"></ul>
	     </div>
    </div>
    
    <div class="browse_right">
	     noRsult...
    </div>
	<jsp:include page="/page/share/Foot.jsp" />
</body>
</html>