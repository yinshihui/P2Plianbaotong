<%@ tag language="java" pageEncoding="utf-8"%>
<%@ attribute name="title" description="页面标题"%>
<%@ attribute name="header" fragment="true" description="额外的head区内容，包括页面加载脚本" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${title}</title>
<%--定义通用脚本的引用 --%>
<link href="res/images/lbt001.PNG" rel="shortcut icon" />
<link href="${pageContext.request.contextPath}/res/css/main.css" rel="Stylesheet" type="text/css"></link>
<link href="${pageContext.request.contextPath}/res/css/tcal.css" rel="Stylesheet" type="text/css"></link>
<script src="${pageContext.request.contextPath}/res/js/tcal.js" type="text/javascript"  /></script>
<script src="${pageContext.request.contextPath}/res/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery.form.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery.jqpagination.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/jqpagination.css" type="text/css" />
<script src="${pageContext.request.contextPath}/res/js/global.js"/></script>
<script src="${pageContext.request.contextPath}/res/js/user_3.js"/></script>
<script src="${pageContext.request.contextPath}/res/js/Calendar3.js" type="text/javascript"></script>

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

function checkEmpStatus(status) {
	var empStatus;
	switch(status) {
		case "n" :
			empStatus = "正常";
			break;
		case "f" :
			empStatus = "禁用";
			break;
	}
	return empStatus;
}
function checkEmpType(type) {
	var empType;
	switch(type) {
		case "s0" :
			empType = "一级审核员";
			break;
		case "s1" :
			empType = "二级审核员";
			break;
	}
	return empType;
}
function checkInstStatus(stat) {
	var status;
	switch(stat) {
		case "s" :
			status = "成功";
			break;
		case "f" :
			statu = "失败";
			break;
	}
	return status;
}
function checkProjStatus(stat) {
	var status;
	switch(stat) {
		case "b0" : 
			status = "新建";
			break;
		case "b1" : 
			status = "打回";
			break;
		case "b2" : 
			status = "通过";
			break;
		case "a0" : 
			status = "待成立的";
			break;
		case "a1" : 
			status = "未到期的";
			break;
		case "a2" : 
			status = "正常还款的";
			break;
		case "a3" : 
			status = "未成立的";
			break;
		case "a4" : 
			status = "到期未还款的";
			break;
		case "a5" : 
			status = "担保机构审核中的";
			break;
		case "a6" : 
			status = "等待还款的";
			break;
		case "a7" : 
			status = "超期还款的";
			break;
	}
	return status;
}
function checkTxnStatus(stat) {
	var status;
	switch(stat) {
		case "S" : 
			status = "交易完成";
			break;
		case "I" : 
			status = "处理中";
			break;
		case "F" : 
			status = "交易失败";
			break;
	}
	return status;
}
function checkRepayType(type) {
	var repayType;
	switch(type) {
		case "a" : 
			repayType = "利随本清";
			break;
		case "b" : 
			repayType = "按月本息";
			break;
		case "c" : 
			repayType = "按月本金";
			break;	
	}
	return repayType;
}

$(document).ajaxStart(function(){
	$("#modal")
		.css("opacity", "0")
		.width($(document).width())
		.height($(document).height())
		.show();
	//$('#mask').show();
	//$('.loading').show();
	
	window.setTimeout(function(){
		$("#modal").css("opacity", "0.1");//$('#mask').show();$('.loading').show();
	}, 2000);
	
});

$(document).ajaxComplete(function(){
	$("#modal").hide();
	//$('#mask').hide();
	//$('.loading').hide();
	
});

$(document).ajaxError(function(event, xhr, settings, exception){
	if (xhr.status == 401)
	{
		alert('登录超时，请重新登录');
		window.location.href=$.appurl('login.jsp');
	}
	else
	{
		//alert("系统正在处理中，请稍后再试!");
		$('.loading').show();
		$('#mask').show();
	}
});

</script>
<script type="text/javascript">
function closeWindow(){
	$('#mask').hide();
	$('.loading').hide();
	}
</script>
<jsp:invoke fragment="header"/>
</head>
<body>


<!-- <div id="mask" style="display:none;z-index:10000">
<iframe src="about:blank" id="mask_box" ></iframe>
</div>


<div class="loading" style="display:none;z-index:10001; position:absolute;top:220px;text-align:center;width:100%">
  <div style="width:128px; margin:0 auto">
    <img src="res/images/loading.gif" align="absmiddle">
  </div>
</div> -->


	<div style="display:none;background: gray; position: absolute;opacity:0;z-index:9999" id="modal"></div>

	<jsp:include page="/WEB-INF/inc/navigator.jsp"/>
	<jsp:doBody/>
  	<jsp:include page="/WEB-INF/inc/footer.jsp"/>
   
</body>
</html>