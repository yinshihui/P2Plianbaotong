var myPass = {
	SMSPASS : 0,
	LOGINPASS : 0,
	RELOGINPASS : 0,
	TXNPASS : 0,
	RETXNPASS : 0,
	MOBILE : 0
};
/**
 * 自定义校验
 */
var CheckMobile = function(id, placeId, accordCls, unaccordCls) {
	var temp,
		  value = document.getElementById(id).value,
		  place = document.getElementById(placeId),
	  	  regex = /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8}$/g;
	 if (regex.test(value)) {
		 place.innerHTML = "";
		 place.className = accordCls;
		 showTrue(id);
		 temp = 1;
	 }else if (value) {
		 place.innerHTML = "不符合手机格式";
		 place.className = unaccordCls;
		 showFalse(id);
		 temp = 0;
	 }else {
		 place.innerHTML = "";
		 hideTF(id);
		 temp = 0;
	 }
	 return temp;
};
var CheckTheSame = function(targetId, targetId2, placeId, placeId2, unaccordCls) {
	var temp,
		  value1 = document.getElementById(targetId).value,
		  value2 = document.getElementById(targetId2).value,
		  place = document.getElementById(placeId),
		  place2 = document.getElementById(placeId2);
	if (value1 === value2 && value1 && value2) {
		place.innerHTML = "";
		place2.innerHTML = "";
		showTrue(targetId);
		showTrue(targetId2);
		temp = 1;
	}else if (value1 !== value2 && value1 && value2) {
		place.innerHTML = "内容不一致";
		place.className = unaccordCls;
		showFalse(targetId);
		temp = 0;
	}else {
		hideTF(targetId);
		temp = 0;
	}
	return temp;
};
var CheckLength = function(id, placeId, minLength, maxLength, accordCls, unaccordCls) {
	var temp,
		  len = document.getElementById(id).value.length,
		  place = document.getElementById(placeId);
	if (len >= minLength && len <= maxLength) {
		place.innerHTML = "";
		place.className = accordCls;
		showTrue(id);
		temp = 1;
	}else if (len < minLength && len) {
		place.innerHTML = "长度不符合，至少" + minLength + "位";
		place.className = unaccordCls;
		showFalse(id);
		temp = 0;
	}else if (len > maxLength) {
		place.innerHTML = "长度不符合，最多" + maxLength + "位";
		place.className = unaccordCls;
		showFalse(id);
		temp = 0;
	}else {
		place.innerHTML = "";
		hideTF(id);
		temp = 0;
	}
	return temp;
};
/**
 * 标志图标
 * 显示/隐藏
 */
var hideTF = function(targetId) {
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
/**
 * 自定义fn
 */
var AddEvent = function(id, handler, fn) {
	var target = document.getElementById(id);
	if ("v" === "\v") {
		target.attachEvent("on" + handler, fn);
	}else {
		target.addEventListener(handler, fn, false);
	}
};
var OnPropertyChange = function(id, fn) {
	var target = document.getElementById(id);
	if ('\v' === 'v') {
		target.onpropertychange = fn; 
	}else {
		target.addEventListener('input', fn, false);
	}
};
/**
 * 真实性校验
 */
var mobileQuery = function() {
	$.post("operator/mobileQuery", {mobile : $("#mobile").val()})
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
//		if (res.arrayList !== null) {
//			$("#mobileTip").html("对不起，该手机号已被占用！");
//			$("#mobileTip").addClass("unaccord").removeClass("accord");
//			myPass.MOBILE = 0;
//			showFalse("mobile");
//		}else {
			$("#mobileTip").html("");
			$("#mobileTip").addClass("accord").removeClass("unaccord");
			myPass.MOBILE = 1;
			showTrue("mobile");	
//		}
	});
};

function hidej(){
	$('#jumpTo1').hide();
	$('#jumpTo').hide();
	$('#sendsms').attr("disabled",false);
	}   
/*******************调用区域***************************/
$(function() {
	
	$("#usrName").val($.urlParam("usr"));
	
/*	OnPropertyChange("loginPWD", function() {
		if (CheckLength("loginPWD", "loginPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("loginPWD", "reLoginPWD", "loginPWDTip", "reLoginPWDTip", "unaccord") ? 
					myPass.LOGINPASS = 1 : myPass.LOGINPASS = 0; 
		}
		 
	});*/
	$("#loginPWD").focus(function() {
		if (CheckLength("loginPWD", "loginPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("loginPWD", "reLoginPWD", "loginPWDTip", "reLoginPWDTip", "unaccord") ?
					myPass.LOGINPASS = 1 : myPass.LOGINPASS = 0; 
		}
		 
	}).blur(function() {
		if (CheckLength("loginPWD", "loginPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("loginPWD", "reLoginPWD", "loginPWDTip", "reLoginPWDTip", "unaccord") ?
					myPass.LOGINPASS = 1 : myPass.LOGINPASS = 0; 
		}
	});
/*	
	OnPropertyChange("reLoginPWD", function() {
		if ($("#loginPWD").val()) {
			if(CheckLength("reLoginPWD", "reLoginPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reLoginPWD", "loginPWD", "reLoginPWDTip", "loginPWDTip", "unaccord")) {
					myPass.LOGINPASS = 1; 
					myPass.RELOGINPASS = 1;
				}else {
					myPass.LOGINPASS = 0; 
					myPass.RELOGINPASS = 0; 
				}
			}
		}	
	});*/
	$("#reLoginPWD").focus(function() {
		if ($("#loginPWD").val()) {
			if(CheckLength("reLoginPWD", "reLoginPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reLoginPWD", "loginPWD", "reLoginPWDTip", "loginPWDTip", "unaccord")) {
					myPass.LOGINPASS = 1; 
					myPass.RELOGINPASS = 1;
				}else {
					myPass.LOGINPASS = 0; 
					myPass.RELOGINPASS = 0; 
				}
			}
		}	
	}).blur(function() {
		if ($("#loginPWD").val()) {
			if(CheckLength("reLoginPWD", "reLoginPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reLoginPWD", "loginPWD", "reLoginPWDTip", "loginPWDTip", "unaccord")) {
					myPass.LOGINPASS = 1; 
					myPass.RELOGINPASS = 1;
				}else {
					myPass.LOGINPASS = 0; 
					myPass.RELOGINPASS = 0; 
				}
			}
		}	
	});
	
/*	OnPropertyChange("txnPWD", function() {
		if (CheckLength("txnPWD", "txnPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("txnPWD", "reTxnPWD", "txnPWDTip", "reTxnPWDTip", "unaccord") ?
					myPass.TXNPASS = 1 : myPass.TXNPASS = 0; 
		}
	});*/
	$("#txnPWD").focus(function() {
		if (CheckLength("txnPWD", "txnPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("txnPWD", "reTxnPWD", "txnPWDTip", "reTxnPWDTip", "unaccord") ?
					myPass.TXNPASS = 1 : myPass.TXNPASS = 0; 
		}
	}).blur(function() {
		if (CheckLength("txnPWD", "txnPWDTip", 8, 20, "accord", "unaccord")) {
			CheckTheSame ("txnPWD", "reTxnPWD", "txnPWDTip", "reTxnPWDTip", "unaccord") ?
					myPass.TXNPASS = 1 : myPass.TXNPASS = 0; 
		}
	});
	
/*	OnPropertyChange("reTxnPWD", function() {
		if ($("#txnPWD").val()) {
			if (CheckLength("reTxnPWD", "reTxnPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reTxnPWD", "txnPWD", "reTxnPWDTip", "txnPWDTip", "unaccord")) {
					myPass.TXNPASS = 1;
					myPass.RETXNPASS = 1;
				}else {
					myPass.TXNPASS = 0; 
					myPass.RETXNPASS = 0; 
				}
			}
		}
	});*/
	$("#reTxnPWD").focus(function() {
		if ($("#txnPWD").val()) {
			if (CheckLength("reTxnPWD", "reTxnPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reTxnPWD", "txnPWD", "reTxnPWDTip", "txnPWDTip", "unaccord")) {
					myPass.TXNPASS = 1;
					myPass.RETXNPASS = 1;
				}else {
					myPass.TXNPASS = 0; 
					myPass.RETXNPASS = 0; 
				}
			}
		}
	}).blur(function() {
		if ($("#txnPWD").val()) {
			if (CheckLength("reTxnPWD", "reTxnPWDTip", 8, 20, "accord", "unaccord")) {
				if (CheckTheSame ("reTxnPWD", "txnPWD", "reTxnPWDTip", "txnPWDTip", "unaccord")) {
					myPass.TXNPASS = 1;
					myPass.RETXNPASS = 1;
				}else {
					myPass.TXNPASS = 0; 
					myPass.RETXNPASS = 0; 
				}
			}
		}
	});

	/*OnPropertyChange("mobile", function() {
		if (CheckMobile("mobile", "mobileTip", "accord", "unaccord")) {
			mobileQuery();
		}
	});*/
	/*	$("#mobile").focus(function() {
		CheckMobile("mobile", "mobileTip", "accord", "unaccord") ?
				myPass.MOBILE = 1 : myPass.MOBILE = 0;
	}).blur(function() {
		CheckMobile("mobile", "mobileTip", "accord", "unaccord") ?
				myPass.MOBILE = 1 : myPass.MOBILE = 0;
	});*/
	$("#mobile").blur(function() {
		if (CheckMobile("mobile", "mobileTip", "accord", "unaccord")) {
			mobileQuery();
		}
	}).focus(function() {
		if (CheckMobile("mobile", "mobileTip", "accord", "unaccord")) {
			mobileQuery();
		}
	});
	
	$("#sendsms").click(function(e){
		e.preventDefault();
		var mobile = $("#mobile").val();
		if (mobile) {
			$("#smsTip").html("");
			$.getJSON("register/sendActiveSms", {mobileNumber:mobile}, function(resp){
				$('#sendsms').attr("disabled",true);
				$('#jumpTo').show();
				$('#jumpTo1').show();
				countDown(60,'###');
				setTimeout('hidej()',60000);
				var identifycode = resp['identifycode'];
				 
				//alert("验证码"+identifycode);
				$("#sms").blur(function() {
					if ($(this).val() === identifycode) {
						$("#smsTip").html("恭喜，验证码正确！").addClass("accord").removeClass("unaccord");
						showTrue("sms");
						myPass.SMSPASS = 1;
					}else if ($(this).val() !== identifycode && $(this).val()){
						$("#smsTip").html("对不起，验证码错误！").addClass("unaccord").removeClass("accord");
						showFalse("sms");
						myPass.SMSPASS = 0;
					}else {
						$("#smsTip").html("");
						hideTF("sms");
						myPass.SMSPASS = 0;
					} 
				});
			});
		}else {
			alert("请先填写您的手机号！");
		}	 
	});
	//AddEvent("sub2", "click", function(e) {
	$("#sub2").click(function(e) {
		if ("v" === "\v") {
			;
		}else {
			e.preventDefault();
		}
		var PASS = myPass.LOGINPASS &&
				myPass.RELOGINPASS &&
				myPass.RETXNPASS &&
				myPass.TXNPASS &&
				myPass.MOBILE &&
				myPass.SMSPASS;
		if(PASS) {
			$.post("operator/usrNameQuery", {usrName : $("#usrName").val()})
			.success(function(res) {
				if (res.arrayList.length) {
					$.post("register/createUsrLogin", $("#user_form").serialize())
					.success(function(r) {
						if (r.status === "ok") {
							location.href = "..";
						}else {
							;
						}	
						setTimeout(function() {
							window.location = "register-success.jsp";
						}, 100);
					});					
				}else {
					alert("对不起找不到该用户！");
					window.location = "login.jsp";
				}				
			});
		}else {
		 
			!myPass.LOGINPASS ? showFalse("loginPWD") : null;
			!myPass.RELOGINPASS ? showFalse("reLoginPWD") : null;
			!myPass.TXNPASS ? showFalse("txnPWD") : null;
			!myPass.RETXNPASS ? showFalse("reTxnPWD") : null;
			!myPass.MOBILE ? showFalse("mobile") : null;
			if (myPass.SMSPASS) {
				showTrue("sms");
			}else {
				showFalse("sms");
				$("#smsTip").html("验证码错误！").addClass("unaccord").removeClass("accord");
			}			
			alert("请完善页面信息！");
		}		
	});
});

/*
 * 	$(function(){
			$("#sendsms").click(function(e){
				e.preventDefault();
				var mobile = $("#mobile").val();
				if (mobile) {
					$("#smsTip").html("");
					$.getJSON("register/sendActiveSms", {mobileNumber:mobile}, function(resp){
						var identifycode = resp['identifycode'];
						alert("验证码已发送，请您即刻查验！");
						$("#textfield8").blur(function() {
							if ($(this).val() === identifycode) {
								$("#smsTip").html("恭喜，验证码正确！");
								myPass.SMSPASS = 1;
							}else if ($(this).val() !== identifycode && $(this).val()){
								$("#smsTip").html("对不起，验证码错误！");
								myPass.SMSPASS = 0;
							}else {
								$("#smsTip").html("");
							} 
						});
					});
				}else {
					alert("请先填写您的手机号！");
				}
				 
			});
			 
			
		});
 */