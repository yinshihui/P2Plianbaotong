function checkGender(type){
	var gender = "男";
	switch( type ){
	    case "M" :
	        gender = "男";
	        break;
	    case "F" :
	        gender = "女";
	        break;
	    default :
	        gender = "其他";
	        break;

	}
	
	return gender;
}


function checkCustType(type){
	var custType ;
	
	switch(type){
	    case "p" :
	    	custType = "个人用户";
	        break;
	    case "c" :
	    	custType = "企业用户";
	        break;
	    default :
	    	custType = "其他";
	        break;
	}
	
	return custType;
}


function checkRoleType(type){
	var roleType ;
	
	switch(type){
	    case "t" :
	    	 roleType  = "投资人用户";
	        break;
	    case "b" :
	    	 roleType  = "经纪人用户";
	        break;
	    case "f" :
	    	 roleType  = "融资人用户";
	        break;
	    case "e" :
	    	 roleType  = "发行机构员工用户";
	        break;
	    case "i" :
	    	 roleType  = "发行机构";
	        break;
	    default :
	    	 roleType  = "其他";
	        break;
	}
	
	return roleType;
}


function checkCertFlg(type){
	var certFlg ;
	
	switch(type){
	    case "ture" :
	    	certFlg = "是";
	        break;
	    case "fault" :
	    	certFlg = "否";
	        break;
	    default :
	    	certFlg = "其他";
	        break;
	}
	
	return certFlg;
}



function checkAcctStatus(type){
	var acctStatus ;
	
	switch(type){
	    case "N" :
	    	acctStatus = "正常";
	        break;
	    case "L" :
	    	acctStatus = "锁定";
	        break;
	    case "O" :
	    	acctStatus = "止付";
	        break;
	    case "I" :
	    	acctStatus = "止入";
	        break;
	    default :
	    	acctStatus = "其他";
	        break;
	}
	
	return acctStatus;
}


function checkFlg(type){
	var Flg ;
	if(type)
		Flg = "是";
	else 
	    Flg = "否";
	
	
	return Flg;
}


/********************调用区域************************/
$(function(){
	//加载脚本
	$.getJSON("userInfo/getUser")
		.success(function(r){
			 
			 var cst = r['cstInf'];
			 var acct = r['acct'];
			 var bind = r['cardBind'];
			 var us = r['usrInf'];
			 var cop = r['copInf'];
			 
			 var certNo,
			 	   cardNo,
				   email = us.email.replace(/\S{2}@\S{2}/, "*******"),
				   mobile = us.mobile.substring(0, 3) + "****" + us.mobile.substring(7, 11);
			 
			 if (cst) {
				 certNo = cst.certNo.substring(0, 3) + "**********" + cst.certNo.substring(13, 18);
			 }		 
//			 
//			 if (bind) {
//				cardNo = bind.cardNo.substring(0, 6) + "********" + bind.cardNo.substring(14, 18);
//			 }	
			 
			 $("#usrNo").html(us.usrNo);
			 $("#usrName").html(us.usrName);
			 $("#cstType").html(checkCustType(us.cstType));
			 $("#roleType").html(checkRoleType(us.roleType));
			 $("#email").html(email);
			 $("#certFlg").html(checkFlg(us.certFlg));
			 $("#mobileFlg").html(checkFlg(us.mobileFlg));
			 $("#emailFlg").html(checkFlg(us.emailFlg));
			 $("#mobile").html(mobile);
			 
			 if(cst!= null){
				 $("#cstName").html(cst.cstName);
				 $("#certNo").html(certNo);
				 $("#gender").html(checkGender(cst.gender));
			 }
			 if(cop!=null){
				 $("#cstName").html(cop.compName); 
			 }
			 
			 
			 
			 $("#acctNo").html(acct.acctNo);
			 if(bind!= null){
			 $("#cardNo").html(bind.cardNo);
			 $("#bankNo").html(bind.bankNo);
			 $("#bankCstName").html(bind.bankCstName);
			 $("#bankLocal").html(bind.bankLocal);
			  
			 $("#eAcctNo").html(bind.eacctNo);
			 }
			      
			 $.post("operator/searchEmpType", {usrName : us.usrName})
				.success(function(res) {
					 
					if (res.arrayList[0] === "s0" || res.arrayList[0] === "s1") {
						$("#usertab3").css("display", "none");
					}
				})
				.error(function(err) {
					 
				});
			 
	});
	
	
});
