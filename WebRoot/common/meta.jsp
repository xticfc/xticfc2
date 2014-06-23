<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   //设置无缓存
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
%>

<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<script src="${ctx }/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="${ctx }/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx }/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="${ctx }/js/uploadify-v3.1/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx }/js/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${ctx }/js/my97DatePicker/wdatePicker.js" type="text/javascript"></script>
<script src="${ctx }/js/my97DatePicker/lang/zh-cn.js" type="text/javascript"></script>


<link rel="stylesheet" href="${ctx }/css/icon.css"/>
<link rel="stylesheet" href="${ctx }/css/easyui.css"/>
<link rel="stylesheet" href="${ctx }/css/zTreeStyle/zTreeStyle.css" type="text/css">
