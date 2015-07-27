<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:open-layout title="用户测试">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<style>
	#message {
		font-size:24px!important;
	}
	</style>
	<script>
		$(function(){
			var msg = window.location.href.split("?")[1];
			msg === "s5" ? 
					$("#message").html("恭喜您，融资确认成功！") : 
			msg === "s8" ? 
					$("#message").html("还款已提交,等待银行处理中！") : 
			msg === "s80" ? 
					$("#message").html("还款已提交,等待银行处理中！") : 
			msg === "s7" ?
					$("#message").html("恭喜您，二级审核成功！") : 
			msg === "s4" ?
					$("#message").html("银行处理中，预计一个工作日到账！") : 
			msg === "s9" ?
					$("#message").html("恭喜您，绑卡成功！") :
			msg === "s10" ?
					$("#message").html("恭喜您，该投资人已添加成功！") :
			msg === "s11" ?
					$("#message").html("已将新密码发至您的邮箱，请查收！") :
			msg === "s6" ?
					$("#message").html("恭喜您，一级审核成功！") : null;
		});
	</script>
	</jsp:attribute>
	<jsp:body>
	 <div class="conter_2_bg bgf4">
<div class="ycontent">
   
  <div class="main" align="center">
       <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div class="ytrue" align="center"><label id="message"></label><img src="res/images/ytrue1.jpg"/></div></td>
    </tr>
    <tr>
    <td><div class="ybuttondiv"><input type="button" class="button" value="返回"  onclick="location.href='index.jsp'"/></div></td>
    </tr>
  
    </table>
    
      
  </div>
</div>
</div>
	 
	</jsp:body>
</lbt:open-layout>
