<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" ></script>

<br />
<h3>
	<span id="cnt">${vall.count}개 호스팅이 등록되어 있습니다.</span>
</h3>
<br/>
<div class="well row" style="overflow:scroll; background-color:white;" >
	<div class="col-md-3" align="center" style="background-color: white">
		<c:forEach var="list" items="${val}">
			<br/>
			<div align="center">
				<img src="${list.PICURL}" width="400px" height="300px" />
				<b>
					<span>\<fmt:formatNumber value="${list.PRICE}" pattern="#,###"/></span>
					<span>${list.TITLE}</span><br/>
				</b>
				<span>${list.HTYPE}</span>
				<span>침대 ${list.BEDCNT}개</span>
			</div>
			<br/>
		</c:forEach>
	</div>
</div>
<div>
	<div class="col-md-9" style="background-color: white">
		<h2>주소</h2>
		<input id="pac-input" class="controls" type="text"
		        placeholder="주소를 입력하세요">
		    <div id="type-selector" class="controls">
		      <input type="radio" name="type" id="changetype-all" checked="checked">
		      <label for="changetype-all">All</label>
		
		      <input type="radio" name="type" id="changetype-establishment">
		      <label for="changetype-establishment">Establishments</label>
		
		      <input type="radio" name="type" id="changetype-address">
		      <label for="changetype-address">Addresses</label>
		
		      <input type="radio" name="type" id="changetype-geocode">
		      <label for="changetype-geocode">Geocodes</label>
		    </div>
		    <div id="map"></div>
		     <script>
		     function initMap() {
		    	  var map = new google.maps.Map(document.getElementById('map'), {
		    	    center: {lat: -33.8688, lng: 151.2195},
		    	    zoom: 13
		    	  });
		    	  var input = /** @type {!HTMLInputElement} */(
		    	      document.getElementById('pac-input'));
		
		    	  var types = document.getElementById('type-selector');
		    	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		    	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);
		
		    	  var autocomplete = new google.maps.places.Autocomplete(input);
		    	  autocomplete.bindTo('bounds', map);
		
		    	  var infowindow = new google.maps.InfoWindow();
		    	  var marker = new google.maps.Marker({
		    	    map: map,
		    	    anchorPoint: new google.maps.Point(0, -29)
		    	  });
		
		    	  autocomplete.addListener('place_changed', function() {
		    	    infowindow.close();
		    	    marker.setVisible(false);
		    	    var place = autocomplete.getPlace();
		    	    if (!place.geometry) {
		    	      window.alert("Autocomplete's returned place contains no geometry");
		    	      return;
		    	    }
		    	    if (place.geometry.viewport) {
		    	      map.fitBounds(place.geometry.viewport);
		    	    } else {
		    	      map.setCenter(place.geometry.location);
		    	      map.setZoom(17);  // Why 17? Because it looks good.
		    	    }
		    	    marker.setIcon(/** @type {google.maps.Icon} */({
		    	      url: place.icon,
		    	      size: new google.maps.Size(71, 71),
		    	      origin: new google.maps.Point(0, 0),
		    	      anchor: new google.maps.Point(17, 34),
		    	      scaledSize: new google.maps.Size(35, 35)
		    	    }));
		    	    marker.setPosition(place.geometry.location);
		    	    marker.setVisible(true);
		
		    	    var address = '';
		    	    if (place.address_components) {
		    	      address = [
		    	        (place.address_components[0] && place.address_components[0].short_name || ''),
		    	        (place.address_components[1] && place.address_components[1].short_name || ''),
		    	        (place.address_components[2] && place.address_components[2].short_name || '')
		    	      ].join(' ');
		    	    }
		    	    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
		    	    infowindow.open(map, marker);
		    	  });
		    	  function setupClickListener(id, types) {
		    	    var radioButton = document.getElementById(id);
		    	    radioButton.addEventListener('click', function() {
		    	      autocomplete.setTypes(types);
		    	    });
		    	  }
		    	  setupClickListener('changetype-all', []);
		    	  setupClickListener('changetype-address', ['address']);
		    	  setupClickListener('changetype-establishment', ['establishment']);
		    	  setupClickListener('changetype-geocode', ['geocode']);
		    	}
			</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAK0WmkDko31qXUi_KV5kZNvtLwkKxePyU&libraries=places&callback=initMap"
	        async defer></script>
		</div>
</div>

