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
		jQuery("#list2").jqGrid({
		   	url:'${ctx}/jqGrid/list',
			datatype: "json",
			mtype:"POST",
		   	colNames:['显示名1','显示名2', 'type', 'money','status','tttt'],
		   	colModel:[
		   		{name:'name',index:'name', width:55, sortable:true},
		   		{name:'shopid',index:'shopid', width:90},
		   		{name:'type',index:'type', width:100},
		   		{name:'money',index:'money', width:80, align:"right"},
		   		{name:'status',index:'status', width:80,align:"right"},
		   		{name:'aaa',index:'', width:80, align:"right"}	
		   	],
		   	width:1000,
		   	height:500,
		   	rowNum:20,
		   	rownumbers:true,
		   	rowList:[10,20,30,100],
		   	pager: '#pager2',
		    viewrecords: true,
		    sortorder: "desc",
		    caption:"表格名称",
		    forceFit:true,
		    loadtext:"加载中...",
		    loadComplete: function(){
				aaa();
		    }
		});
		jQuery("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
	});
	function aaa(){
		var j = jQuery("#list2").jqGrid();
		var cell;
	    var array=j.getDataIDs();
	    for ( var i = 0; i < array.length; i++) {
	        var rowarray=j.getRowData(array[i])
	        for ( var rowname in rowarray) {
	            if(rowname=='aaa'){
	                cell=j.getCell(array[i],rowname);
	                j.setCell(array[i],rowname,'<a href="aaa.html" target="_blank">' + rowarray['name'] + '</a>');
	            }
	        }
	    }
	}
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table  width="100%" border="1">
	<tr>
		<td>
			<table id="list2"></table>
			<div id="pager2"></div>
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