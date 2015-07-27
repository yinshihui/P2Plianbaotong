<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="经纪人项目查询">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
	<script type="text/javascript">
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
	
	function checkProjStatus(status) {
		var projStatus;
		switch(status) {
			case "S0" :
				projStatus = "新建";
				break;
			case "S1" :
				projStatus = "打回";
				break;
			case "S2" :
				projStatus = "通过";
				break;
			case "S3" :
				projStatus = "待成立的";
				break;
			case "S4" :
				projStatus = "未成立的";
				break;
			case "S5" :
				projStatus = "担保机构一级审核";
				break;
			case "S6" :
				projStatus = "担保机构二级审核";
				break;
			case "S7" :
				projStatus = "等待还款的";
				break;
			case "S8" :
				projStatus = "正常还款的";
				break;
			case "S9" :
				projStatus = "到期未还款的";
				break;
			case "S10" :
				projStatus = "超期还款的";
				break;
		}
		return projStatus;
	
		
}
	
	function checkInstStatus(status) {
		var instStatus;
		switch(status) {
			case "s" :
				instStatus = "成功";
				break;
			case "I" :
				instStatus = "处理中";
				break;
			case "f" :
				instStatus = "失败";
				break;
		}
		return instStatus;
	}
	    
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
	
	function loadData(params){
		$.getJSON("project/queryBrokerProject", params, function(resp){
			
			$("#countAcct").text(resp['countAcct']);
			$("#sumAmt").text(resp['sumAmt']);
			
			$("#noBrokerFeeSum").text(resp['noBrokerFeeSum']);
			$("#brokerFeeTxnSum").text(resp['brokerFeeTxnSum']);
			$("#brokerFeeSum").text(resp['brokerFeeSum']);
			
		 
			var detailList = resp['detailList'];
			var tbody = $("#detailBody");
			$("#detailBody").empty();
			for ( var i in detailList) {
				var pd = detailList[i];
				tbody.append($("<tr/>")
						.append($("<td/>").html(pd.lbtPtpFprojInf.projName))
						.append($("<td/>").html(pd.usrName))
						.append($("<td/>").html(pd.lbtPtpFprojInf.demandAmt).formatCurrency())
						.append($("<td/>").html(pd.lbtPtpFprojInstDetail.instAmt).formatCurrency())
						.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInstDetail.instTime), "yyyy-MM-dd HH:mm:ss")))
						.append($("<td/>").html(pd.brokerFeeAmt).formatCurrency())
						.append($("<td/>").html(checkInstStatus(pd.lbtPtpFprojInstDetail.instStatus)))
						.append($("<td/>")
								.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo).html("详情"))));				
				

			}
		});
	}
	$(function(){	
		
		var date = new Date();
		var endDay = date.getDate();
		var endMonth = date.getMonth() + 1;
		var endYear = date.getFullYear();
		var endDate = endYear + '-' + endMonth + '-' + endDay;
		
		loadData({pageNow : 1});
		$("#search").click(function(e){
			e.preventDefault();
			loadData({beginDate:$("#beginDate").val(), endDate:$("#endDate").val(),projName:$("#projName").val(),projStatus:$("#projStatus").val()});
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
	</jsp:attribute>
	<jsp:body>
	<div class="mainRight">
      	<div class="user_right">
	  <div class="box">
        <ul class="boxUL">
          <form id = "searchForm">
          <table width="100%" border="0" cellspacing="10" cellpadding="5" class="tab tab2">
            <tr>
              <th width="10%">起止日期</th>
              <td width="90%"><div class="rl">
                  <input type="date"  name="beginDate" id = "beginDate"  onclick="new Calendar().show(this);"  readonly="readonly"  />
                </div>
                <em>-</em>
                <div class="rl">
                  <input type="date"  name="endDate" id = "endDate"  onclick="new Calendar().show(this);"  readonly="readonly"/>
                </div>
                 <a href="javascript:;" class="rq" id="today">今天</a><a href="javascript:;" class="rq" id="week">7天</a><a href="javascript:;" class="rq" id="month">一个月</a><a href="javascript:;" class="rq" id="three_month">三个月</a></td>
            </tr>
             <tr>
              <th width="10%">交易名称</th>
              <td width="90%"><div class="rl">
                  <input type="text"  name="projName" id = "projName"    />
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
            <h4>业务统计</h4>
            <ul>
            
            交易笔数<b id= "countAcct"> </b>笔 ， 佣金总额<b id = "brokerFeeSum"> </b>元    
             </ul>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th style="width:100px;">名称
                </th>
              <th>投资人
                </th>
              <th>需求金额（元）
                </th>
              <th>投资金额（元）
                </th>
              <th>投资时间
                </th>
               <th>预收佣金（元）
                </th>
              <th>交易状态
                </th>
              <th>操作
                </th>
            </tr>
            <tbody id="detailBody">	
             
			</tbody>
          </table>
          <a href="#" class="jzMore" id="loadMore">加载更多投资记录</a>
        </ul>
      </div>
	 
</div>
</div>

	</jsp:body>
	
</lbt:user-layout>


 