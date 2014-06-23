<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<script type="text/javascript">
	$(function() {
		$( "#dialog" ).dialog();
		
		$( "#dialog2" ).dialog({
		      autoOpen: false,
		      show: {
		        effect: "blind",
		        duration: 1000
		      },
		      hide: {
		        effect: "explode",
		        duration: 1000
		      }
		    });
		 
		    $( "#opener" ).click(function() {
		      $( "#dialog2" ).dialog( "open" );
		    });
		    
		    $( "#dialog-modal" ).dialog({
		        height: 140,
		        modal: true
		      });
		    
		    $( "#dialog-confirm" ).dialog({
		        resizable: false,
		        height:140,
		        modal: true,
		        buttons: {
		          "确认删除？": function() {
		            $( this ).dialog( "close" );
		          },
		          "取消": function() {
		            $( this ).dialog( "close" );
		          }
		        }
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
			<div id="dialog" title="Basic dialog">
			  <p>最基本的对话框.</p>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div id="dialog2" title="Basic dialog">
			  <p>可开关的对话框.</p>
			</div>
			 
			<button id="opener">Open Dialog</button>
		</td>
	</tr>
	
	<tr>
		<td>
			<div id="dialog-modal" title="Basic modal dialog">
			  <p>本对话框会覆盖整个页面，关闭后才能进行其它操作.</p>
			</div>
		</td>
	</tr>
	
	<tr>
		<td>
			<div id="dialog-confirm" title="Empty the recycle bin?">
			  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>模拟确认对话框. Are you sure?</p>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>