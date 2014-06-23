<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title>xticfc</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function logout(){
  if (confirm('确认退出？')) {
  	parent.window.location.href='login.do?action=logout';
  }
}
function IFrameResize(){
	 //alert(document.body.offsetHeight);
	 //alert(document.getElementById("I30").offsetTop);
	 //alert(document.documentElement.clientHeight);
	 document.getElementById("I30").height = document.documentElement.clientHeight - document.getElementById("I30").offsetTop;
	  //document.getElementById("I30").height = 644;
}
</script>
</head>

<body SCROLL ="no" style="background:#ffedc9;" onload="IFrameResize();" onresize="IFrameResize();">
<div id="c_main">
<!-- c_top start-->
  <div id="c_top">
   <div class="ct_con">
     <div class="ctcc">
     <div class="ctop_l"><img src="images/logo.jpg" /></div>
     <div class="ctop_r">
       <div class="login"><span class="csty1"> ${name}</span></div>
       <ul class="exit">
         <li><a href="index.do?action=main" target="I30"><img src="images/c_6.jpg" /></a></li> 
         <li><a href="help/help.html" target="_blank"><img src="images/c_7.jpg" /></a></li> 
         <li><a href="#" onclick="logout();return false;"><img src="images/c_8.jpg" /></a></li> 
       </ul>
     </div>
   </div>
   </div>
</div>
<form action="/xticfc/login.do" method="post">
<table height="200" width="500">
	<tr>
		<td>
			出错！
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>
		</td>
	</tr>
</table>
</form>
<!-- c_top end-->
<iframe name="I30" height="100%" width="100%" border="0" frameborder="0" src="index.do?action=main">
</div>
</body>
</html>