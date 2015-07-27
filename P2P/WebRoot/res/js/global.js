//from http://www.jquery4u.com/snippets/url-parameters-jquery
$.urlParam = function(name){
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
};

//项目状态中文显示
function getProjStatus(status) {
	var projStatus;
	switch(status) {
		case "S0" :
			projStatus = "新建";
			break;
		case "S1" :
			projStatus = "打回";
			break;
		case "S2" :
			projStatus = "还款处理中";
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
			projStatus = "等待还款的 ";
			break;
		case "S71" :
			projStatus = "提交银行处理中 ";
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
		default:
			projStatus = "未知状态";
		break;
	}
	return projStatus;
}
