function usershow(d)
{
	for (var i=1; i<=3 ;i++ )
	{
		document.getElementById("userbox"+ i).style.display='none';
		document.getElementById("usertab"+ i).style.background = '';
		document.getElementById("usertab"+ i).style.color = '#999999';
		document.getElementById("usertab"+ i).style.borderBottom = '2px solid #cccccc';
	}
	document.getElementById("userbox"+ d).style.display='block';
	document.getElementById("usertab"+ d).style.background = 'url("images/user_tab_on.jpg") center bottom no-repeat';
	document.getElementById("usertab"+ d).style.color = '#000000';
	document.getElementById("usertab"+ d).style.borderBottom = '2px solid #ff6600';
}