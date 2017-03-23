<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action="/search/search" method="post">
	<div align="center">
		<table style="width: 70%; height: 5%; border: 0px; border-collapse: collapse;">
			<tr style="text-align: left; height: 30px;">
				<td>
	                <label for="checkin">위치</label>
	                <span class="glyphicon glyphicon-map-marker"></span><br/>
	                <input type="text" id="target" name="target" size="20%" placeholder="목적지, 도시명, 주소" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
	                <label for="checkin">체크인</label>
	                <span class="glyphicon glyphicon-calendar"></span><br/>
	                <input type="text" id="sdate" name="sdate" size="20%" placeholder="체크인 날짜를 입력하세요" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
	                <label for="checkin">체크아웃</label>
	                <span class="glyphicon glyphicon-calendar"></span><br/>
	                <input type="text" id="edate" name="edate" size="22%" placeholder="체크아웃 날짜를 입력하세요" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
					<label for="cnt">인원</label> 
					<span class="glyphicon glyphicon-user"></span><br /> 
					<select class="form-control" name="cnt" id="cnt" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
						<option value="0">인원을 선택하세요</option>
							<c:forEach var="item" begin="1" end="20" varStatus="vs">
								<option value="${item}">${item }명</option>
							</c:forEach>
					</select>
				</td>
				<td>
					<button type="submit" class="btn" style="width: 120px; height: 50px; border: none; background-color: #bb5d00;" onclick="javascript:alert()">
						<font style="color: white; font-size: 25px; font-family: 나눔고딕"><b>
						<span class="glyphicon glyphicon-search"></span></b></font>
					</button>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
<script>
	function alert( ) {
		
		var flag1 = document.getElementById("target").value;
		var flag2 = document.getElementById("sdate").value;
		var flag3 = document.getElementById("edate").value;
		var flag4 = document.getElementById("cnt").value;
			
		if(flag1==null || flag2==null || flag3==null || flag4==0){
			window.alert("목적지, 체크인/아웃 날짜, 인원을 모두 입력해주세요");
		}
	}
</script>
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
	    	    
</script>