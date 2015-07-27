<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="操作员修改">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/operator-modify.css" type="text/css" />
	</jsp:attribute>
	<jsp:body>
		<%-- 具体的内面内容 --%>
		<form id="currentUserForm">
			<table>
				<tr>
					<td><input type="hidden" name="currentUsrName" id="currentUsrName" /></td>
				</tr>
			</table>
		</form>
		<div class="user_right">
			<div class="user_right_tittle">
            	<ul>
                	<li><a href="###"  style="border-bottom:2px solid #ff6600; color:#000000; background:url(../images/user_tab_on.jpg) center bottom no-repeat;">审批员操作</a></li>
                    </ul>
            </div>
           <div style="clear:both"></div>
			<form id="operator_form">
				<table>
					<thead></thead>
					<tbody>
						<tr>
							<td class="required">*</td>
							<td>登录用户名：</td>
							<td>
								<input type="text" name="usrName" id="usrName" maxlength=20 disabled="disabled"  class="input"/>
								<input type="hidden" name="cstNo" id="cstNo" />
							</td>
						</tr>
						<tr>
							<td class="required">*</td>
							<td>操作员类型：</td>
							<td>
								<input type="radio" name="empType" id="empType" checked="checked" value="s0"/>一级审核员
								<input type="radio" name="empType" id="empType2" value="s1" />二级审核员
							</td>
						</tr>
						<tr>
							<td class="required">*</td>
							<td>备注：</td>
							<td><input type="text" name="memo" id="memo"  class="input" maxlength="20"/></td>
						</tr>
						<tr>
							<td class="required">*</td>
							<td>人员状态：</td>
							<td>
								<input type="radio" name="empStatus" id="empStatus" checked="checked" value="n" />正常
								<input type="radio" name="empStatus" id="empStatus2" value="f" />禁用
								<input type="hidden" name="compNo" id="compNo"/>
							</td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td>
								<button id="modifyIssuer">修改</button>
								<button id="return">返回</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/operator-modify.js"/></script>
	</jsp:body>
</lbt:user-layout>
