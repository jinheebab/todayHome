<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<form action="/search/search" method="post">
	<div align="center">
		<table style="width: 70%; height: 5%; border: 0px; border-collapse: collapse;">
			<tr style="text-align: left; height: 30px;">
				<td>
	                <label for="checkin">위치</label>
	                <span class="glyphicon glyphicon-map-marker"></span><br/>
	                <input type="text" id="target" name="target" size="20%" placeholder="목적지, 도시명, 주소" class="form-control" style="width:80%; height:80%; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
	               <label for="checkin">체크인</label>
	                <span class="glyphicon glyphicon-calendar"></span><br/>
	                <input type="text" id="testDatepicker" name="sdate" size="20%" placeholder="체크인 날짜를 입력하세요" class="form-control" style="width:80%; height:80%; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
	                <label for="checkin">체크아웃</label>
	                <span class="glyphicon glyphicon-calendar"></span><br/>
	                <input type="text" id="testDatepicker2" name="edate" size="22%" placeholder="체크아웃 날짜를 입력하세요" class="form-control" style="width:80%; height:80%; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</td>
				<td>
					<label for="cnt">인원</label> 
					<span class="glyphicon glyphicon-user"></span><br /> 
					<select class="form-control" name="cnt" id="cnt" class="form-control" style="width:80%; height:80%; border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" >
						<option value="0">인원을 선택하세요</option>
							<c:forEach var="item" begin="1" end="20" varStatus="vs">
								<option value="${item}">${item }명</option>
							</c:forEach>
					</select>
				</td>
				<td>
					<button type="submit" class="btn" style="width: 120px; height: 50px; border: none; background-color: #bb5d00;">
						<font style="color: white; font-size: 25px; font-family: 나눔고딕"><b>
						<span class="glyphicon glyphicon-search"></span></b></font>
					</button>
				</td>
			</tr>
		</table>
	</div>
</form>

<!-- <input type="text" id="testDatepicker"> -->
<!-- <input type="text" id="testDatepicker2" > -->
<script>
var min;
var max;
	$("#testDatepicker").datepicker({
				dateFormat : "yy-mm-dd",
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				minDate : 0,
				maxDate : "+3M",
				onSelect : function(dateText, init) {
					min = dateText;
					console.log(min);
				}
	
	});
	
	 
	$("#testDatepicker2").datepicker({
				dateFormat : "yy-mm-dd",
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				minDate : 0,
				maxDate : "+3M",
				onSelect : function(dateText, init ) {
					max = dateText;
					console.log(max);
				}
	});
	
	 $('#testDatepicker').datepicker("option", "onClose", function ( selectedDate ) {
		 console.log(selectedDate);
		 $('#testDatepicker2').datepicker("option", "minDate", min);
	    }); 

</script>