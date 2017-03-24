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
/* var day = "03/11/2017";	
var day2 = "03/28/2017";	

$('#testDatepicker').datepicker();

$('#testDatepicker').datepicker("option", "minDate", day);
$('#testDatepicker').datepicker("option", "maxDate", day2);

$('#testDatepicker2').datepicker();

$('#testDatepicker2').datepicker("option", "minDate", day);
$('#testDatepicker2').datepicker("option", "maxDate", day2); */


	$("#testDatepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				minDate : 0,
				maxDate : "+3D",
				onSelect : function(dateText) {
					min = this.value;
					console.log(min);
				}
	});
	
	 $('#testDatepicker').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#testDatepicker2").datepicker( "option", "minDate", selectedDate );
	    });
	 
	$("#testDatepicker2").datepicker({
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				minDate : 0,
				maxDate : "+3M",
				onSelect : function(dateText) {
					max = this.value;
					console.log("djdjdj");
				}
	});
	

	  

		

</script>