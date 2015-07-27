//menu
$(document).ready(function(){
  
  $('li.mainlevel').mousemove(function(){
  $(this).find('ul').slideDown();//you can give it a speed
  });
  $('li.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("fast");
  });
  
  $('li.mainlevel').click(function(){
	  $(this).find('a').addClass('red').sbiling().parent().removeClass('red');
	  });
  
});

//����ͼ�� www.lanrentuku.com