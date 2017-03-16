<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<div>
	<h3>기본정보 입력</h3>
</div>
<div>
	<div class="col-md-3" style="background-color:white">
		<form action="/info/pictureAjax.jsp" method="post" enctype="multipart/form-data">
			<b>PICTURE</b><br />
			<img src="${val.URL}" width="200" height="200"/>
			<hr/>
			<input type="file" class="form-control"	name="pic" />
			<br/>
			<button type="submit" class="btn">사진등록</button>
		</form>
	</div>
	<div class="col-md-9" style="background-color:white">
		<c:if test="${param.mode ne null }">
			<p><i style="color: red">비밀번호가 일치하지 않았습니다.</i></p>
		</c:if>
		<form action="/join/check" method="post" style="background-color:white">
			<p>
				<b>ID</b><span id="chkResult" ></span><br/>
				<input type="text" class="form-control" name="id" id="id" placeholder="id를 입력하세요"/>
			</p>
			<p>
				<b>PASS</b><br/>
				<input type="password" class="form-control" name="pass" id="pass" placeholder="password를 입력하세요"/>
			</p>
			<p>
				<b>PASS CONFIRM</b> <span id="cmpResult" ></span><br/>
				<input type="password" class="form-control" name="rpass" id="rpass"
					onkeyup="javascript:passCompare()" placeholder="password를 입력하세요"/>
			</p>
			<p>
				<b>NAME</b><br/>
				<input type="text" class="form-control" name="name"/>
			</p>	
			<p>
				<b>GENDER</b><br/>
				<select class="form-control" name="gender">
					<option value="male">male</option>
					<option value="female">female</option>
				</select> 
			</p>
			<p>
				<b>BIRTH</b><br/>
			</p>
			<p>
				<b>E-MAIL</b><br/>
				<input type="email" class="form-control" name="email"/>
			</p>
			<p>
				<b>COUNTRY</b><br/>
				<input type="text" class="form-control" name="country"/>
			</p>
			<p>
				<button type="submit" id="sbt" class="btn" disabled >등록하기</button>
			</p>
		</form>
	</div>
</div>
<script>
	var flag1 =false, flag2 =false;
	
	document.getElementById("id").onblur = function() {
		var xhr = new XMLHttpRequest();
		// this .. 이 스크립트를 호출시킨 DOM 객체
		// document.getElementById("id") 
		xhr.open("get", "/join/checkAjax?id="+this.value, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4 && xhr.status==200) {
				var txt = xhr.responseText;
				console.log(txt);
				if(txt == 'YYYYY') {
					document.getElementById("chkResult").innerHTML = '사용가능';
					document.getElementById("chkResult").style.color='green';
					flag1=true;
				}else {
					document.getElementById("chkResult").innerHTML = '사용불가능';
					document.getElementById("chkResult").style.color='red';
					flag1=false;
				}
			}
		};
	};
	
	function sbtChange() {
		if(flag1 && flag2 ) {
			document.getElementById("sbt").disabled = false;
		}else {
			document.getElementById("sbt").disabled = true;
		}
	}
	// string .. length 라는 property 가 존재함.. 문자열 길이.
	
	function passCompare( ) {
		
		var flag = document.getElementById("pass").value == document.getElementById("rpass").value;
		if(flag) {
			flag2 =true;
			document.getElementById("cmpResult").innerHTML = "V";
			document.getElementById("cmpResult").style.color = "green";
		}else {
			flag2 =false;
			document.getElementById("cmpResult").style.color = "red";
			document.getElementById("cmpResult").innerHTML = "<i>비밀번호가 일치하지 않습니다.</i>";
		}
		sbtChange();
	}
	
</script>



