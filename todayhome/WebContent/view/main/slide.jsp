<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery library (served from Google) -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



<div class="col-md-1">
 <span id="slider-prev" style="font-size: 5em;"></span>
 </div>
<div class="col-md-10" align="center">
<ul class="bxslider">
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <img src="/1.jpg" width=600px height=350px title="todayhome"/></div></li>
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <img src="/2.jpg" width=600px height=350px  /></div></li>
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <img src="/3.jpg" width=600px height=350px  /></div></li>
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <img src="/3.jpg" width=600px height=350px  /></div></li>
</ul>
</div>
<div class="col-md-1">
<span id="slider-next" style="font-size: 5em;"></span>
</div>

<div id="bx-pager">
  <a data-slide-index="0" href=""></a>
  <a data-slide-index="1" href=""></a>
  <a data-slide-index="2" href=""></a>
</div>


<script>
$('.bxslider').bxSlider({
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: '>',
	  prevText: '<',
	
	  minSlides: 2,
	  maxSlides: 2,
	  slideWidth: 480,
	  slideMargin: 10,
	  mode: 'horizontal' ,
	  captions: true,
	  pagerCustom: '#bx-pager'
	});

</script>
