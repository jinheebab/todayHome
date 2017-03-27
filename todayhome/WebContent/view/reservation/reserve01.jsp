<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<style>
.pan{
	padding-top: 2%; 
	margin-right: 200; 
	margin-left: 200; 
	padding-right: 30px; 
	padding-left: 30px;
}
.font1{
   font-size: 1.2em;
   line-height: 1.9em;
      padding-top: 1%;
}
.font2{
   font-size: 2.5em;
   padding-top: 1%;
}
.font3{
   font-size: 0.7em;
}
.line {
   padding-top: 2%;
   border-bottom-style: solid;
   border-bottom-width: 1.5px;
   border-bottom-color: black;
   margin-top: 10px;
}
.total{
	text-align: center;
	font-weight: bolder;
	color: white;
	font-size: 2em;
	background-color: B35656;
	border-radius: 10%;
	margin-right: 10%; 
	margin-left: 10%; 
	padding-top: 5%;
	padding-bottom: 5%;

}

.box{
	background-color: F2F2F2;
	padding: 0;
	
	

}
.pricebox{
	background-color: black;
	text-align: right;
	color: white;
	font-size: 2em;
	padding-top: 5%;
	padding-bottom: 2%;
	padding-left: 5%;
	padding-right: 5%;
	font-weight: bolder;
	
	
}
.reserve{
	font-weight: bold;
	font-family: MS Sans Serif;
	font-size: 1.2em;
	line-height: 1.5em;
	padding-bottom: 5%;
	padding-top: 5%;
	padding-right: 5%;
	padding-left: 5%;
	
}
.summery{
	font-size: 1em;
	line-height: 1.7em;
	padding: 5%;

}
.frame{
	padding: 0;
	margin-left: 0;
	margin-right:0;
	overflow: hidden;
	
}
</style>



<div class="row pan" >
<div class="col-md-8">
<span class="font2">예약하기</span><br/>
<hr/>

<form action="/reservation/reserve02">
<input type="hidden" readonly="readonly" id="hostingnum" name="hostingnum" value="${hostingnum}">
 <input type="hidden" readonly="readonly" id="totalmoney" name="totalmoney" placeholder="총결제금액">
 
 
 <div class="row">
 <div class="col-md-6">
 <span class="font1">체크인</span><br/>
 <input type="text" size="30" id="sdate" name="startdate" class="datepicker">
 </div>
 
 <div class="col-md-6">
 <span class="font1"> 체크아웃 </span><br/>
  <input type="text" size="30" id="edate" name="enddate" class="datepicker">
 </div>
 </div>
 
 <div class="row" style="margin-top: 5%;">
 <div class="col-md-6">
 <input type="number" size="30" min="1" max="20" placeholder="1" id="people" name="membercnt"> <span class="font1">명</span>
 </div>
 </div>
 
 
 <div class="row" style="margin-top: 5%;">
 <div class="col-md-9">
<span class="font1"> 호스트에게 간단한 자기소개를 하고 여행가는 이유를 알려주세요</span><br/>
  
 <textarea rows="5" cols="50" id="intro" name=intro></textarea><br/>
  </div>
 </div>
 
  <hr/> 
 <div class="row">
 <div class="col-md-7">
 <span class="font1">※ 이용수칙 ※</span>
  
  <div style="font-weight: bold; margin-top: 5%;" id="rule" >${hostinglist.RULE}</div><br/>
  <input type="radio" name="agree" value="agree" >이용수칙에 동의합니다.&nbsp;&nbsp;
  <input type="radio" name="agree" value="disagree" >이용수칙에 동의하지 않습니다.
  </div>
</div>
 


<div class="row" align="center" style="margin-top: 5%; margin-bottom: 5%;">
<button id="pay" type="submit" class="btn btn-primary">결제하기</button>
</div>
</form>

 </div>
 
 
 <div class="col-md-4 box">
 <div class="frame" align="center">
 <img src="${hostinglist.PICURL}" width= "380px"/>
 </div>
  <div  class="summery">
 <b>${hostinglist.TITLE}</b><br/>
 ${fn:substring(hostinglist.INTRO, 0, 20)}
 </div>
 <div id="reserveinfo"  class="reserve" ></div>
<div id="total" class="pricebox" name="total"></div>

</div>
</div>




  <script>
  $("#pay").attr("disabled", true);
	 setInterval(reserveView,100);
  
  $(document).ready(function(){
	  
	 reserveView(); 
	 
  });
  
  function reserveView(){
	  
	var date1 = new Date($("#sdate").datepicker("getDate"));
	var date2 = new Date($("#edate").datepicker("getDate"));
	
	var clean = 49999;
	
	var service = 29069;

	var reserve_time = date2 - date1;
	
	var reserve_time2 = reserve_time/86400000;
	
	var people = $('#people').val();
	
	var total = reserve_time2 * 50000 + clean + service + people*10000;
	
	var intro = $('#intro').val();

	$('#reserveinfo').html(reserve_time2 + "박 = " + 50000*reserve_time2 + "원 <br/>+<br/>청소비 = " + clean + "원<br/>+<br/> 서비스수수료 = " 
			+ service +"원<br/>+<br/>인원수 " + people + "명 = " + people*10000 + "원 <br/>" + "<hr/>메세지 <br/>" + intro);
	
	$('#total').html("<span style=\"font-size: 0.6em; color: red;\">total</span> "+total + "원");
	
	$('#totalmoney').val(total);
	
  }
  
  var startdate = "${hostinglist.STARTDATE}";
  
  var startdate2 = startdate.split(' ');
  
  console.log(startdate2[0]);
  
  
  
  
  
  var enddate = "${hostinglist.ENDDATE}";
  
  var enddate2 = enddate.split(' ');
  console.log(enddate2[0]);
  
  
//===============================================================================================================
	
	
var disabledate = ${reserve};

console.log(disabledate);

//var disabledate2 = "2017-04-01, 2017-04-02";

	
	
  
  $.datepicker.regional['ko'] = {
		  
		  minDate : 0,
		  changeMonth: true,
	      changeYear: true,		  
	      dateFormat: 'yy-mm-dd',
	      beforeShowDay: function(day){
	    	  
	    	  if(disabledate.indexOf($.datepicker.formatDate('yy-mm-dd', day)) != -1) return [false, "disabledate", "beforeShowDay로 블록"];
	            else return [true, "", ""];
		}
  }
  
  $.datepicker.setDefaults($.datepicker.regional['ko']);
  
  $('#sdate').datepicker();
 
  $('#sdate').datepicker("option", "minDate", startdate2[0]);
  $('#sdate').datepicker("option", "maxDate", enddate2[0]);
  

   $('#edate').datepicker();
   
   $('#edate').datepicker("option", "minDate", startdate2[0]);
   $('#edate').datepicker("option", "maxDate", enddate2[0]);
  
   $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
		 min = selectedDate;
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	    });
	function noDays(date) {
	    	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    	for (i = 0; i < disabledDays.length; i++) {
	      	  if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
	       	     return [false];
	      	  }
	  	  }
	   	 return [true];
		}
	
	$('input[name="agree"]').change(function(){
		if($(this).val() == "agree"){
			$("#pay").attr("disabled", false);
			console.log("agree");
		}else if($(this).val() =="disagree"){
			window.alert("이용수칙에 동의해야 합니다");
			console.log("disagree");
			$("#pay").attr("disabled", true);
		}		
		
	});
	

</script>
 
