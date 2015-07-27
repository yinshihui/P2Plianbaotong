<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="收益查询">
	<jsp:attribute name="header">
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<script type="text/javascript">
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
	function checkTxnStatus(status) {
		var txnStatus;
		switch(status) {
			case "s" :
				txnStatus = "交易完成";
				break;
			case "i" :
				txnStatus = "处理中";
				break;
			case "f" :
				txnStatus = "交易失败";
				break;
		}
		return txnStatus;
	
		
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
	
	 $.FormatDateTime = function (obj, IsMi) {   
	        var myDate = new Date(obj);   
	        var year = myDate.getFullYear();  
	        var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
	        var day = ("0" + myDate.getDate()).slice(-2);  
	        var h = ("0" + myDate.getHours()).slice(-2);  
	        var m = ("0" + myDate.getMinutes()).slice(-2);  
	        var s = ("0" + myDate.getSeconds()).slice(-2);   
	        var mi = ("00" + myDate.getMilliseconds()).slice(-3);  
	        if (IsMi == true) {   
	            return year + "/" + month + "/" + day + " " + h + ":" + m + ":" + s;   
	        }   
	        else {   
	            return year + "/" + month + "/" + day + " " + h + ":" + m + ":" + s + "." + mi;   
	        }  
	    };  
	    
	function loadData(params){
		$.getJSON("invest/ensureTransInQuery", params, function(resp){
			
			$("#countTxn").text(resp['countTxn']);
			$("#sumAmt").text(resp['sumAmt']).formatCurrency();
			myPage.PAGE_COUNT = resp.page_count;
			var detailList = resp['txnDetailList'];
			var tbody = $("#detailBody");
			$("#detailBody").empty();
			
			for ( var i in detailList) {
				var pd = detailList[i];
				var type = '交易类型';
				if(pd.lbtPtpTxnDetail.txnType == 't4')
					type = '分润';
				else 
					type = '';
				tbody.append($("<tr/>")
						.append($("<td/>").html(pd.lbtPtpFprojInf.projName))
						.append($("<td/>").html(type))
// 						.append($("<td/>").html(pd.lbtPtpTxnDetail.cardNo))
						.append($("<td/>").html($.format.date(new Date(pd.lbtPtpTxnDetail.txnTime), "yyyy-MM-dd HH:mm:ss")))
						.append($("<td/>").html(pd.lbtPtpFprojInf.demandAmt).formatCurrency())
						.append($("<td/>").html(pd.lbtPtpFprojInf.financedAmt).formatCurrency())
						.append($("<td/>").html(pd.lbtPtpTxnDetail.txnAmt).formatCurrency())
						.append($("<td/>")
						.append($("<a/>").addClass("btXq").attr("href", "common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo).html("详情"))));
			}
		});
	}
	$(function(){
		
		var date = new Date();
		var endDay = date.getDate();
		var endMonth = date.getMonth() + 1;
		var endYear = date.getFullYear();
		var endDate = endYear + '-' + endMonth + '-' + endDay;
		
		loadData({pageNow : myPage.PAGE_NOW});
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
                  <input type="date"  name="beginDate" id = "beginDate"   onclick="new Calendar().show(this);" readonly="readonly"  />
                </div>
                <em>-</em>
                <div class="rl">
                  <input type="date"  name="endDate" id = "endDate"  onclick="new Calendar().show(this);"  readonly="readonly"/>
                </div>
                <a href="javascript:;" class="rq" id="today">今天</a><a href="javascript:;" class="rq" id="week">7天</a><a href="javascript:;" class="rq" id="month">一个月</a><a href="javascript:;" class="rq" id="three_month">三个月</a></td>
            </tr>
             <tr>
              <th width="10%">项目名称</th>
              <td width="90%"><div class="rl">
                  <input type="text"  name="projName" id = "projName"    />
                </div>
                 </td>
             
            </tr>
            
             
           
            <tr>
              <td></td>
              <td><input id = "search" value="查询" type="submit" class="tj" />
                <input value="重置" type="submit" class="cz" />
                </a></td>
            </tr>
          </table>
          </form>
        </ul>
      </div>
     <div class="box">
        <ul class="boxUL">
          <div class="title1">
            <h4>分润统计</h4>
            <ul>
              	已分润<b id= "countTxn"> </b>笔，累计分润金额<b id = "sumAmt"> </b>元
            </ul>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th style="width:100px;">融资项目名称
                </th>
              <th>交易类型
                </th>
<!--               <th>银行账号 -->
<!--                 </th> -->
              <th>交易时间
                </th>
                <th>项目需求额（元）
                </th>
                <th>融资完成额（元）
                </th>
              <th>分润金额（元）
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


 