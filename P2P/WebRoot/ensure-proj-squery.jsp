<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="二级审核">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
	<script src="res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script type="text/javascript">	
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
	function loadData(params){
		$.getJSON("project/ensureProjSquery", function(resp){
			var projs = resp['list'];
			var tbody = $("#detailBody");
			myPage.PAGE_COUNT = resp.page_count;
			for (var i in projs)
			{
				var proj = projs[i];
				tbody.append(
						$("<tr/>")
						.append($("<td/>").html(proj.lbtPtpFprojInf.projName))
						.append($("<td/>").html(proj.lbtPtpFprojInf.demandAmt).formatCurrency())
						.append($("<td/>").html(proj.lbtPtpFprojInf.annualYield * 100 + "%"))
						.append($("<td/>").html(proj.lbtPtpFprodInf.periods + "个月"))
						.append($("<td/>").html($.format.date(new Date(proj.lbtPtpFprojInf.instStartTime), "yyyy-MM-dd")))
						.append($("<td/>").html($.format.date(new Date(proj.lbtPtpFprojInf.instEndTime), "yyyy-MM-dd")))
						.append($("<td/>>").html(getProjStatus(proj.lbtPtpFprojInf.projStatus)))
						.append($("<td/>")
									.append($("<a/>").addClass("btXq").attr("target","_blank").attr("href", "ensure-proj-scheck.jsp?id="+proj.lbtPtpFprojInf.projNo).html("详情"))));
			}
		});
	};
	
	function getStartDate(dayTip) {
		var PERDAY = 24 * 60 * 60 * 1000,
			  WEEK = 7,
			  MONTH = 30,
			  HALFYEAR = 182,
			  YEAR = 365;
		var date;
		var startYear, startMonth, startDay;
		var endDate = new Date();
		switch(dayTip) {
			case "today" :
				date = new Date(endDate);
				break;
			case "week" :
				date = new Date(endDate - WEEK * PERDAY);
				break;
			case "month" :
				date = new Date(endDate - MONTH * PERDAY);
				break;
			case "three_month" :
				date = new Date(endDate - 3 * MONTH * PERDAY);
				break;
			case "halfyear" :
				date = new Date(endDate - HALFYEAR * PERDAY);
				break;
			case "year" :
				date = new Date(endDate - YEAR * PERDAY);
				break;
		}
		startYear = date.getFullYear(); 
		startMonth = date.getMonth() + 1;
		startDay = date.getDate();
		startDate = startYear + '-' + startMonth + '-' + startDay;
		return startDate;
	};	   
	
	
	$(function(){
		var date = new Date();
		var endDay = date.getDate();
		var endMonth = date.getMonth() + 1;
		var endYear = date.getFullYear();
		var endDate = endYear + '-' + endMonth + '-' + endDay;
			
		loadData({pageNow : myPage.PAGE_NOW});
		
		$("#search").click(function(e){
			e.preventDefault();
			loadData({beginDate:$("#beginDate").val(), endDate:$("#endDate").val()});
		});
		
		$("#today").click(function() {
			$("#beginDate").val(getStartDate("today"));
			$("#endDate").val(endDate);
		});
		$("#week").click(function() {
			$("#beginDate").val(getStartDate("week"));
			$("#endDate").val(endDate);
		});
		$("#month").click(function() {
			$("#beginDate").val(getStartDate("month"));
			$("#endDate").val(endDate);
		});
		$("#three_month").click(function() {
			$("#beginDate").val(getStartDate("three_month"));
			$("#endDate").val(endDate);
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

<style type="text/css">
#introduction tbody .first{
background-color: red;
}
</style>
	</jsp:attribute>
	<jsp:body>
		<div class="mainRight">
      	 <div class="user_right">
      	  <div class="box">
        <ul class="boxUL">
         <form id = "searchForm">
          <table  class="tab tab2">
            <tr>
              <th width="10%">起止日期</th>
              <td width="90%"><div class="rl">
                  <input type="date"  name="beginDate" id = "beginDate"  onclick="new Calendar().show(this);"   readonly="readonly"  />
                </div>
                <em>-</em>
                <div class="rl">
                  <input type="date"  name="endDate" id = "endDate"  onclick="new Calendar().show(this);"  readonly="readonly"/>
                </div>
               <a href="javascript:;" class="rq" id="today">今天</a><a href="javascript:;" class="rq" id="week">7天</a><a href="javascript:;" class="rq" id="month">一个月</a><a href="javascript:;" class="rq" id="three_month">三个月</a></td>
            </tr>
             <tr>
              <td></td>
              <td><input id = "search" value="查询" type="submit" class="tj" />
                <input value="重置" type="submit" class="cz" />
               </td>
            </tr>
            </table>
            </form>
        </ul>
        </div>
      	 <div class="box">
	        <ul class="boxUL">
				<table class="tab tab1" align="center">
					<thead>
						<tr>
							<th width="150px">项目名称</th>
							<th width="150px">金额</th>
							<th width="150px">年化收益率</th>
							<th width="100px">期限</th>
							<th width="100px">投资开始时间</th>
							<th width="100px">投资截止时间</th>
							<th width="100px">项目状态</th>
							<th width="100px">操作</th>
						</tr>
					</thead>
					<tbody id="detailBody">
						<!-- 在加载数据后显示 -->
					</tbody>
				</table>
				<a href="#" class="jzMore" id="loadMore">加载更多融资记录</a>
			</ul>
		</div>
	</div>
	</div>
	</jsp:body>
</lbt:user-layout>

  
</html>