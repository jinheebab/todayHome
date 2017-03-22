<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br />
<h3>
	<span id="cnt">${vall.count}개 호스팅이 등록되어 있습니다.</span>
</h3>
<div class="well row" style="overflow:scroll; background-color:white;" >
	<div class="col-md-3" align="center" style="background-color: white">
		<c:forEach var="list" items="${val}">
			<br/>
			<div align="center">
				<img src="${list.PICURL}" width="400px" height="300px" />
				<b>
					<span>\<fmt:formatNumber value="${list.PRICE}" pattern="#,###"/></span>
					<span>${list.TITLE}</span><br/>
				</b>
				<span>${list.HTYPE}</span>
				<span>침대 ${list.BEDCNT}개</span>
			</div>
			<br/>
		</c:forEach>
	</div>
	<div class="col-md-9" style="background-color: white">
		
	</div>
</div>

