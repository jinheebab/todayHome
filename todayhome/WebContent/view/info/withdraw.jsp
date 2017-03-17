<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div align="center">
	<h3>회원 탈퇴</h3>
	※ 현재 비밀번호를 다시 입력 바랍니다.
</div>
<br/>

<div align="center" class="well" style="min-height: 30%; margin-left: 500px; margin-right: 500px; background-color: white">

<br/>
	
	<form action="/my/leave_result.jsp" method="post">
		<p>
			<b>PASSWORD</b><br/>
			<input type="password" class="form-control" name="pw"/>
		</p>
		<p>
			<button type="submit" class="btn">탈퇴요청</button>
		</p>
	</form>
</div>

		

