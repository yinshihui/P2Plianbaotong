<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="用户资料">
<jsp:attribute name="header">
<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
<style>
.user_right a {
	font-size:12px;
}
#hiddenArea {
	background:rgb(0,0,0);
	background-color:rgba(0,0,0,0.5);
	position:absolute;
	margin-left:auto;
	margin-right:auto;
	display:block;
	top:0;
	left:0;
	height:835px;
	width:100%;
	z-index:200;
}
#wholeContent {
	border-radius:10px;
	border:5px solid rgb(252, 103, 0);
	position:relative;
	width:434px;
	height:110px;
	background-color:white;
	padding:16px;
}
#wholeContent label {
	color:rgb(98, 28, 28);
	font-weight:bolder;
	font-size:16px;
	
}
#wholeContent div {
	background:rgb(255, 241, 134);
}
#introCode {
	font-weight:bolder;
}
</style>
<script>
function CopyLink(text) {
	if (window.clipboardData) {
		clipboardData.setData("Text", text); 
		alert("复制成功！");
	}else {
		alert("请选中链接，按 Ctrl+C 键复制！");
	}
};
$(function(){
	//加载脚本
	var width = window.screen.width;
	var height = 833;
	var height2 = window.screen.height;
	var top = (height2 - $("#wholeContent").height()) / 2;
	var left = (width - $("#wholeContent").width()) / 2;
	$("#wholeContent").css("left", left + "px");
	$("#wholeContent").css("top", top + "px");
	$.getJSON("bank/userInfo")
	.success(function(r){
		 
		$("#introCode").html(r.domain + "/register.jsp?introCode=" + r.acctId);

		/* $.post("bank/acctNoQuery", {usrName : r.name})
		.success(function(res){
			$("#introCode").html(res.domain + "/lbt-www/register.jsp?introCode=" + res.acctNo);
		}); */
	});
	$("#copyContent").click(function(e) {
		e.preventDefault();
		CopyLink($("#introCode").html());
	});
	$("#close").click(function(e) {
		e.preventDefault();
		$("#hiddenArea").hide();
	});
});
</script>
</jsp:attribute>
<jsp:body>
<div class="mainRight">
<div class="user_right">
<div id="hiddenArea">
	<div id="wholeContent">
		<label>复制内容</label><br />
		<div>
			很抱歉目前只支持复制粘贴，后续会推出新的推荐方式！<br />
			直接点击复制内容，将链接发给你的好友：<br/>
			<a title="" id="introCode" href="javascript:;" ></a><br />	
		</div>	
		<button id="copyContent">复制内容</button>
		<button id="close">关闭</button>
	</div>
</div>
</div>
</div>
</jsp:body>
</lbt:user-layout>


 
 