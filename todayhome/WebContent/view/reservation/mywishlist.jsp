<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

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
.side{
	font-size: 1.2em; 
	color: black;
	text-align: right;
}
</style>

<div class="pan">
<div class="font2">나의 예약정보</div>
    <div class="row" style="margin-bottom: 5%;">
<span class="font1">나의 예약 목록</span>
	  <div class="side">
       <c:if test="${wishlist.size() gt 3 }">
		<a href="/reservation/booklist?id=${sessionScope.auth}"><font color="grey">더보기></font></a>
		</c:if>
		</div>
	<hr class="line"/>


       <c:forEach items="${wishlist}" var="x" end ="2">
  		  <div class="col-md-4">
                <div class="frame">
                    <img src= "${x.PICURL}" width="400px"/>
                </div>
                    <a href="/view/detail?num=${x.NUM}"> 
                    <b><font color="black">${fn:substring(x.TITLE,0,23)}<c:if test="${fn:length(x.TITLE) gt 23}">..</c:if></font></b> </a>
           </div>
       </c:forEach>
		</div>
	
	
	<div class="row">
	<div class="font1">나의 호스팅 목록</div>
	  <div class="side">
       <c:if test="${hostinglist.size() gt 3 }">
		<a href="/reservation/hostinglist?id=${hostinglist[0].HNAME}"><font color="grey">더보기></font></a>
		</c:if>
		</div>
	<hr class="line"/>
	
	
       <c:forEach items="${hostinglist}" var="x" end ="2">
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
	
		

