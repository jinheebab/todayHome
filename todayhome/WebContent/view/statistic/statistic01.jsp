<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<html>
<head>
<title>통계</title>
</head>
<body>
	<div class="container">
		<h2>통계페이지</h2>
		<p>통계 결과를 확인하세요</p>
		<ul class="nav nav-tabs">
			<li><a href="#menu1" >지역별</a></li>
			<li><a href="#menu2">국가비율</a></li>
			<li><a href="#menu3">나라별 회원수</a></li>
		</ul>
		<div class="tab-content">
			<!-- ///////////////////////////////////////////////////////////////////지역별/////////////////////////////////////////////////////////////////////////////// -->
			<div id="menu1" class="tab-pane fade in active">
				<h3>지역별 호스팅 분포도</h3>
				<button type="button" class="btn btn-danger" id="goChart">차트보기</button>
				<script>
	$('#goChart').click(function(){
		$(location).attr('href', "/statistic/graph01");
	});
</script>
			</div>
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div id="menu2" class="tab-pane fade">
				<h3>국가별 호스팅 및 회원</h3>
				<button type="button" class="btn btn-danger" id="goChart2">차트보기</button>
				<script>
	$('#goChart2').click(function(){
		$(location).attr('href', "/statistic/graph02");
	});
	</script>
			</div>
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div id="menu3" class="tab-pane fade">
				<h3>나라별 회원수</h3>
				<button type="button" class="btn btn-danger" id="goChart3">차트보기</button>
			</div>
		</div>
		<hr>
		<script>
	$('#goChart3').click(function(){
		
		$(location).attr('href', "/statistic/graph03");
		
	});
	
	</script>
	</div>

	<script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
    $('.nav-tabs a').on('shown.bs.tab', function(event){
        var x = $(event.target).text();         // active tab
        var y = $(event.relatedTarget).text();  // previous tab
        $(".act span").text(x);
        $(".prev span").text(y);
    });
});

</script>

</body>
</html>
