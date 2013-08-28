<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<script language="JavaScript" type="text/javascript" src="${ctx }/js/qiehuan.js"></script>
<script src="${ctx }/js/prototype.lite.js" type="text/javascript"></script>
<script src="${ctx }/js/moo.fx.js" type="text/javascript"></script>
<script src="${ctx }/js/moo.fx.pack.js" type="text/javascript"></script>

<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
	html,body{height:100%;padding:0;margin:0; background:#eef1f6;}
</style>

<style>
.subClass {
    width: 175px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	border:1px solid #a6bbd4;
    border-top:none; 
	background:#FFFFFF;
	padding-top:1px; 
	padding-bottom:1px;
}
.subClass ul {
    list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
	
}
.subClass li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 175px;
	padding-left: 0px;
	
}

.subClass a:link,.subClass a:visited,.subClass a:active{
	margin: 0px;
	padding: 0px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	color: #0e5887;
	background-image:url(${ctx}/images/sub_bg_link.jpg);
	background-repeat: no-repeat;
	height: 26px;
	line-height: 26px;
    padding-left:45px;
	width:130px;
	display: block;
    overflow: hidden;
	text-decoration: none; text-align:left;

}
.subClass a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 26px;
	font-weight: bold;
	color: #0e5887;
	background-image:url(${ctx}/images/sub_bg_hover.jpg);
	background-repeat: no-repeat;
	text-align:left;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
    padding-left:45px;
	width:130px;
	text-decoration: none;
}
</style>
</head>
<body>
	<table width="195" border="0" cellspacing="0" align="center"
		cellpadding="0" style="float: left;">
		<tr>
			<td valign="top" align="center" style="padding-top: 10px;">
				<c:forEach  var="item" items="${funcs}">
					<div class="menucon">
						<h1 class="bigClass">
							<div class="bigClass_l"><img src="${ctx }/images/menu_add.gif"></div>
							<div class="bigClass_r">
								<p>${item.main.title }</p>
							</div>
						</h1>
						<div class="content">
							<ul class="subClass">
								<c:forEach  var="child" items="${item.sub}">
									<li><a href="${ctx }/main/right?clientType=web&funcSubId=${child.funcid }" target="rightFrame">${child.funcname }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('bigClass');
	    var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
	  	);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
</body>
</html>