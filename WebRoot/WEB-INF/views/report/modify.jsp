<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<%@ include file="/common/uploadify.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>县级系统</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	function doCancel(){
		document.location.href="${ctx }/report/index?clientType=web";
	}
	
	function uploadfile(){
		var val=$("#fileQueue").text();
		var form1Valid = $("#form1").Validform({
			tiptype:2,
			ajaxPost:true,
			postonce:true,
			showAllError:true,
			callback:function(data){
				if(data.result == 'true'){
					$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
					document.location.href="${ctx }/report/index?clientType=web";
				}else{
					alert('保存失败，请稍候再试。。。');
				}
			}
		});
		if(val==null || val==""){
			form1Valid.ajaxPost();
		}else{
			if(form1Valid.check(false)){
				$('#uploadify').uploadify('upload','*');
			}
		}
		return false;
	}
</script>

<script type="text/javascript">
	/**
		官方网站www.uploadify.com
		目前没有找到多个文件同时上传的方法，可能付费的才有这功能
	**/
	$(document).ready(function(){
       $("#uploadify").uploadify({
	       	'buttonText':'选择文件',			//选择文件按钮显示的文字，默认是'SELECT FILES'
	       	'buttonClass' : '',				//选择文件按钮的样式,默认为空
	       	'buttonCursor' : 'hand',		//选择文件按钮的鼠标样式，可选'hand'和'arrow'，默认为'hand'
	       	'buttonImage'	: null,			//选择文件按钮的图标,必须不设置buttonClass才起作用(待验证)
	       	'checkExisting'	: false,		//指定服务器端的路径,以检查要上传的文件是否已经存在,默认值是false
	       	'debug'    : false,				//是否开启DEBUG模式，默认为false
	       	'fileObjName' : 'the_files',	//文件属性名，后台可通过MultipartHttpServletRequest.getFile(name)来得到本文件
	       	'fileSizeLimit' : '100MB',		//限制文件大小，默认单位是KB。支持自己写单位，比如200B,300KB,400MB,500GB
	       	'fileTypeDesc' :'',				//The description of the selectable files.  This string appears in the browse files dialog box in the file type drop down.
	       	'fileTypeExts' : '*.rar; *.zip',//允许的上传文件类型，默认情况下文件选择页面不会显示非列表中的其它类型的文件
	        'formData'     : {'someKey' : 'someValue', 'someOtherKey' : 1},//每个文件上传时一块传给后台的参数，可用“onUploadStart“事件为其动态赋值
	       	'height':30,
	       	'method'   : 'post',			//上传方式,可选'post'和'get',默认是'post'
	       	'multi'    : false,				//是否可选择多个文件上传,可选true和false,默认是false
	       	'overrideEvents' : [],			//列出的事件,会不再以系统默认的设置起作用.写法为['onUploadProgress','onCancel'],默认为[]
	       	'preventCaching':false,			//可选true和false.如果选true,那么在上传时会加入一个随机数来使每次的URL都不同,以防止缓存.但是可能与正常URL产生冲突(待验证)
	       	'progressData' : 'speed',		//设置上传队列中显示的方式.speed 速度,percentage 百分比.默认值是percentage
	       	'queueID'	: 'fileQueue',		//队列显示在哪个位置的ID,如果设置成false会生成一个随机的ID,默认值是false
	       	'queueSizeLimit':999,			//同时可在上传队列中的个数,默认值是999.本参数不能限制总上传的文件个数,如需要请用'uploadLimit'
	       	'removeCompleted':false,		//是否从上传列表中移除已经完成的文件,可选true和false
	       	'removeTimeout'	: 10,			//如果设置成上传完成后移出队列,本参数来设置延迟多长时间(秒)移除.
	       	'requeueErrors'	: false,			//如果上传出错,是否再次出现在队列中并上传.可先true和false,默认是false
	       	'successTimeout': 10,			//文件上传完成后,等待服务器返回信息的时间(秒).超过时间没有返回的话,插件认为返回了成功
	        'swf': '${ctx}/js/uploadify-v3.1/uploadify.swf',//swf文件的路径,本文件是插件自带的,不可用其它的代替.本参数不可省略
	        'uploader': '${ctx}/report/modify?clientType=web',//服务器URL.本参数不可省略
	        'uploadLimit'	: 999,			//限制总上传文件数,默认是999
	        'width'	:100,					//选择文件按钮的宽度,不需要加上'px'字符
	        'auto': false,					//是否自动上传,可选true和false
	        'onInit'   : function(instance) {//当uploadify被第一次调用时，在最后调用完成时触发
	        
	        	//$("#uploadify").uploadify("settings", "width", 100); 不知道为什么本方法会报错
	        	$("#uploadify").uploadify("settings", "buttonText", "选择");
	        },
	        'onUploadSuccess' : function(file, data, response) {//每个上传完成并成功的文件都会触发本事件
	           document.location.href="${ctx }/report/index?clientType=web";
	        },
	        'onUploadStart' : function(file) {//在文件被上传前触发
	        	$("#uploadify").uploadify("settings", "formData", {'id':$("#id").val(),'name':$("#name").val(),'dbname':$("#dbname").val(),'code':$("#code").val(),'period':$("#period").val(),'zw':$("#zw").val(),'reportstyle':$("#reportstyle").val(),'status':$("#status").val(),'tempflag':'1'});
	        }
	  });
    });  
        
        
</script>
</head>
<body>
<div class="center_con">
    <div class="butSet">
        <h1 class="tm2">报表更新</h1>
    </div>
    <div class="tabCon">
    	<form action="${ctx }/report/modify?clientType=web" id="form1" method="post">
	       <table width="100%" class="bus_table"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td  class="busTd_l">名称：</td>
	                <td class="busTd_r"><input name="longName" id="name" type="text" class="input1"   value="${report.longName}" datatype="*"/></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">对应表名：</td>
	                <td class="busTd_r"><input name="dbtable" id="dbname" type="text" class="input1" value="${report.dbtable}"  /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">表编码：</td>
	                <td class="busTd_r"><input name="code" id="code" type="text" class="input1" value="${report.code}" datatype="s6-6" /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">报表周期：</td>
	                <td class="busTd_r">
	                	<select class="select1" name="period" id="period">
	                		<option value="0" <c:if test="${report.period eq '0'}"> selected</c:if>>日报</option>
	                		<option value="1" <c:if test="${report.period eq '1'}"> selected</c:if>>侯报</option>
	                		<option value="2" <c:if test="${report.period eq '2'}"> selected</c:if>>周报</option>
	                		<option value="3" <c:if test="${report.period eq '3'}"> selected</c:if>>月报</option>
	                		<option value="4" <c:if test="${report.period eq '4'}"> selected</c:if>>年报</option>
	                		<option value="5" <c:if test="${report.period eq '5'}"> selected</c:if>>单次报表</option>
	                		<option value="6" <c:if test="${report.period eq '6'}"> selected</c:if>>旬报表</option>
	                    </select>
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">作物：</td>
	                <td class="busTd_r">
						<select class="select1" name="zwId" id="zw">
	                		<option value="04" <c:if test="${report.zwId eq '04'}"> selected</c:if>>棉花</option>
	                        <option value="03" <c:if test="${report.zwId eq '03'}"> selected</c:if>>水稻</option>
	                        <option value="01" <c:if test="${report.zwId eq '01'}"> selected</c:if>>小麦</option>
	                        <option value="02" <c:if test="${report.zwId eq '02'}"> selected</c:if>>其他</option>
	                    </select>
					</td>
					<td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">报表类型：</td>
	                <td class="busTd_r">
	                	<select class="select1" name="reportStyle" id="reportstyle">
	                		<option value="1" <c:if test="${report.reportStyle eq '1'}"> selected</c:if>>单记录表</option>
	                        <option value="2" <c:if test="${report.reportStyle eq '2'}"> selected</c:if>>多记录表</option>
	                    </select>
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	            <td  class="busTd_l">状态：</td>
	                <td class="busTd_r">
	                    <select class="select1" name="status" id="status">
	                		<option value="0" <c:if test="${report.status eq '0'}"> selected</c:if>>停用</option>
	                        <option value="1" <c:if test="${report.status eq '1'}"> selected</c:if>>启用</option>
	                    </select>
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">上传报表文件：
	                	<div id="fileQueue"></div>
	                </td>
	                <td class="busTd_r"><input id="filepath" name="filepath" type="text" class="input1" value="${report.filepath }" readonly="readonly"  /></td>
	                <td class="busTd_r"><input name="uploadify" id="uploadify"  type="file" class="input1" /></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l"></td>
	                <td class="busTd_r" colspan="2">
	                	<input id="id" name="id" type="hidden" value="${report.id}"/>
	                    <div class="busb_l"><a href="#" id="doSubmit" onclick="uploadfile();" class="save"></a></div>
	                    <div class="busb_r"><a href="#" onclick="doCancel();" class="cel"></a></div>
	                </td>
	            </tr>
	        </table>
        </form>
    </div>
</div>
</body>
</html>