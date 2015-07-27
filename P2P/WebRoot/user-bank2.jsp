<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<%--使用lbt:user-layout或lbt:main-layout选择页面布局 --%>
<lbt:user-layout title="绑定银行卡">
	<jsp:attribute name="header">
	<%--在这里，header属性中加入页面脚本、样式等位于最终页面<header>标签中的内容 --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/user-bank2.css" type="text/css" />

	<script type="text/javascript">     
function countDown(secs,surl){     
//alert(surl);     
$('#jumpTo').html(secs);
$('#jumpTo1').html("秒后重新发送。");

if(--secs>0){     
     setTimeout("countDown("+secs+",'"+surl+"')",1000);     
     }     
else{       
     location.href=surl;   
     $('#jumpTo').html("");
     $('#jumpTo1').html("");
     }     
}  

  
</script> 
	</jsp:attribute>
	<jsp:body>
<!--	<div class="main">
	会员注册
	<div>1.用户注册    2.发送激活邮件     3.用户激活      4.实名认证     <label class="required">5.绑定银行信息</label>     6.注册成功</div>
 	<form id="card">
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>本次绑卡银行账户名：</td>
					<td><input type="text" name="bankCstName" id="bankCstName" disabled="disabled" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>开户银行：</td>
					<td>
						<select id="bank">
							<option value="中国工商银行" selected>中国工商银行</option>
							<option value="中国农业银行">中国农业银行</option>
							<option value="中国银行">中国银行</option>
							<option value="中国人民银行">中国人民银行</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>开户所在地：</td>
					<td>
						<select id="bankLocal"> 
							<option>省份</option> 
						</select> 
						<select id="bankLocal2"> 
							<option>地级市</option> 
						</select> 
						<select id="bankLocal3"> 
							<option>市、县级市、县</option> 
						</select> 
					</td>
				</tr>
				<tr>
					<td>银行账号：</td>
					<td><input type="text" name="cardNo" id="cardNo" maxlength=19/></td>
				</tr>
				<tr>
					<td>
						<button id="agreeButton">确定</button>
						<button id="returnButton">返回</button>
					</td>
				</tr>
			</tbody>
		</table>
		注：为保证您的资金划转成功，该银行账号开户人必须为 <strong id="cstName"></strong>, 并且身份证号只能是您填写的
	</form> -->
	<div class="user_right">
        	<div class="user_right_tittle">
            	<ul>
                	<li><a id="nsCard" style="cursor:pointer;">绑定重庆农村商业银行卡</a></li>
                    <li><a id="otherCard" style="cursor:pointer;">绑定他行银行卡</a></li>
                </ul>
            </div>
            <form id="usrInfo">
            	<input type="hidden" name="usrName" id="usrName" />
            </form>
            <form id="card">
	            <div class="user_content_bg">
	            	<br /><br>
	           		
	            	<ul>
	                	<li><dt>本次绑卡银行账户名：</dt>
		                	<dd>
		                		<input type="text" class="text_230" name="bankCstName" id="bankCstName" disabled="disabled" readonly="readonly"/>
		                		<input type="hidden" class="text_230" name="cstName" id="cstName" />
		                	</dd>
	                	</li>
	                    <li class="otherBank">
	                    <dt>开户银行：</dt>
	                    	<dd>
	                    		<input type="text"  id ="showBank" class="text_230"  name="showBank"/>
	                    		<input type="hidden"  name="bank" id="bank"/>
	                    		<div id="showBankList">
	                    			<ul>
	                    				<!--  -->

	                    			</ul>
	                    		</div>
	                    		请至少输入4个汉字 
	                    	</dd>
	                    	 
	                    </li>
<!-- 	                    <li class="otherBank"><dt>开户所在地：</dt>
	                    	<dd>
		                    	<select class="select_100" name="bankLocal" id="bankLocal" >
			                      <option value="1">北京</option>
			                      <option value="2">上海</option>
			                    </select>
			                    <select class="select_165" name="bankLocal2" id="bankLocal2" >
			                      <option value="1">北京朝阳门支行</option>
			                      <option value="2">北京建国门支行</option>
			                    </select>
		                    </dd>
		                </li> -->
	                    <li><dt>银行账号：</dt>
	                    	<dd><input type="text" name="cardNo" id="cardNo" class="text_230" maxlength=19/></dd>
	                    </li>    
	                     <li><dt>身份证号：</dt>
	                    	<dd><input type="text" name="certNo" id="certNo" class="text_230" maxlength=18 /></dd>
	                    </li>    
	                   <!--  <li class="otherBank"><dt>身份证有效期：</dt>
	                    	<dd>
	                    		<input type="text" name="certExpDate" id="certExpDate" onclick="new Calendar().show(this);" class="text_230" maxlength=19/>
	                    		<input type="checkbox" name="longPeriod" id="longPeriod" />
	                    		<label>长期</label>
	                    	</dd>
	                    </li>  -->
	                    <li><dt>手机号：</dt>
	                    	<dd>
	                    		<input type="text" name="mobile" id="mobile" class="text_230" maxlength=11 disabled="disabled"/>
	                    		<input type="hidden" name="mobile2" id="mobile2" class="text_230" maxlength=11 />
	                    		<input name="" type="button" id="getCheckCode"  value="获取验证码"/> 
	                    		<input type="text" name="checkCode" id="checkCode" maxlength="6" style="width:50px;"/>
	                    		<input type="hidden" name="runningNumber" id="runningNumber" value=""/>
	                    		<input type="hidden" name="checkBank" id="checkBank" value="0"/>
                                <span id="jumpTo" style="display:none"></span><span id="jumpTo1" style="display:none"></span>                  
	                    	</dd>
	                    </li>
	                  <!--   <li class="otherBank"><dt>发证机关地区编码：</dt>
	                    	<dd><input type="text" name="certOrgCode" id="certOrgCode" class="text_230" maxlength=19/></dd>
	                    </li>    -->
<!-- 	                    <li class="otherBank"><dt>发证机关名称：</dt>
	                    	<dd><input type="text" name="certOrgName" id="certOrgName" class="text_230" maxlength=19/></dd>
	                    </li>   -->
	                </ul>
	                <div class="user_content_bottom"><input name="agreeChoice" id="agreeChoice" type="checkbox" value="" />已阅读并同意<a href="#" onclick="showWindow();" title="联保通电子商务交易转账服务条款">《联保通电子商务交易转账服务条款》</a></div>
	                <div class="user_content_button">
	                	<input name="" type="submit" id="agreeButton" class="button_yellow111" value="确&nbsp;定" />
<!-- 	                    <input name="" type="submit" id="returnButton" class="button_yellow111" value="返&nbsp;回" />
 -->	                </div>
	                <div class="user_content_zhu">
	             	   <span>注：</span>
                       您的银行卡一经绑定，暂不支持更换，请谨慎选卡！<br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为保证您的资金划转成功，请务必填写您本人的银行卡号及身份证等信息。<!-- <strong id="cstName"></strong> -->
	                </div>
	          </div>
		        <!--协议-->
		        <div id="mask" style="display:none">
					<iframe src="about:blank" id="mask_box" ></iframe>
				</div>
          </form>
	</div>
	<div class="message_box_div" style="display:none">

<div class="questionLayer2">
  <div class="questionLayer_h"> <span style="float:left; font-size:14px">线上服务协议服务条款</span><span class="questionLayer_closer"   onclick="closeWindow();">&times;</span> </div>
  <div class="questionLayer_n" >
  <div class="title">若您绑定他行卡请阅读协议一，绑定本行卡请阅读协议二</div>
   <div class="title">(一)电子账户用户线上服务协议</div>
甲方：投资者（您本人）<br>
乙方：重庆联合产权交易所集团股份有限公司<br>
丙方：重庆农村商业银行股份有限公司<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方通过网络页面点击确认或以其他方式选择接受本协议，即表示甲方与乙方、丙方已达成协议并同意接受本协议的全部约定内容以及与本协议有关的各项规则。<br><br>
一、声明与承诺<br>
<strong>1.甲方确认，在甲方注册成为丙方电子账户用户时已接受本服务，或甲方以其他乙方允许的方式实际使用本服务前，甲方已充分阅读、理解并接受本协议的全部内容，一旦甲方使用本服务，即表示甲方同意遵循本协议之所有约定。</strong><br><br>
<strong>2.甲方同意，乙方、丙方经协商一致后有权对本协议内容进行单方面的变更，并以在乙方“联保通”网站或丙方官方网站公告的方式予以公布，无需另行单独通知甲方；若甲方在本协议内容公告变更后继续使用本服务的，表示甲方已充分阅读、理解并接受修改后的协议内容，也将遵循修改后的协议内容使用本服务；若甲方不同意修改后的协议内容，甲方应停止使用本服务。</strong><br><br />
二、业务说明<br>
1. 丙方电子账户：是指丙方为甲方打造的多用途账户，甲方可根据自主意愿，通过乙方系统与丙方系统相连进行丙方电子账户操作，完成认购、提现和查询等多种功能。<br><br />
2. 开户：甲方须按照乙方及丙方要求提交真实有效的身份信息并通过银行或第三方实名认证后方可开通成为丙方电子账户用户，并使用丙方电子账户服务。乙方及丙方有权采取各种必要手段对甲方身份信息进行验证，以确保投资安全。身份信息是乙方及丙方识别甲方的依据，甲方必须妥善保管，不得将身份信息提供给任何第三方或交于任何第三方使用。使用上述身份信息所发出的一切指令均视为甲方本人所为，甲方应对此产生的后果负责。对非因乙方及丙方原因造成的账户、密码等信息被冒用、盗用或非法使用，由此引起的一切风险、责任、损失、费用等应由甲方自行承担。<br></br>
3. 认购：是指甲方申请使用丙方电子账户中的资金用于购买乙方“联保通”网站发布的融资产品或服务。<br><br>
4. 提现：是指甲方申请将丙方电子账户中的资金转出至绑定银行卡。<br><br>
5. 查询：是指甲方可申请在丙方电子账户中查看余额和明细等情况。<br><br>
<strong>6. 丙方有权根据法律法规或丙方的相关规定暂停认购或限制大额认购，届时可能出现甲方无法进行认购操作。</strong><br><br>
7. 因为系统或者其他原因，导致系统支付给甲方/乙方的款项多于应支付款项，甲方/乙方有义务归还多付款项给丙方，丙方有权利追讨或者扣回多付款项。<br><br />
三、丙方电子账户的支付<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方使用丙方电子账户中的资金在乙方“联保通”平台上选择融资项目进行认购，即视为甲方同意将持有的相应金额的电子账户份额划转给乙方指定的项目融资方，用于支付相应融资产品的款项。<br><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>甲方确认：甲方使用丙方电子账户的支付功能是基于自身对所购产品或服务提供方的充分了解，一旦选用该功能，应当自行承担相关的风险。</strong><br><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>甲方和乙方确认：丙方按照与乙方约定的协议或指令将甲方持有的相应金额的电子账户份额划转给乙方指定的项目融资方，即完成了当次服务的所有义务，对于各方产生的任何纠纷不承担任何责任，也不提供任何形式的纠纷解决途径，甲方和乙方应当自行处理相关的纠纷。</strong><br><br />
四、服务费用<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>甲方知晓并同意，乙方及丙方保留向甲方收取服务费的权利。一旦乙方及丙方确定收取或调整服务费收取方式及标准，将以在乙方X”联保通”网站或丙方官网发布公告的方式通知甲方，而不再作个别通知。</strong><br><br>
五、法律适用条款<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本协议的成立、生效、履行和解释，均适用中华人民共和国法律；法律无明文规定的，可适用通行的行业惯例。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果本协议的部分规定与有关的法律法规或金融规章相抵触，三方应按有关的法律法规或金融规章的规定履行自己的权利义务，协议的其他部分的效力不受影响。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果本协议的任何条款被认定为无效或无法执行，则上述条款可被分离，其余部份则仍具有法律效力。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于本协议的未尽事宜，三方同意按照丙方的有关规定和金融监管规章的规定办理。<br><br>
六、争议的解决<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;凡因本协议引起的或与本协议有关的任何争议，由三方协商解决；协商不成的，任何一方均可提交重庆仲裁委员会，按照申请仲裁时该会现行有效的仲裁规则进行仲裁。仲裁裁决是终局的，对双方均有约束力。<br><br />
七、免责条款<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>甲方应充分认识购买融资项目产品不等于将资金作为存款存放在银行或者存款类金融机构。投资有风险，请谨慎选择。</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方使用本服务时同意并认可，可能由于第三方网络连线问题或其他不可抗拒因素，造成本服务无法提供。甲方确保甲方所输入的资料无误，如果因资料错误造成丙方于上述异常状况发生时，无法及时通知甲方相关交易后续处理方式的，丙方不承担任何损害赔偿责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如遇自然灾害等不可抗力事件，或其他不可预见的非常情况，或网络、通讯故障发生，导致乙方及丙方无法履行协议的，乙方及丙方不承担任何责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如因甲方绑定的银行账户已销户或账户状态不正常（挂失、冻结等）或者由于司法或其他原因而进行了账户冻结、扣划或销户，导致乙方及丙方无法履行协议的，乙方及丙方不承担任何责任。<br><br />
八、其他<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丙方对本协议拥有最终解释权。<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在接受本协议之前，请您仔细阅读本协议的全部内容<strong>（特别是以粗体下划线标注的内容）。如果您不同意本协议的任意内容，或者无法准确理解本协议的条款，请不要进行后续操作。</strong>

<div class="title">(二)快捷支付业务线上服务协议</div>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本协议由_重庆农村商业银行股份有限公司 （以下简称“我行”）与我行持卡人(以下简称 “您”)就重庆联合产权交易所集团股份有限公司联保通平台借记卡快捷支付服务（以下简称“本服务”）的使用等相关事项所订立的有效合约。您通过互联网（Internet）点击确认或以其他方式选择接受本协议，即表示您同意接受本协议的全部约定内容，确认承担由此产生的一切责任。<br><br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  在接受本协议之前，<strong>请您仔细阅读本协议的全部内容（特别是以粗体下划线标注的内容）。如果您不同意本协议的任何内容，或者无法准确理解相关条款的解释，请不要进行后续操作。 </strong><br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  您应确保您在使用本服务时绑定的借记卡为您本人合法所有，并确保您将您的联保通账户与该借记卡绑定且用其支付的行为合法、有效，未侵犯任何第三方合法权益；否则因此造成我行、持卡人损失的，您应负责赔偿并承担全部法律责任。<br><br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> 您同意我行对重庆联合产权交易所集团股份有限公司联保通平台（以下简称“联保通”平台）收集并转交我行的，您在使用本服务过程中所填写的包括但不限于姓名、借记卡卡号、手机号码、身份证号码等进行校对核验；并同意将该借记卡与您此次登录的联保通平台账户进行绑定，以便您此次及今后进行支付。同时我行与联保通平台保留随时变更上述确认要素作为校验标准的权利。</strong><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> 一旦绑定成功，您在联保通平台网站或相关使用界面输入联保通平台账户密码或联保通平台账户密码及您所收到的手机校验码后，即视为您确认支付金额及该支付指令，并由联保通平台转交我行进行后续处理。您同意并授权我行按照联保通平台的交易指令从您绑定的借记卡账户中支付相应款项。</strong><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>遗失或更换绑定联保通平台账户或银行账号短信通号码的手机具有较高风险，请您在遗失手机号时，立即致电手机号运营商对相应号码进行暂停并尽快补卡。当您需要更换手机号码时，请及时变更联保通平台账和银行账号短信通号码。</strong><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您应妥善保管该银行账户信息（银行账户信息包含开户户名、开户类型、查询密码、取款密码、开户时提供的证件类型及证件号码、预留手机号码、固定电话、通信地址等与该卡有关的一切信息）及有关实物。如您遗失借记卡、借记卡绑定的手机、对应卡片的银行账户信息应及时通知我行，以减少可能发生的损失。<strong>因您泄露银行账户信息、丢失借记卡或绑定借记卡的预留手机等所致损失需由您自行承担。</strong><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我行可根据业务发展需要，设置或修改支付限额，您对此无异议。您在使用本服务时需同时受我行和联交所设置的支付限额的约束。在任何情况下，支付金额不应超过我行或联保通平台设置的支付限额（以较少者为准，以下简称“支付限额”）。如实际支付金额大于支付限额，我行将拒绝执行交易指令。<br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本协议与本行借记卡章程或协议相冲突部分，以本协议为准。<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您不得利用快捷支付业务进行套现、虚假交易、洗钱等行为，且有义务配合我行进行相关调查，一旦您拒绝配合进行相关调查或我行认为您存在或涉嫌虚假交易、洗钱、套现或任何其他非法活动、欺诈或违反诚信原则的行为、或违反本协议约定的，我行有权采取以下一种、多种或全部措施：<br><br>
   （1）暂停或终止提供本协议项下快捷支付服务；<br>
   （2）终止本协议；<br>
   （3）取消您的用卡资格。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>  您同意，我行有权变更、暂停或终止本协议项下快捷支付业务服务，有权修改、终止本协议，并于执行前通过我行网站进行公告。相关公告经网站发布视为您已收到。您在公告执行后继续办理快捷支付业务的，视同接受有关本协议、快捷支付业务服务修改、变更的内容。本协议终止后，联保通平台在协议终止前已接收并发送我行进行处理的交易指令仍有效，您应承担其后果。</strong>
   </div>

</div>

<br>
  
       <div class="ybuttondiv" style="margin-bottom:20px"><input name="" type="button" class="button" id="agreeBtn"value="已同意并阅读此协议" onclick=""/></div>
</div>
 
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/user-bank2.js"/></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/local.js"/></script>
	</jsp:body>
</lbt:user-layout>

 