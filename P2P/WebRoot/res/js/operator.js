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
function usrNameQuery() {
	var usrNameTip = document.getElementById("usrNameTip");
	$.post("operator/usrNameQuery", $("#operator_form").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		var  list = res.arrayList,
			   len = list.length;
		if (len) {
			var cstNo = document.getElementById("cstNo");
			usrNameTip.innerHTML = "用户存在";
			usrNameTip.className = "accord";
			$("#addIssuer").attr("disabled", false);
			cstNo.value = list[0].cstNo;
		}else {
			usrNameTip.innerHTML = "用户不存在";
			usrNameTip.className = "unaccord";
			if (!$("#usrName").val()) {
				usrNameTip.innerHTML = "";
			}
			$("#addIssuer").attr("disabled", true);
		}
	});
};
/****************调用区域*************************/
$(function() {
	$("#usrName").blur(function(e) {
		usrNameQuery();
	});
	$.getJSON("security/current-user")
	.success(function(r){
		var currentUsrName = document.getElementById("currentUsrName");
		currentUsrName.value = r.name;
		$.post("operator/compNoQuery", $("#currentUserForm").serialize())
		.success(function(res){
			var compNo = document.getElementById("compNo");
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
	
	onChange("usrName", function(e) {
		e = e ? e : window.event;
		if (e.keyCode === 13 || e.keyCode === 9) {
			e.keyCode === 13 ? e.preventDefault() : null;
			usrNameQuery();
		}
	});

	//addEvent("addIssuer", "click", function(e) {
	$("#addIssuer").click(function(e) {
		var memo = document.getElementById("memo");
		if (memo.value !== "") {
			if ($("#usrName").val() === $("#currentUsrName").val()) {
				alert("您不能添加自己！");
			}else{
				$.post("operator/usrNameQuery", {usrName : $("#usrName").val()})
				.success(function(res) {
					var type = res.arrayList[0].roleType;
					if (type === "EnsureUser") {
						$.post("operator/addIssuer", $("#operator_form").serialize())
						.success(function(r){
							if (r.status === "ok") {
								location.href="..";
							}else {
								;
							}	
							alert("添加成功！");
							$("#usrName").val("");
							$("#memo").val("");
							$("#empType").attr("checked", true);
							$("#empStatus").attr("checked", true);
							$("#usrNameTip").html("");
							$("#addIssuer").attr("disabled", true);
						})
						.error(function(err) {
							alert("对不起，该投资人已被添加！");
						});
					}else {
						alert("对不起，该用户不是担保公司员工！");
					}
				});	
			}
		}else {
			alert("请完善页面信息！");
		}
		
	});
	
	//addEvent("return", "click", function(e) {
	$("#return").click(function(e) {
		e.preventDefault();
		window.location = "guarantee-project-query.jsp";
	});
});