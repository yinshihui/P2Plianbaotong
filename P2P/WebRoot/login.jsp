<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>

<lbt:main-layout title="登录">
<jsp:attribute name="header">
<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
<script type="text/javascript" src="res/js/jquery.slide.js"></script>
<script type="text/javascript">
	
	function loadCaptcha()
	{
		$("#captchaImage").attr("src", $.appurl("captcha/login?"+(new Date()).getTime()));
	}
	var CheckChinese = function(id) {
		var target = document.getElementById(id);
		if (target.value) {
			if (escape(target.value).indexOf("%u") < 0) { 
			}else {
				alert("对不起，用户名不可包含汉字");
				target.value = "";
				target.focus();
			}
		}else {
			;
		}	
	};
	$(function(){
		$("#login_bannerbg").Slide({//banner
			effect:"fade",
			speed:600,
			timer:5000
		});
		
		$("#captchaImage").click(loadCaptcha);
		
		$("#captcha").focus(function(){
			if ($(this).val() == '验证码')
			{
				$(this).val('');
				$(this).css("color", "black");
			}
		});
		$("#j_username").focus(function(){
			if ($(this).val() == '请输入会员名')
			{
				$(this).val('');
				$(this).css("color", "black");
			}
		}).blur(function() {
			CheckChinese("j_username");
		});
		
		loadCaptcha();
	}); 
</script>
<script type="text/javascript" src="res/js/slide.js"></script>

	</jsp:attribute>
	<jsp:body>
		 <div class="login_contentimg">
  	<div class="login_banner_center">
        <div class="register_login">
       
        	<div class="login_tittle"><img src="res/images/login_03.jpg" /></div>
        	<form  action="j_spring_security_check" method="post">
            <div class="login_content">
            	<ul>
                <li><dt><img src="res/images/login_12.jpg" /></dt><dd><input id="j_username"  name="j_username" type="text" class=" text_180" value="${SPRING_SECURITY_LAST_USERNAME==null?'请输入会员名':SPRING_SECURITY_LAST_USERNAME}" autocomplete="off"/></dd></li>
                <li><dt><img src="res/images/login_13.jpg" /></dt><dd><input id="j_password"  name="j_password" type="password" class=" text_180" value="" style="color:black" /></dd></li>
                <li style="border:0; height:14px; line-height:14px;"><a href="pwdchange.jsp" class="login_forget">忘记登录密码？</a></li>
                <li><dt><img src="res/images/login_14.jpg" /></dt><dd><input id="captcha" name="captcha" type="text" class=" text_110" value="验证码" autocomplete="off" /><a><img id="captchaImage" src="" /></a></dd></li>
                </ul>
            </div>
            <div><font color="red"> ${SPRING_SECURITY_LAST_EXCEPTION.localizedMessage}</font></div>
          	<div class="login_content"  style="padding-top:0;*+padding-top:10px;"><input type="image" src="res/images/login_15.jpg" name="submit" id="button" value="提交" /></div>
          	</form>
            <div class="login_bottom">还不是会员？ <a href="register.jsp">立即注册</a></div>
      	
      	</div>
      	<section id="login_bannerbg">
                <ul class="login_bannerc">
                    <li class="login_banner1" style="z-index: 1; opacity: 1;">
                        <div class="login_banner1">
                            <img src="res/images/bg_363.jpg">
                            <a href="javascript:;" class="video_ban" id="video_ban"></a>
                        </div>
                    </li>
                    <li class="login_banner2" style="z-index: 0; opacity: 0;">
                        <div class="login_banner">
                            <a href="#"><img src="res/images/bg_364.jpg"></a>
                        </div>
                    </li>
                    <li class="login_banner3" style="z-index:0;opacity:0;">
                        <div class="login_banner">
                            <a href="#"><img src="res/images/bg_363.jpg"></a>
                        </div>
                    </li>
                    <li class="login_banner4" style="z-index: 0; opacity: 0;">
                        <div class="login_banner">
                            <a href="#"><img src="res/images/bg_364.jpg"></a>
                        </div>
                    </li>
                </ul>
                <ul class="login_bannermenu" style="display:none;">
                    <li class="on"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
    		</section>
	</div>
</div>
	</jsp:body>
</lbt:main-layout>


 