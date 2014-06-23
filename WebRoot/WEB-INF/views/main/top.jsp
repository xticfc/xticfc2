<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<script type="text/javascript">
	function webLogout(){
		top.document.location.href="${ctx }/login/webLogout";
	}
</script>
</head>
<body>
	<div style="float: left; width: 100%;">
      <div style="float: left;">欢迎使用管理平台！当前登录用户：${user.name }</div>
   	  <div style="float: right;"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="webLogout();">退出</a></div>
	</div>
</body>
</html>