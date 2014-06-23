<%@page import="com.xticfc.util.DateUtil"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<%
	String currentYear = DateUtil.formatFromDate("yyyy", new Date());
	request.setAttribute("currentYear", currentYear);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
</head>

<body>
	<div style="text-align: center;">xticfc 版权所有&copy; 2010 - ${currentYear }</div>
</body>

</html>