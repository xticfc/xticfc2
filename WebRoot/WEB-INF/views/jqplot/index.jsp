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
$(function(){
	var res = null;
	$.ajax({
	  type: 'POST',
	  url: "${ctx}/jqplot/data1",
	  dataType:"json",
	  async:false,
	  timeout: 10000,
	  error: function(){
	  	alert('请求超时，请稍候再试');
	  },
	  success: function(result){
		  res = result;
	  }
	});
	var plot2 = $.jqplot('chart2', [res],{
		title: "AJAX JSON Data Renderer"
	}); 
});
</script>
</head>

<body>
<div id="c_main">
<!-- c_top start-->
<table  width="100%" border="1">
	<tr>
		<td>
		<div id="chart2" style="height:300px; width:500px;"></div>
		
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
</table>
</div>
</body>
</html>