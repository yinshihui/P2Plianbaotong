<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="融资人项目查询">
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
	background:rgb(0,0,0);
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
#financing {
	display:none;
	height:auto;
	width:308px;
	margin:27px auto;
}
#repay {
	display:none;
}
#submit,
#submitR,
#submitC,
#submit2,
#closeX,
#closeX2 {
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
#submitR:hover,
#submitC:hover,
#submit:hover,
#closeX:hover,
#submit2:hover,
#closeX2:hover {
	background-color:rgb(0, 153, 255)!important;
}
#projStatus {
	height:24px;
	width:130px;
}
</style>
	<script type="text/javascript">
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
    
	function loadData(params){
		$.getJSON("project/financierProjectQuery", params, function(resp){
			
			$("#countAcct").text(resp['countAcct']);
			$("#sumAmt").text(resp['sumAmt']).formatCurrency();
			
			var detailList = resp['list'];
			var tbody = $("#detailBody");
			$("#detailBody").empty();
			for ( var i in detailList) {
				var pd = detailList[i];
				var buttonName ="详情";
				if((pd.lbtPtpFprojInf.projStatus == 'S3' && pd.lbtPtpFprojInf.financedAmt == pd.lbtPtpFprojInf.demandAmt) 
						|| (pd.lbtPtpFprojInf.projStatus == 'S3' && pd.lbtPtpFprojInf.financedAmt >= pd.lbtPtpFprojInf.minDemandAmt && pd.lbtPtpFprojInf.instEndTime <= new Date()) ){
					buttonName ="确认融资";
				}else if(pd.lbtPtpFprojInf.projStatus == 'S3' 
						&& (pd.lbtPtpFprojInf.financedAmt < pd.lbtPtpFprojInf.minDemandAmt)
						&& (pd.lbtPtpFprojInf.instEndTime <= new Date())){
					buttonName ="取消融资";
				}else if(pd.lbtPtpFprojInf.projStatus == 'S7'){
					buttonName ="还款";
				}
								
				if( buttonName == "详情" 
						||buttonName == '确认融资' 
						|| buttonName == "还款"){
					tbody.append($("<tr/>")
							.append($("<td/>").html("<a target='_blank' href=common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo+">"+pd.lbtPtpFprojInf.projName +"</a>"))
							.append($("<td/>").html(pd.lbtPtpFprojInf.demandAmt).formatCurrency())
							.append($("<td/>").html(pd.lbtPtpFprojInf.financedAmt).formatCurrency())
							.append($("<td/>").html(pd.repayAmt).formatCurrency())
							.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInf.instEndTime), "yyyy-MM-dd")))
							.append($("<td/>").html(getProjStatus(pd.lbtPtpFprojInf.projStatus)))
							.append($("<td/>")
								//.append($("<a/>").addClass("btXq").attr("href", detailHref).html(buttonName))));
									.append($("<a/>").addClass("btXq")
											.addClass("doFinance")
											.attr("repayAmt", pd.repayAmt)
											.attr("financingAmt", pd.lbtPtpFprojInf.financedAmt)
											.attr("data", pd.lbtPtpFprojInf.projNo)
											.attr("href", "javascript:;").html(buttonName))));
				}else if(buttonName == "取消融资" ){
					tbody.append($("<tr/>")
							.append($("<td/>").html("<a target='_blank' href=common-detail.jsp?id="+pd.lbtPtpFprojInf.projNo+">"+pd.lbtPtpFprojInf.projName +"</a>"))
							.append($("<td/>").html(pd.lbtPtpFprojInf.demandAmt).formatCurrency())
							.append($("<td/>").html(pd.lbtPtpFprojInf.financedAmt).formatCurrency())
							.append($("<td/>").html(pd.repayAmt).formatCurrency())
							.append($("<td/>").html($.format.date(new Date(pd.lbtPtpFprojInf.projPutDate), "yyyy-MM-dd")))
							.append($("<td/>").html(checkProjStatus(pd.lbtPtpFprojInf.projStatus)))
							);
				}
			}
			$(".doFinance").click(function(e) {
				e.preventDefault();
				var height = document.body.scrollHeight,
					  windowHeight = window.screen.height,
					  windowWidth = window.screen.width,
					  top = (windowHeight - $("#wholeContent").height()) / 2,
					  left = (windowWidth - $("#wholeContent").width()) / 2,
					  id = $(this).attr("data");
				var financingAmt = $(this).attr("financingAmt");//融资金额
				var repayAmt =  $(this).attr("repayAmt");//还款金额
				$("#id2").val(id);
// 				$("#projNo").val(id);
				$("#invest_form div").css("top", top + "px");
				$("#invest_form div").css("left", left + "px");
				$("#hiddenArea").css("display", "block");
				$("#hiddenArea").css("height", height + "px");
				if ($(this).html() === "确认融资") {
					$("#financingAmt").html(financingAmt+" 元");
					$("#financing").css("display", "block");
// 					$("#nofinancing").css("display", "none");
					$("#repay").css("display", "none");
				}else if ($(this).html() === "还款") {
					$("#repayAmt").html(repayAmt+" 元");
					$("#repay").css("display", "block");
// 					$("#nofinancing").css("display", "none");
					$("#financing").css("display", "none");
				}else if ($(this).html() === "详情") {
					$("#hiddenArea").css("display", "none");
					window.open("common-detail.jsp?id=" + id);
				}
			});
		});
	}
	$(function(){
	
		loadData({pageNow : 1});
		
		$("#search").click(function(e){
			e.preventDefault();
			loadData({projName:$("#projName").val(),projStatus:$("#projStatus").val()});
			    });
		$("#submitR").click(function(e) {
			e.preventDefault();
			$.post("acct/financeConfirm", {
				projNo :  $("#id2").val(), 
				transPass :  $("#transPassR").val()
			})
			.success(function(r){
				if (r.result == "success") {
					window.location = "success.jsp?s5";
	    		}
	    		else {
	    			$("#retunresult").html(r.result);
	    		}
			});	
		});
		
// 		$("#submitC").click(function(e) {
// 			e.preventDefault();
// 			$.post("acct/financeCancel", {
// 				projNo :  $("#id2").val(), 
// 				transPass :  $("#transPassC").val()
// 			})
// 			.success(function(r){
// 				if (r.result == "success") {
// 					window.location = "success.jsp";
// 	    		}
// 	    		else {
// 	    			$("#retunresult2").html(r.result);
// 	    		}
// 			});	
// 		});
		
		$("#submit2").click(function(e) {
			e.preventDefault();
			$.post("acct/finacierRepay", {
				projNo : $("#id2").val(),
				payAmt : $("#repayAmt").val(), 
				transPass : $("#transPass").val()
			})
	    	.success(function(r){
	    		if (r.result == "success") {
	    			window.location = "success.jsp?s8";
	    		}else{
	    			$("#retunresult3").html(r.result);
	    		}
	    	});
		});
		$("#closeX").click(function(e) {
			e.preventDefault();
			$("#hiddenArea").css("display", "none");
			$("#financing").css("display", "none");
			$("#repay").css("display", "none");
		});
		$("#closeX2").click(function(e) {
			e.preventDefault();
			$("#hiddenArea").css("display", "none");
			$("#financing").css("display", "none");
			$("#repay").css("display", "none");
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
	              <th width="10%">交易名称</th>
	              <td width="90%"><div class="rl">
	                  <input type="text"  name="projName" id = "projName"    />
	                </div>
	                 </td>
	             
	            </tr>
	             <tr>
	             <th width="10%">交易状态</th>
	              <td width="90%"><div class="rl">
	               <!--   <input type="text"  name="projStatus" id = "projStatus"   /> -->
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
	                </a></td>
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
              <th style="width:100px;">名称 </th>
              <th>融资需求额（元）</th>
              <th>实际完成额（元）</th>
              <th>应还款额（元）</th>
              <th>到期还款日</th>
              <th>交易状态</th>
              <th>操作</th>
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
				<div id="financing">
					<input type="hidden" name="id2" id="id2" />
					<table>
						<tr>
							<td></td><td>融资金额</td>
							<td><div id="financingAmt"></div></td>
						</tr>
						<tr>
							<td class="required">*</td><td>输入交易密码</td>
							<td><input name="transPassR" id="transPassR" type="password"></td>
						</tr>
						  <tr>
						 <td id="retunresult" align="left" colspan="3"></td> 
						</tr>
						<tr>
							<td colspan="2">
								<button id="submitR">确认融资</button>
							</td>
							<td>
								<button id="closeX">关闭</button>
							</td>
							</tr>
					</table>
				</div>
<!-- 				<div id="nofinancing"> -->
<!-- 					<input type="hidden" name="id2" id="id2" /> -->
<!-- 					<table> -->
<!-- 						<tr> -->
<!-- 							<td class="required">*</td><td>输入交易密码</td> -->
<!-- 							<td><input name="transPassC" id="transPassC" type="password"></td> -->
<!-- 						</tr> -->
<!-- 						  <tr> -->
<!-- 						<td></td><td></td> <td id="retunresult2" align="left"></td>  -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td colspan="2"> -->
<!-- 								<button id="submitC">取消融资</button> -->
<!-- 							</td> -->
<!-- 							<td> -->
<!-- 								<button id="closeX">关闭</button> -->
<!-- 							</td> -->
<!-- 							</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->

				<div id="repay">
					<input type="hidden" name="id2" id="id2" />
					<table>
<!-- 						<tr> -->
<!-- 							<td class="required">*</td><td>项目编号</td> -->
<!-- 							<td><input name="projNo" id="projNo" type="text" disabled="disabled"></td> -->
<!-- 						</tr> -->
						<tr>
							<td class="required">*</td><td>还款金额</td>
							<td><div id="repayAmt"></div></td>
						</tr>
						 
						<tr>
							<td class="required">*</td><td>输入交易密码</td>
							<td><input name="transPass" id="transPass" type="password"></td>
						</tr>
						  <tr>
						 <td id="retunresult3" align="left" colspan="3"></td> 
						</tr>
						<tr>
							<td colspan="2">
								<button id="submit2">确认</button>
							</td>
							<td>
								<button id="closeX2">关闭</button>
							</td>
							</tr>
					</table>
				</div>
				
				
				
			</div>
		</form>
	</div>
	</jsp:body>
</lbt:user-layout>
