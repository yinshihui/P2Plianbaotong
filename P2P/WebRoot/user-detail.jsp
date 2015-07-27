<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="用户资料">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	
	
	
	</jsp:attribute>
	<jsp:body>
		<div class="mainRight">
      	<div class="user_right">
        	<div class="user_right_tittle">
            	<ul>
                	<li><a href="#" id="usertab1" onclick="usershow(1);" style=" border-bottom:2px solid #ff6600; color:#000000; background:url(res/images/user_tab_on.jpg) center bottom no-repeat;">基本资料</a></li>
                    <li><a href="#" id="usertab2" onclick="usershow(2);">身份资料</a></li>
                    <li><a href="#" id="usertab3" onclick="usershow(3);">银行卡信息</a></li>
                </ul>
            </div>
            <div class="user_content_bg">
            	<ul id="userbox1" >
                    <li><dt>*用户名：</dt><dd id="usrName"> </dd></li>
                 <!--    <li><dt>*用户类型：</dt><dd id="cstType"> </dd></li> -->
                    <li><dt>*手机号：</dt><dd id="mobile"> </dd></li>
                    <li><dt>*用户电子邮箱：</dt><dd id="email"> </dd></li>
                    
                </ul>
                <ul id="userbox2" style="display:none;">
                   <li><dt>真实姓名：</dt><dd id="cstName"></dd></li>
                   <li><dt>身份证号：</dt><dd id="certNo"></dd></li>
                  <!--   <li hidden="true" ><dt>*公司名称：</dt><dd id="compName"> </dd></li>
                    <li hidden="true" ><dt>*组织机构代码：</dt><dd id="orgNo"> </dd></li>
                    <li hidden="true" ><dt>*营业执照注册号：</dt><dd id="bizCertNo"> </dd></li>
                    <li hidden="true" ><dt>*法人真实姓名：</dt><dd id="coptRealName"> </dd></li>
                    <li hidden="true" ><dt>*法人身份证号：</dt><dd id="coptCertNo"> </dd></li>
 -->                </ul>
                <ul id="userbox3" style="display:none;">
               		 <li><dt>开户名称：</dt><dd id="bankCstName"></dd></li>
                     <li><dt>银行卡号：</dt><dd id="cardNo"></dd></li>
                     <li><dt>农商行电子账号：</dt><dd id="eAcctNo"></dd></li>
                    <!--  <li><dt>开户所在地：</dt><dd id="bankLocal"></dd></li> -->
                     <div class="user_content_zhu">
	             	   <span>注：</span>
                    	  电子账号是您在绑定他行卡时系统自动在重庆农商行注册的电子账户。<br>
                    	  投资前需从其他银行将投资款项转账至该电子账号方可投资！<br>
                                                                               
	                </div>
                </ul>
                
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/user_detail.js"/></script>
	</jsp:body>
</lbt:user-layout>
