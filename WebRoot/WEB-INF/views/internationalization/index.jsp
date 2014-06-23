<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/meta.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<title>xticfc</title>
<script type="text/javascript">
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table  width="100%" border="1">
	<tr>
		<td>
			<spring:message code="title"></spring:message>
		</td>
	</tr>
	<tr>
		<td>
			${ip }
		</td>
	</tr>
</table>
</div>
</body>
</html>