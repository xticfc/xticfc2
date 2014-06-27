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
	
	var zNodes='';
		var setting = {
			async:{
				enable:true,
				autoParam:["id"],
				url:"${ctx}/org/getOrgTreeByUserFunc"
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			
			id=treeNode.ID ;
			name=treeNode.NAME;
			
			$("#name").attr("value", name);
			$("#orgId").attr("value", id);
			hideMenu();
		}
 
		function showMenu() {
			var cityObj = $("#parentName");
			var cityOffset = $("#parentName").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
 
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "parentName" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
 
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		
	
	function doCancel(){
		document.location.href="${ctx }/org/index";
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
					document.location.href="${ctx }/org/index";
				}else if(data.result == '失败'){
					alert('保存失败，站点不存在!');
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
        <h1 class="tm2">修改用户反馈地址</h1>
    </div>
    <div class="tabCon">
    	<form action="${ctx }/org/modify" id="form1" method="post">
	        <table width="100%" class="bus_table"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td  class="busTd_l">ID：</td>
	                <td class="busTd_r">
	                	<input name="id" type="text" class="input1" value="${OrgTable.id}" readonly="readonly"/>
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	                <td  class="busTd_l">所属站点：</td>
	                <td class="busTd_r"><input id="parentName" name="parentName" type="text" value="${parentName}" readonly="readonly" onclick="showMenu();" class="input1" datatype="*"/>
	                <input id="parent" name="parent" type="hidden" value="${parent}"  />
	                </td>
	              	<td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	                <td  class="busTd_l">站点名称：</td>
	                <td class="busTd_r"><input name="name" value="${OrgTable.name}" type="text" class="input1" datatype="*"/></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	                <td  class="busTd_l">简称：</td>
	                <td class="busTd_r"><input name="shortName" value="${OrgTable.shortName}" type="text" class="input1" datatype="*"/></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	             <tr>
	                <td  class="busTd_l">全称：</td>
	                <td class="busTd_r"><input name="longName" value="${OrgTable.longName}" type="text" class="input1" datatype="*"/></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	          
	             <tr>
	           <td  class="busTd_l">状态：</td>
	                <td class="busTd_r">
	                    <input name="status" type="radio" value="1" <c:if test='${OrgTable.status eq "1"}'>checked</c:if>/>&nbsp;启用&nbsp;&nbsp;&nbsp;
	                    <input name="status" type="radio" value="0" <c:if test='${OrgTable.status eq "0"}'>checked</c:if>/> &nbsp;停用
	                </td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l"></td>
	                <td class="busTd_r" colspan="2">
	                	<input name="oldId" type="hidden" value="${OrgTable.id }"/>
	                    <div class="busb_l"><a href="#" id="doSubmit" class="save"></a></div>
	                    <div class="busb_r"><a href="#" onclick="doCancel();" class="cel"></a></div>
	                </td>
	            </tr>
	        </table>
        </form>
    </div>
    <div id="menuContent"  class="menuContent" style="display:none; position: absolute; border:1px solid #b1b8c2; background:#eff2f7; overflow:auto; height:400px;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; "></ul>
	</div>
</div>
</body>
</html>