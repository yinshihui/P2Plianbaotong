function jobsshow(d)
{
	for (var i=1; i<=2 ;i++ )
	{
		document.getElementById("jobsbox"+ i).style.display='none';
		document.getElementById("jobstab"+ i).style.background = '#ccc';
		document.getElementById("jobstab"+ i).style.color = '#2d2d2d';
		document.getElementById("jobstab"+ i).style.borderTop = '';
	}
	document.getElementById("jobsbox"+ d).style.display='block';
	document.getElementById("jobstab"+ d).style.background = '#ff7e28';
	document.getElementById("jobstab"+ d).style.color = '#ffffff';
	document.getElementById("jobstab"+ d).style.borderTop = '';
	document.getElementById("jobstab"+ d).style.borderBottom = 'none';
}