<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="修改手机">
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
	     $("#submit").click(function(e){
	        //     if($("#mobile1").val()!='' && !/^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|189\d{8}$/.test($("#mobile1").val()))
	    	// {
	    	//	 alert("请输入正确的手机号码");
	        // }	
	    //	 else
	    		 
	    		 e.preventDefault();
				 $.post("security/change-mobile/", $("#change-mobile").serialize());
	    		 
		});
		     
		     setTimeout(function() {
					var mobile = document.getElementById("mobile");
					 $.post("security/searchMobile", $("#currentUsrForm").serialize())
						.success(function(res){
							if (res.status === "ok") {
								location.href="..";
							}else {
								;
							}
							var list = res.arrayList;
							
							mobile.value = list[0].mobile;
							
						})
						.error(function(res) {
							//TODO
						});
				}, 100);
		     
		     
	});
	</script>
	</jsp:attribute>
	<jsp:body>
		<%-- 具体的内面内容 --%>
		<div class="mainRight">
      	<div class="user_right">
	<form id="change-mobile">
	
					<div class="box">
                <ul class="boxUL">
                
                 <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
				<tr>
					<th width="40%"><span>*</span>手机号码：</th>
					<td width="60%">
					<input type="text"  id="mobile" disabled="disabled"/>
					<input id="mobile" type="hidden" name="mobile2"/>	
					<a href="*" id="getCode"><span>获取验证码</span></a></td>
					</tr>
	
	                <input type="hidden" name="usrName" id="usrName" />

				
				
				<tr>
					<th width="20%"><span>*</span>新手机号码：</th>
					<td width="80%"><div class="rl">
					<input type="text" id="newMobile" name="newMobile" maxlength="11"/>
				</div>
				</tr>
				
				
					<tr>
					<th width="20%"><span>*</span>验证码：</th>
					<td width="80%"><div class="rl">
					<input id="code" type="text" name="code" />
				</div>
				</td>
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
