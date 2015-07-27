$(function(){
	//加载脚本
	$.getJSON("project/query", function(resp){
		var projs = resp['list'];
		var content = $("#content");
		for (var i in projs) {
			var proj = projs[i],
				  startDate = new Date(proj.instStartTime),
				  startYear = startDate.getFullYear(),
				  startMonth = startDate.getMonth(),
				  startDay = startDate.getDate(),
				  
				  endDate = new Date(proj.instEndTime),
				  endYear = endDate.getFullYear(),
				  endMonth = endDate.getMonth(),
				  endDay = endDate.getDate(),
				  
				  projStatus = checkStatus(proj.projStatus);
			content.append(
					'<div class="investment_list">' +
				    '<div class="investment_listtop">' +
				    '<div class="investment_listtop1"><img src="res/images/fang.png" width="29" height="22" />' + '[渝台' + proj.prodNo + ']' + proj.projName + 
				    '<a href="#" id="tanchu_a' + i + '" style="position:absolute;">' +
				    '<img src="res/images/tai1.gif" width="21" height="19"/><div class="tanchu_style" id="tanchu' + i +'" style="display:none;">担保机构：重庆渝台信用担保有限公司</div></a><br/><span>项目发行规模：￥' + proj.demandAmt + "万元" +
				    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投资期限：12月&nbsp;&nbsp;&nbsp;&nbsp;项目状态：' + projStatus + 
				    '&nbsp;&nbsp;&nbsp;&nbsp;合同成立日：' + proj.contractDate + 
				    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></div>' +
				    '<div class="investment_listtop2">' + proj.annualYield + '%' +
				    '<br/><span>投资收益率</span></div>' +
				    '<div class="investment_listtop3"><img src="res/images/co_line.png" width="4" height="49" /><a style=" padding-left:20px;" href="xuqiu.html"><img src="res/images/btn_blue.png" width="117" height="49" /></a></div></div>' +
				    '<div class="investment_listdom"><div class="investment_listdom1">进度：<progress class="progress" value="10" max="100" /><span style="color:rgb(20, 182, 47);">&nbsp;&nbsp;10%</span></div>' +
				    '<div class="investment_listdom3">还需：<a>30</a>万元</div>' +
				    '<div class="investment_listdom2">开始时间：<span>' + startYear + '-' + startMonth + '-' + startDay + 
				    '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截止时间：<span>' + endYear + '-' + endMonth + '-' + endDay +
				    '</span> </div>' +
				    '</div>' +
				    '</div>'
				);
		}
	});
	var investTime = document.getElementById("investTime"),
		  investComp = document.getElementById("investComp");
	$("#investTime dd").click(function(e) {
		var dd = investTime.getElementsByTagName("dd"),
			  len = investTime.getElementsByTagName("dd").length;
		for (var i = 0; i < len; i += 1) {
			dd[i].className = "";
		}
		this.className = "searchChoose";
	});
	$("#investComp dd").click(function(e) {
		var dd = investComp.getElementsByTagName("dd"),
			  len = investComp.getElementsByTagName("dd").length;
		for (var i = 0; i < len; i += 1) {
			dd[i].className = "";
		}
		this.className = "searchChoose";
	});
	function checkStatus(stat) {
		var status;
		switch(stat) {
			case "b0" : 
				status = "新建";
				break;
			case "b1" : 
				status = "打回";
				break;
			case "b2" : 
				status = "通过";
				break;
			case "a0" : 
				status = "待成立的";
				break;
			case "a1" : 
				status = "未到期的";
				break;
			case "a2" : 
				status = "正常还款的";
				break;
			case "a3" : 
				status = "未成立的";
				break;
			case "a4" : 
				status = "到期未还款的";
				break;
			case "a5" : 
				status = "担保机构审核中的";
				break;
			case "a6" : 
				status = "等待还款的";
				break;
			case "a7" : 
				status = "超期还款的";
				break;
			default :
				status = "坑爹啊";
				break;
		}
		return status;
	}
});