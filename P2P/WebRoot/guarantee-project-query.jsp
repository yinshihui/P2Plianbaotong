<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="担保机构项目查询">
	<jsp:attribute name="header">
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
<style>
a:link {
color:Darkorange;
}
a:visited {
color:Darkorange;
}
 
#hiddenArea {
	backgroun:rgb(0,0,0);
	background-color:rgba(0,0,0,0.5);
	position:absolute;
	margin-left:auto;
	margin-right:auto;
	display:none;
	top:0;
	left:0;
	width:100%;
	z-index:200;
}
#wholeContent {
	border-radius:10px;
	border:5px solid rgb(252, 103, 0);
	position:relative;
	width:338px;
	height:200px;
	background-color:white;
	padding:40px;
}
#invest_form label {
	font-size:24px;
}
#invest_form button {
	font-size:16px;
}
#invest_form table tbody td input {
	width:200px;
	height:30px;
}
#invest_form table tbody tr {
	line-height:40px;
}
#invest_form table tbody td {
	font-size:16px;
}

#submitC,
#submit,
#closeX{
	background-color:rgb(255, 102, 0)!important;
	border-radius:10px;
	border: 0px solid red!important;
	color:white;
	cursor:pointer;
	font-size:14px;
	transition:.5s;
	-o-transition:.5s;
	-moz-transition:.5s;
	-webkit-transition:.5s;
	margin-left:20px;
	margin-right:20px;
	height:36px;
	width:88px!important;
}
#submit:hover,
#closeX:hover{
	background-color:rgb(0, 153, 255)!important;
}
</style>
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
	
	
	function loadData(params){
		$.getJSON("project/queryGuaranteeProject", params, function(resp){
			
			//$("#countAcct").text(resp['list'].length);
			$("#countAcct").text(resp.count);
			myPage.PAGE_COUNT = resp.page_count;
			var detailList = resp['list'];
			var tbody = $("#detailBody");
			var financedAmt = 0;
			for ( var i in detailList) {
				var pd = detailList[i];
				//var detailHref ="" ;
				var buttonName ="详情";
				if(pd.lbtPtpFprojInf.projStatus == 'S3' 
					&& (pd.lbtPtpFprojInf.financedAmt < pd.lbtPtpFprojInf.minDemandAmt)
					&& (pd.lbtPtpFprojInf.instEndTime <= new Date())){
					buttonName ="取消融资";
				}
				
				financedAmt += pd.lbtPtpFprojInf.financedAmt;
				tbody.append($("<tr/>")
						.append($("<td/>").html("<a target='_blank' href=common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo+">"+pd.lbtPtpFprojInf.projName +"</a>"))
						.append($("<td/>").html(pd.lbtPtpFprojInf.demandAmt).formatCurrency())
						.append($("<td/>").html(pd.lbtPtpFprojInf.financedAmt).formatCurrency())
						.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInf.instStartTime), "yyyy-MM-dd HH:mm:ss")))
						.append($("<td/>").html(checkRepayType(pd.lbtPtpFprodInf.repayType)))
						.append($("<td/>").html(checkProjStatus(pd.lbtPtpFprojInf.projStatus)))
						.append($("<td/>")
						.append($("<a/>").addClass("btXq")
										.attr("data", pd.lbtPtpFprojInf.projNo)
										.attr("target", "_blank")
										.addClass("doFinance").attr("href", "common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo).html(buttonName))));
				
				$(".doFinance").click(function(e) {
					if ($(this).html() === "取消融资") {
						e.preventDefault();	
						var height = document.body.scrollHeight,
						  windowHeight = window.screen.height,
						  windowWidth = window.screen.width,
						  top = (windowHeight - $("#wholeContent").height()) / 2,
						  left = (windowWidth - $("#wholeContent").width()) / 2,
						  id = $(this).attr("data");
					
					$("#id2").val(id);
					$("#invest_form div").css("top", top + "px");
					$("#invest_form div").css("left", left + "px");
					$("#hiddenArea").css("display", "block");
					$("#hiddenArea").css("height", height + "px");
						$("#nofinancing").css("display", "block");
					}
				});
			}
			//$("#sumAmt").text(financedAmt).formatCurrency();
			$("#sumAmt").text(resp.sumAmt).formatCurrency();
		});
	}
	$(function(){
	
		loadData({pageNow : myPage.PAGE_NOW});
		$("#search").click(function(e){
			e.preventDefault();
			$("#detailBody").empty();
			loadData({projName:$("#projName").val(),projStatus:$("#projStatus").val()});
			    });
		
		 
		/* 	$(".doFinance").click(function(e) {
				e.preventDefault();
				 
				var id =  $(this).attr("data");
				window.open("common-detail.jsp?id=" + id);
			});
		  */
		
		 //取消融资
		$("#submitC").click(function(e) {
			e.preventDefault();
			$.post("acct/financeCancel", {
				projNo :  $("#id2").val(), 
				transPass :  $("#transPassC").val()
			})
			.success(function(r){
				if (r.result == "success") {
					window.location = "success.jsp";
	    		}
	    		else {
	    			$("#retunresult2").html(r.result);
	    		}
			});	
		});
		  
// 		$("#submit2").click(function(e) {
// 			e.preventDefault();
// 			$.post("acct/finacierRepay", {
// 				projNo : $("#projNo").val(), 
// 				payAmt : $("#payAmt").val(), 
// 				transPass : $("#transPass").val()
// 			})
// 	    	.success(function(r){
// 	    		if (r.status == "ok") {
// 	    			location.href="..";
// 	    		}
// 	    		else {
// 	    			;
// 	    		}
// 	    		window.location = "success.jsp?s8";
// 	    	});
// 		});
		$("#loadMore").click(function(e) {
			e.preventDefault();
			if (myPage.PAGE_NOW < myPage.PAGE_COUNT) {
				myPage.PAGE_NOW += 1;
				loadData({pageNow : myPage.PAGE_NOW});
			}else {	
				$(this).html("没有更早的记录了！");
			}
		}); 

		$("#closeX").click(function(e) {
			e.preventDefault();
			$("#hiddenArea").css("display", "none");
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
	              <th width="10%">项目名称</th>
	              <td width="90%"><div class="rl">
	                  <input type="text"  name="projName" id = "projName"    />
	                </div>
	                 </td>
	             
	            </tr>
	             <tr>
	             <th width="10%">项目状态</th>
	              <td width="90%"><div class="rl">
	                  <select name="projStatus" id = "projStatus" >
	                    
                  	<option value="">未选择</option>
                  	<option value="S0">新建 </option>
                  	<option value="S1">打回 </option>
                  	<option value="S2">通过 </option>
                  	<option value="S3">待成立的 </option>
                  	<option value="S4">未成立的 </option>
                  	<option value="S5">担保机构一级审核</option>
                  	<option value="S6">担保机构二级审核</option>
                  	<option value="S7">等待还款的</option>
                  	<option value="S8">正常还款的</option>
                  	<option value="S9">到期未还款的 </option>
                  	<option value="S10">超期还款的</option>
                   
                  </select>
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
            <h4>融资统计</h4>
            <ul>
              	已融资<b id= "countAcct"> </b>笔，累计融资金额<b id = "sumAmt"> </b>元
            </ul>
          </div>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th style="width:100px;">名称
                </th>
              <th>融资需求额度
                </th>
              <th>实际完成额度
                </th>
              <th>融资开始日期
                </th>
              <th>还款方式
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

<div id="hiddenArea">
	<!-- ----------------------------------------- -->
		<form id="invest_form">
			<div id="wholeContent">
			<!-- 取消融资 -->
				<div id="nofinancing">
						<input type="hidden" name="id2" id="id2" />
						<table>
							<tr>
								<td class="required">*</td><td>输入交易密码</td>
								<td><input name="transPassC" id="transPassC" type="password"></td>
							</tr>
							<tr>
							<td id="retunresult2" align="left" colspan="3"></td> 
							</tr>
							<tr>
								<td colspan="2">
									<button id="submitC">取消融资</button>
								</td>
								<td>
									<button id="closeX">关闭</button>
								</td>
							</tr>
						</table>
				</div>
			</div>
			</form>
			</div>
	</jsp:body>
</lbt:user-layout>
