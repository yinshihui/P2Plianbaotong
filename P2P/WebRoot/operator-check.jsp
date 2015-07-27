<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="操作员浏览">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/jqpagination.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/operator-check.css" type="text/css" />
	</jsp:attribute>
	<jsp:body>
		<%-- 具体的内面内容 --%>
		<form id="compNoForm">
			<table>
				<tr>
					<td><input type="hidden" name="usrName" id="usrName" /></td>
					<td><input type="hidden" name="compNo" id="compNo" /></td>
					<td><input type="hidden" name="pageNow" id="pageNow" /></td>
				</tr>
			</table>
		</form>
		
			<div class="user_right">
			<div class="user_right_tittle">
            	<ul>
                	<li><a href="###"  style="border-bottom:2px solid #ff6600; color:#000000; background:url(../images/user_tab_on.jpg) center bottom no-repeat;">审核员添加</a></li>
                    </ul>
            </div>
          <div style="clear:both"></div>
			<form id="operator_form">
				<table id="operatorCheck" border="0" cellspacing="0" cellpadding="0" class="tab tab1">
					<thead></thead>
					<tbody>
						<tr id="formTopic">
							<!--  <th>企业客户编号</th>
							<th>个人客户编号</th>-->
							<th>客户姓名</th>
							<th>员工类型</th>
							<th>员工状态</th>
							<!--<th>备注</th>-->
							<th>操作</th>
						</tr>
					</tbody>
				</table>
				<!-- ----------------------------分页插件-------------------------------- -->
				
			</form>
			<div class="pagination">
				  <a href="#" class="first" data-action="first">首页</a>
				  <a href="#" class="previous" data-action="previous">上一页</a>
				  <input type="text" data-max-page="400" class="enterPage"/>
				  <a href="#" class="next" data-action="next">下一页</a>
				  <a href="#" class="last" data-action="last">尾页</a>
				</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.jqpagination.min.js"/></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/operator-check.js"/></script>
	</jsp:body>
</lbt:user-layout>
