<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<div class="well row" style="background-color: white;">
   <div class="col-md-6" align="center"
      style="background-color: white; overflow: scroll; width: 50%; height: 100%;">
      <h3>
         <span id="cnt">&nbsp ${count}개 호스팅이 등록되어 있습니다.</span>
      </h3>
      <br/>
      <div class="row">
         <c:forEach var="list" items="${val}">
            <div align="center" class="col-md-6">
               <a href="/view/detail?num=${list.NUM}"> <img
                  src="${list.PICURL}" width="350px" height="300px" /><br />
               </a> <b> <span>\<fmt:formatNumber value="${list.PRICE}"
                        pattern="#,###" /></span> <span>${fn:substring(list.TITLE, 0, 10)}</span><br />
               </b> <span>${list.HTYPE}</span> <span>침대 ${list.BEDCNT}개</span>
            </div>
         </c:forEach>
      </div>
      <!-- 페이지 뷰 -->
      <div align="center">
         <c:if test="${page ne 1 }">
            <a href="/search/search?page=${page -1 }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">이전</a>
         </c:if>
         <c:forEach var="p" begin="${pageStart}" end="${pageEnd}" step="1" varStatus="vs">
            <c:choose>
               <c:when test="${p eq page }">
                  <b>${p }</b>
               </c:when>
               <c:otherwise>
                  <a
                     href="/search/search?page=${p }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">${p }</a>
               </c:otherwise>
            </c:choose>
            <c:if test="${vs.last eq false }">|</c:if>
         </c:forEach>
         <c:if test="${page ne size}">
            <a href="/search/search?page=${page +1 }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">다음</a>
         </c:if>
         
         
      </div>
   </div>
   <div class="col-md-6" style="background-color: white;">
      <h3>
         <span id="cnt"></span>
      </h3>

   <div id="map" style="height:100%"></div>
   </div>
</div>

<script>   
function initMap() {
    <c:forEach var="val" items="${loc}" varStatus="vs">
       var myLatLng${vs.index} = {
               <c:choose>
               <c:when test="${val.results[0].geometry.location.lat eq null}">
                           'lat': 37.3421002,
                           'lng': 127.0718116
               </c:when>
               <c:otherwise>
                        'lat': ${val.results[0].geometry.location.lat},
                        'lng': ${val.results[0].geometry.location.lng}
               </c:otherwise>
            </c:choose>
       };
    </c:forEach>
    var map = new google.maps.Map(document.getElementById('map'), {
       zoom: 10,
       center: myLatLng0
   });

   <c:forEach var="vall" items="${loc}" varStatus="vs">
      var content${vs.index} = '<div><a href="/view/detail?num=${vall.num}"><span id="title">${vall.title}</span></div><img src="${vall.picurl}" width="100px" height="70px" /><br /><b><span>\<fmt:formatNumber value="${vall.price}" pattern="#,###" /></span> <span>${fn:substring(vall.title, 0, 10)}</span><br /></b> </a>';
     var infowindow${vs.index} = new google.maps.InfoWindow({
          content: content${vs.index}
     });
   
     var marker${vs.index} = new google.maps.Marker({
          position: myLatLng${vs.index},
          map: map,
          title: '${vs.index}번째 마커'
      });   
     marker${vs.index}.addListener('click', function() {
          infowindow${vs.index}.open(map, marker${vs.index});
     });  
   </c:forEach>
}
</script>
<script async defer src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD53IpkHwpF-EViVKy52nOANIme2CK7Rns&callback=initMap"></script>