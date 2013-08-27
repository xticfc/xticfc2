<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>县级系统</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function webLogout(){
		top.document.location.href="${ctx }/login/webLogout?clientType=web";
	}
</script>
</head>
<body>
	<div id="top">
	    <div class="top_con">
	        <div class="tc_top">
	      	  <div class="zhuxiao"><a href="javascript:void(0);" class="zx_sty" onclick="webLogout();"></a></div>
	        </div>
	        <div class="tc_bottom">
	            <div class="huanying">欢迎使用植保信息化管理平台！当前登录用户：${user.name }</div>
	        </div>
	    </div>
	</div>
</body>
</html>