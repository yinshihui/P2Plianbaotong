<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="投资人开户">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<style>
		.accord{
			color:green;
		}
		.unaccord {
			color:red;
		}
		.main {
			width:722px;
		}
		
		.ycontent {
			height:375px;
		}
		.ycontent .main {
			height:400px;
			position:relative;
			top:-17px;
		}
		
		.ycontent .title {
			color:black;
			width:78.5%;
			text-align:left;
			font-size:21px;
			border-bottom:2px solid #CCCCCC;
			font-weight:normal;
			padding-left:5px;
			top:-70px;
			height:50px;
		}
		.ycontent .main table {
			margin:30px 0 20px 0;
		}
		.ycontent .main table tr {
			line-height:20px;
			height:56px!important;
		}
		.ycontent .main table th {
			font-size:16px;
			font-weight:normal;
		}
		.ycontent .main table td b {
			line-height:17px;
		}
		.user_right {
			background:rgba(0,0,0,0)!important;
			border:0px solid red;
		}
</style>
<script type="text/javascript">
var myPass = {
	USRNAMEPASS : 0,
	CSTNAMEPASS : 0,
	EMAILPASS : 0
};
var loadCaptcha = function() {
	$("#captchaImage").attr("src", $.appurl("captcha/broker?"+(new Date()).getTime()));
};
var CheckEmail = function(id, placeId, accordCls, unaccordCls) {
	var temp,
		  value = document.getElementById(id).value,
		  place = document.getElementById(placeId),
	  	  regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/g;
	 if (value) {
		 if (regex.test(value)) {
			 place.innerHTML = "";
			 place.className = accordCls;
			 temp = 1;
		 }else {
			 place.innerHTML = "不符合邮箱格式";
			 place.className = unaccordCls;
			 temp = 0;
		 }
	 }else {
		 place.innerHTML = "";
		 temp = 0;
	 }
	
	 return temp;
};
var CheckChinese = function(id, placeId, accordCls, unaccordCls) {
	var target = document.getElementById(id),
		  place = document.getElementById(placeId),
		  temp;
	if (target.value) {
		if (escape(target.value).indexOf("%u") < 0) { 
			place.innerHTML = "";
			place.className = accordCls;
			temp = 1;
		}else {
			place.innerHTML = "对不起，不可包含汉字";
			place.className = unaccordCls;
			temp = 0;
		}
	}else {
		place.innerHTML = "";
		temp = 0;
	}	
	return temp;
};
var showTrue = function(targetId) {
	$("#" + targetId).css({border: '1px solid #cccccc'});
	$("#" + targetId).parent().find('.false').hide();
	$("#" + targetId).parent().find('.true').show();
};
var showFalse = function(targetId) {
	$("#" + targetId).css({border: '1px solid #dd0000'});
	$("#" + targetId).parent().find('.false').show();
	$("#" + targetId).parent().find('.true').hide();
};
function usrNameQuery() {
	var usrNameTip = document.getElementById("usrNameTip");
	$.post("operator/usrNameQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		$("#sub").attr("disabled", false);
		if (res.arrayList.length) {
			usrNameTip.innerHTML = "该用户名已存在";
			usrNameTip.className = "unaccord";
			myPass.USRNAMEPASS = 0;
			showFalse("usrName");
			$("#sub").attr("disabled", true);
		}else {
			usrNameTip.innerHTML = "";
			myPass.USRNAMEPASS = 1;
			showTrue("usrName");
			$("#sub").attr("disabled", false);
		}
	});
};
function cstNameQuery() {
	var cstNameTip = document.getElementById("cstNameTip");
	$.post("operator/cstNameQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		$("#sub").attr("disabled", false);
		if (res.arrayList.length) {
			cstNameTip.innerHTML = "该姓名已存在";
			$("#cstName").parent().children(".false").show();
			$("#cstName").parent().children(".true").hide();
			$("#sub").attr("disabled", true);
		}else {
			cstNameTip.innerHTML = "";
			$("#sub").attr("disabled", false);
		}
	});
};
function totalHide(target) {
	if (!target.val()) {
		target.parent().children(".false").hide();
		target.parent().children(".true").hide();
		$(target).css({border: '1px solid #cccccc'});
	}
}
var CheckNumber = function(id, placeId, i,accordCls, unaccordCls) {
	var value = document.getElementById(id).value,
		  place = document.getElementById(placeId),
	  	  regex =new RegExp("^\[0-9]{" + i + "}$","g"),
	  	  temp = 0;
	if (value) {
		 if (regex.test(value)) {
			 place.innerHTML = "用户名不可全为数字！";
			 place.className = unaccordCls;
			 temp = 0;
		 }else {
			 place.innerHTML = "";
			 place.className = accordCls;
			 temp = 1;
		 }
	}else {
		place.innerHTML = "";
		temp = 0;
	}
	
	 return temp;
};
function emailQuery() {
	var emailTip = document.getElementById("emailTip");
	$.post("operator/emailQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		$("#sub").attr("disabled", false);
		if (res.arrayList.length) {
			emailTip.innerHTML = "该邮箱已被使用 ";
			$("#email").parent().children(".false").show();
			$("#email").parent().children(".true").hide();
			$("#sub").attr("disabled", true);
		}else {
			emailTip.innerHTML = "";
			$("#sub").attr("disabled", false);
		}
	});
};


$(function(){
	loadCaptcha();
	$.post("bank/bindCardQuery")
	.success(function(res) {
		var list = res.cardList;
		if (!list) {
			alert("对不起，您没有绑定银行卡，不能进行融资人开户！");
			$("#usrName").attr("disabled", true);
			$("#cstName").attr("disabled", true);
			$("#email").attr("disabled", true);
			$("#sub").attr("disabled", true);
			$("#sub").css("display", "none");
		}
	});
	/* $("#user_form").validate({
		rules:{
			usrName:{
				required : true
			},
			cstName:{
				required : true
			},
			email:{
				email:true,
				required:true
			}
		},
		highlight : function(element, errorClass) {
			$(element).parent().parent().children("td").children(".false").show();
			$(element).parent().parent().children("td").children(".true").hide();
		},
		unhighlight : function(element, errorClass) {
			$(element).parent().parent().children("td").children(".false").hide();
			$(element).parent().parent().children("td").children(".true").show();
		}, 
		errorPlacement:function(error, element){
			//不显示出错信息
		},
 		submitHandler:function(form) {
			$(form).ajaxSubmit(function(r) {
				if (r === '')
					//location.href = "..";
					//location.href="register-mail.jsp?" + $("#usrName").val();
					location.href = "success.jsp?s10";
				else
					alert(r);
			});
		} 
	});*/
	$("#captchaImage").click(function(e){
		loadCaptcha();
	});
	$("#sub").click(function(e) {
		e.preventDefault();
		if (myPass.EMAILPASS 
				&& myPass.USRNAMEPASS 
				&& myPass.CSTNAMEPASS) {
			$.post("register/createInvestor", $("#user_form").serialize())
			.success(function(res) {
				if (res === "code wrong") {
					alert("验证码错误！");
					loadCaptcha();
				}else {
					location.href = "broker-success.jsp";
				}	
			}).error(function(r) {
				alert("投资人添加失败！");
				loadCaptcha();
			});
		}else {
			alert("请完善页面信息！");
			loadCaptcha();
		}
		
	});
	$("#user_form input")
		.blur(function(){
			$(this).parent().children(".ts").hide();
		})
		.focus(function(){
			$(this).parent().children(".ts").show();
			$(this).parent().children(".true").hide();
			$(this).parent().children(".false").hide();
		});
	
	
	$("#usrName").blur(function(e) {
		//usrNameQuery();
		var len = $(this).val().length;
		if(CheckChinese("usrName", "usrNameTip", "accord", "unaccord")) {
			if (CheckNumber("usrName", "usrNameTip", len, "accord", "unaccord")) {
				usrNameQuery();
			}else {
				$("#sub").attr("disabled", true);
				showFalse("usrName");
				$(this).val("");
			}
		}else {
			$("#sub").attr("disabled", true);
			showFalse("usrName");
		}
		totalHide($("#usrName"));
	});
	$("#cstName").blur(function(e) {
		//cstNameQuery();
		if ($(this).val()) {
			myPass.CSTNAMEPASS = 1;
			showTrue("cstName");
		}
		totalHide($("#cstName"));
	});
	$("#email").blur(function(e) {
		//emailQuery();
		if (CheckEmail("email", "emailTip", "accord", "unaccord")) {
			$("#sub").attr("disabled", false);
			myPass.EMAILPASS = 1;
			showTrue("email");
		}else {
			$("#sub").attr("disabled", true);
			myPass.EMAILPASS = 0;
			showFalse("email");
		}
		totalHide($("#email"));
	});
	
});
</script>
	</jsp:attribute>
	<jsp:body>
		<div class="mainRight">
      	<div class="user_right">
	  <div class="box">
        <ul class="boxUL">
		<form id="user_form" name="usr_form">
		<!--content-->
		<div class="conter_2_bg bgf4">
			<div class="ycontent">
				<div class="title">投资人开户</div>
			  	<div class="main">				  
					  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
					  
<!-- 					    <tr>
							    <th><span>* </span>账户类型</th>
							    <td>
							    	<input type="radio" checked="checked"/>个人用户		
							    	<input type="radio"/>企业用户					

							     </td> 
						  </tr> -->
					  
						  <tr>
							    <th><span>* </span>用户名:</th> 
							    <td>
							    	<input name="usrName" id="usrName" type="text" maxlength="20" class="input"/>			
							    	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>	
							    	<div class="ts" style="display:none">请输入您的用户名。</div>		
							    	<label id="usrNameTip"></label>
							    </td>					
						  </tr>
						  <tr>
							    <th><span>* </span>真实姓名:</th>
							    <td>
							    	<input name="cstName" id="cstName" type="text" maxlength="10" class="input"/>
							    	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
							    	<div class="ts" style="display:none">若名称包含生僻字，请点此打开生僻字库进行选择。</div>
							   		<label id="cstNameTip"></label>
							    </td>
						  </tr>
						  <tr>
							    <th><span>* </span>常用电子信箱:</th>
							    <td>
								    <input name="email" id="email" type="text" class="input"/>
								    <img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
								    <div class="ts" style="display:none">请输入您常用的电子信箱。</div> 
								    <label id="emailTip"></label>
							     </td>
						   </tr>
						  <tr>
						  	 <th><span>* </span>验证码:</th>
						  	 <td>
						  	 	<!--  <input type="text" name="code" id="code" class="input" maxlength="8"/> -->
						  	 	<input type="text" class="input" id="captcha" name="captcha" maxlength="6" style="float:left;"/>
						  	 	
						  	 </td>
						  </tr>
						  <tr>
						  	<th></th>
						  	<td><img id="captchaImage"></td>
						  </tr>
						</table>
						<div class="ybuttondiv">
							<button id="sub" class="button" >立即开户</button>
						</div>
				  </div>
				</div>
			</div>
		</form>
	       </ul>
      </div>
	 
</div>
</div>
	</jsp:body>
</lbt:user-layout>

 