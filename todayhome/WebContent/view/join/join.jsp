<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<div>
	<h3>기본정보 입력</h3>
</div>
	<div style="background-color:white">
		<c:if test="${param.mode ne null }">
			<p><i style="color: red">비밀번호가 일치하지 않았습니다.</i></p>
		</c:if>
		<form action="/join/check" method="post" style="background-color:white">
			<p>
				<b>ID</b><span id="chkResult" ></span><br/>
				<input type="text" class="form-control" name="id" id="id" placeholder="id를 입력하세요" maxlength="20" />
			</p> 
			<p>
				<b>PASS</b><br/>
				<input type="password" class="form-control" name="pass" id="pass" placeholder="password를 입력하세요"/>
			</p>
			<p>
				<b>PASS CONFIRM</b> <span id="cmpResult" ></span><br/>
				<input type="password" class="form-control" name="rpass" id="rpass" onkeyup="javascript:passCompare()" placeholder="password를 입력하세요"/>
			</p>
			<p>
				<b>NAME</b><br/>
				<input type="text" id="name" class="form-control" name="name" placeholder="이름을 입력하세요" onkeyup="javascript:allCompare()"/>
			</p>	
			<p>
				<b>GENDER</b><br/>
				<select class="form-control" name="gender"  id="gender" onkeyup="javascript:allCompare()">
					<option value="male">남</option>
					<option value="female">여</option>
				</select> 
			</p>
			<p>
				<b>BIRTH</b><br/>
				<input class="form-control" type="date" name="bday"  id="birth" onkeyup="javascript:allCompare()">
			</p>
			<p>
				<b>E-MAIL</b><br/>
				<input type="email" class="form-control"  id="email" name="email" placeholder="e-mail을 입력하세요" onkeyup="javascript:allCompare()"/>
			</p>
			<p>
				<b>COUNTRY</b><br/>
					<select class="form-control" name="country"  id="country" onkeyup="javascript:allCompare()">
				<c:forEach var="item" items="${list}">
						<option value="${item }">${item }</option>
				</c:forEach>
					</select>
			</p>
			<p>
				<button type="submit" id="sbt" class="btn" disabled >등록하기</button>
			</p>
		</form>
	</div>
<script>
	var flag1 =false, flag2 =false, flag3 = false;
	
	document.getElementById("id").onblur = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/join/ajax?id="+this.value, true);
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
	}
	function allCompare( ) {
		var f1 = document.getElementById("name").value;
		var f2 = document.getElementById("gender").value;
		var f3 = document.getElementById("birth").value;
		var f4 = document.getElementById("email").value;
		var f5 = document.getElementById("country").value;
		
		console.log(f1);
		console.log(f2);
		console.log(f3);
		console.log(f4);
		console.log(f5);
		
		if(f1=="" || f2==""  || f3==""  || f4==""  || f5==""){
			flag3=false;
		}else{
			flag3=true;
		}
		sbtChange();
	}
	function sbtChange() {
		console.log(flag1+","+flag2+","+flag3);
		console.log("sbt!!");
		if(flag1 && flag2 && flag3) {
			document.getElementById("sbt").disabled = false;
		}else {
			document.getElementById("sbt").disabled = true;
		}
	}
</script>



