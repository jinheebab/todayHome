<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
>>>>>>> branch 'master' of https://github.com/jinheebab/todayhome.git

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
		
<div>
	<h3>INFO</h3>
</div>
<div class="well row" style="background-color: white">	
	<div class="col-md-3" align="center" style="background-color: white">
		<form action="/info/picAjax" method="post" enctype="multipart/form-data">
				<b>PICTURE</b><br />
				<img src="${sharing.FILELINK}" width="200" height="200" />
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
			<button id="withdraw" type="button" class="btn">탈퇴하기</button></a>
		</p>
	</form>
	</div>
</div>

<div id="myModal" class="modal"  >
	<div class="modal-content" style="margin-right: 35%; margin-left:35%;" >
		<div style="padding-right: 10%; padding-left: 10%; padding-bottom: 20%; padding-top: 10%; text-align: center;">
			<span class="close">&times;</span>
				<form action="/info/withdrawAjax" >
					<h3>PASSWORD</h3><br/>
						<input type="password" name="pass" placeholder="비밀번호를 입력하세요"/><br/><br/>
						<button type="submit" class="btn" style="background-color: white; border-style: solid; border-color: orange; border-width: 2px;">탈퇴하기</button>
				</form>
		</div>
	</div>
</div>

<script>
var modal = document.getElementById('myModal');
var btn = document.getElementById("withdraw");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>



    