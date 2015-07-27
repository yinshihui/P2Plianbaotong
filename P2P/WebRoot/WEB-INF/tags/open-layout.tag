<%@ tag language="java" pageEncoding="utf-8"%>
<%@ attribute name="title" description="页面标题"%>
<%@ attribute name="header" fragment="true" description="额外的head区内容，包括页面加载脚本" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${title}</title>
<%--定义通用脚本的引用 --%>
<link href="${pageContext.request.contextPath}/res/css/main.css" rel="Stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/res/css/tcal.css" rel="Stylesheet" type="text/css"></link>
<script src="${pageContext.request.contextPath}/res/js/tcal.js" type="text/javascript"  /></script>
<script src="${pageContext.request.contextPath}/res/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/global.js"/></script>
<script src="${pageContext.request.contextPath}/res/js/user_3.js"/></script>

<script type="text/javascript">
$.appurl = function(relative)
{
	return '${pageContext.request.contextPath}/' + relative;
}
$(function(){
	$.getJSON("security/current-user")
		.success(function(r){
			$("#currentUser").html(r.name);
		});
});


</script>
<jsp:invoke fragment="header"/>
</head>
<body>
  

	<jsp:include page="/WEB-INF/inc/navigator.jsp"/>
	<jsp:doBody/>
  	<jsp:include page="/WEB-INF/inc/footer.jsp"/> 
 
</body>
</html>