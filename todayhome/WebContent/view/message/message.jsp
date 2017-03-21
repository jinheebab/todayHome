<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" align="left">
  <h3>수신함</h3>
  <ul class="nav nav-tabs">
    <li><a href="/view/message">받은 메시지</a></li>
    <li><a href="/view/sendlist">보낸 메시지</a></li>
  </ul>	
  <br>	

<!-- <p><strong> Receive List </strong> </p> <br/>  -->
  
  <form align="left" action="/message/message" method="post">
   <table width="100%">
      <tr style="text-align:left; height: 15%;  width: 33%;" >
         <td> NUM </td>
         <td>보낸 사람 (sender)</td>
         <td>내 용 (content)</td>
      </tr>
      
      <c:forEach var="all" items="${listl }">
         <tr style="text-align:left; height: 15%; width: 40px; " >
	        <td>${all.NUM}</td> 
            <td>${all.SENDER}</td>
            <td>${all.CONTENT}</td>
            <td><a href="/message/message?num=${all.NUM}" ></a></td>
         </tr>		
      </c:forEach>	
   </table>			
<div align="left" >
   <hr/>
   <div align="right" >
   </div>
</form>


${listl}



  
  <ul class="nav nav-tabs"> </ul> <br/>
  <button style="background-color: #E5E5E5; color: black ; border:none;
  text-align: right; font-size: 14px;" class="btn btn-success"
  onClick="location.href='/view/send'">작성</button>
  

</div>

</body> 
</html>	
