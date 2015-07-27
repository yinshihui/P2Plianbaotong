<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:main-layout title="项目详细">
<jsp:attribute name="header">
<script src="${pageContext.request.contextPath}/res/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery-dateFormat.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery.form.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/res/js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/progress.css" type="text/css" />

	<style>
	#captchaImage {
		width:202px;
		height:42px;
	}
#freturnbtn,
#downreportbn,
#downreportbn2,
#fcheckbtn{
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
		width:100px!important;
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
	z-index:200;
}
#hiddenArea2 {
	display:none;
	background:rgb(0,0,0);
	background-color:rgba(0,0,0,0.5);
	position:absolute;
	top:0;
}
#showImg {
	position:absolute;
	background-color:white;
	height:auto;
	width:auto;
}
#showImg img {
	height:500px;
	width:500px;
	transition:1s;
	-o-transition:1s;
	-moz-transition:1s;
	-webkit-transition:1s;
}
#invest_form table {
	border-radius:10px;
	border:5px solid rgb(252, 103, 0);
	position:relative;
	width:520px;
	height:250px;
	background-color:white;
	padding:40px;
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
#projDetailInfo1,
#projDetailInfo2 {
	float:left;
	font-size:16px;
	line-height:30px;
	padding:10px 10px 5px;
	width:461px;
}
#submit:hover,
#closeX:hover {
	background-color:rgb(0, 153, 255)!important;
}
</style>
<script type="text/javascript">
var loadCaptcha = function() {
	$("#captchaImage").attr("src", $.appurl("captcha/project?"+(new Date()).getTime()));
};
var refreshCaptcha = function() {
	$("#captcha").val("");
	loadCaptcha();
};
var investPay = function() {
	var imgNode = '<img alt="浏览器不支持gif" src="res/images/loading.gif" height="29" id="loadImg"/>';
	$('.loading').show();
	$.post("acct/investPay", {
  		projNo : $("#projNo").val(),
  		payAmt : $("#payAmt").val(),
  		transPass : $("#transPass").val(),
  		captcha : $("#captcha").val()
  	}).success(function(r){
  		var result = r['result'];		  	    	 
  		if (result === "code wrong") {
  			$("#retunresult").text("验证码错误");
  			refreshCaptcha();
  			$('.loading').hide();
  		}else if (result === "success" ){
  			$("#submit").html(imgNode);
  			window.location.href="project-success.jsp";
  		}else {
  			$("#retunresult").text(result);
  			refreshCaptcha();
  			$('.loading').hide();
  		}    		 
	}).error(function(err) {
		alert(err);
		refreshCaptcha();
	});
};
function show_time( endtime ,systime)
  
{    
	var myDate = new Date(systime);
	this.year=myDate.getFullYear(); //获取完整的年份(4位,1970-????)
	this.month=myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
	this.date=myDate.getDate(); //获取当前日(1-31)
	 //myDate.getTime();获取当前时间(从1970.1.1开始的毫秒数)
	this.hour=myDate.getHours(); //获取当前小时数(0-23)
	this.minute=myDate.getMinutes(); //获取当前分钟数(0-59)
	this.second=myDate.getSeconds(); //获取当前秒数(0-59)
	this.Msecond=myDate.getMilliseconds(); //获取当前毫秒数(0-999)
	//myDate.toLocaleString( ); 获取日期与时间

	var time_now_server,time_now_client,time_end,time_server_client,timerID;
  // alert(endtime);
	//time_end=new Date("2014/4/26 15:20:00" );//结束的时间
	time_end=new Date(endtime);//结束的时间

	time_end=time_end.getTime();

	time_now_server=new Date(this.year+'/'+this.month+'/'+this.date+' '+this.hour+':'+this.minute+':'+this.second);//开始的时间
	
	time_now_server=time_now_server.getTime();

	 

	time_now_client=new Date();

	time_now_client=time_now_client.getTime();

	 

	time_server_client=time_now_server-time_now_client;


	 

 var timer = document.getElementById("timer");

 if(!timer){

 return ;

 }

  timer.innerHTML ='<a id="invest" href = "javascript:;"><img src="res/images/xuqiu_24.jpg"/></a>';

 

 var time_now,time_distance,str_time;

 var int_day,int_hour,int_minute,int_second;

 var time_now=new Date();

 time_now=time_now.getTime()+time_server_client;

 time_distance=time_end-time_now;

 if(time_distance>0)

 {

  int_day=Math.floor(time_distance/86400000)

  time_distance-=int_day*86400000;

  int_hour=Math.floor(time_distance/3600000)

  time_distance-=int_hour*3600000;

  int_minute=Math.floor(time_distance/60000)

  time_distance-=int_minute*60000;
  // int_second=Math.floor(time_distance/1000)
  int_second=Math.ceil(time_distance/1000)

 

  if(int_hour<10)

   int_hour="0"+int_hour;

  if(int_minute<10)

   int_minute="0"+int_minute;

  if(int_second<10)

   int_second="0"+int_second;

  str_time="<span>"+int_day+"</span>"+"天"+"<span>"+int_hour+"</span>"+"小时"+"<span>"+int_minute+"</span>"+"分钟"+"<span>"+int_second+"</span>"+"秒";

  timer.innerHTML=str_time;

  setTimeout(function() {	  
	  show_time(endtime,systime + 1000);
  }, 1000);

 }

 else

 {
 
   timer.innerHTML =timer.innerHTML;

 }

}

function checkTransStatus(stat) {
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
function checkNull(str) {
	if (str === null) {
		str = "无";
	}else {
		;
	}
	return str;
};
function numToCny(num){     
    var capUnit = ['万','亿','万','圆',''];     
    var capDigit = { 2:['角','分',''], 4:['仟','佰','拾','']};     
    var capNum=['零','壹','贰','叁','肆','伍','陆','柒','捌','玖'];     
    if (((num.toString()).indexOf('.') > 16)||(isNaN(num)))      
        return '';     
    num = ((Math.round(num*100)).toString()).split('.');  
 num = (num[0]).substring(0, (num[0]).length-2)+'.'+ (num[0]).substring((num[0]).length-2,(num[0]).length);  
    num =((Math.pow(10,19-num.length)).toString()).substring(1)+num;     
    var i,ret,j,nodeNum,k,subret,len,subChr,CurChr=[];     
    for (i=0,ret='';i<5;i++,j=i*4+Math.floor(i/4)){     
        nodeNum=num.substring(j,j+4);     
        for(k=0,subret='',len=nodeNum.length;((k<len) && (parseInt(nodeNum.substring(k),10)!=0));k++){     
            CurChr[k%2] = capNum[nodeNum.charAt(k)]+((nodeNum.charAt(k)==0)?'':capDigit[len][k]);     
            if (!((CurChr[0]==CurChr[1]) && (CurChr[0]==capNum[0])))     
                if(!((CurChr[k%2] == capNum[0]) && (subret=='') && (ret=='')))     
                    subret += CurChr[k%2];     
        }     
        subChr = subret + ((subret=='')?'':capUnit[i]);     
        if(!((subChr == capNum[0]) && (ret=='')))     
            ret += subChr;     
    }     
    ret=(ret=='')? capNum[0]+capUnit[3]: ret;    
    if (num % 10000 !== 0) {
    	return ret + "整";
    }
    return ret + "圆整";     
}   
$(function(){
	loadCaptcha();
	$.getJSON("project/detail/" + $.urlParam("id"))
		.success(function(pr){
			var projDetail = pr['projd'];
			var imgs = pr['imgs'];
			var r = projDetail.lbtPtpFprodInf;
			var j = projDetail.lbtPtpFprojInf;
			var date = pr.date;
			var repayInfo = "NULL";
			
			if(r.repayType == 'b')
				repayInfo = "按月本息";
			else if(r.repayType == 'c')
				repayInfo = "按月本金";
			else if(r.repayType == 'a')
				repayInfo = "利随本清";
			
			//通过添加href属性控制页面跳转
			//$("#invest").attr("href", "?id=" + j.projNo);
			//项目名称
			$("#xuqiu_top_tittle").html("<h3>" + j.projName + "</h3>");
			//担保机构名称
			$("#tanchu").html(projDetail.compName);
			//年化收益率
			$("#annualYield").html(j.annualYield*100 + "%");
			//需求金额
			$("#demandAmt").html(j.demandAmt);
			//剩余金额
			$("#alsoNeedAmt").html(projDetail.alsoNeedAmt);
			//TODO
			//最低金额
			$("#minInvestment").html(j.minInvestment);
			//投资期限
			$("#periods").html(r.periods);
			//投资进度
			$("#progressInvest").html(projDetail.progressInvest+"%");
			$(".huge_progress_actual").css("width", projDetail.progressInvest+"%");
			//起投时间
			$("#instStartTime").html($.format.date(new Date(j.instStartTime), "yyyy-MM-dd HH:mm:ss"));
			$("#instStartTime2").val(j.instStartTime);
			//截止时间
			$("#instEndTime").html($.format.date(new Date(j.instEndTime), "yyyy-MM-dd HH:mm:ss"));
			
			//详细信息 
			$("#projDetailInfo1")
			.html("项目编号: " + j.projNo + "<br>"
				 +"项目名: " + j.projName + "<br>"
				 +"投资接受人:" + projDetail.usrName + "<br>"// TODO
				 +"项目用途: " + j.purposes + "<br>"
				 +"起投时间: " + $.format.date(new Date(j.instStartTime), "yyyy-MM-dd HH:mm:ss") + "<br>"
				 +"截止时间: " + $.format.date(new Date(j.instEndTime), "yyyy-MM-dd HH:mm:ss")+ "<br>"
				
			);
			$("#projDetailInfo2")
			.html("最低需求额: " + checkNull(j.minDemandAmt) + "万元<br>"
					 +"担保函名称: " + checkNull(j.guaLetterName) + "<br>"
					 +"担保承诺函名称:" + checkNull(j.comGuaLetterName) + "<br>"
					 +"合同名称: " + checkNull(j.contractName) + "<br>"
					 +"状态: " + checkStatus(j.projStatus) + "<br>"
					 +"兑付方式: " + repayInfo+ "<br>"
			);
			
			//项目信息
			$("#projPurpose").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (j.projIntroduce === null ? '无' : j.projIntroduce));
			
			//担保信息
			$("#issuer").html("<b>担保机构: </b>" + projDetail.compName);
 
			var imgcontent = $("#List1");
			for(var img in imgs){
				
				imgcontent.append('<div class="pic"><a><img src='+  img +'/></a></div>');
			}
			//show_time($.format.date(new Date(j.instStartTime), "yyyy/MM/dd HH:mm:ss"),new Date(sysDate));
			 show_time($.format.date(new Date(j.instStartTime), "yyyy/MM/dd HH:mm:ss"), date);
			 
			 $("#downreportbn").click(function(e){
					e.preventDefault();
					window.open("project/downlodfileA/"+j.projNo);			
				});
			 
			 $("#freturnbtn").click(function(e){
					e.preventDefault();
					window.location.href="index.jsp";				
				});
		});	
	
	$.getJSON("project/comProjDetail/" + $.urlParam("id"))
	.success(function(res){
		var detailList = res['detailList'];
		 
		for ( var i in detailList) {
			var pd = detailList[i];
			var dt = pd.lbtPtpFprojInstDetail;
			var  usrName = pd.usrName;
					$("#investc").append($("<tr/>").attr("class","even")
							.append($("<td/>").html(dt.instNo))
							.append($("<td/>").html(usrName))
							.append($("<td/>").html(dt.instAmt).formatCurrency())
							.append($("<td/>").html($.format.date(new Date(dt.instTime), "yyyy-MM-dd HH:mm:ss")))
							.append($("<td/>").html(checkTransStatus(dt.instStatus)))
		 
			);
		}		
	});
	
	
	
	var projectNo = $.urlParam("id");
	$("#projNo").val(projectNo); 
  	$("#submit").click(function(e){
 		e.preventDefault();
 		var minInvest = +$("#minInvestment").html();
 		var alsoNeedAmt = +$("#alsoNeedAmt").html();
 		if (alsoNeedAmt <= minInvest) {
 			investPay();
 		}else {
 			if ($("#payAmt").val() >= minInvest) {
	  			if ($("#payAmt").val() <= alsoNeedAmt) {
	  				investPay();
	  			}else {
	  				$("#payAmt").val("");
	  				alert("抱歉，您的投资额大于项目剩余金额！");
	  			}
	  		}else {
	  			$("#payAmt").val("");
	  			alert("抱歉，您的投资额未达到最低金额要求！");
	  			 
	  		}	  		
 		}	
 	 });
  	
	var width = window.screen.width;
	var height = 1348;
	var height2 = window.screen.height;
	var top = (height2 - 412) / 2;
	var left = (width - $("#invest_form table").width()) / 2;
	$("#hiddenArea2").css("width", width + "px");
	$("#hiddenArea2").css("height", height + "px");
	$("#invest_form table").css("left", left + "px");
	$("#invest_form table").css("top", top + "px");
	$("#invest").live("click",function()  {
		$.getJSON("security/curr")
		.success(function(r){
		 
			 if (r.name == "") {
				 window.location.href="login.jsp";
			 }else if(r.role != "Investor"){
					alert("不是投资人，不允许投资！");
				
				}else{
					//e.preventDefault();
					var minInvest = +$("#minInvestment").html();
 					var alsoNeedAmt = +$("#alsoNeedAmt").html();
					$("#hiddenArea").css("width", width + "px");
					$("#hiddenArea").css("height", height + "px");
					$("#hiddenArea").css("display", "block");
					$("#transPass").val("");
					$("#payAmt").val("");
					$("#retunresult").val("");
					if (alsoNeedAmt <= minInvest) {
			 			$("#payAmt").val(alsoNeedAmt).attr("readonly", true);
			 		}else {
			 			$("#payAmt").attr("readonly", false);
			 		} 		
				}
		});
	});
	$("#closeX").click(function(e) {
		e.preventDefault();
		$("#hiddenArea").css("display", "none");
		$("#transPass").val("");
		$("#payAmt2").val("");
		$("#moneyTip").html("");
		$("#retunresult").text("");
		$("#captcha").val("");
	});
	$("#captchaImage").click(function(e){
		loadCaptcha();
	});
	$(".picImg").click(function(e) {
		e.preventDefault();
		$("#hiddenArea2").css("display", "block");
		$("#showImg").css("top", (height - 800) + "px");
		$("#showImg").css("left", (width - 500) / 2 + "px");
		$("#showImg img").attr("src", $(this).attr("src"));	
	});
	$("#hiddenArea2").click(function() {
		$(this).css("display", "none");
	});
	$("#payAmt").blur(function() {
		var proVal = $(this).val(),
			  len =proVal.split(".")[1] ? proVal.split(".")[1].length : 0,
			  value = proVal * 10000;
		if (value) {
			if (len >= 2) {
				alert("对不起，请精确到千位！");
				$(this).val("");
				$("#moneyTip").html("");
			}else {
				$("#moneyTip").html(numToCny(value));
			}			
		}else {
			$("#moneyTip").html("");
		}
	});
});	

</script>
	</jsp:attribute>
	<jsp:body>
		<div class="main">
	<div id="content"></div>
	<!-- content here -->
	<div class="conter_2_bg" id="dd">
	<div class="xuqiu_top">
		<div class="xuqiu_top_bian"><img src="res/images/xuqiu_03.jpg" /></div>
      	<div class="xuqiu_top_main">
            <div class="xuqiu_top_tittle" id="xuqiu_top_tittle">
<!--               <h3>[渝台201400109]公司经营需求590万</h3> -->
              <a href="#" style="position:absolute;" onmouseover="document.getElementById('tanchu').style.display='';" onmouseout="document.getElementById('tanchu').style.display='none';"><img src="res/images/xuqiu_02.jpg" />
              <div class="tanchu_style" id="tanchu" style="display:none;"></div></a>
            </div>
            <div class="xuqiu_top_center">
            	<ul>
               	  	<li>
                  		<dt><img src="res/images/xuqiu_08.jpg" /><span>年化收益率</span></dt>
               	  		<dd><span id="annualYield"></span></dd>
                	</li>
                    <li>
                  		<dt><img src="res/images/xuqiu_10.jpg" /><span>需求金额</span></dt>
               	  		<dd><span id="demandAmt"></span>万元</dd>
                	</li>
                    <li>
                  		<dt><img src="res/images/xuqiu_12.jpg" /><span>剩余金额</span></dt>
               	  		<dd><span id="alsoNeedAmt" > </span>万元</dd>
                	</li>
                    <li>
                  		<dt><img src="res/images/xuqiu_14.jpg" /><span>最低投资</span></dt>
               	  		<dd><span id="minInvestment"></span>万元</dd>
                	</li>
                    <li>
                  		<dt><img src="res/images/xuqiu_08.jpg" /><span>投资期限</span></dt>
               	  		<dd><span id="periods"></span>月</dd>
                	</li>
                </ul>
        	</div>
        	<div class="xuqiu_top_bottom">
            	<ul>
                	<li><em><img src="res/images/xuqiu_30.jpg" /></em><dd>投资进度</dd><dt class="fontsize_24" id="progressInvest"> </dt><dt><div class="huge_progress_main"><div class="huge_progress_actual"></div></div></dt></li>
                    <li><em><img src="res/images/xuqiu_35.jpg" /></em><dd>起投时间</dd><dt class="fontsize_16" id="instStartTime"></dt><dd>截止时间</dd><dt class="fontsize_16" id="instEndTime"></dt></li>
                </ul>
            </div>
            <input type="hidden" id="instStartTime2" />
            <div class="xuqiu_top_button"  id="timer" ><!-- <a id="invest" href = "javascript:;" ><img src="res/images/xuqiu_24.jpg"/></a> --></div>
      	</div>
        <div class="xuqiu_top_bian"><img src="res/images/xuqiu_07.jpg"/></div>
    </div>
    <div class="conter" >
    	<div class="xuqiu_list">
            <div class="xuqiu_tittle"><h3>详细信息</h3></div>
            <div id="projDetailInfo1" class="xuqiu_main">
            	<!-- 详细信息 -->
        	</div>
        	<div id="projDetailInfo2" class="xuqiu_main">
            	<!-- 详细信息 -->
        	</div>
    	</div>
        <div class="xuqiu_list">
            <div class="xuqiu_tittle"><h3>项目信息</h3></div>
            <div id = "projPurpose" class="xuqiu_main">
<!--             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上海海上科技信息技术有限公司成立于2000年，现在要开展大型迪士尼游乐场的建立和随包，现在需要资金278764元，动员全国各力量一起完成中不这个人能的事，如果有不这地里中，我人胶人们我们要不断的坚持和不断的努力，才能走出这个好的坏的什么的，那么我们为什么还不吸力量的同时，抓住两点，第一点主是要人民自己的好朋友，再上班一个台阶，更高一点的通行。勇和的中不中是不是我们的一切都可以再来及中不我们的同学同事一起样的努力奋着，才能把我们的祖国中家更努美丽的强大。 -->

        	</div>
    	</div>
    	<div >
            <div class="xuqiu_tittle"><h3>投资明细</h3></div>
            <div  class="xuqiu_main">
        	</div>
       <div class="box" id = "investlist">
        <ul class="boxUL">
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab tab1" align="center">
            <tr>
              <th>投资流水号
                </td>
              <th>投资人
                </td>
              <th>投资金额（元）
                </td>
              <th>交易投资时间
                </td>
              <th>交易状态
                </td>
              
            </tr>
            <tbody id="investc" >
            			 
            </tbody>
            
          </table>
         
        </ul>
      </div>
    	</div>
        <div class="xuqiu_list">
            <div class="xuqiu_tittle"><h3>担保信息</h3></div>
            <div class="xuqiu_main_tittle" id="issuer"></div>
             <div id="fcheck" align="center">
    		<button id="downreportbn">下载承诺函</button>
    		 
    		<button id="freturnbtn">返回</button>
    		</div>
        	 
    	</div>
    </div>
</div>
</div>
	<div id="hiddenArea">
	<!-- ------------投资详细------------------ -->
		<form id="invest_form" >
					<div ></div>	
				<table>
					<tr>
						<td ><input name="projNo" id="projNo"  type="hidden"></td><td ></td>
					</tr>
					<!-- <tr>
						<td class="required">*</td><td>项目编号</td>
						<td><input name="projNo" id="projNo" disabled="disabled" ></td>
					</tr> -->
					<tr>
						<td class="required">*</td><td>请输入投资金额（万元）</td>
						<td>
							<input name="payAmt" id="payAmt" type="text" maxLength=5>
						</td>
					</tr>
					<tr>
						<td></td><td></td>
						<td><label id="moneyTip"></label></td>
					</tr>
					<!-- <tr>
						<td class="required">*</td><td>请确认投资金额</td>
						<td><input name="payAmt2" id="payAmt2" type="text"></td>
					</tr> -->
					 
					<tr>
						<td class="required">*</td><td>输入交易密码</td>
						<td><input name="transPass" id="transPass" type="password"></td>
					</tr>
					<tr>
						<td class="required">*</td><td>验证码</td>
						<td><input type="text" class="input" id="captcha" name="captcha" maxlength="6" style="float:left;"/></td>
					</tr>
					<tr>
						<td></td><td></td>
						<td><img id="captchaImage"  /></td>
					</tr>
					 <tr>
						<td></td><td></td> <td id="retunresult" align="left"></td> 
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button id="submit">确认投资</button>		
							<button id="closeX">关闭</button>
						</td>
					</tr>
				</table>
			</form>
	</div>
	<div id="hiddenArea2">
		<div id="showImg">
			<img src="#" title=""/>
		</div>
	</div>
	<div class="loading" style="display:none;z-index:10001; position:absolute;top:220px;text-align:center;width:100%;">
	  <div style="width:230px; margin:0 auto; font-size:15px;color:#000;font-weight:bold; text-align:center;font-family:'微软雅黑';background:#fff;border:5px solid #888888;padding:20px;border-radius:10px;-webkit-border-radius: 15px;-moz-border-radius: 15px;">
	    <img src="res/images/loading.gif" align="absmiddle"><br><br>
		正在处理中，请稍后...
		 <a href="###" style="color:#ff6600;font-weight:bold; font-size:15px;" onclick="closeWindow()">点击返回</a> 
	  </div>
	</div>
	</jsp:body>
</lbt:main-layout>

 