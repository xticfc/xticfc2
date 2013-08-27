<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>县级系统</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var checkedList = new Array();
	function show(tag){
	 var light=document.getElementById(tag);
	 var fade=document.getElementById('fade');
	 light.style.display='block';
	 fade.style.display='block';
	 }
	function hide(tag){
	 var light=document.getElementById(tag);
	 var fade=document.getElementById('fade');
	 light.style.display='none';
	 fade.style.display='none';
	}
		
</script>
<script type="text/javascript">
	function doCancel(){
		document.location.href="${ctx }/ywxt/index?clientType=web";
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
	
	
	function findCheckedId(id){
        for(var i =0;i<checkedList.length;i++){
            if(checkedList[i] == id){
            	return i;
            }
        }
        return -1;
    }
	function isChecked(rowdata){
		if(findCheckedId(rowdata.code) == -1){
        	return false;
        }
        return true;
	}
	function addCheckedId(id){
        if(findCheckedId(id) == -1){
            checkedList.push(id);
        }
    }
    function removeCheckedId(id){
        var i = findCheckedId(id);
        if(i==-1){
        	return;
        }
        checkedList.splice(i,1);
    }
	function onCheckRow(checked, data){
        if (checked){
        	addCheckedId(data.code);
        }else{
        	removeCheckedId(data.code);
        }
    }
	function onCheckAllRow(checked){
		var v = $("#maingrid").ligerGetGridManager(); 
        for (var rowid in v.records){
            if(checked){
                addCheckedId(this.records[rowid]['code']);
            }else{
                removeCheckedId(this.records[rowid]['code']);
            }
        }
	}
	$(function(){
		hide('light');
		$("#checkedListInput").click(function(){
			var v = $("#maingrid").ligerGetGridManager(); 
			v.loadData(true);
			show('light');
		});
		
		$("#cancel").click(function(){
			hide('light');
		});
		
		
		$("#confirm").click(function(){
			$("#checkedListInput").val(checkedList.join(','));
			hide('light');
		});
		var form1Valid = $("#form1").Validform({
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
		$("#doSubmit").click(function(){
			form1Valid.ajaxPost();
			return false;
		});
		
		
	
		$("#maingrid").ligerGrid({
			url:"${ctx }/ywxt/getSystemTableInfoRelation?clientType=web",
			root:'result',
			record:'total',
			alternatingRow:true,
			checkbox:true,
			headerRowHeight:30,
			delayLoda:true,
			columns: [
				{ display: '报表名称', name: 'longName', width:200},
				{ display: '上报周期', width:70,
					render:function(row){
						return getPeriodName(row.period);
					}
				}
			],
			pageSizeOptions: [10, 20, 50, 100],
			isChecked: isChecked, 
			onCheckRow: onCheckRow, 
			onCheckAllRow: onCheckAllRow
        });
		
	});
</script>
</head>
<body>
<!-- 层开始 -->
<div  id="light" class="tc_white_content">
    <h1 class="tc_tm">
         <div class="tc_biaoti">选择报表</div> 
         <div class="tc_close" style="float:right;">
         	<a onclick="hide('light')" style="background:url(${ctx }/images/close.gif) no-repeat; display:block; width:15px; height:15px; cursor:pointer;" ></a>
         </div>
    </h1>
	<div class="clear"></div>
    <div class="tc_con"> 
        <div class="tc_con_con" id="maingrid">
	     </div>
	  </div>
  <div class="tc_con_bottom">
     <div class="tc_cb_0"><input name="" type="button" id="cancel" class="tc_but7" value=" "/></div>
      <div class="tc_cb_0"><input name="" type="button" id="confirm" class="tc_but6" value=" " /></div>
   </div>  
</div>
<div id="fade" class="black_overlay"></div>
<!-- 层结束 -->
<div class="center_con">
    <div class="butSet">
        <h1 class="tm2">新增业务系统</h1>
    </div>
    <div class="tabCon">
    	<form action="${ctx }/ywxt/add?clientType=web" id="form1" method="post">
	        <table width="100%" class="bus_table"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td  class="busTd_l">系统名称：</td>
	                <td class="busTd_r"><input name="name" type="text" class="input1" datatype="s6-18"/></td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">IP地址：</td>
	                <td class="busTd_r"><input name="ip" type="text" class="input1" datatype="s7-15"/></td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">端口：</td>
	                <td class="busTd_r"><input name="port" type="text" class="input1" datatype="n1-5"/></td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">等级：</td>
	                <td class="busTd_r">
	                	<select class="input1" name="type">
	                        <option value="1">国家级</option>
	                        <option value="2">省级</option>
	                        <option value="3">市级</option>
	                    </select>
	                </td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">header：</td>
	                <td class="busTd_r"><input name="header" type="text" class="input1" /></td>
	                <td ><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">rc4key：</td>
	                <td class="busTd_r"><input name="rc4key" type="text" class="input1" /></td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">可上报报表：</td>
	                <td class="busTd_r"><input name="checkedList" type="text" class="input1" id="checkedListInput" readonly="readonly" style="color:#999999;" value="点击以选择报表。。。"/></td>
	                <td align="left"></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">状态：</td>
	                <td class="busTd_r">
	                    <input name="status" type="radio" value="1" checked="checked"/>&nbsp;启用&nbsp;&nbsp;&nbsp;
	                    <input name="status" type="radio" value="0" /> &nbsp;停用
	                </td>
	                <td class="busTd_r2"><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l"></td>
	                <td colspan="2" class="busTd_r">
                       <div class="busb_l"><a href="#" id="doSubmit" class="save"></a></div>
                       <div class="busb_r"><a href="#" onclick="doCancel();" class="cel"></a></div>
                    </td>
	            </tr>
	        </table>
        </form>
    </div>
</div>
</body>
</html>