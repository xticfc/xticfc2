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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			
			id=treeNode.ID ;
			name=treeNode.NAME;
			
			$("#name").attr("value", name);
			$("#orgId").attr("value", id);
			var v = $("#maingrid").ligerGetGridManager(); 
			v.set({
				parms:[
					{name:'orgId',value:$("#orgId").val()}
				]
			});
			v.loadData(true);
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
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		

</script>
<script type="text/javascript">
	
	var searchString;
	
	function getName(){
		return $("#name").val();;
	}
	
	function getStatus(){
		var status = $("input[name='status']:checked").val();
		if(status){
			return status;
		}else{
			return '';
		}
	}
	function addAll(){
		var form1Valid = $("#saveSiteRelationForm").Validform({
			tiptype:2,
			ajaxPost:true,
			postonce:true,
			showAllError:true,
			callback:function(data){
				if(data.result == '成功'){
					$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
					document.location.href="${ctx }/ywxt/index?clientType=web";
				}else{
					alert('保存失败，请稍候再试。。。');
				}
			}
		});
		form1Valid.ajaxPost();
		return false;
	}
	
	function showid(sysid,sxid){
		var input;
		$.ajax({
			url:"${ctx }/org/getInputBm?clientType=web",
			type:"post",
			async:false,
			dataType:"json",
			data:{sysid:sysid,sxid:sxid},
			timeout: 10000,
			error: function(){alert('请求超时，请稍候再试');},
			success: function(result){
				input = result.name;
			}
		});
		return input;
	}
	
	$(function(){
		$("#maingrid").ligerGrid({
			url:"${ctx }/ywxt/list?clientType=web",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '名称', name: 'longName'},
				{ display: '类型', 
					render: function(row){
						if(row.type == '0'){
				        	return '国家农技中心';
				        }else if(row.type == '1'){
				        	return '省级测报站';
				        }else if(row.type == '2'){
				        	return '县测报站';
				        }else{
				        	return '';
				        }
					}
				},
				{ display: '作物', 
					render: function(row){
						if(row.zwid == '04'){
				        	return '棉花';
				        }else if(row.zwid == '03'){
				        	return '小麦';
				        }else if(row.zwid == '01'){
				        	return '水稻';
				        }else if(row.zwid == '02'){
				        	return '其他';
				        }else{
				        	return '';
				        }
					}
				},
				{ display: '当前状态', 
					render: function(row){
						if(row.status == '0'){
				        	return '停用';
				        }else if(row.status == '1'){
				        	return '启用';
				        }else{
				        	return '';
				        }
					}
				},
				{
				    display: '输入市县编码', width:150,
				    render: function (row){
				        var result = '';
				        result += "<input  name=\""+row.id+"\" id=\""+row.id+"\"  value=\""+showid('${systemid}',row.id)+"\" type=\"text\" class=\"input1\" />";
				        result += "<input  name=\"sxid\" id=\"sxid\" value=\""+row.id+"\" type=\"hidden\" class=\"input1\" />";
				        result += "<input  name=\"systemid\" id=\"systemid\" value=\"${systemid}\" type=\"hidden\" class=\"input1\" />";
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
        	<form action="${ctx }/notice/search?clientType=web" method="post" id="searchForm">
	            <table width="500" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="400">
	                	测报站：<input id="name" name="name" type="text" readonly="readonly" onclick="showMenu();" class="input1" />
	                       <input id="orgId" name="orgId" type="hidden"  />
	                </td>
	              </tr>
	            </table>
            </form>
        </td>
        <td align="right">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td align="right">    
                  <a href="#"  id="" onclick="addAll();" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
<form action="${ctx }/org/saveSiteRelation?clientType=web" method="post" id="saveSiteRelationForm">
	<div class="tabCon" id="maingrid">
	</div>
</form>
</div>
<div id="menuContent"  class="menuContent" style="display:none; position: absolute; border:1px solid #b1b8c2; background:#eff2f7; overflow:auto; height:400px;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; "></ul>
</div>
</body>
</html>