$(function(){
  		$.getJSON("transaction/transferInQuery", function(res) {
		var list = res.arrayList;
		for (var i = 0, len = list.length; i < len; i += 1) {
			$("#myTable tbody").append(
				'<tr class="oTr"><td class="txnType">' + 
				list[i].txnType + 
				'</td><td class="txnAmt">' + 
				list[i].txnAmt + 
				'</td><td class="cardNo">' +
				list[i].cardNo +
				'</td><td class="txnTime">' +
				list[i].txnTime +
				'</td></tr>'		
			);
		}
	});  
	 
	 $("#sub").click(function(e) {	 
		 e.preventDefault();
		 $("#myTable tbody").empty();
		 $.post("transaction/search", $("#searchForm").serialize())
			.success(function(res){
				if (res.status === "ok") {
					location.href="..";
				}else {
					;
				}
				var list = res.arrayList;
				for (var i = 0, len = list.length; i < len; i += 1) {
					$("#myTable tbody").append(
						'<tr class="oTr"><td class="txnType">' + 
						list[i].txnType + 
						'</td><td class="txnAmt">' + 
						list[i].txnAmt + 
						'</td><td class="cardNo">' +
						list[i].cardNo +
						'</td><td class="txnTime">' +
						list[i].txnTime +
						'</td><tr>'		
					);
				}
			})
			.error(function(res) {
				$("#myTable tbody").append(
						'<tr><td colspan="4" align="center">无记录</td></tr>'		
					);
			});
	 });
});