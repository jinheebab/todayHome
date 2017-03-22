<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" ></script>

<div class="well row" style="background-color:white;">
	<div class="col-md-6" align="center" style="background-color: white; overflow:scroll; width:50%; height:100%;">
	<h3>
	<span id="cnt">&nbsp${vall.count}개 호스팅이 등록되어 있습니다.</span>
	</h3><br/>
	<div class="row">
		<c:forEach var="list" items="${val}">
			<div align="center" class="col-md-6">
				<a href="/view/detail?num=${list.NUM}" >
					<img src="${list.PICURL}" width="350px" height="300px" /><br/>
				</a>
				<b>
					<span>\<fmt:formatNumber value="${list.PRICE}" pattern="#,###"/></span>
					<span>${list.TITLE}</span><br/>
				</b>
				<span>${list.HTYPE}</span>
				<span>침대 ${list.BEDCNT}개</span>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="col-md-6" style="background-color: white">
	<!DOCTYPE html>
	<html>
	  <head>
	    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	    <meta charset="utf-8">
	    <title>Simple markers</title>
	    <style>
	      html, body {
	        height: 100%;
	        margin: 0;
	        padding: 0;
	      }
	      #map {
	        height: 100%;
	      }
	   </style>
	  </head>
	  <body>
	    <div id="map"></div>
	  </body>
	</html>
	</div>
</div>
<script>	
	function initMap() {
	  var myLatLng = {lat: -25.363, lng: 131.044};
	
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 4,
	    center: myLatLng
	  });
			
	  var marker = new google.maps.Marker({
	    position: myLatLng,
	    map: map,
	    title: 'Hello World!'
	  });
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap">
</script>

