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
	
	var searchString;
	
	function doDelete(id){
		if(confirm("确定删除？")){
			url = "${ctx }/user/delete?clientType=web&id="+id;
			window.location.href=url;
		}else{
			return false;
		}
	}
	
	
	function getName(){
		return $("#name").val();
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
			url:"${ctx }/user/list?clientType=web",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '名称', name: 'name'},
				{ display: '登录名', name: 'loginId' },
				{ display: '登录密码', name: 'password', isSort: false},
				{ display: '当前状态', 
					render: function(row){
						return getStatus(row.status);
					}
				},
				{ display: '用户级别', 
					render: function(row){
						if(row.userLevel == '3'){
				        	return '超级用户';
				        }else if(row.userLevel == '2'){
				        	return '国家用户';
				        }
				        else if(row.userLevel == '1'){
				        	return '省级用户';
				        }
				        else if(row.userLevel == '0'){
				        	return '县级用户(测报站用户)';
				        }else{
				        	return '';
				        }
					}
				},
				{ display: '用户类型', 
					render: function(row){
						if(row.userType == '0'){
				        	return '系统管理员';
				        }else if(row.userType == '1'){
				        	return '非系统管理员';
				        }else{
				        	return '';
				        }
					}
				},
				{
				    display: '操作', isAllowHide: false,width:150,
				    render: function (row){
				        var result = '';
				        result += "<img src=\"${ctx }/images/037.gif\" width=\"9\" height=\"9\" />&nbsp;[<a href=\"${ctx }/user/gotoModify?clientType=web&id="+row.userId+"\">修改</a>]";
				        result += "&nbsp;&nbsp;&nbsp;&nbsp;";
				        result += "<img src=\"${ctx }/images/037.gif\" width=\"9\" height=\"9\" />&nbsp;[<a href=\"#\" onclick=\"doDelete('"+row.userId+"');\">删除</a>]";
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
                        名称： <input name="name" id="name" type="text" class="input1" value="${name}"/>&nbsp;&nbsp;
                        状态： 
                    <input name="status" type="radio" value="1" <c:if test='${status eq "1"}'>checked</c:if>/>&nbsp;激活  &nbsp;&nbsp;&nbsp;
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
                  <a href="${ctx }/user/gotoAdd?clientType=web" class="bsty0"></a>
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