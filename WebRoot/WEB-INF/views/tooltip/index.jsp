<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<script type="text/javascript">
	$(function() {
		$( document ).tooltip({
			track: true
		});
	});
	
</script>
</head>

<body>
<div id="c_main">
<!-- c_top start-->
<table width="800" align="center">
	<tr>
		<td>
			<p><label for="age">Your age:</label><input id="age" title="We ask for your age only for statistical purposes." /></p>
			<p>将鼠标放到输入框上以显示提示信息.</p>
		</td>
	</tr>
</table>
</div>
</body>
</html>