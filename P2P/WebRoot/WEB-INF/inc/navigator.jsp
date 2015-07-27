<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" >
$(function(){
	$.getJSON("security/current-user")
		.success(function(r){
			if (r.name !== "") {
				$("#registin").append($("<a/>").attr("href", "").attr("id","openhome")
						.append($("<img/>").attr("src", "res/images/huiyuan.jpg")));
				//$(".register").css("display", "none");
				//$(".login_1").css("display", "none");
				$("#lo1").css("display", "none");
				$("#lo2").css("display", "block");
				
				$("#loginTip").html("");
				$("#registerTip").html("");	
				$("#acctNowTip").html("当前用户:");
				$("#exitTip").html("退出");
			}else if (r.name === ""){
				$("#registin").append($("<a/>").attr("href", "register.jsp")
						.append($("<img/>").attr("src", "res/images/register_button.jpg")));
				$("#lo1").css("display", "block");
				$("#lo2").css("display", "none");
				//$(".register").css("display", "block");
				$("#loginTip").html("登录");
				$("#registerTip").html("注册");
				$("#exitTip").html("");
				$("#acctNowTip").html("");
			}
		});
	 
	$("#huiyuan").click(function(e){
		
		e.preventDefault();
		$.getJSON("acct/redirectHref", function(resp){
		 
			window.location.href=resp.returnUrl;
			
		});
		
		
	});
	
	
	$(document).ready(function(){
		$('.attention_right').mousemove(function(){
			$('.attention_right .div').show();
			});
		$('.attention_right').mouseleave(function(){
			$('.attention_right .div').hide();
			})
		})
	
});
</script>
<div id="top">
  <div class="top">您好，欢迎来到联保通平台！<span><a href="login.jsp" id="loginTip">登录</a></span> | <a href="register.jsp" id="registerTip">注册</a> <a id="acctNowTip"></a><span id="currentUser"></span> | <a href="logout" id="exitTip">退出</a></div>
</div>
 

 
<div class="logo">
<a class="t_logo" href="index.jsp"><img src="res/images/logo.jpg" /></a>
 <div class="menu">
     <ul id="nav">
                <li class="mainlevel"><a href="index.jsp">首&nbsp;页</a>
                
                </li>
                <li class="mainlevel" id="mainlevel_01"><a href="project-query.jsp">我要投资</a>
                
                </li>
                <li class="mainlevel" id="mainlevel_02"><a id="huiyuan" href="">会员中心</a>
                 
                </li>
                <li class="mainlevel" id="mainlevel_03"><a href="help.jsp">帮助中心</a>
                    
                </li>
                <li class="mainlevel" id="mainlevel_04"><a href="aboutus.jsp">关于我们</a>
                    
                </li>
                </ul>
 </div>
</div>
