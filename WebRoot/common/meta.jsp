<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   //设置无缓存
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
%>

<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<script src="${ctx }/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${ctx }/js/ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${ctx }/js/validform_v5.2_min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx }/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${ctx }/css/ui/jquery-ui-1.10.3.custom.min.css">
<script src="${ctx }/js/ztree/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script src="${ctx }/js/ztree/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
<script src="${ctx }/js/ztree/jquery.ztree.exedit-3.5.min.js" type="text/javascript"></script>
<script src="${ctx }/js/ztree/jquery.ztree.exhide-3.5.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${ctx }/js/jqGrid/i18n/grid.locale-cn.js"></script>
