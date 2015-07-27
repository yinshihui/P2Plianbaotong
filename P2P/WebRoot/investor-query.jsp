<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="投资人管理">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
	function loadData(params){
		$.getJSON("broker/queryInvestor",params, function(resp){
			
			
			var arrayList = resp['list'];
			var arrayList2 = resp['list2'];
			var tbody = $("#detailBody");
			
			$("#countInvest").text(resp['countInvest']);
			$("#countCardBind").text(resp['countCardBind']);
			$("#countActive").text(resp['countActive']);
			
			myPage.PAGE_COUNT = resp.page_count;
			//$("#detailBody").empty(); 
			for ( var i in arrayList) {
				var p = arrayList[i];
				var q = arrayList2[i];
				tbody.append(
						 $("<tr/>")						
						.append($("<td/>").html(p.cstNo))
						.append($("<td/>").html(p.cstName))
						.append($("<td/>").html(q.usrName))
						.append($("<td/>").html(q.email)) 
						.append($("<td/>").html(q.mobile))
						.append($("<td/>")
								.append($("<a/>").addClass("btXq").attr("href", "investor-detail.jsp?cstNo="+p.cstNo).html("详情")))
						);
			}
			if (!resp.countResult) {
				$("#loadMore").html("无记录");
			}
		});
	}
	$(function(){
		
		loadData({pageNow : myPage.PAGE_NOW});
		$("#search").click(function(e){
			e.preventDefault();
			myPage.PAGE_NOW  = 1;
			$("#detailBody").empty(); 
			$("#loadMore").html("加载更多投资人记录");
			loadData({certNo:$("#certNo").val(), cstName:window.encodeURIComponent($("#cstName").val()), pageNow : myPage.PAGE_NOW});
			    });	
	
		$("#loadMore").click(function(e) {
			e.preventDefault();
			if (myPage.PAGE_NOW < myPage.PAGE_COUNT) {
				myPage.PAGE_NOW += 1;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {	
				$(this).html("没有更早的记录了！");
			}
		}); 
		
	});
	
	
</script>
	</jsp:attribute>
	<jsp:body>
	<div class="mainRight">
      	<div class="user_right">
	  <div class="box">
        <ul class="boxUL">
          <form id = "searchForm">
          <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
 
             <tr>
              <!-- <th width="15%">身份证号码</th>
              <td width="30%"><div class="rl">
                  <input type="text"  name="certNo" id = "certNo"    />
                </div>
                 </td> -->
             <th width="5%">真实姓名</th>
              <td width="40%"><div class="rl">
                  <input type="text"  name="cstName" id = "cstName"   />
                </div>
                 </td>
            </tr>
            <tr>
            <td></td>
              <td><input id = "search"value="查询" type="submit" class="tj" />
                <input value="重置" type="submit" class="cz" />
                </td>
            </tr>
          </table>
          </form>
        </ul>
      </div>
     <div class="box">
        <ul class="boxUL">
 		<div class="title1">
            <h4>投资人统计</h4>
            <ul>
             	 投资人	<b id= "countInvest"> </b>人，已激活<b id = "countActive"> </b>人，已绑卡<b id = "countCardBind"> </b>人
            </ul>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th>个人客户编号 </th>             
              <th>真实姓名 </th>   
              <th>用户名</th>                       
              <th>邮箱</th>
              <th>手机号</th>
              <th>操作</th>
            </tr>
            <tbody id="detailBody">	
             
			</tbody>
          </table>
          <a href="#" class="jzMore" id="loadMore">加载更多投资人记录</a>
        </ul>
      </div>
	 
</div>
</div>

	</jsp:body>
	
</lbt:user-layout>


 