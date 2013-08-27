<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title>xticfc</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var setting = {	};

	var zNodes =[
		{ name:"父节点1 - 展开", open:true,
			children: [
				{ name:"父节点11 - 折叠",
					children: [
						{ name:"叶子节点111"},
						{ name:"叶子节点112"},
						{ name:"叶子节点113"},
						{ name:"叶子节点114"}
					]},
				{ name:"父节点12 - 折叠",
					children: [
						{ name:"叶子节点121"},
						{ name:"叶子节点122"},
						{ name:"叶子节点123"},
						{ name:"叶子节点124"}
					]},
				{ name:"父节点13 - 没有子节点", isParent:true}
			]},
		{ name:"父节点2 - 折叠",
			children: [
				{ name:"父节点21 - 展开", open:true,
					children: [
						{ name:"叶子节点211"},
						{ name:"叶子节点212"},
						{ name:"叶子节点213"},
						{ name:"叶子节点214"}
					]},
				{ name:"父节点22 - 折叠",
					children: [
						{ name:"叶子节点221"},
						{ name:"叶子节点222"},
						{ name:"叶子节点223"},
						{ name:"叶子节点224"}
					]},
				{ name:"父节点23 - 折叠",
					children: [
						{ name:"叶子节点231"},
						{ name:"叶子节点232"},
						{ name:"叶子节点233"},
						{ name:"叶子节点234"}
					]}
			]},
		{ name:"父节点3 - 没有子节点", isParent:true}

	];
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table width="500" align="center">
	<tr>
		<td>
			welcome! 这是主页面！
		</td>
	</tr>
	<tr>
		<td>
			<div class="zTreeDemoBackground left">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>