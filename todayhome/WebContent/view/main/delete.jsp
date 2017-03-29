<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row" align="center">
	<br/><br/>
	<h2>
		<span class="glyphicon glyphicon-trash"></span>
		귀하가 등록하신 호스팅을 삭제하시겠습니까?
	</h2><br/><br/>
</div>
<div class='row' align="center">
	삭제를 위해 비밀번호를 입력하세요<br/><br/>
	<form action="/view/delete1">
		<div>
			<input type="password" name="pass" id="pass" style="width:40%; height:5%; background-color:white; "/>
			<button type="submit" class="btn" id="bt" style="width:10%; height:5%; background-color:white;">삭제</button>
		</div>
	</form>
</div>