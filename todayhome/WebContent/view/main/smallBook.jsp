<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<input type="text" id="testDatepicker">
<input type="text" id="testDatepicker2" name="end">

<script>
var min;
var max;

	$("#testDatepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				/*  minDate : -10, */
				minDate : 0,
				maxDate : "+3D",
				onSelect : function(dateText) {
					min = this.value;
				}
	});
	

	$("#testDatepicker2").datepicker({
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				minDate : -20,
				maxDate : "+3M",
				onSelect : function(dateText) {
					max = this.value;
				}
	});
	
	 $('#testDatepicker').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#testDatepicker2").datepicker( "option", "minDate", selectedDate );
	    });
	 
	 var day = "2017-03-01";	 
	 $('#testDatepicker').datepicker();
	 
	  $('#testDatepicker').datepicker("option", "minDate", day);
		

</script>