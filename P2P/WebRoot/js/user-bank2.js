var myBank = {
	BANKCHOOSE : 1	
};
function SetCookie(name,value) {
    var Days = 0.1; 
    var exp  = new Date();    
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
};
function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;

};
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
};
function closeWindow(){
	$('#mask').hide();
	$('.message_box_div').hide();
}
	
function showWindow(){
	$('#mask').show();
	$('.message_box_div').show();
}
var OnPropertyChange = function(id, fn) {
	var target = document.getElementById(id);
	if ('\v' === 'v') {
		target.onpropertychange = fn; 
	}else {
		target.addEventListener('input', fn, false);
	}
};
var OnKeyChange = function(id, fn) {
	var target = document.getElementById(id);
	if ('\v' === 'v') {
		target.attachEvent('onkeydown', fn);
	}else {
		target.addEventListener('keydown', fn, false);
	}
};
function addEvent(id, handler, fn) {
	var target = document.getElementById(id);
	if ("v" === "\v") {
		//ie
		target.attachEvent("on" + handler, fn);
	}else {
		target.addEventListener(handler, fn, false);
	}
};

function hidej(){
	$('#jumpTo1').hide();
	$('#jumpTo').hide();
	$('#getCheckCode').attr("disabled",false);
	} 

/*******************调用区域***************************/
$(function() {	
	var agreeChoice = document.getElementById("agreeChoice");
	
	closeWindow();
	$.getJSON("security/current-user")
	.success(function(r){
		if (r.name !== "") {
			$(".register").css("display", "none");
			$("#loginTip").html("");
			$("#registerTip").html("");
			$("#acctNowTip").html("当前用户:");
			$("#exitTip").html("退出");
		}else if (r.name === ""){
			$(".register").css("display", "block");
			$("#loginTip").html("登录");
			$("#registerTip").html("注册");
			$("#acctNowTip").html("");
			$("#exitTip").html("");
		}
		$.post("bank/bindCardQuery")
			.success(function(res) {
				var list = res.cardList;
				
				if (list) {
					$("#agreeButton").attr("disabled", true);
					$("#returnButton").attr("disabled", true);
					$("#getCheckCode").attr("disabled", true);
					if (list.eacctNo === null) {
						//已绑定的是本行卡
						$("#nsCard").addClass("choosen");
						$("#otherCard").removeClass("choosen");
						$(".otherBank").css("display", "none");
					}else {
						//还是他行卡
						$("#showBank").val(list.bankLocal);
						$("#showBank").attr("disabled", true);
						$("#nsCard").removeClass("choosen");
						$("#otherCard").addClass("choosen");
						$(".otherBank").css("display", "block");
					}
					$("#cardNo").val(list.cardNo);
					$("#certNo").val(list.certNo);
					$("#cardNo").attr("disabled", true);
					$("#certNo").attr("disabled", true);
				}else {
					//如果未绑定
					$("#agreeButton").attr("disabled", false);
					$("#returnButton").attr("disabled", false);
					$("#otherCard").click(function() {
						$("#checkBank").val(1);
						$("#showBank").attr("disabled", false);
						$("#showBank").val("");
						$("#cardNo").val("");
						$("#certNo").val("");
						if (!myBank.BANKCHOOSE) {
							$('#jumpTo').show();
							$('#jumpTo1').show();
						}else {
							$('#jumpTo').hide();
							$('#jumpTo1').hide();
						}
						$("#nsCard").removeClass("choosen");
						$("#otherCard").addClass("choosen");
						$(".otherBank").css("display", "block");
					});
					$("#nsCard").click(function() {
						$("#checkBank").val(0);
						$("#showBank").attr("disabled", true);
						$("#showBank").val("重庆农村商业银行");
						$("#cardNo").val("");
						$("#certNo").val("");
						if (myBank.BANKCHOOSE) {
							$('#jumpTo').show();
							$('#jumpTo1').show();
						}else {
							$('#jumpTo').hide();
							$('#jumpTo1').hide();
						}
						$("#otherCard").removeClass("choosen");
						$("#nsCard").addClass("choosen");
						$(".otherBank").css("display", "none");
					});
				}
			});
	});
	
	$.getJSON("security/current-user")
	.success(function(r){
		$("#usrName").val(r.name);
		$.post("bank/getCstName")
		.success(function(res) {
			 
			//因添加机构用户时没有录入真实姓名字段，comp表中名字字段为空，此处暂时先拿登录名替代
			var login = res.login;
			var cst = res.cst;
			var comp = res.comp;
			var mobile = login.mobile.substring(0, 3) + "****" + login.mobile.substring(7, 11);
			$("#mobile").val(mobile);
			$("#mobile2").val(login.mobile);
			if(cst !=null){
				$("#bankCstName").val(cst.cstName);
				$("#cstName").val(cst.cstName);
			}else if (comp != null){
				$("#bankCstName").val(comp.compName);
				$("#cstName").val(comp.compName);
			}
			
			
		});
	});
/*	$.getJSON("xx/xxx")
	.success(function(r){
		bankCstName.value = r.dd;
		cstName.value = r.dd;
	});*/
	
/*	bankCstName.value = getCookie("cstName");
	cstName.innerHTML = getCookie("cstName");*/
	
	$("#nsCard").addClass("choosen");
	$("#showBank").val("重庆农村商业银行");
	
	$("#agreeBtn").click(function(e) {
		e.preventDefault();
		closeWindow();
		$('#agreeChoice').attr('checked', true);
	});
	$("#getCheckCode").click(function(e) {
		$('#getCheckCode').attr("disabled",true);
		if ($("#nsCard").attr("class") === "choosen") {
			myBank.BANKCHOOSE = 1;
		}else {
			myBank.BANKCHOOSE = 0;
		}
		$('#jumpTo').show();
		$('#jumpTo1').show();
		countDown(60,'###');
		setTimeout('hidej()',60000);
		e.preventDefault();
		 $.post("bank/sendSms", {
			 mobileNumber : $("#mobile2").val()
		 })
		 .success(function(r) {
			// alert(r['result']);
			 $("#runningNumber").val(r['result']);
		 });
	});
	
	//addEvent("agreeButton", "click", function(e) {
	$("#agreeButton").click(function(e) {
		e.preventDefault();
		if (true && agreeChoice.checked) {		//调用银行信息接口
			$.post("bank/create", $("#card").serialize())
			.success(function(rs){
			if (rs['result'] == "success") {
				window.location.href="success.jsp?s9";
			}else {
				alert(rs['result']);
			}		
			
			 
		});
		}else {
			alert("请完善页面信息！");
		}
	});
	/*addEvent("returnButton", "click", function(e) {
		e.preventDefault();
		window.location = "user-bank1.jsp";
	});*/
	$("#showBank").blur(function() {
		if ($(this).val().length >= 4) {
			$("#showBankList ul li").remove();

			$.getJSON("bank/fetchBank", {bankName : $("#showBank").val()}, function(resp){
				 
				for (var key in resp) {
					$("#showBankList ul").append('<li class="bankMap" id ='+key+'>' +resp[key] + '</li>');
				}
				 
			});
			$("#showBankList").css("display", "block");
			setTimeout(function() {
				 
				$(".bankMap").live("click",function() {
					 
					$("#showBank").val($(this).text());
					$("#bank").val($(this).attr("id"));
					$("#showBankList").css("display", "none");
				});
			}, 300);
		}else {
			$("#showBankList").css("display", "none");
		}
	});
	
});

