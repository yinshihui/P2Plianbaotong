function onChange(id, fn) {
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
/****************调用区域*************************/

$(function() {
	var usrName = document.getElementById("usrName"),
		  compNo = document.getElementById("compNo"),
		  cstNo = document.getElementById("cstNo"),
		  currentUsrName = document.getElementById("currentUsrName"),
		  memo = document.getElementById("memo");
	var empType = window.location.href.split("&")[3] ? window.location.href.split("&")[3] : "";
	var empStatus = window.location.href.split("&")[4] ? window.location.href.split("&")[4] : "";
	usrName.value = window.location.href.split("?")[1].split("&")[0] ? window.location.href.split("?")[1].split("&")[0] : "";
	cstNo.value = window.location.href.split("&")[1] ? window.location.href.split("&")[1] : "";
	memo.value = window.location.href.split("&")[2] ? decodeURI(window.location.href.split("&")[2]) : "";
	if (empType === "s0") {	
		$("#empType").attr("checked", true);
	}else if (empType === "s1") {
		$("#empType2").attr("checked", true);
	}
	if (empStatus === "n") {	
		$("#empStatus").attr("checked", true);
	}else if (empStatus === "f") {
		$("#empStatus2").attr("checked", true);
	}
	$.getJSON("security/current-user")
	.success(function(r){
		currentUsrName.value = r.name;
		$.post("operator/compNoQuery", $("#currentUserForm").serialize())
		.success(function(res){
			if (res.status === "ok") {
				location.href="..";
			}else {
				;
			}
			var list = res.arrayList,
				  len = list.length;
			if (len) {
				compNo.value = list[0].compNo;
			}else {
				alert("找不到该用户！");
			}
		});	
	});
	//addEvent("modifyIssuer", "click", function(e) {
	$("#modifyIssuer").click(function(e) {
		var memo = document.getElementById("memo");
		e.preventDefault();
		if (memo.value !== "") {
			$.post("operator/modifyIssuer", $("#operator_form").serialize())
			.success(function(r){
				if (r.status === "ok") {
					location.href="..";
				}else {
					;
				}	
				alert("修改成功！");		
			})
			.error(function(err) {
				alert("请完善页面信息！");
			});
		}else {
			alert("请完善页面信息！");
		}
	});
	//addEvent("return", "click", function(e) {
	$("#return").click(function(e) {
		e.preventDefault();
		window.location = "operator-check.jsp?" + compNo.value;
	});
});