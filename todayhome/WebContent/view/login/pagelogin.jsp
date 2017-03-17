<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="padding: 5% 33%; text-align: center;">
	<h2>로그인</h2><br/>
	<form action="/view/login/confirm">
		ID &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="id" />
		<br /><br />
		 PASS : <input type="password" name="pass"/>
		 <br/><br/>
		 <input	type="checkbox" name="autologin" />자동로그인
		 <br /><br />
		<button type="submit" class="btn" style="background-color: white; border-style: solid; 
		border-color: orange; border-width: 2px;">로그인</button>
	</form>
	 <span style="font-size: 0.9em;">아직 회원이 아니신가요? <a href="/join/join/">회원가입</a></span>
</div>
