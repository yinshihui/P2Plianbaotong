<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="用户资料">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	 

<style type="text/css">
 
#deleteinvest,
#return {
	background-color:rgb(255, 102, 0)!important;
	border-radius:16px;
	border: 0px solid red!important;
	color:white;
	cursor:pointer;
	font-size:14px;
	transition:.5s;
	-o-transition:.5s;
	-moz-transition:.5s;
	-webkit-transition:.5s;
	height:33px;
	width:88px!important;
}
 
  
#deleteinvest:hover,
#return:hover {
	background-color:rgb(0, 153, 255)!important;
}
</style>
	<script>
	$(function(){
		//加载脚本
		$.getJSON("broker/investorDetail/"+ $.urlParam("cstNo"))
			.success(function(r){
				 
				 var cst = r['cst'];
				 var us = r['usr'];
				 
				 $("#usrNo").html(us.usrNo);
				 $("#usrName").html(us.usrName);
				 $("#cstName").html(cst.cstName);
				 $("#email").html(us.email);
				 $("#certNo").html(cst.certNo);
				 $("#cstMobile").html(us.mobile);
				 
				 
				 
				 $("#deleteinvest").live("click",function(e) {
						$.getJSON("broker/deleteInvestor/" + us.usrNo)
						.success(function(sr) {
							if(sr['result'] == "success" ){
								window.location.href="broker-success.jsp";
							}else{
								alert(sr['result']); 
								}
						});
					}); 
				 
				 $("#return").click(function(e){
						e.preventDefault();
						window.location.href="investor-query.jsp";
						
					});
				 
				 
		});
		
		
	});
	</script>
	</jsp:attribute>
	<jsp:body>
		<div class="mainRight">
      	<div class="user_right">
        	<div class="user_right_tittle">
            	<ul>
                	<li><a href="#" id="usertab1" onclick="usershow(1);" style=" border-bottom:2px solid #ff6600; color:#000000; background:url(res/images/user_tab_on.jpg) center bottom no-repeat;">详细信息</a></li>
                </ul>
            </div>
            <div class="user_content_bg">
            	<ul id="userbox1" >
                	<li><dt>*用户序号：</dt><dd id="usrNo"></dd></li>
                    <li><dt>*用户名：</dt><dd id="usrName"> </dd></li>
                    <li><dt>用户姓名：</dt><dd id="cstName"></dd></li>
                    <li><dt>*用户电子邮箱：</dt><dd id="email"> </dd></li>
                    <li><dt>身份证号：</dt><dd id="certNo"></dd></li>
                    <li><dt>联系电话：</dt><dd id="cstMobile"></dd></li>
                   
                   <li><dt></dt>
						<dd >
						<button id="deleteinvest" type="button">删除</button>
						<button id="return">返回</button></dd></li>
                </ul>
               	  
								
							 
             
            </div>
           
        </div>
    </div>
	</jsp:body>
</lbt:user-layout>


 
 