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
	
	
	
	function getZwmc(zwid){
		var name;
		$.ajax({
			url:"${ctx }/zw/getZwmc",
			type:"post",
			async:false,
			dataType:"json",
			data:{zwid:zwid},
			timeout: 10000,
			error: function(){alert('请求超时，请稍候再试');},
			success: function(result){
				name = result.name;
			}
		});
		return name;
	}
	
	
	function getPeriodName(period){
		var result = '';
		if(period){
			if(period == '0'){
				result='日报表';
			}else if(period == '1'){
				result='候报表';
			}else if(period == '2'){
				result='周报表';
			}else if(period == '3'){
				result='月报表';
			}else if(period == '4'){
				result='年报表';
			}else if(period == '5'){
				result='单次报表';
			}else if(period == '6'){
				result='旬报表';
			}
		}
		return result;
	}
	
	function getName(){
		var name = $("#longName").val();;
		if(name){
			return name;
		}else{
			return '';
		}
	}
	
	function addAll(){
		var form1Valid = $("#saveTableInfoRelation").Validform({
			tiptype:2,
			ajaxPost:true,
			postonce:true,
			showAllError:true,
			callback:function(data){
				if(data.result == '成功'){
					$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
					document.location.href="${ctx }/ywxt/index";
				}else{
					alert('保存失败，请稍候再试。。。');
				}
			}
		});
		form1Valid.ajaxPost();
		return false;
	}
	
	function showid(sysid,code){
		var input;
		$.ajax({
			url:"${ctx }/tableinfo/getInputBm",
			type:"post",
			async:false,
			dataType:"json",
			data:{sysid:sysid,code:code},
			timeout: 10000,
			error: function(){alert('请求超时，请稍候再试');},
			success: function(result){
				input = result.name;
			}
		});
		return input;
	}
	
	$(function(){
		$("#doSearch").click(function(){
			var v = $("#maingrid").ligerGetGridManager(); 
			v.set({
				parms:[
					{name:'longName',value:getName()}
				]
			});
			v.loadData(true);
		});
		$("#maingrid").ligerGrid({
			url:"${ctx }/tableinfo/list",
			root:'result',
			record:'total',
			alternatingRow:true,
			headerRowHeight:30,
			
			columns: [
				{ display: '报表名称', name: 'longName'},
				{ display: '报表编码', name: 'code' },
				{ display: '上报周期', 
					render: function(row){
						return getPeriodName(row.period);
					}
				},
				{ display: '对应作物', 
					render:function(row){
						return getZwmc(row.zwId);
					}
				},
				{ display: 'rc4key', name: 'rc4key' },
				{ display: '输入报表编码', width:150,
					render: function(row){
						var result = '';
				        result += "<input  name=\""+row.code+"\" id=\""+row.code+"\" value=\""+showid('${systemid}',row.code)+"\" type=\"text\" class=\"input1\" />";
				        result += "<input  name=\"codeid\" id=\"codeid\" value=\""+row.code+"\" type=\"hidden\" class=\"input1\" />";
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
<div class="center_con" >
 <div class="butSet">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" >
            <table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="250">   
                        报表名称： <input name="longName" id="longName" type="text" class="input1" value="${longName }"/>
                </td>
                <td ><a href="#" id="doSearch" class="search"></a></td>
              </tr>
            </table>
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
<form action="${ctx }/tableinfo/saveTableInfoRelation?clientType=web" method="post" id="saveTableInfoRelation">
	<div class="tabCon" style="width: 1200px;" id="maingrid">
	</div>
</form>
</div>

</body>
</html>