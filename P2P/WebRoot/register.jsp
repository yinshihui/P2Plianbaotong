<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="lbt" tagdir="/WEB-INF/tags" %>
<lbt:main-layout title="填写会员信息">
	<jsp:attribute name="header">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/register.css" type="text/css" /> 
	</jsp:attribute>
	<jsp:body>
		<script type="text/javascript">
			function closeWindow(){
				$('#mask').hide();
				$('.message_box_div').hide();
			}
				
			function showWindow(){
				$('#mask').show();
				$('.message_box_div').show();
			}
		</script>
		
		<form id="user_form" action="register/create" method="POST">
        <!--协议-->
        <div id="mask" style="display:none">
<iframe src="about:blank" id="mask_box" ></iframe>
</div>
<div class="message_box_div" style="display:none">

<div class="questionLayer2">
  <div class="questionLayer_h"> <span style="float:left; font-size:14px">协议页面</span><span class="questionLayer_closer"   onclick="closeWindow();">&times;</span> </div>
  <div class="questionLayer_n" >
   <div class="title">联交所联保通平台服务协议</div>
致用户：<br>
所有接受<strong>重庆联合产权交易所集团股份有限公司联保通网站</strong>平台服务的用户（包含注册用户和非注册用户。注册用户是指在www.cquae.com完成全部注册程序后，使用联交所联保通平台的用户。非注册用户是指未进行注册,直接登录本网站或通过其他网站进入 www.cquae.com使用联交所联保通平台的用户）均应遵守本条款。<br>
<strong>一、风险提示</strong><br>
1.请您在使用联交所联保通平台前认真阅读全部条款内容。如您对条款内容有任何疑问，可向联交所联保通平台咨询。如果您不同意本条款的内容，您应立即停止注册程序或停止使用联交所联保通平台的服务。但只要您事实上使用了联交所联保通平台的服务，视为您已认真阅读并同意遵守本条款。<br>
<br>2.本条款内容除正文外还包括所有联交所联保通平台网站已经发布的或将来可能发布的各类规则(包括但不限于《法律声明》、《联交所联保通平台费用及其他规则》等)。所有规则为本条款不可分割的组成部分，与正文具有同等法律效力。除另行明确声明外，联交所联保通平台提供的任何服务均受本条款约束。<br>
<br>3.联交所联保通平台有权修改本条款内容（含正文及/或各类规则），并在联交所联保通平台上公示，如您不同意相关变更，请停止使用联交所联保通平台的服务。如您继续使用联交所联保通平台的服务，即表示您同意并接受经修订的条款内容。如新旧条款之间冲突或矛盾的，除另行明确声明外，以最新修订的条款为准。<br>
<br>4.对于您提供的资料及数据信息，您授予联交所联保通平台全球通用的、永久的、免费的使用权利。<br>
<br>5.您应自行判断联交所联保通平台相关信息的真实性、合法性和有效性，结合自身的财务状况、风险承受能力、风险识别能力等谨慎决定是否投资/融资/提供担保等，并自行承担因此产生的法律后果。联交所联保通平台对业务中涉及的资金风险不承担任何担保、偿还的义务。<br>
<br>6.凡通过联交所联保通平台与其它网站的链接而获得的网上资料及内容，仅供您浏览和参考之用，请您对相关内容自行辨别及判断，联交所联保通平台不承担任何责任。<br>
<br>7.互联网传输可能会受到干扰，中断、延迟或数据错误，非联交所联保通平台能控制的通讯设施故障引致的数据及交易的不准确或不及时，联交所联保通平台积极协调处理但不承担任何责任。<br>
<br><strong>二、名词解释</strong><br>
1.<strong>投资人</strong>：是指在联交所联保通平台注册并同意相关服务协议，申明自己有合法来源的闲余资金通过联交所联保通平台进行投资的自然人、法人或其他组织。<br>
<br>2.<strong>融资人（投资接受人）</strong>：是指在联交所联保通平台注册并同意相关服务协议，有资金需求及合法资金用途，承诺到期回购投资人的投资权益（包含本金和收益），按时全额兑付投资人的本金和收益，并获得担保人担保认定的自然人、法人或其他组织。<br>
<br>3.<strong>担保人</strong>：是指在联交所联保通平台注册并同意相关服务协议，依法登记设立，取得担保机构经营许可证，具备担保人的主体资格，有足够的能力履行担保责任，并为投资接受人到期回购投资人的投资权益（包含本金和收益）提供不可撤销履约连带责任保证的担保公司。<br>
<br>4.<strong>联交所联保通平台</strong>：是为投资人、投资接收人、担保人之间订立并履行合约提供媒介服务的网站。<br>
<br><strong>三、投资人、投资接受人和担保人的义务</strong><br>
1.投资人应当拥有合法来源的闲余资金，资金来源不合法给自己及他人造成的一切损失由投资人负责。按照投资接受人向投资人定向融资的原则，投资人只能投资其在联交所联保通平台注册成功之后发布的融资项目。<br>
<br>2.投资接受人应对其发布的相关信息（包括但不限于公司名称、 联系人及联络信息，资金的需求及承诺收益描述、担保声明等）的真实性、合法性等承担责任，并按该信息偿付投资人的本金和收益。<br>
<br>3.担保人应对投资接受人发布的相关信息（包括但不限于公司名称、 联系人及联络信息，资金的需求及承诺收益描述、担保声明等）进行审核。<br>
<br>4.担保人应按照国家法规和审慎原则自行完善针对投资接受人的担保手续，并为相关投资人的本金安全及收益安全提供连带责任保证。当投资接受人不履约时，担保人应按约定履行担保义务，及时代投资接受人向相关投资人偿付本金和约定收益。<br>
<br><strong>四、注册及信息查询授权</strong><br>
1.在注册时，您应当按照法律法规要求，或注册页面的提示，准确填写并及时更新您提供的身份证信息、电子邮件地址、联系电话、联系地址、邮政编码等联系方式。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，联交所联保通平台有权向您发出询问及/或要求改正的通知，有权删除相应的资料，调整您在本网站的信用评价并公开，甚至中止、终止对您提供部分或全部服务。由此导致您在使用联交所联保通平台的过程中产生任何损失或增加费用的，应完全由您承担。<br>
<br>2.为了维护您和联交所联保通平台其他用户的利益，您授权联交所联保通平台查询中国人民银行征信系统、各地公民信用数据库等关于您的信息，以便核对您填写的注册信息，并了解其他影响您的履约能力、信用评价的信息。<br>
<br><strong>五、服务接受方的承诺和保证</strong><br>
1.您确认：如果您是自然人，在您完成普通用户的注册程序时，您是中国大陆籍年满18周岁且具有完全民事行为能力的自然人。若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且联交所联保通平台有权注销您的账号（登录名）。如果您是法人或其他组织，在您完成联交所机构用户的注册程序时，您应当是具备完全民事行为能力的企业法人或其他组织。<br>
<br>2.您向联交所联保通平台提供真实资料，用于开设与您的银行账户绑定的联保通账户及签署投融资担保合约。未提供真实资料，从而导致另一服务接受方或服务提供方无法履约，因而对您所造成的损失，联交所联保通平台将不予承担。<br>
<br>3.在您签署本协议，申请联交所联保通平台上唯一的用户名，完成注册程序后，请您妥善保存您的账号、密码等，您应对您的账号和密码的安全负责。任何通过您的用户名和密码实施的行为将视为您的行为，无论是您自己操作还是其他人代您操作，都由您承担法律后果。在未征得联交所联保通平台同意的前提下，您不得以任何方式转让、赠与联交所联保通平台的用户名和密码。<br>
<br>4.在接受联交所联保通平台服务的过程中，您承诺不从事下列行为：<br>
（1）发表、传送、传播、储存侵害他人知识产权、商业秘密权等合法权利的内容；<br>
（2）制造虚假身份、发布虚假信息等误导、欺骗他人，或违背联交所联保通平台页面公布之活动规则进行虚假交易；<br>
（3）进行危害计算机网络安全的行为。<br>
<br>5.在使用联交所联保通平台的过程中，您承诺遵守以下约定：<br>
（1）在使用联交所联保通平台的过程中实施的所有行为均遵守国家法律、法规及联交所联保通平台服务条款，不违背社会公共利益或公共道德，不损害他人的合法权益。<br>
（2）不发布国家禁止发布的信息，不发布其它涉嫌违法或违反本条款内容的信息。<br>
（3）不对联交所联保通平台上的任何数据作商业性利用，包括但不限于在未经联交所联保通平台事先书面同意的情况下，以复制、传播等任何方式使用联交所联保通平台上展示的资料。<br>
<br>6.您了解并同意：<br>
（1）您违反上述承诺时，联交所联保通平台有权依据本条款的约定，做出相应处理或终止向您提供服务，且无须征得您的同意或提前通知您。<br>
（2）当您的行为涉嫌违反法律法规或违反本条款的，联交所联保通平台有权采取相应措施，包括但不限于直接屏蔽、删除侵权信息，或直接停止提供服务。如使联交所联保通平台遭受任何损失的（包括但不限于受到第三方的索赔、受到行政管理部门的处罚等），您还应当赔偿或补偿联交所联保通平台遭受的损失及（或）发生的费用，包括诉讼费、律师费、保全费等。<br>
（3）向提供平台服务的联交所联保通平台支付服务费。<br>
<br>7.您授权：<br>
（1）您为投资人时，当您完成投资，并由投资接受人按照《投资权益回购履约担保合同》所约定的事宜向您按时、足额履约兑付您的本金及收益后，您授权联交所联保通平台向担保公司出具《解除担保责任告知函》。<br>
（2）您为投资人时，当投资接受人未能向您按照《投资权益回购履约担保合同》上所约定的事宜对您按时、足额履约兑付约定的本金及收益时，由担保人为投资接受人向您进行代偿成功之后，您授权联交所联保通平台向担保人出具《代偿债务确认书》。<br>
（3）您为投资接受人时，授权联保通平台根据您的指令划转向投资人兑付本金及收益。当您不能按照《投资权益回购履约担保合同》上所约定的事宜向投资人进行按时、足额履约兑付投资人本金及收益时，您授权联交所联保通平台向担保公司出具《代偿通知书》。<br>
<br><strong>六、权利救济</strong><br>
1.您同意在发现本网站任何内容不符合法律规定，或不符合本用户协议规定的，您有义务及时通知联交所联保通平台。如果您发现您的个人信息被盗用，或者您的其他权利被侵害，请将此情况告知联交所联保通平台并同时提供如下信息和材料：<br>
（1）侵犯您权利的信息的网址，编号或其他可以找到该信息的细节；<br>
（2）您是该权利的合法拥有者的权利证明；<br>
（3）您的联系方式，包括联系人姓名，地址，电话号码和电子邮件；<br>
（4）您的身份证复印件、营业执照复印件等其他相关资料。<br>
<br>经审查得到证实的，我们将及时删除相关信息。我们仅接受邮寄、电子邮件或传真方式的书面侵权通知。情况紧急的，您可以通过客服电话先行告知，我们会视情况采取相应措施。<br>
您理解联交所联保通平台对您的请求采取行动需要合理时间，联交所联保通平台对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。<br>
<br><strong>七、服务终止</strong><br>
1.您同意，联交所联保通平台基于网站服务的安全性、合法性，有权无须经事先通知而改变、中止、终止向您提供部分或全部联交所联保通平台服务，暂时冻结或永久冻结（注销）您的账号，且无须向您或任何第三方承担任何责任。<br>
<br>2.您有权向联交所联保通平台要求注销您的账号，经联交所联保通平台审核同意并注销您的账号后，您与联交所联保通平台基于本服务条款产生的关系即终止。您的账号被注销后，联交所联保通平台没有义务为您保留或向您披露您账号中的任何信息。<br>
<br>3.您同意，您与联交所联保通平台的服务关系终止后，联交所联保通平台仍有权继续使用您在接受联交所联保通平台的服务期间发布的所有信息。<br>
<br><strong>八、法律适用、管辖与其他</strong><br>
1.本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国法律，如无相关法律规定，可参照商业惯例和（或）行业习惯。<br>
<br>2.因本协议产生的争议，应当协商解决，协商不成可向<strong>重庆仲裁委员会申请仲裁<strong>。<br>
<br>
<div align="right">重庆联合产权交易所集团股份有限公司</div>
<br>
</div>
       <div class="ybuttondiv" style="margin-bottom:20px"><input name="" type="button" class="button" id="agreeBtn" value="已同意并阅读此协议"/></div>
</div>
</div>
        
        
        
		<!--content-->
		<div class="conter_2_bg bgf4">
			<div class="ycontent">
				<div class="title">个人用户注册</div>
			  	<div class="main">
				    <div class="step">
				      <img src="res/images/ystep1.jpg" width="52" height="52" /> <span>填写会员信息</span>　　
				      <img src="res/images/ystep2_1.jpg" width="52" height="52" /> 发送激活邮件　　
				      <img src="res/images/ystep3_1.jpg" width="52" height="52" /> 会员激活　　 
				      <img src="res/images/ystep4_1.jpg" width="52" height="52" /> 激活成功</div>
					  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						  <tr>
							    <th><span>* </span>用户名</th>
							    <td>
							    	<input name="usrName" id="usrName" type="text" maxlength="20" class="input"/>						
							      	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
							      	<label id="usrNameTip"></label>
							     </td>
						  </tr>
						  <tr>
							    <th><span>* </span>真实姓名</th>
							    <td>
							    	<input name="cstName" id="cstName" type="text" maxlength="10" class="input" />
							      	<img src="res/images/ytrue2.jpg" class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg" class="false" style="display:none"/>
							      	<label id="cstNameTip"></label>
							    </td>
						  </tr>
						  <tr>
							    <th><span>* </span>常用电子信箱</th>
							    <td>
								    <input name="email" id="email" type="text" class="input" />
							    	<img src="res/images/ytrue2.jpg"  class="true" style="display:none" />
							     	<img src="res/images/yfalse2.jpg"   class="false" style="display:none"/>
							     	<label id="emailTip"></label>
							    </td>
						   </tr>
						   <tr>
							    <th>推荐人号码</th>
							    <td>
							    	<input name="introCode" id="introCode" type="text" maxlength="8" class="input"/>
							    	<img src="res/images/ytrue2.jpg"  class="true" style="display:none" />
							      	<img src="res/images/yfalse2.jpg"  class="false" style="display:none"/>
							      	<label id="introCodeTip"></label>
							   </td>
						    </tr>
							<tr>
							    <th><span>* </span>验证码</th>
							    <td>
							    	<input type="text" class="input" id="captcha" name="captcha" maxlength="6" style="float:left;"/>
							    	<img src="res/images/ytrue2.jpg" style="display:none" id="codeTrue" class="true"/>
							      	<img src="res/images/yfalse2.jpg" style="display:none" id="codeFalse" class="false"/>
							    </td>
							</tr>
							<tr>
								<th></th>
								<td><img id="captchaImage"></td>
							</tr>
						</table> 
						<div class="yxy"><input type="checkbox" id="agreeChoice"/> 已阅读并同意<label id="protocol"><span onclick="showWindow()">《联保通平台服务项目协议》</span></label></div>
						<div class="ybuttondiv">
							<button id="sub" class="button">注 册</button>
						</div>
				  </div>
				</div>
			</div>
		</form>
		<div id="hiddenArea">
		<!-- ----------------------------------------------- -->
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/register.js"/></script>
	</jsp:body>
</lbt:main-layout>