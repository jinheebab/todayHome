<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <br/><br/> 
<div align="center" >	
<div class="row">
<c:forEach var="i" items="${list}" end="3">
<div class="col-md-4">
	<div style="width: 480.5px; height: 320.33px; overflow: hidden;">
  <img src="${i.PICURL}" width=600px height=350px  >
  </div>

 <b><span style="font-family:Arial Black; font-size: medium;">
 ${i.TITLE} .${i.COUNTRY}  [${i.HTYPE}] | ₩${i.PRICE} </span></b>  <br/>  <br/>
  </div>
 </c:forEach>
  </div>
  <br/><br/>
  <b>오늘만큼은 여기가 우리 집이에요. 전 세계에 있는 우리 집을 경험해보세요.</b>
 </div>
