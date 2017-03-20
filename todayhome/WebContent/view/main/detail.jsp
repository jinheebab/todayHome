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
.line{
	padding-top: 2%; 
	border-bottom-style: solid; 
	border-bottom-width: 1.5px; 
	border-bottom-color: black; 
	margin-top: 10px;
}
.point1 {
       background-image:url('/icon/star_off.png');
        width:120px;
        height:30px;
    }
.point2 {
        overflow:hidden;
        width: ${score}%;
    }
</style>

<div style="padding-top: 5%;">
	<c:forEach var="i" items="${list}">
		<span class="title">${i.TITLE}</span>
		<br />
		<div class="location">${i.COUNTRY},${i.CITY} 
		<div class="point1">
		<div class="point2" ><img src="/icon/star_on.png" width="120px" height="30px"></div></div>
		</div> 

		<hr class="line" />
		${i.HTYPE} ${i.RTYPE} ${i.RCNT} ${i.MEMBERCNT}
		
	</c:forEach>
</div>

