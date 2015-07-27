function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;
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
/*******************调用区域***************************/
$(function() {
	var cstName = document.getElementById("cstName");
	
	cstName.value = getCookie("cstName");
	addEvent("frontPic", "change", function() {
		var frontPic = document.getElementById("frontPic"),
			  fPic = document.getElementById("fPic");
		fPic.src = frontPic.value;
	});
	addEvent("backPic", "change", function() {
		var backPic = document.getElementById("backPic"),
			  bPic = document.getElementById("bPic");
		bPic.src = backPic.value;
	});
	addEvent("agreeButton", "click", function(e) {
		e.preventDefault();
		if (true) {		//需要身份证验证接口
			window.location = "register-success.jsp";
		}
	});
	addEvent("returnButton", "click", function(e) {
		e.preventDefault();
		window.location = "user-bank3.jsp";
	});
});