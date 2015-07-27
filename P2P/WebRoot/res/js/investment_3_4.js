function three(d)
{
	for (var i=1; i<=4 ;i++ )
	{
		document.getElementById("invthree"+ i).style.background = '';
		document.getElementById("invthree"+ i).style.color = '#333333';
	}
	document.getElementById("invthree"+ d).style.background = 'url("images/investment_07.jpg") center no-repeat';
	document.getElementById("invthree"+ d).style.color = '#ffffff';
}