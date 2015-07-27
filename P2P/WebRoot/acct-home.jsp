<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags"%>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="账户信息管理">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
		<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
	<style>
	#code {
		width:100px!important;
	}
	#hiddenArea {
		background:grey;
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
	#invest_form table {
		border-radius:10px;
		border:5px solid rgb(252, 103, 0);
		position:relative;
		width:500px;
		height:250px;
		background-color:white;
		padding:40px;
		transition:0.5s;
		-o-transition:0.5s;
		-moz-transition:0.5s;
		-webkit-transition:0.5s;
	}
	#invest_form table tbody tr {
		line-height:40px;
	}
	#invest_form table tbody td {
		font-size:16px;
	}
	#invest_form table tbody td input {
		width:200px;
		height:30px;
	}
	#submit,
	#closeX {
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
			height:36px;
			width:88px!important;
	}
	#submit:hover,
	#closeX:hover {
		background-color:rgb(0, 153, 255)!important;
	}
	</style> 
	<script>
	var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
	};
	var myPass = {
		CODEPASS : 0
	}
	
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
	function loadMore() {
		$.getJSON("acct/acctQuery/", {pageNow : myPage.PAGE_NOW})
		.success(function(r) {
			var detailList = r['detailList'];
			var tbody = $("#detailBody");
			
			$("#countAcct").text(r['countAcct']);
			$("#sumAmt").text(r['sumAmt']).formatCurrency();
			$("#sumInst").text(r['sumInst']);
			$("#sumInst").formatCurrency();
			
			
			var id;
			for ( var i in detailList) {
				var pd = detailList[i];
				
				var repaydate =pd.lbtPtpFprojInf.repayDate;
				if (repaydate != null){
				 
					//repaydate = $.format.date(new Date(repaydate), "yyyy-MM-dd");
				}else {
					repaydate ="审核中";
				}
				
				id = pd.lbtPtpFprojInstDetail.projNo;
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
								.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "common-detail.jsp?id=" + id).html("详情"))));
			}
		});
	};
	function countDown(id1, id2, secs,surl){     
		//alert(surl);  
		$('#' + id1).html(secs);
		$('#' + id2).html("秒后重新发送。");

		if(--secs>0){     
		     setTimeout(function() {
		    	 countDown(id1, id2, secs,surl);
		     },1000);     
	    }     
		else{       
		     location.href=surl;   
		     $('#' + id1).html("");
		     $('#' + id2).html("");
		 }     
	};
	function hidej(id){
		$('#' + id).attr("disabled",false);
	}; 
	/***************************************************/
		$(function() {
			$.getJSON("acct/acctQuery/", {pageNow : myPage.PAGE_NOW})
			.success(function(r) {
				
			  	myPage.PAGE_COUNT = r.page_count;
			   
			 				$("#countAcct").text(r['countAcct']);
				$("#sumAmt").text(r['sumAmt']).formatCurrency();
				$("#sumInst").text(r['sumInst']);
				$("#sumInst").formatCurrency();
				
				var detailList = r['detailList'];
				var tbody = $("#detailBody");
				var id;
				for ( var i in detailList) {
					var pd = detailList[i];
					var repaydate =pd.lbtPtpFprojInf.repayDate;
					if (repaydate != null){
					//	repaydate = $.format.date(new Date(repaydate), "yyyy-MM-dd");
					}else {
						repaydate ="审核中";
					}
					id = pd.lbtPtpFprojInstDetail.projNo;
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
									.append($("<a/>").addClass("btXq").attr("target", "_blank").attr("href", "common-detail.jsp?id=" + id).html("详情"))));
				}

			});
			
			$.getJSON("acct/acctLocalQuery")
			.success(function(r) {
				$("#balance").text(r['balance'] ? r['balance'] : "0").formatCurrency();
				$("#freezeAmt").text(r['frzBalance'] ? r['frzBalance'] : "0").formatCurrency();
				var cardType = r['cardType'];

				var cardNo =r['cardNo']; 	
			 	if(cardType == "other"){
			  		$("#yuan").append($("<a/>").attr("href", "###").attr("class","btHc").text("资金划出"));
	
			  	}

				if(cardNo == null){
			  		$("#addCard").attr("class","addCard").append($("<a/>").attr("href", "user-bank2.jsp")
			  				.append($("<span/>").text("添加银行卡"))
			  				).append($("</p>").text("畅通安全     多重密码保护"));
			  		alert("为了保证顺利进行投资，请立即绑定银行卡！");
			  	}else{
			  		$("#addCard").attr("class","addCardc").append($("<a/>")
			  				.append($("<span/>"))
			  				).append($("</p>").text(cardNo.substring(0, 6) + "********" + cardNo.substring(14, 18)));
			  	}
			});
			
			
			$("#invest_form").validate({
			 
				submitHandler:function(form){
					if (myPass.CODEPASS) {
						$(form).ajaxSubmit(function(r){
							//$("#submit",this).arr("disabled","disabled");
							if (r.result === 'success') {
				  	    			window.location.href="success.jsp?s4";
							}else {
								$("#retunresult").text(r.result);
							}
						});
					}else {
						alert("请检查验证码是否正确填写！");
					}
				}
			});

			var width = window.screen.width;
			var height = document.body.clientHeight;
			var height2 = window.screen.height;
			var top = (height2 - $("#invest_form table").height()) / 2;
			var left = (width - $("#invest_form table").width()) / 2;
			$("#invest_form table").css("left", left + "px");
			$("#invest_form table").css("top", top + "px");
			$(".btHc").live("click",function(e){
				e.preventDefault();
				$.getJSON("security/current-user")
				.success(function(r){
					if (r.name !== "") {						
						e.preventDefault();
						$("#hiddenArea").css("width", width + "px");
						$("#hiddenArea").css("height", document.body.clientHeight + "px");
						$("#hiddenArea").css("display", "block");
						$("#transPass").val("");
						$("#payAmt").val("");
						$("#code").val("");
						$.post("operator/usrNameQuery", {usrName : r.name})
						.success(function(res) {
							$("#mobile").val(res.arrayList[0].mobile);
						});		
					}else {					
						window.location.href="login.jsp";
					}
				});
			});
			
			$("#closeX").click(function(e) {
				e.preventDefault();
				$("#hiddenArea").css("display", "none");
				$("#transPass").val("");
				$("#payAmt").val("");
			});
			$("#loadMore").click(function(e) {
				e.preventDefault();
				if (myPage.PAGE_NOW < myPage.PAGE_COUNT) {
					myPage.PAGE_NOW += 1;
					loadMore();
				}else {	
					$(this).html("没有更早的记录了！");
				}
			}); 
			
			$("#loadAcct").click(function(e) {
				e.preventDefault();
				$.getJSON("acct/acctBankQuery/")
				.success(function(r) {
					if(r['bankErrMsg'] !=null && r['bankErrMsg'] !="" ){
						alert(r['bankErrMsg']);
					}else{
					$("#balance").text(r['balance'] ? r['balance'] : "0").formatCurrency();
					$("#freezeAmt").text(r['frzBalance'] ? r['frzBalance'] : "0").formatCurrency();
					}
				});
			}); 
			
			$("#getCode").click(function(e) {
				e.preventDefault();
				$("#getCode").attr("disabled",true);
	 			myPass.CODEPASS = 1;
	 			countDown("jumpTo", "jumpTo1", 60, '###');
	 			setTimeout(function() {
	 				hidej("getCode");
	 			}, 60000);
				$.getJSON("smsSend/sendIdentifyCd", {
						mobileNumber : $("#mobile").val(),
						smsType : "AmtDraw"
					}, function(res) {
					 
					});
			});
			
		});
		
		
	</script>
	</jsp:attribute>
	<jsp:body>
		 <div class="mainRight">
      	<div class="user_right">
      	<div class="box">
        <ul class="boxUL">
          <div class="myInfo">
            <div class="myInfoLeft">
              <div class="info info1">
                <ul>
                 
            
                  <h5>农商行账户余额</h5>
                  <h2 id="balance"></h2>
                  <h5>元</h5>
                 <a id="loadAcct" href=""> [查询余额]</a> 
                </ul>
              </div>
              <div class="info info2">
                <ul >
                  <h5>农商行账户冻结余额</h5>
                  <h3 id="freezeAmt"></h3>
                   <h5 >元</h5>
                  <h5 id="yuan" ></h5>
                  <a id="touzi" href="project-query.jsp" class="btTz">投资</a>
                </ul>
              </div>
              <div class="info info3">
                <ul>
                  <li class="on"><b class="icon_aq"></b>安全等级 高</li>
                  <li class="on"><b class="icon_rz"></b>已认证</li>
                  <li class="on"><b class="icon_yx"></b>已绑定</li>
                  <li class="on"><b class="icon_sj"></b>已绑定</li>
                </ul>
              </div>
            </div>
            <div class="myInfoRight">
              <div  id = "addCard" > 
                
              </div>
            </div>
          </div>
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
  </ul>
</div>
		      
			 
			 
			     
		  </div>
		  </div>
	<div id="hiddenArea">
	<!-- ------------投资详细------------------ -->
		<form id="invest_form" action="acct/withDrawing" method="POST">
				<table>
					<tr>
						<td class="required">*</td><td>请输入划出金额(元)</td>
						<td><input name="payAmt" id="payAmt" type="text"></td>
					</tr>
					<tr>
						<td class="required">*</td><td>输入交易密码</td>
						<td><input name="transPass" id="transPass" type="password"></td>
					</tr>
					<tr>
						<td class="required">*</td><td>验证码</td>
						<td>
							<input name="code" id="code" type="text" maxlength="8">
							<button id="getCode">获取验证码</button>
							<label id="codeTip"></label>
							<input type="hidden" name="mobile" id="mobile" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><label id="jumpTo"></label><label id="jumpTo1"></label></td>
					</tr>
					  <tr>
						<td></td><td></td> <td id="retunresult" align="left"></td> 
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button id="submit">确认划出</button>
							<button id="closeX">关闭</button>
						</td>
					</tr>
				</table>
			</form>
	</div>	
	</jsp:body>
</lbt:user-layout>


