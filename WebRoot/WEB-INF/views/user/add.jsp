<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	function doCancel(){
		document.location.href="${ctx }/user/index?clientType=web";
	}
	
	$(function(){
		var form1Valid = $("#form1").Validform({
			tiptype:2,
			ajaxPost:true,
			postonce:true,
			showAllError:true,
			callback:function(data){
				if(data.result == '成功'){
					$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
					document.location.href="${ctx }/user/index?clientType=web";
				}else{
					alert('保存失败，请稍候再试。。。');
				}
			}
		});
		$("#doSubmit").click(function(){
			form1Valid.ajaxPost();
			return false;
		});
	});
</script>
</head>
<body>
<div class="center_con">
    <div class="butSet">
        <h1 class="tm2">新增用户</h1>
    </div>
    <div class="tabCon">
    	<form action="${ctx }/user/add?clientType=web" id="form1" method="post">
	        <table width="100%" class="bus_table"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td class="busTd_l">名称：</td>
	                <td class="busTd_r"><input name="name" type="text" class="input1" datatype="*"  /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td class="busTd_l">登录名称：</td>
	                <td class="busTd_r"><input name="loginId" type="text" class="input1" datatype="*"  /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td class="busTd_l">登录密码：</td>
	                <td class="busTd_r"><input name="password" type="password" class="input1"  datatype="s6-16" /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td class="busTd_l">确认密码：</td>
	                <td class="busTd_r"><input name="okpass" type="password" class="input1" recheck="password" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！" datatype="s6-16" /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	            	<td class="busTd_l">状态：</td>
	                <td class="busTd_r">
	                    <input name="status" type="radio" value="1" checked="checked" />&nbsp;启用&nbsp;&nbsp;&nbsp;
	                    <input name="status" type="radio" value="0"  /> &nbsp;停用
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	            	<td class="busTd_l">用户级别：</td>
	                <td class="busTd_r">
	                	<select class="select1" name="userLevel">
	                		<option value="0" >县级</option>
	                        <option value="1"  >省级</option>
	                        <option value="2" >国家级</option>
	                    </select>
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	            	<td class="busTd_l">用户类型：</td>
	                <td class="busTd_r">
	                    <input name="userType" type="radio" value="0" checked="checked" /> &nbsp;系统管理员
	                    <input name="userType" type="radio" value="1"  />&nbsp;非系统管理员&nbsp;&nbsp;&nbsp;
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l"></td>
	                <td class="busTd_r" colspan="2">
	                    <div class="busb_l"><a href="#" id="doSubmit" class="save"></a></div>
	                    <div class="busb_r"><a href="#" onclick="doCancel();" class="cel"></a></div>
	                </td>
	            </tr>
	        </table>
        </form>
    </div>
</div>
</body>
</html>