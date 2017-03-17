<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		
<div>
	<h3>INFO</h3>
</div>
<div class="well row" style="background-color: white">	
	<div class="col-md-3" align="center" style="background-color: white">
		<form action="/info/ajax" method="post" enctype="multipart/form-data">
				<b>PICTURE</b><br />
				<img src="${val.PICURL}" width="200" height="200"/>
				<hr/>
				<input type="file" class="form-control"	name="pic" />
				<br/>
				<button type="submit" class="btn">사진변경</button>
		</form>
	</div>
	<div class="col-md-9" style="background-color: white">
		<form action="/info/ajax" method="post">
		<p>
			<b>ID</b><br/>
			<span id="id"> ${val.ID}</span>
		</p>
		<p>
			<b>PASS</b><br/>
			<input type="password" class="form-control" name="pass" id="pass" value="${val.PASS}"/>
		</p>
		<p>
			<b>NAME</b><br/>
			<input type="text" class="form-control" name="name" id="name" value="${val.NAME}"/>
		</p>
		<p>
			<b>GENDER</b><br/>
			<select name="gender" class="form-control" id="gender">
				<option value="male" ${val.GENDER eq 'male' ? 'selected' : ''}>남</option>
				<option value="female" ${val.GENDER eq 'female' ? 'selected' : ''}>여</option>
			</select> 
		</p>
		<p>
			<b>BIRTH</b><br/>
			<input class="form-control" type="date" name="birth"  id="birth"  value="<fmt:formatDate value="${val.BIRTH}" pattern="yyyy-MM-dd"/>"/>
		</p>
		<p>
			<b>E-MAIL</b><br/>
			<input type="email" class="form-control" name="mail" id="mail" value="${val.MAIL} "/>
		</p>
		<p>
			<b>COUNTRY</b><br/>
				<select class="form-control" name="country"  id="country" >
					<c:forEach var="item" items="${list}">
						<option value="${item }" ${val.COUNTRY eq item  ? 'selected' : ''}>${item }</option>
					</c:forEach>
				</select>
		</p>
		<br/>
		<p>
			<button type="submit" class="btn">변경하기</button>
			<a href="/info/withdraw"><button type="button" class="btn">탈퇴하기</button></a>
		</p>
	</form>
	</div>
</div>



    