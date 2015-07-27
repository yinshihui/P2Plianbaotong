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
function addEvent(id, handler, fn) {
	var target = document.getElementById(id);
	if ("v" === "\v") {
		//ie
		target.attachEvent("on" + handler, fn);
	}else {
		target.addEventListener(handler, fn, false);
	}
};
/************************调用区域******************************/
$(function() {
/*	var cstName = document.getElementById("cstName"),
	  	  certNo = document.getElementById("certNo");
	cstName.value = getCookie("cstName");
	certNo.value = getCookie("certNo");
	
	$.post("register/create", $("#user_form").serialize())
		.success(function(r){
		if (r.status === "ok") {
			location.href="..";
		}else {
			;
		}
	});*/
	
	//addEvent("sub3", "click", function(e) {
	$("#sub3").click(function(e) {
		//e.preventDefault();
		window.location = "login.jsp";
	});
});


