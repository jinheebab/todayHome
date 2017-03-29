<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"   type="text/css" />
<script   src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   

<style>
.mainpic{
   width:100%;
   height: 70%;
   overflow: hidden;
}
.title {
   font-weight: bold;
   font-size: 2.2em;
   font-family: 나눔고딕;
   line-height: 1.3em;
}

.location {
   font-size: 1.5em;
   color: grey;
}

.line {
   padding-top: 2%;
   border-bottom-style: solid;
   border-bottom-width: 1.5px;
   border-bottom-color: black;
   margin-top: 10px;
}

.point1 {
   background-image: url('/icon/star_off.png');
   width: 120px;
   height: 30px;
}

.point2 {
   overflow: hidden;
   width: ${score}%;

}
.point2_r{
   overflow: hidden;
}
.icon {
   width: 60px;
   height: 60px;
}
.font1{
   font-size: 1.2em;
   line-height: 1.9em;
      padding-top: 1%;
}
.font2{
   font-size: 1.7em;
   padding-top: 1%;
}
.font3{
   font-size: 0.7em;
}
.profile{
   overflow: hidden;
   width: 70px;
   height: 70px;
   border-radius: 50%;
}
.modal1 {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; 
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
    background-color: #fefefe;
   margin-right: 30%; 
   margin-left:30%;
    padding: 5%;
    border: 1px solid #888;
}

/* The Close Button */
.close1 {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close1:hover,
.close1:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.btn{
   border-style: soild;
   border-width: 2px;
   border-color: black;
   background-color: white;
   font-weight: bold;
}
.bookbox { 
   border-style: solid;
   border-color: grey;
   border-width: thin;
   width: 100%;
}
</style>




<div class="mainpic">
<div><img src="${list[0].PICURL}" width="1600px" height="800px" ></div>
</div>
<div class="row" style="padding-top: 5%; margin: 0 150; padding-right: 25px; padding-left: 25px;">
   <c:forEach var="i" items="${list}">
      <span class="title">${i.TITLE}</span>
      <br />
      
    <div class="row"  >
   <div class="col-md-8">
      <div class="location">${i.COUNTRY}, ${i.CITY} <span style="font-size: 0.8em;">${i.CATEGORY}</span>
         <div class="point1">
            <div class="point2">
               <img src="/icon/star_on.png" width="120px" height="30px">
            </div>
         </div>
      </div>
      </div>
      
      
   
      <div class="col-md-4 font1" align="center">
	      <div class="profile">
	      <img src="${uphoto.FILELINK}" width="70px"  >
	      </div>
      		<a href="/view/message/send?receiver=${i.HNAME}">${i.HNAME}</a><br/>
	      <c:if test="${i.HNAME eq id}"> 
	      	<a href="/view/delete" >호스팅 삭제하기</a>
	      </c:if>
      </div>
      </div>

      <hr class="line" />
      <div class="row" align="center">
         <div class="col-md-3">
            <img src="/icon/htype.png" class="icon">
         </div>
         <div class="col-md-3">
            <img src="/icon/bedcnt.png" class="icon">
         </div>
         <div class="col-md-3">
            <img src="/icon/membercnt.png" class="icon">
         </div>
         <div class="col-md-3">
            <img src="/icon/bathcnt.png" class="icon">
         </div>
      </div>
      
      <div class="row font1" align="center" >
      <div class="col-md-3">
      ${i.HTYPE}[${i.RTYPE}(${i.ROOMCNT}개)]
      </div>
      <div class="col-md-3" >
      침대 ${i.BEDCNT}개
      </div>
      <div class="col-md-3">
      인원 ${i.MEMBERCNT}명
      </div>
      <div class="col-md-3">
      욕실 ${i.BATHCNT}개
      </div>
      </div>
      </c:forEach>
      </div>
      
      <div class="row"  style="padding-top: 5%; margin: 0 150; padding-right: 25px; padding-left: 25px;">
   <div class="col-md-8" >
      <c:forEach var="i" items="${list}">
      <hr />
      <div class="font2">상세설명</div>
      <hr />
      <!-- 숙소 -->
      <div class="row font1">
      <div class="col-md-4" style="font-weight: bold;" >
      숙소
      </div>
      <div class="col-md-4">
      집 유형: ${i.HTYPE}<br/>
      숙박 가능 인원: ${i.MEMBERCNT}<br/>
      방 개수: ${i.ROOMCNT}<br/>
      침대 개수: ${i.BEDCNT}<br/>
      </div>
      <div class="col-md-4">
      체크인: ${i.STARTDATE}<br/>
      체크아웃: ${i.ENDDATE}<br/>
      </div>
      </div>
      <hr />
      <!-- 시설 -->
      <div class="row font1">
      <div class="col-md-4"  style="font-weight: bold;">
      편의
      </div>
      <div class="col-md-8">
      ${i.AMENITY}<br/>
      </div>

      </div>
      <hr />
      <!-- 가격 -->
      <div class="row font1">
      <div class="col-md-4"  style="font-weight: bold;">
      가격
      </div>
      <div class="col-md-4">
      주중 ${i.PRICE}원
      </div>
      <div class="col-md-4">
      주말 ${i.PRICE+20000}원
      </div>
      </div>
      
      <hr />
      <!-- 설명 -->
      <div class="row font1">
      <div class="col-md-4"  style="font-weight: bold;">
      설명
      </div>
      <div class="col-md-8">
      ${i.INTRO }
      </div>
      </div>
      <hr />
      <!-- 규칙 -->
      <div class="row font1">
      <div class="col-md-4"  style="font-weight: bold;">
      규칙
      </div>
      <div class="col-md-8">
      ${i.RULE}
      </div>
      </div>
   </c:forEach>
      <hr/>
      <div class="row font2">
      사진
      <hr/>
      </div>
      
      <div class="row" align="center">
   
      <c:forEach var="i" items="${hphoto}">
      <img src="${i.FILELINK}" width="70%">
      <br/><br/><br/>
      </c:forEach>
      </div>
      
         <!-- 리뷰 -->
   <hr/>
   <div class="row">
   <div class="col-md-3">
   <div class="font2">후기 ${reviewcnt[0].CNT}개 <span class="font3" >${score/10}점</span> </div>
   </div>
   <div class="col-md-5" align="left">
   
            <div class="point1">
            <div class="point2" >
               <img src="/icon/star_on.png" width="120px" height="30px">
            </div>
         </div>
   </div>
   <div class="col-md-4">
  <button id="myBtn1" class="btn">후기등록</button>
   </div>
   

   </div>
   <hr/>
   <c:choose>
      <c:when test="${review.size() gt 0 }">
      <c:forEach var ="i" begin="0" end="${review.size()-1}">
   <div class="row font1">
   <div class="col-md-1"  align="center">
      <div class="profile">
      <img src="${reviewerphoto[i].FILELINK} " width="70px">
      </div>
   </div>
   <div class="col-md-11" style="padding-left: 5%;" >
      <b><a href="/view/message/send?receiver=${review[i].WRITER}"> ${review[i].WRITER}</a></b>
         <div class="point1">
            <div class="point2_r" style="width: ${review[i].GRADE*10}%;">
               <img src="/icon/star_on.png" width="120px" height="30px">
            </div>
         </div>
      
      ${review[i].CONTENT}
      <hr/>
   </div>
   </div>
      </c:forEach>
      </c:when>
      <c:otherwise>
         등록된 후기가 없습니다.
      </c:otherwise>
   </c:choose>
      
   
</div>

<!-- =============================== -->

<!-- Trigger/Open The Modal -->

<!-- The Modal -->
<div id="myModal1" class="modal1">

  <!-- Modal content -->
  <div class="modal-content1">
    <span class="close1">&times;</span>
    <div align="center">
    <h2>후기 등록</h2> <br/>
    <b>[NO.${list[0].NUM}] ${list[0].TITLE}</b><br/>
<textarea  rows="6" cols="80" id="content" class="form-control" placeholder="후기를 입력해주세요" 
name="textarea" maxlength="200" ></textarea>

<div class="row">
<img src="/icon/star_1.png" width="25px" height="29px"><input type="radio" value="1" name="grade" />
<img src="/icon/star_2.png" width="45px" height="29px"><input type="radio" value="2.5" name="grade" />
<img src="/icon/star_3.png" width="70px" height="29px"><input type="radio" value="5" name="grade" />
<img src="/icon/star_4.png" width="89px" height="29px"><input type="radio" value="7.5" name="grade" />
<img src="/icon/star_on.png"  height="30px"><input type="radio" value="10" name="grade" />
</div>

 <br/>
 <button type="submit" id="Rbtn" style="background-color: white; border-style: solid; border-color: orange; border-width: 2px;  width: 80px;">등록</button>
  </div>
</div>
</div>

<hr/>
<div class="col-md-4 " >
<div class="bookbox">
<form action="/reservation/reserve01" method="get" style="margin-bottom: 0;">
<div style="padding-top: 5%; padding-left: 5%; padding-bottom: 1%; font-size: 2em; font-weight: bold; 
background-color: 309; "><font color="white" id="price">₩ ${list[0].PRICE} <span style="font-size: 0.6em;">1박</span></font></div>
<div class="row" style="padding: 5%;">
<div class="col-md-6" style="padding-left: 8%;">
체크인<input type="text" size="15" name="checkin" id="testDatepicker">
</div>
<div class="col-md-6" style="padding-left: 8%;">
체크아웃<input type="text" size="15"  name="checkout" id="testDatepicker2">
</div>
</div>
<div class="row"  style="padding-left: 13%; ">인원</div>
<div class="row" align ="center" style="padding-left: 5%; padding-right: 5%; padding-bottom: 5%;">
<select name="membercnt" id="member" style="width: 300px; height: 40px;">
<option value="0">인원을 선택하세요</option>
      <c:forEach var="item" begin="1" end="20" varStatus="vs">
      <option value="${item}">${item}명</option>
      </c:forEach>
</select>
</div>
<input type="text" name="num" value="${list[0].NUM}" hidden="true"/>
<button type="submit" id="book" style=" background-color: CC3300; width: 100%; 
font-size: 1.3em; font-weight: bold; padding-top: 2%; padding-bottom: 2%;"><font color="white">예 약 하 기</font></button>
</form>

</div>
</div>
</div>



<script>
var num = ${list[0].NUM};

// Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];
var num = ${list[0].NUM};
// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}


$("#Rbtn").click(function(){
   var msg = $("#content").val();
   var grade = $('input:radio[name="grade"]:checked').val();
   console.log("review/resultAjax?msg="+msg+"&grade="+grade+"&hostingnum="+num);
    $.ajax({
      url : "review/resultAjax?msg="+msg+"&grade="+grade+"&hostingnum="+num
   }).done(function(txt){
      modal1.style.display = "none";
      location.reload();
   }); 
});
   
   

$("#content").onkeyup = function(obj){
   var maxLength = parseInt(obj.getAttribute("maxlength"));
      if(obj.value.length>maxLength){
      obj.value = obj.value.substring(0, maxLength);
      }
};


/* datepicker area */
var min;
var max;

var startdate = "${list[0].STARTDATE}";
var enddate = "${list[0].ENDDATE}";
/* 2017-03-17 */
/* 03/28/2017 */
var day = startdate.split(' ');
var day2 = enddate.split(' ');
var ar1 = day[0].split("-");
var ar2 = day2[0].split("-");

var date1 = ar1[1]+"/"+ar1[2]+"/"+ar1[0];
var date2 = ar2[1]+"/"+ar2[2]+"/"+ar2[0];


console.log(date1);
console.log(date2);

$('#testDatepicker').datepicker();

$('#testDatepicker').datepicker("option", "minDate",date1);
$('#testDatepicker').datepicker("option", "maxDate", date2);

$('#testDatepicker2').datepicker();

$('#testDatepicker2').datepicker("option", "minDate", date1);
$('#testDatepicker2').datepicker("option", "maxDate", date2);


   $("#testDatepicker").datepicker({

            dateFormat: 'yyyy-mm-dd',
            changeMonth : true,
            changeYear : true,
            nextText : '다음 달',
            prevText : '이전 달',
            minDate : 0,
            maxDate : 0,
            onSelect : function(dateText, init) {
               console.log(dateText);
            }
   });
   
    $('#testDatepicker').datepicker("option", "onClose", function ( selectedDate ) {
       min = selectedDate;
           $("#testDatepicker2").datepicker( "option", "minDate", selectedDate );
       });
    
   $("#testDatepicker2").datepicker({
            dateFormat: 'yyyy-mm-dd',
            changeMonth : true,
            changeYear : true,
            nextText : '다음 달',
            prevText : '이전 달',
            minDate : 0,
            maxDate : "+3M",
            onSelect : function(dateText, init) {
               console.log(dateText);
            }
   });
   
    $('#testDatepicker2').datepicker("option", "onClose", function ( selectedDate ) {
       max = selectedDate;
          
       });
   
   $("#member").change(function(){
      var member = $('#member option:selected').val()
      var mind = ""+min;
      var maxd = ""+max;
      var start = mind.split("/")[1];
      var end = maxd.split("/")[1];
      var days  = end-start;
      console.log(days);
   //   var newDt = new Date(days.replace(/-/g, '/'));
   //   console.log(newDt);
      
      var price = ${list[0].PRICE};
      price += member*10000;
      price = price * days;
      $("#price").html("₩ "+price+"<span style=\"font-size: 0.6em;\"> "+days+"박</span>");
   });
   

</script>
