<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="投资信息查询">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/jqpagination.css" type="text/css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.jqpagination.min.js"/></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
	<style>
	.pagination {
		right:-148px!important;
		top:-9px!important;
		width:445px!important;
	}
	#projStatus {
		width:100px;
	}
	
	</style>
	<script type="text/javascript">
/* 	$(function(){
		$.getJSON("invest/InvestQuery")
			.success(function(r){
				$("#investQuery").html(r.name);
			});
	}); */
	var myPage = {
			PAGE_NOW : 1,		//现在是第几页
			PAGE_COUNT : 1		//一共有多少页
	};
	function setPageNum() {
		$('.pagination').jqPagination({
			  link_string : '/?page={page_number}',
			  current_page: 1, //设置当前页 默认为1
			  max_page : myPage.PAGE_COUNT, //设置最大页 默认为1
			  page_string : '当前第{current_page}页,共{max_page}页',
			  paged : function(page) {
			      //回发事件。。。
			      }
			});
	};
		 
	function checkInstStatus(stat) {
		var status;
	    
		switch(stat) {
			case "s" : 
				status = "交易成功";
				break;
			case "I" : 
				status = "处理中";
				break;
			case "f" : 
				status = "失败";
				break;
			default :
				status = "未知";
				break;
		}
		return status;
	}
	
		
		function checkStatus(stat) {
			var status;
		    
			switch(stat) {
				case "S0" : 
					status = "新建";
					break;
				case "S1" : 
					status = "打回";
					break;
				case "S2" : 
					status = "通过";
					break;
				case "S3" : 
					status = "待成立";
					break;
				case "S4" : 
					status = "未成立";
					break;
				case "S5" : 
					status = "担保机构审核中";
					break;
				case "S6" : 
					status = "担保机构审核中";
					break;
				case "S7" : 
					status = "等待还款";
					break;
				case "S8" : 
					status = "正常还款";
					break;
				case "S9" : 
					status = "到期未还款";
					break;
				case "S10" : 
					status = "超期还款";
					break;
				default :
					status = "未知";
					break;
			}
			return status;
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
		$.getJSON("invest/InvestQuery", params, function(resp){
			
			$("#countAcct").text(resp['countAcct']);
			 
			$("#sumAmt").text(resp['sumAmt']);
			$("#sumAmt").formatCurrency();
			$("#sumInst").text(resp['sumInst']);
			$("#sumInst").formatCurrency();
			
			var detailList = resp['detailList'];
			myPage.PAGE_COUNT =resp["page_count"];
			var tbody = $("#detailBody");
			var id;
			var instNo;
			$("#detailBody").empty();
			for ( var i in detailList) {
				var pd = detailList[i];
				var repaydate =pd.lbtPtpFprojInf.repayDate;
				if (repaydate != null){
				//	repaydate = $.format.date(new Date(repaydate), "yyyy-MM-dd");
				}else {
					repaydate ="审核中";
				}
				id = pd.lbtPtpFprojInstDetail.projNo;
				instNo = pd.lbtPtpFprojInstDetail.instNo;
				if(pd.lbtPtpFprojInstDetail.instStatus == 's'){
					
					tbody.append($("<tr/>")
							.append($("<td/>").html(pd.lbtPtpFprojInf.projName))
							/* .append($("<td/>").html(pd.usrName)) */
							.append($("<td/>").html(pd.lbtPtpFprojInstDetail.instAmt).formatCurrency())
							.append($("<td/>").html(pd.instRate).formatCurrency())
							.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInstDetail.instTime), "yyyy-MM-dd HH:mm:ss")))
							.append($("<td/>").html(repaydate))
							.append($("<td/>").html(checkStatus(pd.lbtPtpFprojInf.projStatus)))
							.append($("<td/>").html(checkInstStatus(pd.lbtPtpFprojInstDetail.instStatus)))

							.append($("<td/>")
									.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "common-detail.jsp?id=" + id).html("详情"))
									)
							.append($("<td/>")
 									.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "report/tzcert/" + instNo).html("下载凭证"))
									)
									);
				}else{
					tbody.append($("<tr/>")
							.append($("<td/>").html(pd.lbtPtpFprojInf.projName))
							/* .append($("<td/>").html(pd.usrName)) */
							.append($("<td/>").html(pd.lbtPtpFprojInstDetail.instAmt).formatCurrency())
							.append($("<td/>").html(pd.instRate).formatCurrency())
							.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInstDetail.instTime), "yyyy-MM-dd HH:mm:ss")))
							.append($("<td/>").html(repaydate))
							.append($("<td/>").html(checkStatus(pd.lbtPtpFprojInf.projStatus)))
							.append($("<td/>").html(checkInstStatus(pd.lbtPtpFprojInstDetail.instStatus)))

							.append($("<td/>")
									.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "common-detail.jsp?id=" + id).html("详情"))
									)
									);
				}

			}
		});
	}
	var getPageNum = function() {
		loadData({pageNow : myPage.PAGE_NOW});
		setTimeout(function() {
			setPageNum();
		}, 200);		
	};
	$(function(){	
		var date = new Date();
		var endDay = date.getDate();
		var endMonth = date.getMonth() + 1;
		var endYear = date.getFullYear();
		var endDate = endYear + '-' + endMonth + '-' + endDay;
		
		getPageNum();
		
		$("#search").click(function(e){
			e.preventDefault();
			loadData({beginDate:$("#beginDate").val(), endDate:$("#endDate").val(),projName:$("#projName").val(),projStatus:$("#projStatus").val(),pageNow : 1});
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
		//回第一页
		$(".first").click(function() {
			if (myPage.PAGE_NOW !== 1) {
				myPage.PAGE_NOW = 1;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {
				alert("到首页了哦！");
			}
		});
		//上一页
		$(".previous").click(function(e) {
			if (myPage.PAGE_NOW > 1) {
				myPage.PAGE_NOW -= 1;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {
				alert("到首页了哦！");
			}
		});
		//下一页
		$(".next").click(function(e) {
			$(this).attr("disabled", false);
			if (myPage.PAGE_NOW < myPage.PAGE_COUNT) {
				$(this).attr("disabled", false);
				myPage.PAGE_NOW += 1;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {
				$(this).attr("disabled", true);
				alert("到尾页了哦！");
			}
		});
		//回最后一页
		$(".last").click(function() {
			var count = myPage.PAGE_COUNT;
			if (myPage.PAGE_NOW !== count) {
				myPage.PAGE_NOW = count;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {
				alert("到尾页了哦！");
			}
		});
		//支持输入框手动输入页数
		$(".enterPage").blur(function(e) {		
			var value = $(this).val();
			if (value <= myPage.PAGE_COUNT) {
				myPage.PAGE_NOW = +value;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {
				$(this).val("");
				alert("您输入的页数有误！");
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
               
                  <input type="date"  name="beginDate" id = "beginDate" onclick="new Calendar().show(this);"  readonly="readonly"  />
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
           <!--   <tr>
             <th width="10%">交易状态</th>
              <td width="90%"><div class="rl">
                   <input type="text"  name="projStatus" id = "projStatus"   />
                  <select name="projStatus" id = "projStatus">
                  	<option value="">未选择</option>
                  	<option value="s">交易完成</option>
                  	<option  value="I">处理中</option>
                  	<option  value="f" >交易失败</option>
                  </select>
                </div>
                 </td>
                  </tr> -->
             
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
          <div class="title1">
            <h4>投资统计</h4>
            <ul>
              	已投资<b id= "countAcct"> </b>笔，累计投资金额<b id = "sumAmt"> </b>元，预计收益金额<b id = "sumInst"> </b>元
            </ul>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th style="width:100px;">名称
                </th>
             <!--  <th>投资接受人
                </th> -->
                 <th>投资金额（元）
                </th>
              <th>收益（元）
                </th>
              <th>投资日期
                </th>
              <th>到期日期
                </th>
               <th>投资状态
                </th>
                <th>交易状态
                </th>
              <th>详情</th>
              <th>投资凭证</th>
            </tr>
            <tbody id="detailBody">	
             
			</tbody>
          </table>
<!--           <div class="page">
            <ul>
              <li class="pageBox"><a href="#">上一页</a></li>
              <li class="pageBox"><a href="#">下一页</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li class="pageBox"><a href="#">首页</a></li>
              <li class="pageBox"><a href="#">尾页</a></li>
              <li>跳转
                <input class="pageInput" />
        	        页</li>
              <li>
                <input value="go" class="pageBt" type="submit">
              </li>
            </ul>
           
          </div> -->
           <div class="pagination">
			  <a href="#" class="first" data-action="first">首页</a>
			  <a href="#" class="previous" data-action="previous">上一页</a>
			  <input type="text" data-max-page="400" class="enterPage"/>
			  <a href="#" class="next" data-action="next">下一页</a>
			  <a href="#" class="last" data-action="last">尾页</a>
			</div>
      </div>
	 
</div>
</div>

	</jsp:body>
	
</lbt:user-layout>


 