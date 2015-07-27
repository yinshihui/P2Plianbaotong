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
$(function(){
	/*addEvent("agreeButton", "click", function(e) {
		var agreeChoice = document.getElementById("agreeChoice");
		e.preventDefault();
		if (agreeChoice.checked) {
			window.location = "user-bank2.jsp";
		}else {
			alert("请完善页面信息~");
		}
		agreeChoice = null; 
	});*/
	$("#returnButton").click(function(e) {
		//e.preventDefault();
		window.location = "user-bank2.jsp";
	});
	
});
