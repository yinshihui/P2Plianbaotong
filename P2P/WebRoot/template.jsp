<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="用户测试">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script>
		$(function(){
		});
	</script>
	</jsp:attribute>
	<jsp:body>
		<%-- 具体的内面内容 --%>
		test body
	</jsp:body>
</lbt:user-layout>
