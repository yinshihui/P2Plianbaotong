<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:main-layout title="项目查询">
<jsp:attribute name="header">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/project-query.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/progress.css" type="text/css" />
<script type="text/javascript">

//跟踪查询状态
var currentParams = {pageNow:1};

$(function(){
	var investTime = document.getElementById("investTime"),
		  investComp = document.getElementById("investComp");
	var periodsValue;
	var compNameValue;
	$.getJSON("security/current-user")
	.success(function(r){
		$("#usrName").val(r.name);
		$.post("operator/usrNameQuery", {usrName : $("#usrName").val()})
		.success(function(r){
			var list = r.arrayList;
			$("#roleType").val(list[0].roleType);
		});
	});
	loadData();
	
	$("#investTime dd").click(function(e) {
		 e.preventDefault();
		var dd = investTime.getElementsByTagName("dd"),
			  len = investTime.getElementsByTagName("dd").length;
		for (var i = 0; i < len; i += 1) {
			dd[i].className = "";
		}
		this.className = "searchChoose";
		periodsValue = this.title;
		currentParams.periods = periodsValue;
		currentParams.compName = compNameValue;
		currentParams.pageNow = 1;
		loadData();
		
	});
	$("#investComp dd").click(function(e) {
		 e.preventDefault();
		var dd = investComp.getElementsByTagName("dd"),
			  len = investComp.getElementsByTagName("dd").length;
		for (var i = 0; i < len; i += 1) {
			dd[i].className = "";
		}
		this.className = "searchChoose";
		compNameValue = this.title;
		currentParams.periods = periodsValue;
		currentParams.compName = compNameValue;
		currentParams.pageNow = 1;
		loadData();
	});
// 	$('.pagination').jqPagination({
// 		current_page: 1, //设置当前页 默认为1
// 		page_string : '当前第{current_page}页,共{max_page}页',
// 	    paged: function(page) {
// 	    	currentParams.pageNow = page;
// 	    	loadData();
// 	    }
// 	});

	setTimeout(function() {
		$('.pagination').jqPagination({
			max_page : $("#pageCount").val(),
			current_page : currentParams.pageNow,
			page_string : '当前第{current_page}页,共{max_page}页',
			paged: function(page) {
	 	    	currentParams.pageNow = page;
	 	    	loadData();
	 	    }
		});
	}, 1000);	
});
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
	function loadData(){
	//加载脚本
	$.getJSON("project/query", currentParams, function(resp){
		var projList = resp['list'];
		$("#pageCount").val(resp.page_count);
		
		
		var content = $("#content");
		$("#content").empty();
		for (var i in projList) {
			var proj = projList[i].lbtPtpFprojInf;
			var alsoNeedAmt = projList[i].alsoNeedAmt;
			var progressInvest = projList[i].progressInvest;
			var percentWidth = progressInvest + "%";
			var investImageSrc ="res/images/btn_blue.png";
			var imageHref ="project-detail.jsp?id="+proj.projNo;
			if (projList[i].investFlag == "N" ){
				 investImageSrc ="res/images/btn_grey.png";
				 percentWidth = "100%";
				 imageHref ="common-detail.jsp?id="+proj.projNo;
				 
			}
			
			var prod = projList[i].lbtPtpFprodInf;
				  projStatus = checkStatus(proj.projStatus);
			var contractdate='未成立';
			if(proj.contractDate!=null){
				contractdate = proj.contractDate;
			}
				//contractdate = $.format.date(new Date(proj.contractDate), "yyyy-MM-dd");
			
				
			
			content.append(
					'<div class="investment_list">' +
				    '<div class="investment_listtop">' +
				    '<div class="investment_listtop1"><img src="res/images/fang.png" width="29" height="22" />'  + proj.projName + 
				    '<a href="#" id="tanchu_a' + i + '" style="position:absolute;">' +
				    '<img src="res/images/tai1.gif" width="21" height="19"/><div class="tanchu_style" id="tanchu' + i +'" style="display:none;">担保机构：重庆渝台信用担保有限公司</div></a><br/><span>项目发行规模：￥' + proj.demandAmt + "万元" +
				    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投资期限：'+prod.periods+'月&nbsp;&nbsp;&nbsp;&nbsp;项目状态：' + projStatus + 
				    '&nbsp;&nbsp;&nbsp;&nbsp;合同成立日：' + contractdate +
				    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></div>' +
				    '<div class="left_listtop2">' + proj.annualYield*100 + '%' +
				    '<br/><span>投资收益率</span></div>' +
				    '<div class="investment_listtop3"><img src="res/images/co_line.png" width="4" height="49" /><a style=" padding-left:20px;" href="'+imageHref+'"><img src="'+investImageSrc+'" width="117" height="49" /></a></div></div>' +
				    '<div class="investment_listdom"><div class="investment_listdom1"><label style="float:left;">进度：</label><div class="progress_main"><div class="progress_actual " style="width:' + percentWidth + ';"></div></div><span style="color:rgb(255, 95, 6);float:left;margin-left:5px;">' + percentWidth + '</span></div>' +
				    '<div class="investment_listdom3">还需：<a>'+alsoNeedAmt+'</a>万元</div>' +
				    '<div class="investment_listdom2">开始时间：<span>' + $.format.date(new Date(proj.instStartTime), "yyyy-MM-dd HH:mm:ss")+ 
				    '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截止时间：<span>' + $.format.date(new Date(proj.instEndTime), "yyyy-MM-dd HH:mm:ss") +
				    '</span> </div>' +
				    '</div>' +
				    '</div>'
				);
		}
	});
}

</script>
</jsp:attribute>
<jsp:body>
<div class="conter_2_bg">
	<div class="conter">
		<div id="searchArea" class="investment">
			<ul>
				<li id="investTime">
					<dt>投资期限：</dt>
					<dd id="allmonth" class="searchChoose" title="0"><a href="#" title="" >全部</a></dd>
					<dd id="month1" title="1" ><a href="#"  >1个月</a></dd>
					<dd id="month3" title="3"><a href="#" >3个月</a></dd>
					<dd id="month6" title="6"><a href="#" >6个月</a></dd>
					<dd id="month12" title="12"><a href="#">12个月</a></dd>
				</li>
				<li id="investComp">
					<dt>担保公司：</dt>
					<dd id ="allInvest" class="searchChoose"  title="" ><a href="#" >全部</a></dd>
					<dd id ="invest1" title="4" ><a>渝台担保</a></dd>
					<dd id="invest2" title="5" ><a>教育担保</a></dd>
				</li>
			</ul>
		</div>
   		<div class="investment_content">
   			<div id="content">
   			<!-- ------------------append here----------------------------- -->
   			</div>
			<div class="pagination">
			    <a href="#" class="first" data-action="first">首页</a>
			    <a href="#" class="previous" data-action="previous">上一页</a>
			    <input type="text" readonly="readonly"/>
			    <a href="#" class="next" data-action="next">下一页</a>
			    <a href="#" class="last" data-action="last">尾页</a>
			</div>
	    	<div class="investment_bottom">
	    	</div>
	    </div>
    </div>
</div>
<input type="hidden" name="pageCount" id="pageCount"/>
<input type="hidden" name="usrName" id="usrName"/>
<input type="hidden" name="roleType" id="roleType"/>
</jsp:body>
</lbt:main-layout>
</html>