<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="安全中心">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
<style>
	#box,
	#box2,
	#box3,
	#box4 {
		display:none;
	}
	#boxUL,
	#boxUL2,
	#boxUL3,
	#boxUL4 {
		border-radius:10px;
		border:5px solid rgb(252, 103, 0);
		position:absolute;
		width:500px;
		height:300px;
	}
	#boxUL table,
	#boxUL2 table,
	#boxUL3 table,
	#boxUL4 table {
		margin-top:60px!important;
	}
	#hiddenArea {
		background:grey;
		background-color:rgba(0,0,0,0.5);
		position:absolute;
		margin-left:auto;
		margin-right:auto;
		display:none;
		top:0;
		left:0;
		z-index:200;
		transition:.5s;
		-o-transition:.5s;
		-moz-transition:.5s;
		-webkit-transition:.5s;
	}
	.tab2 td input.tj {
		background-color:rgb(255, 102, 0);
		border-radius:10px;
		cursor:pointer;
		transition:.5s;
		-o-transition:.5s;
		-moz-transition:.5s;
		-webkit-transition:.5s;
	}
	.tab2 td input.tj:hover {
		background-color:rgb(0, 153, 255);
	}
	.tab tbody tr th{
		font-size:16px;
	}
	.box ul.boxUL {
		
	}
	#submit,
	#submit2,
	#submit3,
	#submit4,
	.closeX {
		background:rgb(255, 102, 0)!important;
		border-radius:10px;
		border: 0px solid red!important;
		color:white;
		cursor:pointer;
		font-size:14px;
		height:30px!important;
		transition:.5s;
		-o-transition:.5s;
		-moz-transition:.5s;
		-webkit-transition:.5s;
		width:88px!important;
	}
	#submit:hover,
	#submit2:hover,
	#submit3:hover,
	#submit4:hover,
	.closeX:hover {
		background-color:rgb(0, 153, 255)!important;
	}
	.dd {
		transition:.5s;
		-o-transition:.5s;
		-moz-transition:.5s;
		-webkit-transition:.5s;
	}
	.dd:focus {
		border-radius:5px;
		border:1px solid rgb(0, 153, 255);
		box-shadow:0 0 3px #666666;
	}
	#jumpTo2,
	#jumpTo3,
	#jumpTo4{
		color:#ff6600;
		font-size:20px;
		font-weight:bold;
	}
	#jumpTo22,
	#jumpTo33,
	#jumpTo44 {
		font-size:14px;
	}
</style>
<script type="text/javascript">
var myPass = {
	SMSPASS : 0,
	EMAILPASS : 0,
	CODEPASS : 1
};
function countDown(id1, id2, secs,surl){     
	//alert(surl);  
	if (myPass.CODEPASS) {
		$('#' + id1).html(secs);
		$('#' + id2).html("秒后重新发送。");
	}else {
		return false;
	}	

	if(--secs>0){     
	     setTimeout(function() {
	    	 countDown(id1, id2, secs,surl);
	     },1000);     
    }     
	else{       
	     location.href=surl;   
	     $('#' + id1).html("");
	     $('#' + id2).html("");
	 }     
};
function hidej(id){
	$('#' + id).attr("disabled",false);
}; 
function pwdCheck(opwd, npwd, npwdLen, npwdTo, strFun){
	
	<%--var opwd = document.getElementById("oldPasswordTxn").value;
	 var npwd = document.getElementById("newPasswordTxn").value;
	 var npwdLen = document.getElementById("newPasswordTxn").value.length;
	 var npwdTo = document.getElementById("newPasswordTxnTo").value;
	  --%>
	   if(npwd=='' || npwdTo=='')
		{
		   alert("新密码不能为空");									 
		}
		 else{
		       if(npwdLen<8 || npwdLen>14)
		           {
		           alert("密码至少为8-14为字符!");
		           }
		       else{
		           if( opwd==npwd ){
		    	       alert("新旧密码相同, 请设置新密码");
		           }
		           else if(npwd != npwdTo)
	                          {
	                              alert("两次输入密码不一致");
	  
	                           }   
	                           else{

    		                       $.post(strFun, {oldpwd:opwd, 
    		                    	   newpwd:npwd}, function(resp){
    		                       
    			                   var ret = resp['i_ret'];
    			                   if(ret == "S")
    			                   {
    				                   alert("密码修改成功");
    			                       $("#hiddenArea").css("display", "none");
    			                   }
    			                    else if(ret == "F")
    			                       alert("原密码不正确");
    		                        });
                                }
                    }
		 }
}


$(function(){
	$.getJSON("security/current-user/", function(e){
		e.loginPwd ? $("#one").html("已设定") : $("#one").html("未设定");
		e.txnPwd ? $("#two").html("已设定") : $("#two").html("未设定");
		e.mobileFlg ? $("#three").html("已设定") : $("#three").html("未设定");
		e.emailFlg ? $("#four").html("已设定") : $("#four").html("未设定");
		$("#usrName").val(e.name);
	});
	var width = window.screen.width;
	var height = 697;
	var wholeHeight = (window.screen.height > 697) ? window.screen.height : 697;
	var top = (height - 300) / 2;
	var left = (width - 500) / 2;
	 
	$("#boxUL").css("left", left + "px");
	$("#boxUL").css("top", top + "px");
	$("#boxUL2").css("left", left + "px");
	$("#boxUL2").css("top", top + "px");
	$("#boxUL3").css("left", left + "px");
	$("#boxUL3").css("top", top + "px");
	$("#boxUL4").css("left", left + "px");
	$("#boxUL4").css("top", top + "px");
	$("#changeLoginPwd").click(function() {
   		$.post("security/searchMobile/")
	 	.success(function(res) {
	 		$("#mobile4").val(res.mobile);
	 	});
		$("#hiddenArea").css("display", "block");
		$("#box").parent().find("div.box").css("display", "none");
		$("#box4").css("display", "block");
		$("#hiddenArea").css("width", width + "px");
		$("#hiddenArea").css("height", wholeHeight + "px");
		$("#oldPasswordLogin").val("");
		$("#newPasswordLogin").val("");
		$("#newPasswordLoginTo").val("");
		$("#code4").val("");
		$("#jumpTo4").html("");
		$("#jumpTo44").html("");
		myPass.CODEPASS = 0;
	});
	$("#changeTxnPwd").click(function() {
   		$.post("security/searchMobile/")
	 	.success(function(res) {
	 		$("#mobile3").val(res.mobile);
	 	});
		$("#hiddenArea").css("display", "block");
		$("#box").parent().find("div.box").css("display", "none");
		$("#box3").css("display", "block");
		$("#hiddenArea").css("width", width + "px");
		$("#hiddenArea").css("height", wholeHeight + "px");
		$("#oldPasswordTxn").val("");
		$("#newPasswordTxn").val("");
		$("#newPasswordTxnTo").val("");
		$("#code3").val("");
		$("#jumpTo3").html("");
		$("#jumpTo33").html("");
		myPass.CODEPASS = 0;
	});
	$("#changeMobile").click(function() {
   		$.post("security/searchMobile/")
	 	.success(function(res) {
	 		$("#mobile2").val(res.mobile);
	 	});
		$("#hiddenArea").css("display", "block");
		$("#box").parent().find("div.box").css("display", "none");
		$("#box2").css("display", "block");
		$("#hiddenArea").css("width", width + "px");
		$("#hiddenArea").css("height", wholeHeight + "px");
		$("#newMobile").val("");
		$("#code").val("");
		$("#jumpTo2").html("");
		$("#jumpTo22").html("");
		myPass.CODEPASS = 0;
	});
	$("#changeEmail").click(function() {
		$.post("security/searchMobile/")
	 	.success(function(res) {
	 		$("#mobile").val(res.mobile);
	 	});
		$("#hiddenArea").css("display", "block");
		$("#box").parent().find("div.box").css("display", "none");
		$("#box").css("display", "block");
		$("#hiddenArea").css("width", width + "px");
		$("#hiddenArea").css("height", wholeHeight + "px");
		$("#email").val("");
		$("#code2").val("");
		$("#jumpTo").html("");
		$("#jumpTo1").html("");
		myPass.CODEPASS = 0;
	});
	
	$(".closeX").click(function(e) {
		e.preventDefault();
		$("#hiddenArea").css("display", "none");
		$("#email").attr("readonly", false);
		$("#newMobile").attr("readonly", false);
		$('#getCode').attr("disabled", false);
		$('#getCode2').attr("disabled", false);
		$('#getCode3').attr("disabled", false);
		$('#getCode4').attr("disabled", false);
	});
//*********************txn*************************//	
	$("#newPasswordTxn").keydown(function(e) {
		e = e ? e : window.event;
		if (e.keyCode === 32) {
			return false;
		}
	});
	$("#newPasswordTxnTo").keydown(function(e) {
		e = e ? e : window.event;
		if (e.keyCode === 32) {
			return false;
		}
	});
	$("#getCode3").click(function(e){
    	e.preventDefault(); 
		alert("验证码已发送，请即刻查验！");
		$('#getCode3').attr("disabled", true);
		myPass.CODEPASS = 1;
		countDown("jumpTo3", "jumpTo33", 60, '###');
		setTimeout(function() {
			hidej("getCode3");
		}, 60000);
		$.getJSON("smsSend/sendIdentifyCd", {
				mobileNumber : $("#mobile3").val(),
				smsType : "TxnpwdChg"
			}, function(resp){
		});
	});
	$("#submit3").click(function(e){
		e.preventDefault();
		var opwdTxn = document.getElementById("oldPasswordTxn").value;
		 var npwdTxn = document.getElementById("newPasswordTxn").value;
		 var npwdTxnLen = document.getElementById("newPasswordTxn").value.length;
		 var npwdTxnTo = document.getElementById("newPasswordTxnTo").value;
		 var strFun = "security/changeTxnPassword/";	 
		 $.getJSON("smsSend/validIdtyCd", {idtyCd : $("#code3").val()},
			function(resp){
				var res = resp['result'];
				if(res == 'success'){
					pwdCheck(opwdTxn, npwdTxn, npwdTxnLen, npwdTxnTo, strFun);
					$("#jumpTo3").html("");
					$("#jumpTo33").html("");
					$('#getCode3').attr("disabled", false);
				}else{					
					$("#code3").attr("readonly", false);
					alert("请检查验证码是否正确！");
					$("#oldPasswordTxn").val("");
					$("#newPasswordTxn").val("");
					$("#newPasswordTxnTo").val("");
				}
			});		 	 
	});
//**********************pass*****************************//	
	$("#newPasswordLogin").keydown(function(e) {
		e = e ? e : window.event;
		if (e.keyCode === 32) {
			return false;
		}
	});
	$("#newPasswordLoginTo").keydown(function(e) {
		e = e ? e : window.event;
		if (e.keyCode === 32) {
			return false;
		}
	});
	$("#getCode4").click(function(e){
    	e.preventDefault();
		alert("验证码已发送，请即刻查验！");
		$('#getCode4').attr("disabled", true);
		myPass.CODEPASS = 1;
		countDown("jumpTo4", "jumpTo44", 60, '###');
		setTimeout(function() {
			hidej("getCode4");
		}, 60000);
		$.getJSON("smsSend/sendIdentifyCd", {
				mobileNumber : $("#mobile4").val(),
				smsType : "LogpwdChg"
			}, function(resp){
		}); 
	});
	$("#submit4").click(function(e){
	     e.preventDefault();
		 var opwdTxn = document.getElementById("oldPasswordLogin").value;
		 var npwdTxn = document.getElementById("newPasswordLogin").value;
		 var npwdTxnLen = document.getElementById("newPasswordLogin").value.length;
		 var npwdTxnTo = document.getElementById("newPasswordLoginTo").value;
		 var strFun = "security/changeLoginPassword/";
		 $.getJSON("smsSend/validIdtyCd", {idtyCd : $("#code4").val()},
			function(resp){
				var res = resp['result'];
				if(res == 'success'){
					pwdCheck(opwdTxn, npwdTxn, npwdTxnLen, npwdTxnTo, strFun);
					$("#jumpTo4").html("");
					$("#jumpTo44").html("");
					$('#getCode4').attr("disabled", false);
				}else{					
					$("#code4").attr("readonly", false);
					alert("请检查验证码是否正确！");
					$("#oldPasswordLogin").val("");
					$("#newPasswordLogin").val("");
					$("#newPasswordLoginTo").val("");
				}
			});		 
	});
//*****************mobile*********************//
 	$("#getCode").click(function(e){
    	e.preventDefault();
		var regex = /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8}$/g;
		if ($("#newMobile").val() && regex.test($("#newMobile").val())) {
			alert("验证码已发送，请即刻查验！");
			$('#getCode').attr("disabled",true);
			$("#newMobile").attr("readonly", true);
			myPass.CODEPASS = 1;
			countDown("jumpTo2", "jumpTo22", 60, '###');
 			setTimeout(function() {
 				hidej("getCode");
 			}, 60000);
			$.getJSON("smsSend/sendIdentifyCd", {
					mobileNumber : $("#newMobile").val(),
					smsType : "PhoneChg"
					}, function(resp){
			});
		}else {
			alert("请确认新手机号格式！");
		}	 
	});
    $("#submit2").click(function(e) {
    	e.preventDefault();
		$.getJSON("smsSend/validIdtyCd", {idtyCd : $("#code").val()},
			function(resp){
				var res = resp['result'];
				if(res == 'success'){
					$("#code").attr("readonly", true);
		    		 $.post("security/change-mobile/", {
		    			 usrName : $("#usrName").val(), 
		    			 newMobile : $("#newMobile").val()
	    			 }).success(function() {
	    				 alert("修改完成！");
	    				 $("#jumpTo2").html("");
	 					$("#jumpTo22").html("");
	 					$('#getCode').attr("disabled", false);
	    				 window.location.reload();
	    			 }).error(function() {
	    				 alert("对不起，您的手机号可能已被占用，请重新验证！");
	    				 window.location.reload();
	    			 });  	
				}else{					
					$("#code").attr("readonly", false);
					 alert("请检查新手机号或验证码是否正确填写！");
				}
			});
     });
     
//*****************email*********************//
     $("#getCode2").click(function(e){
    	e.preventDefault();
 		var regex = /^(\w+((-\w+)|(.\w+))*@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+)*.[A-Za-z0-9]+)/g;
 		if ($("#email").val() && regex.test($("#email").val())) {
 			alert("验证码已发送，请即刻查验！"); 			
 			$('#getCode2').attr("disabled",true);
 			$("#email").attr("readonly", true);
 			myPass.CODEPASS = 1;
 			countDown("jumpTo", "jumpTo1", 60, '###');
 			setTimeout(function() {
 				hidej("getCode2");
 			}, 60000);
 			$.getJSON("smsSend/sendIdentifyCd", {
 					mobileNumber : $("#mobile").val(),
 					smsType : "MailChg"
 					}, function(resp){
 			});
 		}else {
 			alert("请确认新邮箱格式！");
 		}	 
 	});
    $("#submit").click(function(e) {
    	e.preventDefault();
	   	$.getJSON("smsSend/validIdtyCd", {idtyCd : $("#code2").val()},
			function(resp){
				var res = resp['result'];
				if(res === 'success'){
					$("#code2").attr("readonly", true);
		    		 $.post("security/change-email/", {
		    			 usrName : $("#usrName").val(), 
		    			 email : $("#email").val()
	    			 }).success(function() {
	    				 alert("修改完成！");
	    				 $("#jumpTo").html("");
	 					 $("#jumpTo1").html("");
	 					 $('#getCode2').attr("disabled", false);
	    				 window.location.reload();
	    			 }).error(function() {
	    				 alert("对不起，您的邮箱可能已被占用，请重新验证！");
	    				 window.location.reload();
	    			 });  	
				}else{					
					$("#code2").attr("readonly", false);
					 alert("请检查邮箱或验证码是否正确填写！");
				}
			});
    });
});
</script>
	</jsp:attribute>
	<jsp:body>
	<div class="mainRight">
      	 
<div class="mainRight"> 
      <!--content-->
      <div class="box">
        <ul class="boxUL" style="padding:10px;">
          <div class="title2">
            <h4>安全中心</h4>
          </div>
          <div class="aqdj">
            <ul>
              <h4>账户安全级别</h4>
              <span class="dj4"></span>
            </ul>
          </div>
          <div class="sm">
          <p>为了更好的保护您的资金和交易安全，请时常更换密码，联保通推荐您选择启用以下保护措施<br />
			您使用的安全服务：</p>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab3" align="center">
            <tr>
              <td><img src="res/images/newImages/iconDlmm.gif" width="34" height="34" /></td>
              <td>登录密码</td>
              <td class="ysz">已设置</td>
              <td></td>
              <td><a href="javascript:;" class="btXq" id="changeLoginPwd">修改</a></td>
            </tr>
            <tr>
              <td><img src="res/images/newImages/iconZfmm.gif" width="34" height="34" /></td>
              <td>支付密码</td>
              <td class="ysz">已设置</td>
              <td><a href="txnpwdchange.jsp"  class="ysz">忘记交易密码？</a></td>
              <td><a href="javascript:;" class="btXq" id="changeTxnPwd">修改</a></td>
            </tr>
            <tr>
              <td><img src="res/images/newImages/iconSjbd.gif" width="34" height="34" /></td>
              <td>手机绑定</td>
              <td class="ysz">已设置</td>
              <td></td>
              <td><a href="javascript:;" class="btXq" id="changeMobile">修改</a></td>
            </tr>
            <tr>
              <td><img src="res/images/newImages/iconYxbd.gif" width="34" height="34" /></td>
              <td>邮箱绑定</td>
              <td class="ysz">已设置</td>
              <td></td>
              <td><a href="javascript:;" class="btXq" id="changeEmail">修改</a></td>
            </tr>
          </table>
        </ul>
      </div>
    </div>
    
    <div id="hiddenArea">
    <!-- ---------------修改邮箱页面--------------------- -->
    	<form id="change-email">
				<div class="box" id="box">
                <ul class="boxUL" id="boxUL">
                
                 <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
					<tr>
						<th width="40%"><span>*</span>手机号码：</th>
						<td width="60%">
							<input type="text"  id="mobile" disabled="disabled" class="dd"/>
							<input id="mobile111" type="hidden" name="mobile" class="dd"/>
						</td>
						<td><input type="hidden" name="usrName" id="usrName"/></td>
					</tr>
	
	                

				<tr>
					<th width="20%"><span>*</span>新邮箱：</th>
					<td width="80%"><div class="rl">
					<input type="text" id="email" name="email" class="dd"/>
				</div>
				</tr>
				
					<tr>
						<th width="20%"><span>*</span>验证码：</th>
						<td width="80%">
							<div class="rl">
								<input id="code2" type="text" name="code2" class="dd" maxlength=6/>
								<button id="getCode2">获取验证码</button>
							</div>
					</td>
					</tr>	
					<tr>
						<td></td>
						<td><label id="jumpTo"></label><label id="jumpTo1"></label></td>
					</tr>	 
				   <tr>
            		  <td></td>
					<td>
						<input id="submit" value="确定" type="submit" class="tj"/>
						<input class="closeX" type="submit" class="tj" value="关闭" />
					</td>
				  </tr>
				</table>
			  </ul>
			</div>
			
		<!-- ---------------修改手机页面--------------------- -->	
			<div class="box" id="box2">
               <ul class="boxUL" id="boxUL2">
               
                <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
			<tr>
				<th width="40%"><span>*</span>手机号码：</th>
				<td width="60%">
					<input type="text"  id="mobile2" disabled="disabled" class="dd"/>
					<input id="mobile2" type="hidden" name="mobile2" class="dd"/>	
				</td>
				</tr>
			<tr>
				<th width="20%"><span>*</span>新手机号码：</th>
				<td width="80%"><div class="rl">
				<input type="text" id="newMobile" name="newMobile" maxlength="11" class="dd"/>
			</div>
			</tr>
				<tr>
				<th width="20%"><span>*</span>验证码：</th>	
				<td width="80%">
					<div class="rl">				
						<input id="code" type="text" name="code"  class="dd" maxlength=6/>
						<button id="getCode">获取验证码</button>
					</div>
			</td>
			</tr>	
			<tr>
				<td></td>
				<td><label id="jumpTo2"></label><label id="jumpTo22"></label></td>
			</tr>
			 <tr>
             <td></td>

				<td>
					<input id="submit2" value="确定" type="submit" class="tj"/>
					<input class="closeX" type="submit" class="tj" value="关闭" /> 
				</td>
				</tr>
					</table>
			     </ul>
			</div>
		<!-- ---------------------------修改支付密码页面------------------------------- -->	
			<div class="box" id="box3">
                <ul class="boxUL" id="boxUL3">
                
                 <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
				<tr>
					<th width="40%"><span>*</span>旧密码：</th>
					<td width="60%"><div class="rl">
					<input type="password" id="oldPasswordTxn" name="oldpasswordTxn" class="dd"  onpaste="return false"/>
					</div></td>
			   </tr>
				 <tr>
					<th width="20%"><span>*</span>新密码：</th>
					<td width="80%"><div class="rl">
					<input type="password"  id="newPasswordTxn" name="newPasswordTxn" class="dd" onpaste="return false"/>
				</div></td>
				</tr>
				<tr>
					<th width="20%"><span>*</span>确认新密码：</th>
					<td width="80%"><div class="rl">
					<input id="mobile3" type="hidden" name="mobile3" class="dd"/>	
					<input type="password" id="newPasswordTxnTo" name="newPasswordTxnTo" class="dd" onpaste="return false"/>
				</div>
				 </tr>
				 <tr>
					<th width="20%"><span>*</span>验证码：</th>	
					<td width="80%">
						<div class="rl">						
							<input id="code3" type="text" name="code3"  class="dd" maxlength=6/>
							<button id="getCode3">获取验证码</button>
						</div>
					</td>
				</tr>	
				<tr>
					<td></td>
					<td><label id="jumpTo3"></label><label id="jumpTo33"></label></td>
				</tr>
				 <tr>
              <td></td>

					<td>
						<input id="submit3" value="确定" type="submit" class="tj"/>
						<input class="closeX" type="submit" class="tj" value="关闭" /> 
					</td>
					</tr>
					</table>
				     </ul>
				</div>
				
	<!-- ------------------------------修改登录密码------------------------------------- -->			
	
	<div class="box" id="box4">
                <ul class="boxUL" id="boxUL4">
                <span class="cz"><a class="zk"></a><a class="sq"><img src="res/images/newImages/sq.jpg" width="48" height="22" /></a></span>
          <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
				<tr>
					<th width="40%"><span>*</span>旧密码：</th>
					<td width="60%"><div class="rl">
					<input type="password" id="oldPasswordLogin" name="oldPasswordLogin" class="dd" onpaste="return false"/>
					</div></td>
			   </tr>				
		          <tr>
					<th width="20%"><span>*</span>新密码：</th>
					<td width="80%"><div class="rl">
					<input id="mobile4" type="hidden" name="mobile4" class="dd"/>	
					<input type="password"  id="newPasswordLogin" name="newPasswordLogin" class="dd" onpaste="return false"/>
				</div></td>
		         </tr>
		          <tr>
					<th width="20%"><span>*</span>确认新密码：</th>
					<td width="80%"><div class="rl">
					<input type="password" id="newPasswordLoginTo" name="newPasswordLoginTo"  class="dd" onpaste="return false"/>
				</div></td>
		         </tr>
		         <tr>
					<th width="20%"><span>*</span>验证码：</th>	
					<td width="80%">
						<div class="rl">
							<input id="code4" type="text" name="code4"  class="dd" maxlength=6/>
							<button id="getCode4">获取验证码</button>
						</div>
				</td>
				</tr>	
				<tr>
					<td></td>
					<td><label id="jumpTo4"></label><label id="jumpTo44"></label></td>
				</tr>
		        <tr>
        		    <td></td>
					<td>
						<input id="submit4" value="确定" type="submit" class="tj"/>
						<input class="closeX" type="submit" class="tj" value="关闭" />
					</td>
					</tr>
					</table>
				     </ul>
				     
               </div>
	 	  </form>
	<!-- ------------------------------------------------------ -->
		
		<form id="currentUsrForm">
			<table>
				<tr>
					<td><input type="hidden" name="currentName" id="currentName" /></td>
				</tr>
			</table>
		</form>
		<!-- --------------------------------------------------------------- -->
    </div>
       
<!-- 		<h4>您使用的安全服务：</h4>
		<ul style="list-style:none;">
			<li>
               <strong>登录密码</strong>
     			<em id="one"></em>
               <label>为保证账户安全, 请时常更换密码</label>
               <a href="change-password.jsp" title="" >修改</a>
			</li>
			<li>
				<strong>支付密码</strong>
				<em id="two"></em>
				<label>账户资金需要提现时输入, 保护账户资金安全</label>
			    <a href="change-pay-password.jsp" >修改</a>
			</li>					
			<li>
				<strong>手机绑定</strong>
				<em id="three"></em>
				<label>可用于找回密码以及重要通知</label>
				<a href="change-mobile.jsp" >修改</a>
			</li>
			<li>
				<strong>邮箱绑定</strong>
			    <em id="four"></em>
				<label>可用于找回密码以及重要通知</label>
				<a href="change-email.jsp" >修改</a>
			</li>
		</ul> -->
	</div>
 
	</jsp:body>
</lbt:user-layout>
 