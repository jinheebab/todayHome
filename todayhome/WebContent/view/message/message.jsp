<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.sender{
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


</style>
	<h3>수신함</h3>
	<ul class="nav nav-tabs">
		<li><a href="/view/message?page=1">받은 메시지</a></li>
		<li><a href="/view/message/sendlist?page=1">보낸 메시지</a></li>
		<li><a href="/view/message/send">작성</a></li>
	</ul>
		<c:forEach var="i" items="${list}" begin="${page*5-5}" end="${page*5-1}">
	<div class="row">
			<div class="sender">
				<span style="font-size: 0.8em;">From.</span> ${i.SENDER}
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
			<a href="/view/message?page=${page -1}">이전</a>
		</c:if>
		<c:forEach var="p" begin="1" end="${size}" varStatus="vs" >
			<c:choose>
				<c:when test="${p eq page}">
					<b>${p}</b>
				</c:when>
				<c:otherwise>
					<a href="/view/message?page=${p}">${p}</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${vs.last eq false }">|</c:if>
		</c:forEach>
		<c:if test="${page ne size and size gt 1}">
			<a href="/view/message?page=${page +1 }">다음</a>
		</c:if>	
</div>
