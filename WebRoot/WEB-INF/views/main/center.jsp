<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
	html,body{ margin:0; padding:0; height:100%; overflow:hidden; }
</style>
</head>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0" style="background: url(${ctx }/images/c_bg1.jpg) repeat-x top;">
		<tr>
			<td style="width: 4px; background: url(${ctx }/images/c_bg.jpg) repeat-x top;"></td>
			<td width="195" name="fmTitle" align="center" valign="top">
				<div class="tm1"><img src="${ctx }/images/tmbg.jpg"></div>
				<iframe id="leftFrame" height="100%" width="195" marginwidth="0"
					marginheight="0" src="${ctx }/main/left?clientType=web" border="0" frameborder="0"
					scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
				</iframe>
			</td>
			<td width="4"></td>
			<td align="left" valign="top">
				<iframe id="rightFrame"
					height="100%" width="100%" src="${ctx }/main/right?clientType=web" name="rightFrame"
					border="0" frameborder="0"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
				</iframe>
			</td>
			<td style="width: 4px; background: url(${ctx }/images/c_bg.jpg) repeat-x top;"></td>
		</tr>
	</table>
</body>
</html>