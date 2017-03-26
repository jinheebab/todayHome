<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" ></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


.thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }

.image {
	position:relative;
	floatLleft;	
}
.image .text{
	position:absolute;
	top:50%;
	left:5%;
	width:700px;
	font-size: 25px;
	font-family:"Sans-Serif";
}
.line {
   padding-top: 2%;
   border-bottom-style: solid;
   border-bottom-width: 1.5px;
   border-bottom-color: black;
   margin-top: 10px;
}
</style>

<div class="image">
	<img src="/host.png" width="100%" height="80%" />
	<div class="text"><h1>호스팅</h1><br/>
		<b>${id}</b>님 안녕하세요!<br/>호스팅 등록을 도와드리겠습니다<br/>
	</div>
</div>

<div class="row" style="margin-top:2%; margin-left: 15%; margin-right: 15%;">
	<form action="/hosting/host03">
		<div class="row"><div class="line">
			<h1>호스트로 등록<br/></h1>
			<h3>숙소 등록부터 시작해 보세요.<br/>숙소에 대한 프로필을 작성하는 것과 같습니다.</h3><br/></div><br/>
				<b></b><span class="glyphicon glyphicon-map-marker"></span>1단계
				<h4>회원님의 숙소 유형은 무엇인가요?</h4><hr/>
					<div class="col-md-6" >
						<h2 style="margin-left: 22%;">숙소 유형</h2>
						<div style="margin-left: 15%;">
							<select class="form-control" name="htype" id="htype" style="width:200px; height:50px"> 
								<c:forTokens items="단독주택,아파트,호텔,산장,호스텔,리조트,레지던스,게스트하우스,기숙사,민수(타이완),료칸(일본),펜션(한국),헤리티지 호텔(인도)" delims=",." var="t">
									<option>${t}</option>
								</c:forTokens>
							</select>
						</div>
						<h2 style="margin-left: 23%;">방 유형</h2>
						<div style="margin-left: 15%;">
							<input type="radio" name="rtype" value="allRoom">집 전체
							<input type="radio" name="rtype" value="oneRoom">일인실
							<input type="radio" name="rtype" value="manyRoom">다인실<br/>
						</div>
					</div>
					<div class="col-md-6" >
						<h2 style="margin-left: 23%;">방 개수</h2>
						<div style="margin-left: 15%;">
							<select class="form-control" name="roomcnt" id="roomcnt" style="width:200px; height:50px">
								<option value="0">방 개수를 선택하세요</option>
								<c:forEach var="item" begin="1" end="20" varStatus="vs">
									<option value="${item}">${item }개</option>
								</c:forEach>
							</select>
						</div>
						<h2 style="margin-left: 23%;">수용인원</h2>
						<div style="margin-left: 15%;">
							<select class="form-control" name="membercnt" id="membercnt" style="width:200px; height:50px">
								<option value="0">인원을 선택하세요</option>
								<c:forEach var="item" begin="1" end="20" varStatus="vs">
									<option value="${item}">${item }명</option>
								</c:forEach>
							</select>
						</div>
					</div>
			</div><div class="line"></div><br/>
			<div class="row">
				<span class="glyphicon glyphicon-map-marker"></span>2단계
				<h4>회원님의 숙소 위치는 어디인가요?</h4><hr/>
				<div class="col-md-6" >
					<h5 style="margin-left: 23%;">1. 지도에 호스팅할 위치를 입력하세요</h5><br/>
					<div>
						<input id="pac-input" class="controls" type="text" placeholder="예) 강남구" name=address>
						    <div id="type-selector" class="controls">
						    	<button type="button" id="refresh" class="btn btn-primary btn-md">검색</button>
						   	</div>
					    <div id="map" style="width:103%; height:70%;"></div>
				    </div>
				</div>
				<div class="col-md-6" >
				    <div >
				    <h5 style="margin-left: 23%;">2. 상세 하위주소와 가격을 입력하세요</h5><br/>
				    	<h4>국가</h4>
					    <input type="text" class="form-control" id="country" name="country" readonly="readonly" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
					    <h4>도시</h4>
					    <input type="text" class="form-control" id="city" name="city" readonly="readonly" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
					    <h4>하위주소</h4>
				 		<input type="text" class="form-control" id="location" name="location" /><br/>
				 		<h5 align="center">평균 금액</h5>
				 		<h2 align="center"><span id="findPrice" style="background-color:white; "></span></h2><br/>
				 		<h4 align="center">위를 참고하시고 원하시는 가격을 입력해주세요</h4>
				 	    <div align="center"><input class="form-control" type="number" name="price" min="1" max="1000000" placeholder="가격을 입력하세요(단위:원)" id="price" style="width:210px; height:50px"></div>
					</div>
				</div>
			</div><div class="line"></div>
			<div class=row><br/>
				<span class="glyphicon glyphicon-map-marker"></span>3단계
				<h4>첫번째 세부정보를 입력해주세요</h4><hr/>
				<div class="col-md-6" >
					<h2 style="margin-left: 23%;">침대 개수</h2>
					<div style="margin-left: 15%;">
						<select class="form-control" name="bedcnt" id="bedcnt" style="width:200px; height:50px">
							<option value="0">침대 개수를 선택하세요</option>
							<c:forEach var="item" begin="1" end="10" varStatus="vs">
								<option value="${item}">${item }개</option>
							</c:forEach>
						</select>
					</div>
					<h2 style="margin-left: 23%;">제공 비품</h2>
					<div>
						<textarea class="form-control" name="amenity" id="amenity" placeholder="제공비품을 입력하세요" rows="3" cols="50" style="width:400px; height:150px"></textarea>
					</div>    
				</div>
				<div class="col-md-6">
					<h2 style="margin-left: 23%;">욕실 개수</h2>
					<div style="margin-left: 15%;">
						<select class="form-control" name="bathcnt" id="bathcnt" style="width:200px; height:50px">
							<option value="0">욕실 개수를 선택하세요</option>
							<c:forEach var="item" begin="1" end="10" varStatus="vs">
								<option value="${item}">${item }개</option>
							</c:forEach>
						</select>
					</div>
					<h2 style="margin-left: 23%;">이용 수칙</h2>
					<div>
	 			 		<textarea class="form-control" name="rule" id="rule" placeholder="이용수칙을 입력하세요"  rows="3" cols="50" style="width:400px; height:150px"></textarea>
	 			 	</div>
				</div>
			</div><br/><br/>
	 <script>
		function initMap() {
			  var map = new google.maps.Map(document.getElementById('map'), {
			    center: {lat: 37.49794199999999, lng: 127.027621},
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCCtadQykezCNspZiTMu2TRdYXl9QZlbc&libraries=places&callback=initMap" async defer></script>

	<div class="row">
		<h4>두번째 세부정보를 입력해주세요</h4><hr/>
	    <div class="col-md-6">
	    	<h2 style="margin-left: 23%;"> 숙소 이름</h2>
	    	<div style="margin-left: 15%;">
	    		<input class="form-control" type="text" id="title" name="title" style="width:200px; height:50px;" />
	    	</div>
			<h2 style="margin-left: 20%;"> 호스트 이름</h2>
			<div style="margin-left: 15%;">
	    		<input class="form-control" type="text" id="hname" name="hname" style="width:200px; height:50px;" />
	    	</div><br/>
			<h2 style="margin-left: 23%;"> 호스팅 기간</h2>
			<div> 
				<input type="text" id="sdate" name="startdate" placeholder="체크인 날짜를 입력하세요" style="width:200px; height:50px; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" /> 
				<input type="text" id="edate" name="enddate" placeholder="체크아웃 날짜를 입력하세요" style="width:200px; height:50px; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
			</div>
	    </div>
		<div class="col-md-6">
			<h2 style="margin-left:35%;"> 카테고리</h2> 
			<div align="center">
				<input type="text" id="inputCategory" placeholder="카테고리를 입력해주세요" style="width:200px; height:50px; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" /> 
				<button type="button" id="plus" style="width:70px; height:50px; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; background-color:white">추가</button> 
			 	<textarea class="form-control" rows="3" id="category" name="category" rows="3" cols="50" style="width:400px; height:240px"></textarea>
		 	</div>
		 </div>
	</div><div class="line"></div>
	<div class="row"><br/>
		<span class="glyphicon glyphicon-map-marker"></span>4단계
		<h4>숙소 사진과 설명을 입력해주세요</h4><hr/>
		<div class="row">
			<h2>메인사진등록</h2>
	 	    <div id="image"  style="width:90%; height:50%; overflow: hidden; border:1%"></div>
            파일주소<input type="text" class="form-control" id="picurl" name=picurl readonly="readonly" />
            <input class="form-control" type="file" id="FILE_TAG" >
	 	   	<a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">등록</a>
 	    </div>
	 	    <div class="col-md-5">
			</div>
		<div class="row">
			<div class="form-group">
	  			<label for="comment">소개글:</label>
	  			<textarea name="intro" id="intro" class="form-control" rows="5"></textarea>
	  			<label for="comment">게스트 자격조건:</label>
		  		<textarea name="condition" id="condition" class="form-control" rows="5"></textarea>
			</div>
			<button type="submit" class="btn" id="register">최종등록</button>
		</div>
	 </div>
	</form>
</div>


<script>
	    $.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99',
	        minDate: 0
	        };
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
	    $('#sdate').datepicker();
	    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	    });
	 
	    $('#edate').datepicker();
	    $('#edate').datepicker("option", "minDate", $("#sdate").val());
	    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
	    	console.log(selectedDate)
	        $("#sdate").datepicker( "option", "maxDate", selectedDate );
	    });
	    
	    // 가격 띄우기
 	    function refresh(){
 	    	var city = $('#city').val();
 	    	$.ajax({
 	            url:'/hosting/host02',
 	            type:'get',
 	            data: { "city" : city },
 	            success: function(price){
 	                var total = Number(price);
 	                $('#findPrice').html(total+"원");
 	            }
 	        });
 	    };

 	    $('#plus').click(function(){
 	    	var inputCategory = $('#inputCategory').val();
 	    	$('#inputCategory').val('');
 	    	var category = $('#category').val() + '#' + inputCategory;
 	    	$('#category').val(category);
 	    	
 	    });
	
	
	$('#refresh').click(function(){
		refresh();
		
		 var address = $('#pac-input').val();
		 var address2 = address.split(' ');
		 var address3 = '';
		 
		 $('#country').val(address2[0]);
		 $('#city').val(address2[2]);
		 
		 for(var i=3; i<address2.length; i++){
			 address3 += address2[i];
		 }
		 
		 $('#location').val(address3);
		 
	});
	function uploadFile(){
        var form = $('FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("fileObj", $("#FILE_TAG")[0].files[0]);

        $.ajax({
            url: '/hosting/upload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert('사진등록성공');
                        console.log(result);
                        
                        $('#image').html('<img src="'+result+'" width="100%" height="100%">');
                        
                        $('#picurl').val(result);
                        
                    }
            });
    }
	
	</script>
	 
	 
