function one(d)
{
	for (var i=1; i<=5 ;i++ )
	{
		
		document.getElementById("invone"+ i).style.background = '';
		document.getElementById("invone"+ i).style.color = '#333333';
	}
	document.getElementById("invone"+ d).style.background = 'url("images/investment_07.jpg") center no-repeat';
	document.getElementById("invone"+ d).style.color = '#ffffff';
}