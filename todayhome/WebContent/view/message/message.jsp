<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container" align="left">
	<h3>수신함</h3>
	<ul class="nav nav-tabs">
		<li><a href="/view/message">받은 메시지</a></li>
		<li><a href="/view/sendlist">보낸 메시지</a></li>
		<li><a href="/view/send">작성</a></li>

	</ul>
	<br />
	<!-- <p><strong> Receive List </strong> </p> <br/>  -->

	<form action="/message/message" method="post">
		<table class="table">

			<thead>
				<tr>
					<th width="15%">보낸 사람</th>
					<th width="75%">내 용</th>
					<th width="15%">받은 시간</th>
				</tr>
			</thead>

			<c:forEach var="all" items="${listl }">
				<tr>

					<td>${all.SENDER}</td>
					<td>${all.CONTENT}</td>
					<%-- 				<td>${all.CONTENT}</td> --%>

					<td><a href="/message/message?num=${all.NUM}"></a></td>
				</tr>
			</c:forEach>
		</table>
	</form>


	<ul class="nav nav-tabs">
	</ul>
	<br />
	<div align="left">
		<button style="width: 20%; font-size: 14px;"
			class="btn btn-primary btn-block"
			onClick="location.href='/view/send'">작 성</button>
	</div>
	<br />
</div>

<!--  -->




<div class="container" align="left">
	<ul class="nav nav-tabs">
	</ul>
</div>

<div class="container" align="left">
	<ul class="pagination">
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>
<br />
<br />
<!--  -->





<%-- ${listl} --%>



</body>
</html>
