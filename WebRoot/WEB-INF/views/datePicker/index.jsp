<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		$( "#datepicker0" ).datepicker({
			onSelect: function( selectedDate ) {
				//alert(selectedDate);
			}
		});
		$( "#datepicker1" ).datepicker({ 
			minDate: -20, 
			maxDate: "+1M +10D",
			showOn: "button",
			buttonImage: "${ctx }/images/ui/calendar.gif",
			buttonImageOnly: true,
			showButtonPanel: true
		});
		$( "#datepicker2" ).datepicker({
			showButtonPanel: true,
			onSelect: function(dateText, inst) {
				alert(dateText);
				alert(inst);
			}
		});
		$( "#datepicker3" ).datepicker({
			changeMonth: true,
			changeYear: true,
			showOtherMonths: true,
			selectOtherMonths: false,
			showWeek: true,
			firstDay: 1,
			showAnim:"slideDown"
		});
		var dates = $( "#from, #to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 2,
			onSelect: function( selectedDate ) {
				var option = this.id == "from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
		
		$( "#datepicker0" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
	});
	
</script>
</head>

<body style="background:#ffedc9;">
<div id="c_main">
<!-- c_top start-->
<table width="500" align="center">
	<tr>
		<td>
			welcome! 这是日期选择页面！
		</td>
	</tr>
	<tr>
		<td width="1000px">
			<div style="width: 1000px;">
				<div style="float: left;">
					最普通<br/>
					<input type="text" id="datepicker0" size="30"/>
				</div>
				<div style="float: left;">
					设置可选择的范围<br />
					<input type="text" id="datepicker1" size="30"/>
				</div>
				<div style="float: left;" id="datepicker2">
				</div>
				<div style="float: left;">
					显示年月<br />
					<input type="text" id="datepicker3" size="30"/>
				</div>
				<div style="float: left;">
					<label for="from">从:</label>
					<input type="text" id="from" name="from"/>
					<label for="to">至:</label>
					<input type="text" id="to" name="to"/>
				</div>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>