<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:open-layout title="用户测试">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script>
		$(function(){
		});
	</script>
	</jsp:attribute>
	<jsp:body>
	 <div class="conter_2_bg bgf4">
<div class="ycontent">
   
  <div class="main" align="center">
       <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div class="ytrue" align="center">恭喜您，操作成功！<img src="res/images/ytrue1.jpg"/></div></td>
    </tr>
    <tr>
    <td><div class="ybuttondiv"><input type="button" class="button" value="返回"  onclick="location.href='acct-broker-home.jsp'"/></div></td>
    </tr>
  
    </table>
    
      
  </div>
</div>
</div>
	 
	</jsp:body>
</lbt:open-layout>
