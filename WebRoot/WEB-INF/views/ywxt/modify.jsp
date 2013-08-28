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
	var checkedList = new Array();
	var canceledList = new Array();
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
	
	function getZwmc(zwid){
		var name;
		$.ajax({
			url:"${ctx }/zw/getZwmc?clientType=web",
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
	
	function findCheckedId(id){
        for(var i =0;i<checkedList.length;i++){
            if(checkedList[i] == id){
            	return i;
            }
        }
        return -1;
    }
	function findCanceledId(id){
        for(var i =0;i<canceledList.length;i++){
            if(canceledList[i] == id){
            	return i;
            }
        }
        return -1;
    }
	function isChecked(rowdata){
		if(rowdata.isChecked == '1' && findCanceledId(rowdata.code) == -1){
        	return true;
        }else if(findCheckedId(rowdata.code) != -1){
        	return true;
        }else{
        	return false;
        }
	}
	function addCheckedId(id){
        if(findCheckedId(id) == -1){
            checkedList.push(id);
        }
    }
	function addCanceledId(id){
        if(findCanceledId(id) == -1){
            canceledList.push(id);
        }
    }
    function removeCheckedId(id){
        var i = findCheckedId(id);
        if(i==-1){
        	return;
        }
        checkedList.splice(i,1);
    }
    function removeCanceledId(id){
        var i = findCanceledId(id);
        if(i==-1){
        	return;
        }
        canceledList.splice(i,1);
    }
	function onCheckRow(checked, data){
        if (checked){
        	addCheckedId(data.code);
        	removeCanceledId(data.code);
        }else{
        	addCanceledId(data.code);
        	removeCheckedId(data.code);
        }
    }
	function onCheckAllRow(checked){
		var v = $("#maingrid").ligerGetGridManager(); 
        for (var rowid in v.records){
            if(checked){
                addCheckedId(this.records[rowid]['code']);
                removeCanceledId(this.records[rowid]['code']);
            }else{
            	addCanceledId(this.records[rowid]['code']);
                removeCheckedId(this.records[rowid]['code']);
            }
        }
	}
	function onAfterShowData(){
		var v = $("#maingrid").ligerGetGridManager(); 
		var records = v.records;
        for (var rowid in records){
            if(records[rowid]['isChecked'] == '1'){
                if(findCanceledId(records[rowid]['code']) == -1){
                	addCheckedId(records[rowid]['code']);
				}                
            }
        }
	}
	$(function(){
	
		hide('light');
		$("#selectTable").click(function(){
			var v = $("#maingrid").ligerGetGridManager(); 
			v.set({
				parms:[{name:'systemTableId',value:'${systemTable.id}'}]
			});
			v.loadData(true);
			show('light');
		});
		
		$("#cancel").click(function(){
			hide('light');
		});
		
		
		$("#confirm").click(function(){
			$("#checkedListInput").val(checkedList.join(','));
			$("#canceledListInput").val(canceledList.join(','));
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
				{ display: '对应作物', width:70,
					render:function(row){
						return getZwmc(row.zwId);
					}
				},
				{ display: '上报周期', width:70,
					render:function(row){
						return getPeriodName(row.period);
					}
				}
			],
			pageSizeOptions: [10, 20, 50, 100],
			isChecked: isChecked, 
			onCheckRow: onCheckRow, 
			onCheckAllRow: onCheckAllRow,
			onAfterShowData:onAfterShowData
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
        <h1 class="tm2">修改业务系统</h1>
    </div>
    <div class="tabCon">
    	<form action="${ctx }/ywxt/modify?clientType=web" id="form1" method="post">
	        <table width="100%" class="bus_table"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td  class="busTd_l">系统名称：</td>
	                <td class="busTd_r"><input name="name" type="text" class="input1" value="${systemTable.name }" datatype="s6-18"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">IP地址：</td>
	                <td class="busTd_r"><input name="ip" type="text" class="input1" value="${systemTable.ip }" datatype="s7-15"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">端口：</td>
	                <td class="busTd_r"><input name="port" type="text" class="input1" value="${systemTable.port }" datatype="n1-5"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">等级：</td>
	                <td class="busTd_r">
	                	<select class="input1" name="type">
	                        <option value="1" <c:if test="${systemTable.type eq '1'}"> selected</c:if> >国家级</option>
	                        <option value="2" <c:if test="${systemTable.type eq '2'}"> selected</c:if>>省级</option>
	                        <option value="3" <c:if test="${systemTable.type eq '3'}"> selected</c:if>>市级</option>
	                    </select>
	                </td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">header：</td>
	                <td class="busTd_r"><input name="header" type="text" class="input1" value="${systemTable.header }"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">rc4key：</td>
	                <td class="busTd_r"><input name="rc4key" type="text" class="input1" value="${systemTable.rc4key }"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">可上报报表：</td>
	                <td class="busTd_r"><input name="" type="text" class="input1" id="selectTable" readonly="readonly" style="color:#999999;" value="点击以查看详细信息。。。"/></td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l">状态：</td>
	                <td class="busTd_r">
	                    <input name="status" type="radio" value="1" <c:if test='${systemTable.status eq "1"}'>checked</c:if>/>&nbsp;启用&nbsp;&nbsp;&nbsp;
	                    <input name="status" type="radio" value="0" <c:if test='${systemTable.status eq "0"}'>checked</c:if>/> &nbsp;停用
	                </td>
	                <td><div class="Validform_checktip"></div></td>
	            </tr>
	            <tr>
	                <td  class="busTd_l"></td>
	                <td colspan="2" class="busTd_r">
	                    <div class="busb_l"><a href="#" id="doSubmit" class="save"></a></div>
	                    <div class="busb_r"><a href="#" onclick="doCancel();" class="cel"></a></div>
	                    <input type="hidden" id="checkedListInput" name="checkedList" value=""/>
	                    <input type="hidden" id="canceledListInput" name="canceledList" value=""/>
	                    <input type="hidden" id="systemTableId" name="systemTableId" value="${systemTable.id }"/>
	                </td>
	            </tr>
	        </table>
        </form>
    </div>
</div>
</body>
</html>