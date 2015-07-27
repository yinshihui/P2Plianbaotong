<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="密码修改">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script>
		$(function(){
			
			   $.getJSON("security/current-user/", function(e){
			    	 var currentName = document.getElementById("currentName"),
					  usrName = document.getElementById("usrName");
				      currentName.value = e.name;
				      usrName.value = e.name;
				});
			  
			 //  setTimeout(function() {
				   $.post("security/searchloginPwd", $("#currentUsrForm").serialize())
			 
						.success(function(res){
							if (res.status === "ok") {
								location.href="..";
							}else {
								;
					    	}
							var list = res.arrayList;
							 oldpwd = list[0].loginPwd;
						})
						.error(function(res) {
							//TODO
						});
				//	}, 100);
	
				//var old = document.getElementById("oldpassword").value;
						$("#submit").click(function(e){
							
					   var old = document.getElementById("oldpassword").value;
							 
							 if (old!=oldpwd)
							  {     
							   alert("原密码不正确");
							  }
							  else{ 
							   var newpassword=document.getElementById("newpassword").value;
							
									  if(newpassword=='')
									{
									   alert("新密码不能为空");									 
									}
									     else{
									           if(!/^.{6,14}$/.test($("#newpassword").val()))
									               {
									               alert("密码至少为6-14为字符!");
									               }
									           else{
									                    if($("#newpasswordTo").val()!=$("#newpassword").val())
									                  {
									                alert("两次输入密码不一致");
									  
									                   }   
									                  else{
								                    	 e.preventDefault();
								    					 $.post("security/change-password/", $("#change-password").serialize())
								    					 .success(function() {
								    						 alert("密码修改成功，请您妥善保管！");
								    					 });
								    	          			
								                     }
			                   }
			           }
			        }
				});
			});
	</script>
	</jsp:attribute>
	<jsp:body>
	<div class="mainRight">
      	<div class="user_right">
		<%-- 具体的内面内容 --%>
		
		<h4>更改登录密码</h4>
		<form id="change-password">
				<div class="box">
                <ul class="boxUL">
                <span class="cz"><a class="zk"><img src="res/images/newImages/zk.jpg" width="48" height="22" /></a><a class="sq"><img src="res/images/newImages/sq.jpg" width="48" height="22" /></a></span>
          <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
				<tr>
					<th width="40%"><span>*</span>旧密码：</th>
					<td width="60%"><div class="rl">
					<input type="password" id="oldpassword" name="password"/>
					</div></td>
			   </tr>
			
				<input type="hidden" name="usrName" id="usrName" />
				
		          <tr>
					<th width="20%"><span>*</span>新密码：</th>
					<td width="80%"><div class="rl">
					<input type="password"  id="newpassword" name="newpassword"/>
				</div></td>
		         </tr>
		         
		          <tr>
					<th width="20%"><span>*</span>确认新密码：</th>
					<td width="80%"><div class="rl">
					<input type="password" id="newpasswordTo" name="newPasswordTo" />
				</div></td>
		         </tr>
		         
		            <tr>
              <td></td>
					<td><a href="security.jsp" ><input id="submit" value="确定" type="submit" class="tj"/> </td>
					</tr>
					</table>
				     </ul>
				     
               </div>
			</form>
			<form id="currentUsrForm">
		<table>
			<tr>
				<td><input type="hidden" name="currentName" id="currentName" /></td>
			</tr>
		</table>
	</form>
		  </div>
		  </div>
		
	</jsp:body>
</lbt:user-layout>
