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
<span style=" font-weight:bold; font-size:1.5em; ">MY WISHLIST</span>
<hr style="border-bottom-style: solid; border-bottom-width: 0px; border-bottom-color: black; margin-top: 10px;"/>
<div align="center">
<ul class="bxslider" >
<c:forEach var="i" items="${wishlist}" end="4" >
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

