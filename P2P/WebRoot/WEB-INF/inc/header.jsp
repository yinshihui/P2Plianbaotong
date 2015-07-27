<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%--定义通用脚本的引用 --%>
<link href="res/images/lbt001.PNG" rel="shortcut icon" />

<link href="${pageContext.request.contextPath}/res/css/main.css" rel="Stylesheet" type="text/css"></link>
<script src="${pageContext.request.contextPath}/res/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/global.js"/></script>
<script type="text/javascript">
$.appurl = function(relative)
{
	return '${pageContext.request.contextPath}/' + relative;
}
$(function(){
	$.getJSON("security/current-user")
		.success(function(r){
			$("#currentUser").html(r.name);
			$("#currentUserId").html(r.name);
		});
});
</script>	
 