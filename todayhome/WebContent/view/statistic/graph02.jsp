<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>인기순위</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>호스팅 인기순위</h2>
  <p>평균 평점을 매겨 순위를 산정했습니다</p>
  <table class="table">
    <thead>
      <tr>
        <th>순위</th>
        <th>호스팅번호</th>
        <th>호스팅제목</th>
        <th>호스팅 주소</th>
      </tr>
    </thead>
    <tbody>
      
      <c:forEach items="${list}" var="x" varStatus="vs">
          
      <tr class="success">
      	<td>${vs.count}위</td>
        <td>${x.NUM}</td>
        <td>${x.TITLE}</td>
        <td>${x.ADDRESS}</td>
      </tr>
      
     </c:forEach>
    </tbody>
  </table>
</div>

<script>





</script>




</body>
</html>