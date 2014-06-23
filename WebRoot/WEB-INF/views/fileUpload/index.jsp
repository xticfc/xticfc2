<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/common/meta.jsp"%>
<%@ include file="/common/uploadify.jsp"%>
<title>xticfc2</title>

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
	       	'fileTypeExts' : '*.gif; *.jpg; *.png',//允许的上传文件类型，默认情况下文件选择页面不会显示非列表中的其它类型的文件
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
	       	'requeueErrors'	: true,			//如果上传出错,是否再次出现在队列中并上传.可先true和false,默认是false
	       	'successTimeout': 10,			//文件上传完成后,等待服务器返回信息的时间(秒).超过时间没有返回的话,插件认为返回了成功
	        'swf': '${ctx}/js/uploadify-v3.1/uploadify.swf',//swf文件的路径,本文件是插件自带的,不可用其它的代替.本参数不可省略
	        'uploader': '${ctx}/fileUpload/upload',//服务器URL.本参数不可省略
	        'uploadLimit'	: 999,			//限制总上传文件数,默认是999
	        'width'	:100,					//选择文件按钮的宽度,不需要加上'px'字符
	        'auto': false,					//是否自动上传,可选true和false
	        'onCancel':function(file){		//当取消一个上传队列中的文件是触发,通过再次选择同一个文件而替换掉原来选定的文件时不会触发
	        	//alert('文件'+file.name+'被取消了');
	        },	
	        'onClearQueue':function(queueItemCount){//当'cancel'方法带着*参数时,也就是说一次全部取消的时候触发.queueItemCount是被取消的文件个数
	        	//alert(queueItemCount+'个文件被取消了');
	        },
	        'onDestroy':function(){			//当destroy方法被调用时触发,没有传过来的参数.如<a href="javascript:$('#file_upload').uploadify('destroy')">Destroy Uploadif</a>
	        	//alert('I am getting destroyed!');
	        },
	        'onDialogClose':function(queueData){//当选择文件对话框关闭时触发,不论是点的'确定'还是'取消'都会触发.如果本事件被添加进了'overrideEvents'参数中,那么如果在选择文件时产生了错误,不会有错误提示框弹出
	        	//queueData.filesSelected	在浏览文件时选中的文件个数
	        	//queueData.filesQueued		被加入上传队列中的文件个数(本方法不会产生任何错误)
	        	//queueData.filesReplaced	已有队列中,被替换的文件个数
	        	//queueData.filesCancelled	The number of files that were cancelled from being added to the queue 凑和看吧
	        	//queueData.filesErrored	返回错误的文件个数
	        },	
	        'onDialogOpen':function(){//当选择文件框被打开时触发,没有传过来的参数.<div id="message_box"></div>
	        	$('#message_box').html('The file dialog box was opened...');
	        },
	        'onDisable':function(){//当'desable'方法被调用时触发,没有传过来的参数.<a href="javascript:$('#file_upload').uploadify('disable', true);">Disable Uploadify</a>
	        	//alert('You have disabled Uploadify!');
	        },
	        'onEnable':function(){//当'desable'方法被调用时触发,没有传过来的参数.<a href="javascript:$('#file_upload').uploadify('disable', false);">Enable Uploadify</a>
	        	//alert('You have enabled Uploadify!');
	        },
	        'onFallback':function(){//Triggered during initialization if a compatible version of Flash is not detected in the browser.
	        	//alert('Flash was not detected.');
	        },
	        'onInit'   : function(instance) {//当uploadify被第一次调用时，在最后调用完成时触发
	        
	        	//$("#uploadify").uploadify("settings", "width", 100); 不知道为什么本方法会报错
	        	$("#uploadify").uploadify("settings", "buttonText", "测试settings方法");
	            //alert('The queue ID is ' + instance.settings.queueID);
	        },
	        'onQueueComplete':function(queueData){//当队列中的所有文件上传完成时触发,目前不清楚再添加文件完成时还会不会触发
	        	//queueData.uploadsSuccessful	上传成功的文件个数
	        	//queueData.uploadsErrored		返回错误的文件个数
	        },
	        'onSelect': function(file){//当文件从浏览框被添加到队列中时触发
	           //alert('The file ' + file.name + ' was added to the queue.');
	        },
	        'onSelectError' : function(file,errorCode,errorMsg) {
	        	//errorCode QUEUE_LIMIT_EXCEEDED  队列已满(已达到限制数,不允许再添加)
	        	//errorCode FILE_EXCEEDS_SIZE_LIMIT  文件大小超过了设置的最大值
	        	//errorCode ZERO_BYTE_FILE  文件没有长度
	        	//errorCode INVALID_FILETYPE  所选文件类型不符合限制的类型
	        	//errorMsg  *You can access a full error message using ‘this.queueData.errorMsg’ if you do not override the default event handler.
	            //alert('The file ' + file.name + ' returned an error and was not added to the queue.');
	        },
	        'onSWFReady' : function() {//当flash对象准备好的时候触发,没有传过来的参数
	            //alert('The Flash file is ready to go.');
	        },
	        'onUploadComplete' : function(file) {//当一个文件上传完成时触发,不论是成功还是失败都会触发
	            //alert('The file ' + file.name + ' finished processing.');
	        },
	        'onUploadError' : function(file, errorCode, errorMsg, errorString) {//当文件上传完成但是返回错误时触发
	            //alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
	        },
	        'onUploadSuccess' : function(file, data, response) {//每个上传完成并成功的文件都会触发本事件
	        	//data The data that was returned by the server-side script (anything that was echoed by the file)
	        	//response The response returned by the server—true on success or false if no response.  If false is returned, after the successTimeout option expires, a response of true is assumed.
	            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
	        },
	        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {//Triggered each time the progress of a file upload is updated.
	            //bytesUploaded The number of bytes of the file that have been uploaded
	            //bytesTotal The total number of bytes of the file
	            //totalBytesUploaded The total number of bytes uploaded in the current upload operation (all files)
	            //totalBytesTotal The total number of bytes to be uploaded (all files)
	            $('#progress').html(totalBytesUploaded + ' bytes uploaded of ' + totalBytesTotal + ' bytes.');//<div id="progress"></div>
	        },
	        'onUploadStart' : function(file) {//在文件被上传前触发
	        	$("#uploadify").uploadify("settings", "formData", {'someKey':'3333','kkk':'llll'});
	        	
	           // alert('开始上传 ' + file.name);
	        }
	        /**
	        	以下是可触发事件的方法
	        	'cancel':  从队列中取消一个文件或者一个正在进行中的文件(不知道怎么翻译,Cancel a file from the queue or a file that is in progress.)
	        		fileID 想要取消的文件ID.检索ID的最简单的方法是使用ID 属性( id attribute of the file queue item),但是怎么用不清楚.如果用'*'会取消队列中所有的文件,如果不指定ID,那么会取消第一个
	        		suppressEvent 如果设置成true,那么onUploadCancel事件会被忽略.本方法经常被用来清空队列
	        		例:
	        		<a href="javascript:$('#file_upload').uploadify('cancel')">Cancel First File</a>
	        		<a href="javascript:$('#file_upload').uploadify('cancel', '*')">Clear the Queue</a>
	        	
	        	'destroy':	销毁uploadify实例并返回到原始的状态
	        		无参数
	        		例:
	        		<a href="javascript:$('#file_upload').uploadify('destroy')">Destroy Uploadify</a>
	        	
	        	'disable': 启用或者禁用'选择文件'按钮
	        		setDisabled 想要禁用按钮请设置成true,相反设置成false
	        		例:
	        		<a href="javascript:$('#file_upload').uploadify('disable', true)">Disable the Button</a> 
	        		<a href="javascript:$('#file_upload').uploadify('disable', false)">Enable the Button</a>
	        	
	        	'settings': 返回或修改一个 uploadify实例的settings值
	        		name  想要改变或设置的值的名称,如果只写'name'，会返回与name对应的值
	        		value 与name对应的值
	        		resetObjects 如果设置成true,在更新postData对象时会替换掉原来的值,设置成false,会在原来值的基础上添加新的值.
	        		注意:
	        			'swf' 属性不可被替换
	        		例:
	        		<a href="javascript:changeBtnText()">Change the Button Text</a> 
	        		<a href="javascript:returnBtnText();">Read the Button</a>
	        		function changeBtnText() {
					    $('#file_upload').uploadify('settings','buttonText','BROWSE');
					}
					function returnBtnText() {
					    alert('The button says ' + $('#file_upload').uploadify('settings','buttonText'));
					}
				
				'stop':	停止当前的上传并添加到队列中去
					无参数
					例:
					<a href="javascript:$('#file_upload').uploadify('upload', '*')">Upload the Files</a> 
					<a href="javascript:$('#file_upload').uploadify('stop')">Stop the Uploads!</a>
				
				'upload': 上传指定的文件或者所有队列中的文件
					fileID 想要上传的文件ID.检索ID的最简单的方法是使用ID 属性( id attribute of the file queue item),但是怎么用不清楚.如果输入'*',所有队列中的文件都会被上传
					例:
					<a href="javascript:$('#file_upload').uploadify('upload','*')">Upload Files</a>
	        **/
	  });
    });  
        
        
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table  width="100%" border="1">
	<tr>
		<td>
			<div id="fileQueue"></div>
		    <input type="file" name="uploadify" id="uploadify" />
		    <p>
		      <a href="javascript:$('#uploadify').uploadify('upload','*')">上传</a>| 
		      <a href="javascript:$('#uploadify').uploadify('cancel','*’)">取消上传</a>
		    </p>
		</td>
	</tr>
	<tr>
		<td>
			<a href="${ctx}/fileUpload/download">下载</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>