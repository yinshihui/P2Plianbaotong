var myPage = {
		PAGE_NOW : 1,		//现在是第几页
		PAGE_COUNT : ""		//一共有多少页
};
function checkEmpStatus(status) {
	var empStatus;
	switch(status) {
		case "n" :
			empStatus = "正常";
			break;
		case "f" :
			empStatus = "禁用";
			break;
	}
	return empStatus;
}
function checkEmpType(type) {
	var empType;
	switch(type) {
		case "s0" :
			empType = "一级审核员";
			break;
		case "s1" :
			empType = "二级审核员";
			break;
	}
	return empType;
}
/**
 * 分页插件
 */
function setPageNum() {
	$('.pagination').jqPagination({
		  link_string : '/?page={page_number}',
		  current_page: 1, //设置当前页 默认为1
		  max_page : myPage.PAGE_COUNT, //设置最大页 默认为1
		  page_string : '当前第{current_page}页,共{max_page}页',
		  paged : function(page) {
		      //回发事件。。。
		      }
		});
};
function getPageData() {
	$(".oTr").remove();			//分页或者换页前，先清空之前的列表数据
	$("#pageNow").val(myPage.PAGE_NOW);
	$.post("operator/operatorCheck", $("#compNoForm").serialize())
	.success(function(res){
		if (res.status === "ok") {
			location.href="..";
		}else {
			;
		}
		var list = res.arrayList,
			  list2 = res.arrayList2;
		var len = list.length;
		myPage.PAGE_COUNT = res.page_count;
		for (var i = 0; i < len; i += 1) {
			$("#operator_form tbody").append(
					'<tr class="oTr"><td class="usrName">' +
					list2[i] +					
					'</td><td class="empType">' +
					checkEmpType(list[i].empType) +
					'</td><td class="empStatus">' +
					checkEmpStatus(list[i].empStatus) +
					'</td><td>' + 
					'<a href="operator-modify.jsp?' +
					list2[i] +
					'&' +
					list[i].cstNo +
					'&' +
					list[i].memo +
					'&' +
					list[i].empType +
					'&' +
					list[i].empStatus +
					'" title="修改" class="input">修改</a></td></tr>'	
			);
		}
	});
};
function getPageNow() {
	getPageData();
	setTimeout(function() {
		setPageNum();
	}, 150);
};
/********************调用区域************************/
$(function() {	
		
	$.getJSON("security/current-user")
	.success(function(r){
		$("#usrName").val(r.name);
		$.post("operator/searchCompNo", $("#compNoForm").serialize())
		.success(function(res){
			var list = res.arrayList,
				  len = list.length;
			if (len) {
				$("#compNo").val(list[0].compNo);
				getPageNow();
			}else {
				alert("该审核员不存在！");
			}
		});
	});
	//回第一页
	$(".first").click(function() {
		if (myPage.PAGE_NOW !== 1) {
			myPage.PAGE_NOW = 1;
			getPageData();
		}else {
			alert("到首页了哦！");
		}	
	});
	//上一页
	$(".previous").click(function(e) {
		if (myPage.PAGE_NOW > 1) {
			myPage.PAGE_NOW -= 1;
			getPageData();
		}else {
			alert("到首页了哦！");
		}
	});
	//下一页
	$(".next").click(function(e) {
		if (myPage.PAGE_NOW < myPage.PAGE_COUNT) {
			myPage.PAGE_NOW += 1;
			getPageData();
		}else {	
			alert("到尾页了哦！");
		}
	});
	//回最后一页
	$(".last").click(function() {
		var count = myPage.PAGE_COUNT;
		if (myPage.PAGE_NOW !== count) {
			myPage.PAGE_NOW = count;
			getPageData();
		}else {
			alert("到尾页了哦！");
		}			
	});
	//支持输入框手动输入页数
	$(".enterPage").blur(function(e) {		
		var value = $(this).val();
		if (value <= myPage.PAGE_COUNT) {
			myPage.PAGE_NOW = +value;
			getPageData();
		}else {
			$(this).val("");
			alert("您输入的页数有误！");
		}
	});
});