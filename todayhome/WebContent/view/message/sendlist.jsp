<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

/* td, th {
	border: 1px solid #dddddd; /* ffffff  */
	text-align: left;
	padding: 8px;
} */

tr:nth-child(even) {
	background-color: #dddddd; /* dddddd  */
}
</style>

<div class="container" align="left">
	<h3>발신함</h3>
	<ul class="nav nav-tabs">
		<li><a href="/view/message">받은 메시지</a></li>
		<li><a href="/view/message/sendlist">보낸 메시지</a></li>
		<li><a href="/view/message/send">작성</a></li>
	</ul>
	<br />
	
	<table class="table">
		<thead>
			<tr>
				<th width="15%">받는 사람</th>
				<th width="72%">내 용</th>
				<th width="13%">보낸 시간</th>
			</tr>
		</thead>
		<c:forEach var="all" items="${boards}">
			<tr>
				<td>${all.RECEIVER}</td>
				<td>${all.CONTENT}</td>
				<td><fmt:formatDate value="${all.WRITETIME }" pattern="yy / MM / dd ( E ) " />  <br/>
					<fmt:formatDate value="${all.WRITETIME }" pattern="a: hh시 mm분" /> </td>
			</tr>
		</c:forEach>
	</table>
	
	<br />
	<div align="left">
		<button style="width: 20%; font-size: 14px;"
			class="btn btn-primary btn-block"
			onClick="location.href='/view/message/send'">작 성</button>
	</div>		
	<br/>
				
	<ul class="nav nav-tabs"></ul>
	
	<div align="left">
		<c:if test="${page ne 1 }">
			<a href="/view/message/sendlist?page=${page -1 }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">이전</a>
		</c:if>
		<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
			<c:choose>
				<c:when test="${p eq page }">
					<b>${p }</b>
				</c:when>
				<c:otherwise>
					<a href="/view/message/sendlist?page=${p }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">${p }</a>	
				</c:otherwise>
			</c:choose>
			<c:if test="${vs.last eq false }">|</c:if>
		</c:forEach>
		<c:if test="${page ne size }">
			<a href="/view/message/sendlist?page=${page +1 }&target=${searchK.target}&sdate=${searchK.sdate}&edate=${searchK.edate}&cnt=${searchK.cnt}">다음</a>
		</c:if>	
	</div>

	<br />

</div>





<br />
<br />


</body>
</html>












