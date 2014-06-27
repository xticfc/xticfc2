<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
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
	
	function doDelete(systemTableId){
		if(confirm("确定删除？")){
			$.ajax({
				url:"${ctx}/ywxt/delete",
				type:"post",
				async:false,
				dataType:"json",
				data:{systemTableId:systemTableId},
				timeout: 10000,
				error: function(){alert('请求超时，请稍候再试');},
				success: function(result){
					doSearch();
				}
			});
		}else{
			return false;
		}
	}
	
	
	function getName(){
		return $("#name").val();
	}
	
	function getStatus1(){
		var status = $("input[name='status1']:checked").val();
		if(status){
			return status;
		}else{
			return '';
		}
	}
	
	function selectAll(){
		$("input[name='checkList1'][@checked='']").length;
		$("input[name='checkList1']").attr("checked",this.checked);
	}
	
    
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
	$(document).keydown(function(event){ 
         if(event.keyCode == '13'){
         	if($("#name").is(":focus") || $("input[name='status1']").is(":focus")){
         		doSearch();
         	}
         } 
    });
    
	$(function(){
		
		$("#doSearch").click(function(){
			doSearch();
		});
		
		$("#maingrid").ligerGrid({
			url:"${ctx }/ywxt/list",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '系统名称', name: 'name'},
				{ display: 'IP地址', name: 'ip' },
				{ display: '端口', name: 'port',width:100},
				{ display: '等级', width:100,
					render:function(row){
						return getLevel(row.type);
					}
				},
				{ display: 'header', name: 'header',width:100 },
				{ display: 'rc4key', name: 'rc4key', width:250 },
				{ display: '当前状态', width:100,
					render: function(row){
						return getStatus(row.status);
					}
				},
				{
				    display: '操作', isAllowHide: false,width:300,
				    render: function (row){
				        var result = '';
				        result += '<img src="${ctx }/images/037.gif" width="9" height="9" />&nbsp;[<a href="${ctx }/ywxt/gotoModify?systemTableId='+row.id+'">修改</a>]';
				        result += '&nbsp;&nbsp;&nbsp;&nbsp;';
				        result += '<img src="${ctx }/images/037.gif" width="9" height="9" />&nbsp;[<a href="#" onclick="doDelete(\''+row.id+'\');">删除</a>]';
				        result += '<img src="${ctx }/images/037.gif" width="9" height="9" />&nbsp;[<a href="${ctx }/org/siteRelation?systemid='+row.id+'">站点关联</a>]';
				        result += '<img src="${ctx }/images/037.gif" width="9" height="9" />&nbsp;[<a href="${ctx }/tableinfo/reportRelation?systemid='+row.id+'">报表关联</a>]';
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
                <td width="400" >   
                        系统名称： <input name="name" id="name" type="text" class="input1" value="${name }"/>&nbsp;&nbsp;
                        系统状态： 
                    <input name="status1" type="radio" value="1" <c:if test='${status eq "1"}'>checked</c:if>/>&nbsp;启用  &nbsp;&nbsp;&nbsp;
                    <input name="status1" type="radio" value="0" <c:if test='${status eq "0"}'>checked</c:if>/>&nbsp;停用  &nbsp;&nbsp;
                </td>
                <td width="100"><input name="" type="button" class="search" value=" " id="doSearch" /></td>
              </tr>
            </table>
        </td>
        <td align="right">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td align="right">    
                  <a href="${ctx }/ywxt/gotoAdd?clientType=web" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
	<div id="maingrid" class="tabCon"></div>
	</div>
</body>
</html>