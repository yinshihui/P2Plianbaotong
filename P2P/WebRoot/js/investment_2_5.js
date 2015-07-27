function two(d)
{
	for (var i=1; i<=5 ;i++ )
	{
		document.getElementById("invtwo"+ i).style.background = '';
		document.getElementById("invtwo"+ i).style.color = '#333333';
	}
	document.getElementById("invtwo"+ d).style.background = 'url("images/investment_07.jpg") center no-repeat';
	document.getElementById("invtwo"+ d).style.color = '#ffffff';
}