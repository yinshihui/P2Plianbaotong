<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>

<lbt:main-layout title="联保通首页">
	<jsp:attribute name="header">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/progress.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/res/js/jquery-1.4.2.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/res/js/jquery.slide.js" type="text/javascript"></script>
		
	
		<script type="text/javascript">
		/*滚动*/
		var jq=jQuery.noConflict();
		jq(function(){
		jq("#bannerbg").Slide({//banner
			effect:"fade",
			speed:1000,
			timer:5000
		});
		}); 
		
		    
		$(function(){
			
			
			
			
			$.getJSON("index/project", function(resp){
				//项目信息
				var projs = resp['list'];
				var len = (projs.length > 10) ? 10 : projs.length;
				//投资总金额
				var sumInvestAmt = resp['sumInvestAmt'];
				//还款总金额
				var sumRepayAmt = resp['sumRepayAmt'];
				
			$("#sumInvestAmt").html(sumInvestAmt);
			$("#sumInvestAmt").formatCurrency();
			$("#sumRepayAmt").html(sumRepayAmt);	
			$("#sumRepayAmt").formatCurrency();
			for (var i = 0 ; i < len; i += 1) {
				var proj = projs[i];
				
				var investImageSrc ="res/images/btn_blue.png";
				var imageHref ="project-detail.jsp?id="+proj.lbtPtpFprojInf.projNo;
				if (proj.investFlag == "N"){
					 investImageSrc ="res/images/btn_grey.png";
					 proj.progressInvest = 100;
					 imageHref ="common-detail.jsp?id="+proj.lbtPtpFprojInf.projNo;
					 
				}
				 
				$("#content_left")
					.append($("<div/>").addClass("left_list")
						.append($("<div/>").addClass("left_listtop")
							.append($("<div/>").addClass("left_listtop1")
								.append($("<img/>").attr("src", "res/images/fang.png"))
								.append($("<a />").attr("href", "common-detail.jsp?id="+proj.lbtPtpFprojInf.projNo)
								.append(proj.lbtPtpFprojInf.projName))
								.append($("<a />").attr("href", "#").addClass("aHref")
									.append($("<img/>").attr("src", "res/images/tai1.gif"))
									.append($("<div />").addClass("imgTitle").text("")))
								.append($("<br/>"))
								.append($("<span/>").html("项目发行规模："+proj.lbtPtpFprojInf.demandAmt+"万元	" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +"投资期限："+proj.lbtPtpFprodInf.periods+"月")))
							.append($("<div/>").addClass("left_listtop2")
								.append(proj.lbtPtpFprojInf.annualYield*100+"%")
								.append($("<br/>"))
								.append($("<span/>").append('年化收益率')))
							.append($("<div/>").addClass("left_listtop3")
								.append($("<img/>").attr("src", "res/images/co_line.png").attr("height","49").attr("width","4"))
								.append($("<a/>").css("padding-left", "20px").attr("href", imageHref)
									.append($("<img/>").attr("src", investImageSrc))))
									.append($("<div/>").addClass("left_listbottom")
										.append($("<div />").addClass("left_listdom1").css("margin-top", "11px")
												.append($("<label />").html("进度：").css("float", "left"))
												.append(($("<div />").addClass("progress_main"))
													.append($("<div />").addClass("progress_actual").css("width", proj.progressInvest + "%")))
										.append($("<label />").html("&nbsp;&nbsp;&nbsp;"+proj.progressInvest+"%").addClass("percent")) )
										.append($("<div/>").addClass("left_listdom2")
												.html("开始时间 : <span>"+$.format.date(new Date(proj.lbtPtpFprojInf.instStartTime), "yyyy-MM-dd HH:mm:ss") +"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间 : <span>"+ $.format.date(new Date(proj.lbtPtpFprojInf.instEndTime), "yyyy-MM-dd HH:mm:ss") +"</span>")))
												)
					);
			}
				for (var i = 0, len = projs.length; i < len; i += 1) {
					var aHref, imgTitle;
					aHref = document.getElementsByClassName("aHref")[i];
					imgTitle = document.getElementsByClassName("imgTitle")[i];
					aHref.onmouseover = function() {
						imgTitle.style.display = "block";
					};
					aHref.onmouseout = function() {
						imgTitle.style.display = "none";
					};
				}
			 
			});
			
			$("#openhome").live("click",function(e){
				 
				 e.preventDefault();
				 
				$.getJSON("acct/redirectHref", function(resp){
					 
					window.location.href=resp.returnUrl;
					
				});
				
				
			});
			 
		});
		</script>
		<style type="text/css">
		#introduction tbody .first{
		background-color: red;
		}
		.percent {
			color:#FF6600;
		}
		.imgTitle {
			background-color:#FFE9AD;
			border:1px solid orange;
			color:#7B7B7B;
			position:relative;
			padding:0 5px;
			height:auto;
			width:auto;
			display:none;
		}
		.aHref {
			position:absolute;
		}
		#sub_01 {
			position:absolute;
			display:none;
		}
		a:hover {
			text-decoration:underline;
		}
		</style>
	</jsp:attribute>
	<jsp:body>
 

<div class="contentimg">
  	<div class="banner_center">
        <div class="register">
          <div class="register01"><img src="res/images/register_01.jpg" /></div>
           <div id="registin"><!-- <a href="register.jsp"><img src="res/images/register_button.jpg" width="248" height="60" /></a> --></div>
          <div id ="lo1" class="login_1" >已有账号？&nbsp;<a href="login.jsp">立即登录</a></div>
          <div id ="lo2" class="login_1">欢迎您登录联保通系统！ </div>
          <div class="tel"><img src="res/images/tel.jpg" style="margin-top:-5px; margin-right:5px;" />023-63000666</div>
      	</div>
      	<section id="bannerbg">
                <ul class="bannerc">
                    <li class="banner1" style="z-index: 1; opacity: 1;">
                        <div class="banner">
                            <a href="index.jsp"><img src="res/images/loginbg.jpg"></a>
                            <a href="javascript:;" class="video_ban" id="video_ban"></a>
                        </div>
                    </li>
                    <li class="banner2" style="z-index: 0; opacity: 0;">
                        <div class="banner">
                            <a href="index.jsp"><img src="res/images/loginbg_2.jpg"></a>
                        </div>
                    </li>
                </ul>
                
    		</section>
	</div>
</div>


<div class="conter">
 <div id="content_left" class="conter_left">
  <div class="step">
    <div class="step1"><span class="tit">注册/登录</span><br />
      <span class="list">注册成为会员</span><br />
      <span class="list">登录投融资平台</span></div>
    <div class="step2"><span class="tit">选择项目投资</span><br />
      <span class="list">选择您满意的项目</span><br />
      <span class="list">填写资料绑定银行卡</span>
      <br /><span class="list">完成投资</span></div>
    <div class="step3"><span class="tit">查看投资记录</span><br />
      <span class="list">查看我的投资记录</span><br />
      <span class="list">查看回收本息记录</span></div>
  </div>
  <div class="cut">
   <ul>
    <li class="bt01">推荐投资项目</li>
    <a href="project-query.jsp"><li class="bt02" >更多投资项目</li></a>
   </ul>
  </div>
   </div>
 <div class="conter_right">
 <div class="conter_rightlist">
 <div class="conter_righttit"><span class="conter_righttit_left">交易统计</span></div>
 <div class="conter_rightli"><span class="text">总成交金额（元 )</span><br/><span class="num" id="sumInvestAmt"></span><br/><span class="text">累计还款金额（元 )</span><br/><span class="num" id="sumRepayAmt"></span></div>
 </div>
 <div class="conter_rightlist">
 <div class="conter_righttit"><span class="conter_righttit_left">公告</span><span class="conter_righttit_right"><a href="#">更多>></a></span></div>
 <div class="conter_rightli">
 <ul>
	 <li>热烈庆祝联保通上线！</li>
     <li></li>
 </ul>
 </div>
 </div>
 
 <div class="conter_rightlist">
 <div class="conter_righttit"><span class="conter_righttit_left">新闻</span><span class="conter_righttit_right"><a href="#">更多>></a></span></div>
 <div class="conter_rightli">
 <ul>
	 <li><a href="${pageContext.request.contextPath}/staticNews-01.jsp">互联网金融首度写入政府工作报告</a></li>
	 <li><a href="${pageContext.request.contextPath}/staticNews-02.jsp">央行鼓励互联网金融创新</a></li>
	 <li><a href="${pageContext.request.contextPath}/staticNews-04.jsp">重庆市金融办领导赴公司调研</a></li>
 </ul>
 </div>
 </div>
 <div class="conter_rightlist">
 <div class="conter_righttit"><span class="conter_righttit_left">常见问题</span><span class="conter_righttit_right"><a href="#">更多>></a></span></div>
 <div class="conter_rightli">
 <ul>
	 <li><a href="help.jsp#q1">什么是联保通互联网金融平台？</a></li>
	 <li><a href="help.jsp#q2">电子合同有效吗？</a></li>
	 <li><a href="help.jsp#q3">我账户里的资金安全吗？</a></li>
	 <li><a href="help.jsp#q4">什么是投资接收人？</a></li>
	 <li><a href="help.jsp#q5">绑定的他行卡如何进行购买产品？</a></li>
 </ul>
 </div>
 </div>
 <div class="conter_rightlist">
 <div></div>
 
 </div>
 </div>
</div>
	</jsp:body>
</lbt:main-layout>