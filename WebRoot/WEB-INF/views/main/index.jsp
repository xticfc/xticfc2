<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<script type="text/javascript">
	var fresh=false;
	$(function(){
		$("body").layout("resize");
		$('#tt').tabs({ 
			border:false, 
			onSelect:function(title){
				if(fresh){
					var tab = $('#tt').tabs('getTab', title);
	    		    tab.panel('refresh');
    		    }
				fresh=false;
			} ,
			fit:true
		}); 
	});
	function addTab(title, url){
		var content = '<iframe scrolling="no" frameborder="0"  src="${ctx}/'+url+'" style="width:100%;height:100%;"></iframe>';
		if ($('#tt').tabs('exists', title)){
	        $('#tt').tabs('select', title);
	    } else {
	        $('#tt').tabs('add',{
	            title:title,
	             tools:[{
	            	iconCls:'icon-mini-refresh',
		    		handler:function(){
		    			fresh=true;
		    		}
	            }],
				content:content,
	            closable:true
	        });
	    }
	}
	function setIframeSize(){
		var h=document.documentElement.clientHeight-205;
		var w=document.documentElement.clientWidth;
		var d = document.getElementById("content");
		d.height=h;
		d.width=w;
// 		d.height=$("#abc").height();
// 		d.width=$("#abc").width();
	}
</script>
</head>
<body class="easyui-layout" onload="setIframeSize();">
	<div data-options="region:'north'" style="height:90px; overflow: hidden;">
		<iframe src="${ctx }/main/top" style="width: 100%; height: 100%; border: 0; overflow: hidden;" ></iframe>
	</div>
    <div data-options="region:'south'" style="height:40px; overflow: hidden; ">
    	<iframe src="${ctx }/main/bottom" style="width: 100%; height: 100%; border: 0; overflow: hidden;" ></iframe>
    </div>
    <div data-options="region:'west'" title="功能列表" style="width:127px;">
    	<div class="easyui-accordion">
    		<c:forEach  var="item" items="${funcs}">
				<div  data-options="iconCls:'icon-edit'" title="${item.main.title }" align="center">
					<c:forEach  var="child" items="${item.sub}">
						<li ><a href="javascript:void(0);" onclick="addTab('${child.funcName}', '${child.url }');">${child.funcname }</a></li>
					</c:forEach>
				</div>
			</c:forEach>
    	</div>
    </div>
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:false">
    		<div id="abc" title="首页" style=" height: 100%; width: 100%;">
    			<iframe id="content" src="${ctx }/datePicker/index" style=" border: 0; overflow: hidden;" ></iframe>
    		</div>
    	</div>
    </div>
</body>
</html>