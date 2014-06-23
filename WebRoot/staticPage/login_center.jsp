<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function changeCode() {  
	    $('#kaptchaImage').hide().attr('src', '${ctx }/login/getKaptchaImage?clientType=web&a=' + Math.floor(Math.random()*100) ).fadeIn();  
	}
	function doSubmit(){
		var username = $("#username").val();
		var password = $("#password").val();
		var identificationCode = $("#identificationCode").val();
		if(username.length < 1 || username.length > 16){
			alert('请输入6-16位的用户名');
			$("#username").focus();
			return false;
		}
		if(password.length < 1 || password.length > 16){
			alert('请输入6-16位的密码');
			$("#password").focus();
			return false;
		}
		if(identificationCode.length != 4){
			alert('请输入4位的验证码');
			$("#identificationCode").focus();
			return false;
		}
		$.ajax({
		  type: 'POST',
		  url: "${ctx }/login/webLogin?clientType=web",
		  data: {username:username,password:password,identificationCode:identificationCode},
		  dataType:"json",
		  timeout: 10000,
		  error: function(){
		  	alert('请求失败，请稍候再试');
		  	changeCode();
		  	$("#identificationCode").val('');
		  },
		  success: function(result){
			  if(result.success){
			  		top.document.location.href="${ctx}/main/index?clientType=web";
			  }else{
			  		alert('登录失败： ' + result.msg);
			  		changeCode();
			  		$("#identificationCode").val('');
			  }
		  }
		});
	}
	$(document).keydown(function(event){ 
         if(event.keyCode == '13'){
         	if($("#username").is(":focus") || $("#password").is(":focus") || $("#identificationCode").is(":focus")){
         		doSubmit();
         	}
         } 
    });
	$(function(){ 
		changeCode();
		$("#username").focus();
		$("#doSubmit").click(function(){
			doSubmit();
		});
	});
</script>
</head>

<body>
<div id="l_center">
  <div class="ppt">
    <img src="${ctx }/images/l_2.jpg" />
  </div>
  <form action="${ctx }/login/webLogin" method="post">
  <div class="dl_wai">
    <div class="dl">
      <div class="dl_0">
       <div class="dl0_l">账 号：</div><div class="dl0_r"><input class="input1" name="username" id="username"/></div>
      </div>
      <div class="dl_0">
       <div class="dl0_l">密 码：</div><div class="dl0_r"><input class="input1" name="password" id="password"/></div>
      </div>
      <div class="dl_0">
       <div class="dl0_l">验证码：</div><div class="dl0_r"><input class="input2" name="identificationCode" id="identificationCode"/></div>
      </div>
      <div class="dl_0">
       <div class="dl0_l"></div>
       <div class="dl0_r">
       	<p class="l_img">
			<img src=""  id="kaptchaImage"/>
		</p>
		<p class="intro">
			看不清？<a href="#" onclick="changeCode()">换一张 </a>
		</p>
       </div>
      </div>
      <div class="dl_bt">
      	   <input type="hidden" name="clientType" value="web"/>
           <input type="button" class="button1" id="doSubmit" value=" "/>
       </div>
    </div>
  </div>
 </form>
</div>
</body>
</html>
