<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>



</head>
<body>
		<h2>호스팅 1단계</h2>
		<p>${id}님안녕하세요! 호스팅 등록을 도와드리겠습니다</p>
		
		<div class="dropdown">
			<select id="roomType" name="roomType">
				<option value="allRoom">집전체</option>
				<option value="oneRoom">일인실</option>
				<option value="manyRoom">다인실</option>
			</select>
		</div>

		<div class="dropdown">
			<select id="people" name="people">

				<c:forEach begin="1" end="15" step="1" var="x" varStatus="status">
					<option value="room${x}">${x}인실</option>
					<c:if test="${not status.last}">
						<br>
					</c:if>
				</c:forEach>
			</select>
		</div>




<input id="pac-input" class="controls" type="text"
        placeholder="Enter a location">
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

		    // If the place has a geometry, then present it on a map.
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

		  // Sets a listener on a radio button to change the filter type on Places
		  // Autocomplete.
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
	
	<script>
		
	</script>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9YaEeWPWYmIGjPE2r1cAReWwTjGRLj9I&libraries=places&callback=initMap"
        async defer></script>
</body>
</html>
