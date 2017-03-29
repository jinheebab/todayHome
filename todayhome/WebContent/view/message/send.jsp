<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="model.MessageDao"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.pad{

	padding: 5%;
	
}
.button{
	background-color: white;
	border-style: solid;
	border-radius: 10px;
	border-width: 2px;
	border-color: 2F97F2;
	padding: 0.5% 2%;
	font-weight: bold;
	font-family: 나눔고딕;

}
.title{
	font-family: 나눔고딕;
	font-size: 2em;
	padding-bottom: 3%;


}

</style>

<div class="pad">
	<div class="title">
	메시지 보내기
	</div>
	<ul class="nav nav-tabs">
		<li><a href="/view/message?page=1">받은 메시지</a></li>
		<li><a href="/view/message/sendlist?page=1">보낸 메시지</a></li>
		<li><a href="/view/message/send?receiver=" style="color:black; font-weight: bold;">작성</a></li>
	</ul>
	
	<form action="/view/message/sendcomp" method="post" name="send">
			<p class="form-inline">
				<strong> 받는 분 </strong> <i> _ ID </i> <br /> <input type="text"
					name="receiver" id="writer" class="form-control"
					value="${receiver}" maxlength="50" onkeyup="chkword(this, 50)" />
			</p>
			<ul class="nav nav-tabs"></ul>
			<br /> <strong> 내용 </strong> (<span id="counter"></span>) <br />
			<textarea rows="6" cols="60" id="content" class="form-control"
				placeholder="CONTENT" maxlength="500" onkeyup="chkword(this, 500)"
				style="resize: none;" name="content"></textarea>
			<div class="pad" align="center">
				<button type="submit" class=" button">전 송</button>
			</div>
	</form>
</div>
<!-- 스크립트 -->

<script type="text/javascript">
	$("a").click(function() {
		if ($("#content").val().length != 0) {
			if (window.confirm("작성중인 문서를 취소하고 이동합니까?")) {
				location.href = $(this).attr("title");
			}
		} else {
			location.href = $(this).attr("title");
		}
	});

	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			//			$(this).height(((content.split('\n').length + 1) * 3.5) + 'em');
			$('#counter').html(content.length + '/500');
		});
		$('#content').keyup();
	});

	function chkword(obj, maxByte) {
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 1;
			} else {
				totalByte++;
			}

			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}

		// 넘어가는 글자는 자른다.
		if (totalByte > maxByte) {
			alert(maxByte + "자 이상 입력할 수 없습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}

	function inputLengthCheck(eventInput) {
		var inputText = $(eventInput).val();
		var inputMaxLength = $(eventInput).prop("maxlength");
		var j = 0;
		var count = 0;
		for (var i = 0; i < inputText.length; i++) {
			val = escape(inputText.charAt(i)).length;
			if (val == 6) {
				j++;
			}
			j++;
			if (j <= inputMaxLength) {
				count++;
			}
		}
		if (j > inputMaxLength) {
			$(eventInput).val(inputText.substr(0, count));
		}
	}
</script>






















