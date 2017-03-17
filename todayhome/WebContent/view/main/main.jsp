<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


  <br/><br/> 
  <div class="row">
  <div class="col-md-1" align="right">
    <br/><br/><br/><br/><br/><br/><br/><br/>
 <span id="slider-prev" style="font-size: 2em; padding-left: 20%"></span>
 </div>
<div class="col-md-10" align="center">
<ul class="bxslider">
<c:forEach var="i" items="${list}" end="4" >
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <a href="/view/detail?num=${i.NUM}">
  <img src="${i.PICURL}" width=600px height=350px title="${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] "/>
  </a></div></li>
  </c:forEach>
</ul>
</div>
<div class="col-md-1" align="left">
<br/><br/><br/><br/><br/><br/><br/><br/>
<span id="slider-next" style="font-size: 2em; padding-right: 20%"></span>
</div>
</div>

<div id="bx-pager">
  <a data-slide-index="0" ></a>
  <a data-slide-index="1" ></a>
  <a data-slide-index="2" ></a>
</div>


<div class="row" align="center" style="padding-bottom: 2%;" >	
  <br/><br/>
  <b>오늘만큼은 여기가 우리 집이에요. 전 세계에 있는 우리 집을 경험해보세요.</b>
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
