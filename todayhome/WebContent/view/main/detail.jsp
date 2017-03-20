<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
.icon {
	width: 60px;
	height: 60px;
}
.font1{
	font-size: 1.2em;
	line-height: 1.9em;
}
.font2{
	font-size: 1.7em;
}
.profile{
	overflow: hidden;
	width: 70px;
	height: 70px;
	border-radius: 50%;

}
</style>

<div style="padding-top: 5%;">
	<c:forEach var="i" items="${list}">
		<span class="title">${i.TITLE}</span>
		<br />
		
			<div class="row" >
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
		<img src="${uphoto[0].FILELINK}" width="70px"  >
		</div>
			<a href="/view/message/send?id=${i.HNAME}">${i.HNAME}</a> 
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
		<div class="col-md-3">
		침대 ${i.BEDCNT}개
		</div>
		<div class="col-md-3">
		인원 ${i.MEMBERCNT}명
		</div>
		<div class="col-md-3">
		욕실 ${i.BATHCNT}개
		</div>
		</div>
		<hr />
		<div class="font2">상세설명</div>
		<hr />
		<!-- 숙소 -->
		<div class="row font1">
		<div class="col-md-4">
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
		<div class="col-md-4">
		편의
		</div>
		<div class="col-md-4">
		${i.AMENITY}<br/>
		</div>
		<div class="col-md-4">
		
		</div>
		</div>
		<hr />
		<!-- 가격 -->
		<div class="row font1">
		<div class="col-md-4" >
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
		<div class="col-md-4">
		설명
		</div>
		<div class="col-md-8">
		${i.INTRO }
		</div>
		</div>
		<hr />
		<!-- 규칙 -->
		<div class="row font1">
		<div class="col-md-4">
		규칙
		</div>
		<div class="col-md-8">
		${i.RULE}
		</div>
		</div>
		
		<div class="row">
		${hphoto}
		</div>
		
	</c:forEach>

			<!-- 리뷰 -->
	<hr/>
	<div class="font2">후기</div>
	<hr/>
	<div class="row font1">

		<c:forEach var="r" items="${review}">
		no.${r.NUM} ${r.WRITER}
		<br/>
		${r.CONTENT}
		<hr/>
		</c:forEach>
	</div>
	

	
	
	
</div>

