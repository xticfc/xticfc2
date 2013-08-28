<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
</head>
<frameset rows="86,*,32" cols="*" framespacing="0" frameborder="no" border="0">
  <frame  src="${ctx }/staticPage/login_top.jsp" name="login_topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frame  src="${ctx }/staticPage/login_center.jsp" />
  <frame src="${ctx }/staticPage/login_bottom.jsp" name="login_bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
<body>

</body>
</noframes>
</html>