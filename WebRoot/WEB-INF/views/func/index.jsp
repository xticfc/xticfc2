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

<body >
<div class="center_con">
 <div class="butSet">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" >
        	<form action="${ctx }/org/search" method="post" id="searchForm">
	             <table width="500" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="400">   
	                	  站点：<input id="name" name="name" type="text" readonly="readonly" onclick="showMenu();" class="input1" />
	               			 <input id="id" name="id" type="hidden"  />
	                      系统状态： 
	                    <input name="status" type="radio" value="1" <c:if test='${status eq "1"}'>checked</c:if>/>&nbsp;启用  &nbsp;&nbsp;&nbsp;
	                    <input name="status" type="radio" value="0" <c:if test='${status eq "0"}'>checked</c:if>/>&nbsp;停用  &nbsp;&nbsp;
	                </td>
	                <td width="100"><input name="" type="button" class="search" value=" " id="doSearch" /></td>
	              </tr>
	            </table>
            </form>
        </td>
        <td align="right">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td align="right">    
                  <a href="${ctx }/org/gotoAdd" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
	<div class="tabCon">
		<table id="list2"></table>
		<div id="pager2"></div>
	</div>
	<div id="menuContent"  class="menuContent" style="display:none; position: absolute; border:1px solid #b1b8c2; background:#eff2f7; overflow:auto; height:400px;">
		<ul id="orgTree" class="ztree" style="margin-top:0; "></ul>
	</div>
</div>
</body>
</html>