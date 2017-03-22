<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
   
   
<div class="row" style="margin-bottom: 30px;">
  <div class="col-md-1" align="right">
    <br/><br/><br/><br/><br/><br/><br/><br/>
 <span id="slider-prev" style="font-size: 2em; padding-left: 20%"></span>
 </div>
<div class="col-md-10">
<span style=" font-weight:bold; font-size:1.5em; ">HOT LOCATION</span>
<hr style="border-bottom-style: solid; border-bottom-width: 0px; border-bottom-color: black; margin-top: 10px;"/>
<div align="center">
<ul class="bxslider" >
<c:forEach var="i" items="${list}" end="12" >
  <li><div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <a href="/view/detail?num=${i.NUM}">
  <img src="${i.PICURL}" width=600px height=350px title="${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] "/>
  </a></div></li>
  </c:forEach>
</ul>
</div>
</div>
<div class="col-md-1" align="left">
<br/><br/><br/><br/><br/><br/><br/><br/>
<span id="slider-next" style="font-size: 2em; padding-right: 20%"></span>
</div>
</div>


<!-- ================================================================= -->
  <div class="row">
  <div class="col-md-1" align="right">
    <br/><br/><br/><br/><br/>
 <span id="slider-prev1" style="font-size: 2em; padding-left: 20%"></span>
 </div>
<div class="col-md-10">
<span style=" font-weight:bold; font-size:1.5em; ">TODAY's CHOICE</span>
<hr style="border-bottom-style: solid; border-bottom-width: 0px; border-bottom-color: black; margin-top: 10px;"/>
<div align="center">
<ul class="bxslider1" >
<c:forEach var="i" items="${list}" end="12" >
  <li><div style="width: 330.5px; height: 170.33px; overflow: hidden;">
  <a href="/view/detail?num=${i.NUM}">
  <img src="${i.PICURL}" width=270px height=170px title="${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] "/>
  </a></div></li>
  </c:forEach>
</ul>
</div>
</div>
<div class="col-md-1" align="left">
<br/><br/><br/><br/><br/>
<span id="slider-next1" style="font-size: 2em; padding-right: 20%"></span>
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
  
  $('.bxslider1').bxSlider({
     
     nextSelector: '#slider-next1',
     prevSelector: '#slider-prev1',
     nextText: '>',
     prevText: '<',
   
     minSlides: 3,
     maxSlides: 3,
     slideWidth: 350,
     slideMargin: 10,
     mode: 'horizontal' ,
     captions: true,
     pagerCustom: '#bx-pager'
   });
</script>