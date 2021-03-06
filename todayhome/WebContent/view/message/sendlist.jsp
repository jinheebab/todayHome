<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.receiver{
	margin-top: 2%;
	margin-bottom: 0;
	margin-right: 85%;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	padding: 1%;
	padding-bottom: 0.5%;
	border-style: solid;
	border-bottom-style: none;
 	border-width: 2px; 
	border-color: 2F97F2;
	font-weight: bold;
	font-size: 1.1em;
}
.content{
	margin-top: 0;
	margin-bottom: 2%;
/* 	border-style: solid;
 	border-width: 2px;
	border-color: grey;  */
	padding: 2%;
	padding-bottom: 0.5%;
	font-size: 1.1em;
	background-color: E3F7FC;
}
.title{
	font-family: 나눔고딕;
	font-size: 2em;
	padding-bottom: 3%;
	padding-left: 0;
	margin-left: -15;

}
.pad{

	padding: 5%;
	
}
.navbtn{
	background-color: 2F97F2;
	border-style: solid;
	border-color: 2F97F2;
	border-width: thin;
	font-weight: bold;
	color: white;
}
.selectbtn{
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-style: solid;
	border-color: 2F97F2;
	border-width: thin;
	font-weight: bold;
	color: black;

}
</style>
	<div class="pad">
	<div class="title">보낸 메시지</div>
	<ul class="nav nav-tabs" style="margin-left:-15; margin-right: -15; border-bottom-style: solid; border-bottom-width:3px; ">
		<li class="navbtn"><a href="/view/message?page=1" style="color: white;">받은 메시지</a></li>
		<li class="selectbtn"><a href="/view/message/sendlist?page=1" style="color:black;">보낸 메시지</a></li>
		<li class="navbtn"><a href="/view/message/send?receiver="style="color: white;">작성</a></li>
	</ul>
		<c:forEach var="i" items="${list}" begin="${page*5-5}" end="${page*5-1}">
	<div class="row">
			<div class="receiver">
				<span style="font-size: 0.8em;">To.</span>
				<a href="/view/message/send?receiver=${i.RECEIVER}" title="${i.RECEIVER}에게 메시지 보내기" style="color: black" > ${i.RECEIVER}</a>
			</div>
			<div class="content">
				${i.CONTENT}
				<div align="right" style="font-size: 0.9em;">
				<b><fmt:formatDate value="${i.WRITETIME }" pattern="yyyy. MM. dd " />
				<fmt:formatDate value="${i.WRITETIME }" pattern="a hh:mm" />
				</b>
				</div> 
			</div>
	</div>
		</c:forEach>
	
				
	<!-- 페이징 -->
	<div align= "center">
		<c:if test="${page ne 1 }">
			<a href="/view/message/sendlist?page=${page -1}">이전</a>
		</c:if>
		<c:forEach var="p" begin="1" end="${size}" varStatus="vs" >
			<c:choose>
				<c:when test="${p eq page}">
					<b>${p}</b>
				</c:when>
				<c:otherwise>
				<a href="/view/message/sendlist?page=${p}">${p}</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${vs.last eq false }">|</c:if>
		</c:forEach>
		<c:if test="${page ne size and size gt 1}">
			<a href="/view/message/sendlist?page=${page +1 }">다음</a>
		</c:if>	
</div>
</div>
