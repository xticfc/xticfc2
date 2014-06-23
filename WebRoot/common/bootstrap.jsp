<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   //设置无缓存
   response.setHeader("progma","no-cache");   
   response.setHeader("Cache-Control","no-cache");   
%>

<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<script src="${ctx }/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="${ctx }/js/bootstrap.js" type="text/javascript"></script>


<link rel="stylesheet" href="${ctx }/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="${ctx }/css/bootstrap-theme.css" type="text/css">
