<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<lbt:main-layout title="填写会员信息">
	<jsp:attribute name="header">
	</jsp:attribute>
	
	<jsp:body>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/pwdchange.css" type="text/css" /> 
		<script type="text/javascript">
// 		$(document).ready(function(){

// 			});
			
		$(function() {
			
			$('.input').focus(function(){ 
				$(this).css({border: '1px solid #ff6600'});
				$(this).parent().find('.ts').show();
				}
				  );
				  $('.input').blur(function(){ 
				$(this).css({border: '1px solid #cccccc'});
				$(this).parent().find('.ts').hide();
				
				}
				  );
			
			$("#pwdchg_form").validate({
				rules:{
					usrName:"required",
					email:"required"
				},
				
				messages:{
					usrName:"请输入您的用户名",
					email:"请输入您的邮箱地址"
				}
			});
			$("#usrName").blur(function() {
				if ($(this).val()) {
					$(this).parent().children(".true").show();
				}else {
					$(this).parent().children(".true").hide();
				}
			});
			$("#email").blur(function() {
				var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/g;
				if ($(this).val()) {
					if (regex.test($(this).val())) {
						$(this).parent().children(".true").show();
						$(this).parent().children(".false").hide();
					}else {
						$(this).parent().children(".true").hide();
						$(this).parent().children(".false").show();
					}
				}else {
					$(this).parent().children(".true").hide();
					$(this).parent().children(".false").hide();
				}
				
			});
			$("#sub").click(function(e){
				e.preventDefault();
				if($("#usrName").val() && $("#email").val()){
				 $.post("pwdChange/sendTxnpwdchgMail", {usrName:$("#usrName").val(),email:$("#email").val()})
		  	    	.success(function(r){
		  	    		var result = r['result'];
		  	    		if (result =="发送成功" ){
		  	    			window.location.href="success.jsp?s11";
		  	    		}else {
		  	    			$("#retunresult").css("color", "red").text(result);
		  	    		}    		 
	 	    	});
				}else{
					
					if(!$("#nameerror").val())
						$("#nameerror").show();
					
					if(!$("#emailerror").val())
						$("#emailerror").show();
				}
			});
		
		});
		</script>
		
		<form id="pwdchg_form">
		<!--content-->
		<div class="conter_2_bg bgf4">
			<div class="ycontent">
				<div class="title">交易密码重置申请</div>
			  	<div class="main" id="mainContent">
				    　
				      
					  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						  <tr>
							    <th><span>* </span>用户名</th>
							    <td>
							    	<input name="usrName" id="usrName" type="text" maxlength="20" class="input"/>						
							      	<div  id="nameerror" class="ts" style="display:none">请输入您的用户名。</div>
							      	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
							     </td>
						  </tr>
						  <tr>
							    <th><span>* </span>电子信箱</th>
							    <td>
								    <input name="email" id="email" type="text" class="input" />
							    	<div id="emailerror" class="ts" style="display:none">请输入您的电子邮箱。</div>
							     	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
							     	
							    </td>
						  </tr>
						   <tr  >
							<th></th><td id="retunresult" align="center"></td> 
						</tr>
<!-- 						  <tr> -->
<!-- 							<td align="center" colspan="2"><input type="submit" id="sub"></td>  -->
<!-- 						</tr> -->
						</table> 
						<div class="ybuttondiv">
							<button id="sub" class="button">提交</button>
						</div>
				  </div>	
				</div>
			</div>
		</form>
	</jsp:body>
</lbt:main-layout>