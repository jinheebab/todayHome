<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<style>

.pan{
	padding-top: 2%; 
	margin-right: 200; 
	margin-left: 200; 
	padding-right: 30px; 
	padding-left: 30px;
	/* background-color: grey; */
}
.frame{
	padding-top: 5%;
	padding-bottom: 5%; 
	overflow: hidden;
	
}
.font1{
   font-size: 1.5em;
   line-height: 1.9em;
   padding-top: 1%;
	font-weight: bold;
	font-family: 나눔고딕;
	   
}
.font2{
   font-size: 2.5em;
   padding-top: 2%;
   padding-bottom: 2%;
   margin-bottom: 5%;
}
.font3{
   font-size: 0.7em;
}
.line{

	border-bottom-style: solid; 
	border-bottom-width: 0px; 
	border-bottom-color: black; 
	margin-top: 10px;
}
</style>
 
 
    <div class="pan">
<div class="row">
<div class="font2">나의 예약정보</div>
	<div class="font1">나의 예약 목록</div>
	<hr class="line"/>
       <c:forEach items="${list}" var="x" >
       <div class="col-md-4">
                <div class="frame">
                    <img src="${x.PICURL}" width="400px" />
                </div>
                    <a href="/view/detail?num=${x.NUM}">
                    <b><font color="black">${fn:substring(x.TITLE,0,23)}<c:if test="${fn:length(x.TITLE) gt 23}">..</c:if></font></b> </a>
        </div>
       </c:forEach>

		</div>
		</div>
