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
		   	colNames:['用户姓名', '所属站点', '用户等级', '用户类型','登录账号', '状态','操作'],
		   	colModel:[
		   		{name:'name',index:'name', width:55, sortable:true},
		   		{name:'orgName',index:'orgName', width:55, sortable:true},
		   		{name:'userLevel',index:'userLevel', width:50, sortable:true},
		   		{name:'userType',index:'userType', width:50},
		   		{name:'loginId',index:'loginId', width:80,align:"right"},
		   		{name:'status',index:'status', width:80,align:"right"},
		   		{name:'aaa',index:'', width:80, align:"middle"}	
		   	],
		   	width:1000,
		   	height:400,
		   	altRows:true,
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
	        var rowarray=j.getRowData(array[i]);
	        for ( var rowname in rowarray) {
	            if(rowname=='aaa'){
	                cell=j.getCell(array[i],rowname);
	                j.setCell(array[i],rowname,'<a href="aaa.html" target="_blank">' + rowarray['name'] + '</a>');
	            }else if(rowname == 'userLevel'){
	            	j.setCell(array[i], rowname, getUserLevel(rowarray['userLevel']));
	            }else if(rowname == 'userType'){
	            	j.setCell(array[i], rowname, getUserType(rowarray['userType']));
	            }
	        }
	    }
	}
	
	function getUserLevel(userLevel){
		if(userLevel == 1){
			return '省管理员';
		}else if(userLevel == 2){
			return '县管理员';
		}else if(userLevel == 3){
			return '超级管理员';
		}else if(userLevel == 0){
			return '市级管理员';
		}
	}
	
	function getUserType(userType){
		if(userType == 0){
			return '管理员';
		}else if(userType == 1){
			return '普通用户';
		}else {
			return '';
		}
	}
</script>
</head>

<body>
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