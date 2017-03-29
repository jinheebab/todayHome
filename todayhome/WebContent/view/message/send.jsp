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
	padding-bottom: 2%;
	
}
.pad2{

	padding-left: 3.5%;
	padding-right: 3%;
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
	padding-left: 0;
	margin-left: -15;


}
.navbtn{
	background-color: 2F97F2;
	border-style: solid;
	border-color: 2F97F2;
	border-width: thin;
	font-weight: bold;
	color: white;
}
.selectbtn{
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-style: solid;
	border-color: 2F97F2;
	border-width: thin;
	font-weight: bold;
	color: black;

}

</style>

<div class="pad">
	<div class="title">
	메시지 보내기
	</div>
	<ul class="nav nav-tabs" style="margin-left:-15; margin-right: -15; border-bottom-style: solid; border-bottom-width:3px; ">
		<li class="navbtn"><a href="/view/message?page=1" style="color: white;">받은 메시지</a></li>
		<li class="navbtn"><a href="/view/message/sendlist?page=1" style="color: white;">보낸 메시지</a></li>
		<li class="selectbtn"><a href="/view/message/send?receiver=" style="color:black;">작성</a></li>
	</ul>
	</div>
	<div class="pad2">
	<form action="/view/message/sendcomp" method="post" name="send">
				<h4>To</h4>
				<input type="text" name="receiver" id="writer" list="id_list" value="${receiver}"/><span id="set" style="color: 2F97F2;"> 엔터로 겁색</span>
					<datalist id="id_list"></datalist>
			
			<br /><br />
			 <h4>내용</h4>
			<textarea rows="6" cols="60" id="content" class="form-control"
				placeholder="CONTENT" maxlength="500" onkeyup="chkword(this, 500)"
				style="resize: none;" name="content"></textarea>
				<div align="right" id="counter"></div>
			<div class="pad" align="center">
				<button type="submit" class=" button" id="send">전 송</button>
			</div>
	</form>
</div>
<!-- 스크립트 -->

<script type="text/javascript">
	//writer found
	$('#writer').keydown(function(key) {
		 if (key.keyCode == 13) {
		$("#set").html(" 검색중");
		var rst;		
		var id = $(this).val();
	    $.ajax({
	        url : "/view/message/search?id="+id
	     }).done(function(txt){
	    	 for(var i=0; i<txt.length; i++){
	    	 rst += "<option>"+txt[i]+"</option>";
	    	 }
	    	 $("#id_list").html(rst);
	    	 $("#set").html(" 검색완료");
	     }); 
		 return false;
		 }
	}); 

	$("#send").click(function(){
		
		window.alert("전송완료");
		
	});


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
			window.alert(maxByte + "자 이상 입력할 수 없습니다.");
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






















