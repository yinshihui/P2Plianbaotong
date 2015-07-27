var myPass = {
	USRNAMEPASS : 0,
	CSTNAMEPASS : 0,
	EMAILPASS : 0,
	INTROCODEPASS : 0
};
/**
 * 自定义校验
 **/
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
var CheckEmail = function(id, placeId, accordCls, unaccordCls) {
	var temp,
		  value = document.getElementById(id).value,
		  place = document.getElementById(placeId),
	  	  regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/g;
	 if (regex.test(value)) {
		 place.innerHTML = "";
		 place.className = accordCls;
		 temp = 1;
	 }else {
		 place.innerHTML = "不符合邮箱格式";
		 place.className = unaccordCls;
		 temp = 0;
	 }
	 return temp;
};
var CheckNumber = function(id, placeId, i, j, accordCls, unaccordCls) {
	var temp,
		  value = document.getElementById(id).value,
		  place = document.getElementById(placeId),
	  	  regex =new RegExp("^\[0-9]{" + i + "," + j + "}$","g");
	 if (regex.test(value)) {
		 place.innerHTML = "";
		 place.className = accordCls;
		 temp = 1;
	 }else {
		 place.innerHTML = "格式不符合";
		 place.className = unaccordCls;
		 temp = 0;
	 } 
	 return temp;
};
/**
 * 自定义fn
 */
var onChange = function(id, fn) {
	var target = document.getElementById(id);
	if ('\v' === 'v') {
		target.onpropertychange = fn;
	}else {
		target.addEventListener('input', fn, false);
	}
};
var random = function(num) {
	var number;
	number = parseInt(num + Math.random() * num);
	return number;
};
/**
 * 真实性校验
 */
var loadCaptcha = function() {
	$("#captchaImage").attr("src", $.appurl("captcha/register?"+(new Date()).getTime()));
};
var introCodeQuery = function() {
	$.post("operator/introCodeQuery", {introCode : $("#introCode").val()})
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		if (res.brokerList[0] === "Broker" && res.bankList) {
			$("#introCodeTip").html("");
			$("#introCodeTip").addClass("accord").removeClass("unaccord");
			myPass.INTROCODEPASS = 1;
			showTrue("introCode");
		}else {
			$("#introCodeTip").html("该推荐人无效！");
			$("#introCodeTip").addClass("unaccord").removeClass("accord");
			myPass.INTROCODEPASS = 0;
			showFalse("introCode");
		}
	})
	.error(function(err) {
		$("#introCodeTip").html("抱歉，推荐人号码格式错误！").addClass("unaccord").removeClass("accord");
		myPass.INTROCODEPASS = 0;
		showFalse("introCode");
	});
};
var usrNameQuery = function() {
	$.post("operator/usrNameQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		if (res.arrayList.length) {
			$("#usrNameTip").html("对不起，该用户名已存在，您可以尝试 " + 
					$("#usrName").val() + random(1000));
			$("#usrNameTip").addClass("unaccord").removeClass("accord");
			myPass.USRNAMEPASS = 0;
			showFalse("usrName");
		}else {
			if ($("#usrName").val()) {
				$("#usrNameTip").html("");
				$("#usrNameTip").addClass("accord").removeClass("unaccord");
				myPass.USRNAMEPASS = 1;
				showTrue("usrName");
			}else {
				myPass.USRNAMEPASS = 0;
				hideTF("usrName");
			}		
		}
	});
};
var cstNameQuery = function() {
	$.post("operator/cstNameQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		if (res.arrayList.length) {
			$("#cstNameTip").html("该姓名已存在!");
			$("#cstNameTip").addClass("unaccord").removeClass("accord");
			myPass.CSTNAMEPASS = 0;
			showFalse("cstName");
		}else {
			if ($("#cstName").val()) {
				$("#cstNameTip").html("");
				$("#cstNameTip").addClass("accord").removeClass("unaccord");
				myPass.CSTNAMEPASS = 1;
				showTrue("cstName");
			}else {
				myPass.CSTNAMEPASS = 0;
				hideTF("cstName");
			}		
		}
	});
};
/*var emailQuery = function() {
	$.post("operator/emailQuery", $("#user_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		if ( res.arrayList.length) {
			$("#emailTip").html("该邮箱已被使用！");
			$("#emailTip").addClass("unaccord").removeClass("accord");
			myPass.EMAILPASS = 0;
			showFalse("email");
		}else {
			if ($("#email").val() && myPass.EMAILPASS) {
				$("#emailTip").html("");
				$("#emailTip").addClass("accord").removeClass("unaccord");
				myPass.EMAILPASS = 1;
				showTrue("email");
			}else {
				myPass.EMAILPASS = 0;
				hideTF("email");
			}		
		}
	});
};*/
/**
 * 标志图标
 * 显示/隐藏
 */
var hideTF = function(targetId) {
	$("#" + targetId).css({border: '1px solid #cccccc'});
	$("#" + targetId).parent().find('.false').hide();
	$("#" + targetId).parent().find('.true').hide();
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
/**************************调用区域********************************/
$(function() {
	
	closeWindow();

	var width = window.screen.width;
	var height = 944;
	var introCode = window.location.href.split("=")[1] ? window.location.href.split("=")[1] : null;
	
	$("#hiddenArea").css("width", width + "px");
	$("#hiddenArea").css("height", height + "px");	
	if (introCode) {	
		$("#introCode").val(introCode);
		$("#introCode").attr("readonly", true);
	}
	
	loadCaptcha();
	/**
	 * 真实性校验
	 */
	$("#usrName").blur(function(e) {
		if ($("#usrName").val()) {
			if(CheckChinese("usrName", "usrNameTip", "accord", "unaccord")) {
				usrNameQuery();
			}else {
				showFalse("usrName");
			}
		}else {
			hideTF("usrName");
		}
		
	});
	$("#cstName").blur(function(e) {
		if ($(this).val()) {
			showTrue("cstName");
		}
	});
/*	$("#email").blur(function(e) {
		emailQuery();
	})*/
	$("#email").change(function() {
		if(CheckEmail("email", "emailTip", "accord", "unaccord")) {
			myPass.EMAILPASS = 1;
			showTrue("email");
		}else {
			if ($("#email").val() !== ""){
				showFalse("email");
			}else {
				$("#emailTip").html("");
				hideTF("email");
			}
			myPass.EMAILPASS = 0;
		}
	});
	$("#introCode").blur(function(e) {
		if ($("#introCode").val()) {
			introCodeQuery();
		}else {
			hideTF("introCode");
			$("#introCodeTip").html("");
		}		
	});

	$("#sub").click(function(e) {
		e.preventDefault();
		var PASS;
		if ($("#introCodeTip").html() === "") {
			PASS = myPass.USRNAMEPASS &&
			//myPass.CSTNAMEPASS &&
			myPass.EMAILPASS;
		}else {
			PASS = myPass.USRNAMEPASS &&
			//myPass.CSTNAMEPASS &&
			myPass.EMAILPASS &&
			myPass.INTROCODEPASS;
		}
		
		$(".true").css("display", "none");
		$(".false").css("display", "none");
		
		if ($("#agreeChoice").is(":checked") && PASS) {
			$.post("register/create", $("#user_form").serialize())
			.success(function(res){
				if (res === "code wrong") {
					$("#codeTrue").css("display", "none");
					$("#codeFalse").css("display", "block");
					alert("验证码错误！");
					loadCaptcha();
				}else {
					$("#codeTrue").css("display", "block");
					$("#codeFalse").css("display", "none");
					$("#captchaTip").html("");
					location.href="register-mail.jsp?" + $("#usrName").val();
				} 
			});
		}else {
			!myPass.USRNAMEPASS ? showFalse("usrName") : null;
			//!myPass.CSTNAMEPASS ? showFalse("cstName") : null;
			!$("#cstName").val() ? showFalse("cstName") : null;
			!myPass.EMAILPASS ? showFalse("email") : null;
			if (!$("#introCodeTip").html() === "") {
				!myPass.INTROCODEPASS ? showFalse("introCode") : null;
			}
			showFalse("captcha");
			alert("请完善页面信息！");
			loadCaptcha();
		}
	});
//	$("#protocol").click(function() {
//		$("#hiddenArea").css("display", "block");
//	});
	$("#captchaImage").click(function() {
		loadCaptcha();
	});
	
	$("#agreeBtn").click(function(e) {
		e.preventDefault();
		closeWindow();
		$('#agreeChoice').attr('checked', true);
	});
	
});