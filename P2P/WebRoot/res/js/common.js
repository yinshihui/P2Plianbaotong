
//隔行变色加选中变色
$(document).ready(function(){
        $(".tab1 tr:odd").addClass("odd");     //奇数行设定为 "odd" 样式
        $(".tab1 tr:even").addClass("even");   //偶数行设定为 "even" 样式
        $(".tab1 tr").mouseover(function(){$(this).addClass("over");})     //当 mouseover 时加入 "over" 样式
                          .mouseout(function(){$(this).removeClass("over");})   //当 mouseout 时移除 "over" 样式
                        .click(function(){$(this).toggleClass("tr_chouse");}) //当 click 加入或移除 "tr_chouse" 样式，实现数据列选取
     });
//左侧菜单

$(function(){
	$(".leftMenu ul li").mouseenter(function(){
		$(this).addClass("on")
		.siblings().removeClass("on");
		}).mouseleave(function(){
			$(this).removeClass("on");
			})
	}) 