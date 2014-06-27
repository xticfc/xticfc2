<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>移动端管理</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	
	var url;
	var searchString = "";
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
		if(status){
			if(status == '1'){
				result = "启用";
			}else if(status == '0'){
				result = "停用";
			}
		}
		return result;
	}
	
	function doDelete(id){
		if(confirm("确定删除？")){
			document.location.href="${ctx}/mmsUser/delete?id="+id;
		}else{
			return false;
		}
	}
	
	
	function getName(){
		return $("#name").val();
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
				{name:'name',value:getName()},
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
			url:"${ctx }/mmsUser/list",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '用户名称', name: 'name'},
				{ display: '手机号码', name: 'mobile' },
				{ display: '设备串号', name: 'mobileId'},
				{ display: 'SIM卡号', name: 'simId'},
				{ display: '分类', name: 'typeName',isSort:false },
				{ display: '设备', name: 'equipment' },
				{ display: '当前状态', 
					render: function(row){
						return getStatus(row.status);
					}
				},
				{
				    display: '操作', isAllowHide: false,width:150,
				    render: function (row){
				        var result = '';
				         result += "<img src=\"${ctx }/images/037.gif\" width=\"9\" height=\"9\" />&nbsp;[<a href=\"${ctx }/mmsUser/gotoModify?id="+row.id+"\">修改</a>]";
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
            <table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="400">   
                	  用户名称：<input id="name" name="name" type="text" class="input1"/>
                	  系统状态： 
                    <input name="status" type="radio" value="1" <c:if test='${status eq "1"}'>checked</c:if>/>&nbsp;启用  &nbsp;&nbsp;&nbsp;
                    <input name="status" type="radio" value="0" <c:if test='${status eq "0"}'>checked</c:if>/>&nbsp;停用  &nbsp;&nbsp;
                </td>
                <td width="100"><input name="" type="button" class="search" value=" " id="doSearch" /></td>
              </tr>
            </table>
        </td>
         <td align="right">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td align="right">    
                  <a href="${ctx }/mmsUser/gotoAdd" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
	<div class="tabCon" id="maingrid">
	</div>
</div>
</body>
</html>