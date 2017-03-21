<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="well row" style="background-color: white">	
<%-- 	<span id="cnt">${}개 호스팅이 등록되어 있습니다.</span> --%>
	<div class="col-md-3" align="center" style="background-color: white">
		<div style="width: 200px; height: 200px; border-radius: 50%; overflow: hidden;">
			<c:forEach var="list" items="${val}">
				<img src="${list.PICURL}" width="200px"  />
			</c:forEach>
		</div>
	</div>
	<div class="col-md-9" style="background-color: white">
	</div>
</div>