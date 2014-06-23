<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<script type="text/javascript">
	var setting = {
		async:{
			enable:true,
			autoParam:["id"],
			url:"${ctx}/tree/getChildren"
		},
		check:{
			enable:true,
			chkboxType: {"Y":"ps", "N":"ps"}
		}
	};
	var settingGetAll = {
		async:{
			enable:true,
			autoParam:["id"],
			url:"${ctx}/tree/getChildren"
		},
		data:{
			simpleData:{
				enable:true,
				idKey:"id",
				pIdKey:"parent",
				rootPid:null
			}
		},
		check:{
			autoCheckTrigger:false,
			enable:true,
			chkStyle:"checkbox",
			chkboxType: {"Y":"ps", "N":"ps"}
		},
		callback: {
			beforeClick: beforeClick,
			onCheck:onCheck
		}
		
		
	};
	var settingGetAll2 = {
		async:{
			enable:true,
			autoParam:["id"],
			url:"${ctx}/tree/getAll?id=140000"
		},
		data:{
			simpleData:{
				enable:true,
				idKey:"id",
				pIdKey:"parent",
				rootPid:null
			}
		},
		callback: {
			beforeClick: beforeClick2,
			onClick:onClick2
		}
		
		
	};
	var settingLeftRight = {
		async:{
			enable:true,
			autoParam:["id"],
			url:"${ctx}/tree/getAll"
		},
		data:{
			simpleData:{
				enable:true,
				idKey:"id",
				pIdKey:"parent",
				rootPid:null
			}
		},
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		callback: {
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop
		}
	};

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, []);
		$.fn.zTree.init($("#treeDemoGetAll"), settingGetAll, []);
		$.fn.zTree.init($("#treeDemoGetAll2"), settingGetAll2, []);
		$.fn.zTree.init($("#treeDemoGetAllLeft"), settingLeftRight, []);
		$.fn.zTree.init($("#treeDemoGetAllRight"), settingLeftRight, []);
	});
	function beforeClick(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemoGetAll");
		zTree.checkNode(treeNode, !treeNode.checked, null, true);
		return false;
	}
	function onCheck(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemoGetAll"),
		nodes = zTree.getCheckedNodes(true),
		v = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		alert(v);
	}
	function beforeClick2(treeId, treeNode) {
		var check = (treeNode && !treeNode.isParent);
		if (!check) alert("只能选择县...");
		return check;
	}
	function onClick2(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemoGetAll2"),
		nodes = zTree.getSelectedNodes(),
		v = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		//alert(v);
	}
	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		return targetNode ? targetNode.drop !== false : true;
	}
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table width="500" align="center">
	<tr>
		<td>
			welcome! 这是树页面！
		</td>
	</tr>
	<tr>
		<td width="1000px">
			<div style="width: 1000px;">
				<div style="float: left;">
					异步加载<br/>
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div style="float: left;">
					直接加载<br />
					<ul id="treeDemoGetAll" class="ztree"></ul>
				</div>
				<div style="float: left;">
					直接加载2<br />
					<ul id="treeDemoGetAll2" class="ztree"></ul>
				</div>
				<div style="float: left;">
					直接加载左<br />
					<ul id="treeDemoGetAllLeft" class="ztree"></ul>
				</div>
				<div style="float: left;">
					直接加载右<br />
					<ul id="treeDemoGetAllRight" class="ztree"></ul>
				</div>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>