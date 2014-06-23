<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<script type="text/javascript">

	$(function() {
		WdatePicker({
			eCont:'date6',
			onpicked:function(dp){
				alert('你选择的日期是:'+dp.cal.getDateStr());
			}
		});
	});
</script>
</head>

<body>
<table width="100%" align="center">
	<tr>
		<td>
			welcome! 这是日期选择页面！
		</td>
	</tr>
	<tr>
		<td >
			<div >
				<div style="float: left;">
					日历<input id="date1" type="text" onclick="WdatePicker()"/>
				</div>
				<div style="float: left;">
					databox
					<input id="date2" type="text" readonly="readonly"/>
					<img onclick="WdatePicker({el:'date2'})" src="${ctx }/js/my97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
				</div>
				<div style="float: left;">
					显示周数
					<input id="date3" type="text" onfocus="WdatePicker({isShowWeek:true})"/>
				</div>
				<div style="float: left;">
					把周数赋给其它框
					<input type="text" class="Wdate" id="date4" onfocus="WdatePicker({isShowWeek:true,onpicked:function() {$dp.$('date4_1').value=$dp.cal.getP('W','W');$dp.$('d122_2').value=$dp.cal.getP('W','WW');}})"/>
					周数<input type="text" id="date4_1" style="width: 50px;"/>
				</div>
				<div style="float: left;">
					周一做为第1天
					<input class="Wdate" type="text" id="date5" onfocus="WdatePicker({firstDayOfWeek:1})"/>
				</div>
				<div style="float: left;">
					平面显示
					<div id="date6"></div>
				</div>
				<div style="float: left;">
					默认的起始日期
					<input type="text" id="date7" onfocus="WdatePicker({startDate:'1980-05-01'})"/>
				</div>
				<div style="float: left;">
					年月日时分秒
					<input type="text" id="date8" onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分ss秒'})" class="Wdate" style="width:300px"/>
				</div>
				<div style="float: left;">
					时分秒
					<input type="text" id="date9" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm:ss'})" class="Wdate"/>
				</div>
				<div style="float: left;">
					年月
					<input type="text" id="date10" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})" class="Wdate"/>
				</div>
				<div style="float: left;">
					不同格式
					<input id="date11" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'date12'})"/>
					<input id="date12" type="text" />
				</div>
				<div style="float: left;">
					星期, 月 日, 年
					<input type="text" id="date13" onfocus="WdatePicker({dateFmt:'DD, MMMM d, yyyy'})" class="Wdate"/>
				</div>
				<div style="float: left;">
					双月日历
					<input id="date14" class="Wdate" type="text" onfocus="WdatePicker({doubleCalendar:true,dateFmt:'yyyy-MM-dd'})"/>
				</div>
				<div style="float: left;">
					不合法的日期演示(例如1997-02-29)
					<input id="date15" type="text" onclick="WdatePicker({errDealMode:1})"/>
				</div>
				
			</div>
		</td>
	</tr>
</table>
				<div style="height: 700px;">
					abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />abc<br />
				</div>
</body>
</html>