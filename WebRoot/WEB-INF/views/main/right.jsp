<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
	html,body{ margin:0; padding:0; height:100%; overflow:hidden; background:#FFFFFF;}
</style>
</head>
<frameset rows="43,*" cols="*" framespacing="0" frameborder="no" border="0" id="aa" >
  <frame  id="wzFrame" src="${ctx }/main/weizhi?funcSubId=${funcSub.funcid }" name="login_topFrame" scrolling="No" noresize="noresize"  />
  <frame  id="mainFrame"  name="mainFrame" style="border-left:1px solid #cfdbe9; "  src="${ctx }/${funcSub.url }?funcSubId=${funcSub.funcid }" />
</frameset>
</html>