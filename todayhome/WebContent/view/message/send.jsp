<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="container" align="left">

	<h3>용건을 전달해드립니다.</h3>
	<ul class="nav nav-tabs">
		<li><a title="/view/message">받은 메시지</a></li>
		<li><a title="/view/sendlist">보낸 메시지</a></li>
		<li><a href="/view/send">전송</a></li>
	</ul>
</div>

<form action="/message/message" method="get">

	<%-- 	<c:forEach var="all" items="${send }">
		<tr>
			<td>${all.RECEIVER}</td>
			<td>${all.CONTENT}</td>
						<td>${all.CONTENT}</td>				
			<td><a href="/message/message?num=${all.NUM}"></a></td>
		</tr>
	</c:forEach> --%>

	<div class="container" align="left" class="col-md-8"
		style="width: 70%; margin-left: 1%;">

		<p class="form-inline">
			<strong> 받는 분 </strong> <i> _ ID </i> <br /> <input type="text"
				class="form-control" id="writer" name="writer"
				placeholder="RECEIVER" maxlength="50" onkeyup="chkword(this, 50)" />
		</p>
		<p>
			<strong> 내용 </strong> <span id="cnt">(0</span>/500) <br />
			<textarea rows="5" cols="60" id="content" class="form-control"
				placeholder="CONTENT" maxlength="500" onkeyup="chkword(this, 500)"
				style="resize: none;"></textarea>
		<div align="left">
			<!-- <span id="cnt">0</span>/500  -->

			<c:forEach var="all" items="${lists }">

				<tr>
					<td>${all.content}</td>
					<td><a href="/message/message?num=${all.NUM}"></a></td>
				</tr>

			</c:forEach>
			<button type="submit" value="전 송" class="btn btn-primary btn-block"
				style="width: 35%">전 송</button>
		</div>

	</div>

</form>



<script type="text/javascript">
	$("a").click(function() {
		if ($("#content").val().length != 0) {
			if (window.confirm("작성중인 내용이 있습니다.\n취소하고 이동 하시겠습니까?")) {
				location.href = $(this).attr("title");
			}
		} else {
			location.href = $(this).attr("title");
		}
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
				totalByte += 2;
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
</script>
