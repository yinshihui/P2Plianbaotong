<%@ tag language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<%@ attribute name="title" description="页面标题"%>
<%@ attribute name="header" fragment="true" description="额外的head区内容，包括页面加载脚本" %>
<lbt:main-layout title="${title}">
	<jsp:attribute name="header">
		<jsp:invoke fragment="header"/>
	</jsp:attribute>
	<jsp:body>
	<script language="javascript" type="text/javascript">
$(document).ready(function(){
	$(".clickmenu").mousemove(function(){
		$(this).addClass("org"); 	
	});
	
	$(".clickmenu").mouseleave(function(){
		$(this).removeClass("org"); 	
	});
	
	$(".clickmenu").click(function(){
		$(this).addClass("org1").siblings().removeClass("org1");  	
	});
	
	$("#intro").click(function() {
		window.location = "introCode.jsp";
	});
})
</script>
<style>
#intro:hover {
	cursor:pointer;
} 
</style>
	<div class="mainBox">
  <ul class="mainCenter">
<%-- 	<sec:authorize ifAnyGranted="Investor"> --%>
	
	 <div class="mainLeft">
      <div class="leftMenu">
        <ul>
          
        	<!-- 投资人权限 -->
          <sec:authorize ifAnyGranted="Investor">
 		  <li class="clickmenu" onclick="location.href='acct-home.jsp'"><b class="icon1"></b><span class="f16">投资人主页</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">账户管理</span><b class="arrow"></b></li>
          <li onclick="location.href='project-query.jsp'" class="leftMenu2 clickmenu"><b class="icon5"></b><span href="project-query.jsp">我要投资</span><b class="arrow"></b></li>
          <li onclick="location.href='user-bank2.jsp'" class="leftMenu2 clickmenu"><b class="icon3"></b><span href="user-bank2.jsp">绑定银行卡</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li><b class="icon7"></b><span class="f16">交易查询</span><b class="arrow"></b></li>
          <li onclick="location.href='invest-query.jsp'" class="leftMenu2 clickmenu"><b class="icon8"></b><span href="invest-query.jsp">投资记录</span><b class="arrow"></b></li>
<!--           <li onclick="location.href='transfer-in-query.jsp'" class="leftMenu2 clickmenu"><b class="icon10"></b><span href="transfer-in-query.jsp">收益记录</span><b class="arrow"></b></li>
 -->          <li onclick="location.href='transfer-out-query.jsp'" class="leftMenu2 clickmenu"><b class="icon10"></b><span href="transfer-out-query.jsp">划出记录</span><b class="arrow"></b></li>
         
          </sec:authorize>
          
           <!-- 担保公司权限 -->
          <sec:authorize ifAnyGranted="EnsureCorp">
          <li class="clickmenu" onclick="location.href='guarantee-project-query.jsp'"><b class="icon1"></b><span class="f16">担保公司主页</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">账户管理</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">用户管理</span><b class="arrow"></b></li>
          <li onclick="location.href='operator.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="operator.jsp">审批员添加</span><b class="arrow"></b></li>
          <li onclick="location.href='operator-check.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="operator-check.jsp">审批员浏览</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">项目管理</span><b class="arrow"></b></li>
          <li onclick="location.href='guarantee-project-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="guarantee-project-query.jsp">项目查询</span><b class="arrow"></b></li>
 			<li onclick="location.href='transfer-in-query.jsp'" class="leftMenu2 clickmenu"><b class="icon10"></b><span href="transfer-in-query.jsp">收益记录</span><b class="arrow"></b></li>
          </sec:authorize>
          
           <!-- 一级审核员权限 -->
          <sec:authorize ifAnyGranted="s0_EnsureUser">
          <li class="clickmenu" onclick="location.href='ensure-proj-fquery.jsp'"><b class="icon1"></b><span class="f16">一级审核主页</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li onclick="location.href='ensure-proj-fquery.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-proj-fquery.jsp">一级审核</span><b class="arrow"></b></li>
         <li onclick="location.href='ensure-comp-proj-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-proj-fquery.jsp">项目查询</span><b class="arrow"></b></li>
         <li onclick="location.href='ensure-comp-transin-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-comp-transin-query.jsp">收益查询</span><b class="arrow"></b></li>
          
          </sec:authorize>
           <!-- 二级审核员权限 -->
           <sec:authorize ifAnyGranted="s1_EnsureUser">
          <li class="clickmenu" onclick="location.href='ensure-proj-squery.jsp'"><b class="icon1"></b><span class="f16">二级审核主页</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li onclick="location.href='ensure-proj-squery.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-proj-squery.jsp">二级审核</span><b class="arrow"></b></li>
          <li onclick="location.href='ensure-comp-proj-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-proj-fquery.jsp">项目查询</span><b class="arrow"></b></li>
          <li onclick="location.href='ensure-comp-transin-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="ensure-comp-transin-query.jsp">收益查询</span><b class="arrow"></b></li>
        
          </sec:authorize>
          
          <!-- 经纪人权限 -->
          <sec:authorize ifAnyGranted="Broker">
          <li class="clickmenu" onclick="location.href='acct-broker-home.jsp'"><b class="icon1"></b><span class="f16">经纪人主页</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">账户管理</span><b class="arrow"></b></li>
          <li onclick="location.href='user-bank2.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-bank2.jsp">绑定银行卡</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">投资人管理</span><b class="arrow"></b></li>
          <li onclick="location.href='investor-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="investor-query.jsp">投资人管理</span><b class="arrow"></b></li>
          <li onclick="location.href='broker-cst-register.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="broker-cst-register.jsp">投资人添加</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">业务查询</span><b class="arrow"></b></li>
          <li onclick="location.href='broker-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="broker-query.jsp">业务统计</span><b class="arrow"></b></li>
		   <li onclick="location.href='transfer-out-query.jsp'" class="leftMenu2 clickmenu"><b class="icon10"></b><span href="transfer-out-query.jsp">划出记录</span><b class="arrow"></b></li>
		  <li id="intro"><b class="icon2"></b><span class="f16">我要推广</span><b class="arrow"></b></li>
<!--  		  <li onclick="location.href='transfer-in-query.jsp'" class="leftMenu2 clickmenu"><b class="icon10"></b><span href="transfer-in-query.jsp">收益记录</span><b class="arrow"></b></li>
 -->         
          </sec:authorize>
          <!-- 融资人权限 -->
          <sec:authorize ifAnyGranted="Financier">
          <li class="clickmenu" onclick="location.href='acct-financier-home.jsp'"><b class="icon1"></b><span class="f16">融资人主页</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">账户管理</span><b class="arrow"></b></li>
          <li onclick="location.href='user-bank2.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-bank2.jsp">绑定银行卡</span><b class="arrow"></b></li>
          <li onclick="location.href='user-detail.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="user-detail.jsp">用户资料</span><b class="arrow"></b></li>
          <li onclick="location.href='###'"><b class="icon2"></b><span class="f16">融资人</span><b class="arrow"></b></li>
          <li onclick="location.href='financier-project-query.jsp'" class="leftMenu2 clickmenu"><b class="icon6"></b><span href="financier-project-query.jsp">融资人项目查询</span><b class="arrow"></b></li>
          </sec:authorize>
          <li class="clickmenu" onclick="location.href='security.jsp'"><b class="icon1"></b><span class="f16">安全中心</span><b class="arrow"></b></li>
        </ul>
      </div>
    </div>
   
		 
			<jsp:doBody/>
		   </ul>
</div>
	</jsp:body>
</lbt:main-layout>
 
