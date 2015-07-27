function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + 
    		name + 
    		"=([^;]*)(;|$)"));
     if(arr != null) {
    	 return unescape(arr[2]); 
     }
     return null;
};
/******************************************************/
$(function() {
	var usrName = document.getElementById("usrName");
	usrName.innerHTML = window.location.href.split("?")[1];
});