<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/meta.jsp"%>
<title>xticfc</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=CC73ed25841faf93a32ff8dbade21caf"></script> 

<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:100%}  
</style>

</head>

<body style="background:#ffedc9;">

<script type="text/javascript"> 
	var map = new BMap.Map("container");          // 创建地图实例  
	var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
	map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
</script> 

<!-- c_top start-->
<table  width="100%" height="100%" border="1">
	<tr>
		<td>
			<div id="container" class="container"></div>
		</td>
	</tr>
</table>

</body>
</html>