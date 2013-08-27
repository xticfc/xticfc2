<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>县级系统</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	
	//加载树
	var zNodes='';
		var setting = {
			async:{
				enable:true,
				autoParam:["id"],
				url:"${ctx}/org/getOrgTreeByUserFunc?clientType=web"
			},
			view: {
				selectedMulti: false,
				dblClickExpand: false
			},
			data:{
				simpleData:{
					enable:true,
					idKey:"ID",
					pIdKey:"PARENT",
					rootPid:null
				},
				key:{
					name:"NAME"
				}
			},
			callback: {
				onClick: onClick
			}
		};
 
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("orgTree"),
			nodes = zTree.getSelectedNodes(),
			
			id=treeNode.ID ;
			name=treeNode.NAME;
			
			$("#name").attr("value", name);
			$("#id").attr("value", id);
			hideMenu();
		}
 
		function showMenu() {
			var cityObj = $("#name");
			var cityOffset = $("#name").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
 
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "name" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
 
		$(document).ready(function(){
			$.fn.zTree.init($("#orgTree"), setting, zNodes);
		});
		
	
	
	
	var searchString;
	
	function doDelete(id){
		if(confirm("确定删除？")){
			url = "${ctx }/org/delete?clientType=web&id="+id;
			window.location.href=url;
		}else{
			return false;
		}
	}
	
	
	function getId(){
		return $("#id").val();
	}
	function getLevel(level){
		var result = "";
		if(level){
			if(level == '1'){
				result = "国家级";
			}else if(level == '2'){
				result = "省级";
			}else if(level == '3'){
				result = "市级";
			}
		}
		return result;
	}
	
	function getStatus(status){
		var result = "";
		
			if(status == '1'){
				result = "启用";
			}else if(status =='0'){
				result = "停用";
			}
		
		return result;
	}
	
	function getStatus1(){
		var status = $("input[name='status']:checked").val();
		if(status){
			return status;
		}else{
			return '';
		}
	}
	$(document).keydown(function(event){ 
         if(event.keyCode == '13'){
         	if($("#name").is(":focus") || $("input[name='status']").is(":focus")){
         		doSearch();
         	}
         } 
    });
	function doSearch(){
		var v = $("#maingrid").ligerGetGridManager(); 
		v.set({
			parms:[
				{name:'id',value:getId()},
				{name:'status',value:getStatus1()}
			]
		});
		v.loadData(true);
	}
	$(function(){
		$("#doSearch").click(function(){
			doSearch();
		});
	 
		$("#maingrid").ligerGrid({
			url:"${ctx }/org/list?clientType=web",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '站点名称', name: 'name',isSort: true},
				{ display: '所属站点', name: 'parent' },
				{ display: '当前状态', 
					render: function(row){
						return getStatus(row.status);
					}
				},
				
				{
				    display: '操作', isAllowHide: false,width:150,
				    render: function (row){
				        var result = '';
				        result += "<img src=\"${ctx }/images/037.gif\" width=\"9\" height=\"9\" />&nbsp;[<a href=\"${ctx }/org/gotoModify?clientType=web&id="+row.id+"\">修改</a>]";
				        result += "&nbsp;&nbsp;&nbsp;&nbsp;";
				        result += "<img src=\"${ctx }/images/037.gif\" width=\"9\" height=\"9\" />&nbsp;[<a href=\"#\" onclick=\"doDelete('"+row.id+"');\">删除</a>]";
				        return result;
				    }
				}
			],
			width:'100%',
			pageSizeOptions: [10, 20, 50, 100] 
        });
        
	});
</script>
</head>
<body>
<div class="center_con">
 <div class="butSet">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" >
        	<form action="${ctx }/org/search?clientType=web" method="post" id="searchForm">
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
                  <a href="${ctx }/org/gotoAdd?clientType=web" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
	<div class="tabCon" id="maingrid">
	</div>
	<div id="menuContent"  class="menuContent" style="display:none; position: absolute; border:1px solid #b1b8c2; background:#eff2f7; overflow:auto; height:400px;">
		<ul id="orgTree" class="ztree" style="margin-top:0; "></ul>
	</div>
</div>
</body>
</html>