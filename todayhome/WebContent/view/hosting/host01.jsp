<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>호스팅 1단계</h2>
  <p>${id}님 안녕하세요! 호스팅 등록을 도와드리겠습니다</p>
	  	<div class="dropdown">
		    <select id="roomType">
		   <option value="allRoom">집전체</option>
		   <option value="oneRoom">일인실</option>
		   <option value="manyRoom">다인실</option>
			</select>
	  	</div>
  	
	  	<div class="dropdown">
		    <select id="people">
		    
		    <c:forEach var="item" items="${cnt}" begin=0 end=15 step=1 varStatus="status">
		   		<option value="allRoom">${cnt}인실</option> <c:if test="${not status.last}"> <br> </c:if>
		   </c:forEach>
			</select>
	  	</div>
  </div>

</body>
</html>
