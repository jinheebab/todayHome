<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
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
            alert(maxByte + "더이상 입력할 수 없습니다.");
            str2 = strValue.substr(0, len);
            obj.value = str2;
            chkword(obj, 4000);
        }
    }
</script>

<div>
<div class="row">
<h3>메시지 작성</h3>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<p class="form-inline">
			<input type="text" class="form-control" id="writer" placeholder="받는 분" maxlength="50" onkeyup="chkword(this, 50)"/>
		</p>
		<p>
			<textarea rows="2" cols="83" id="content" class="form-control"
				placeholder="내용" maxlength="500" onkeyup="chkword(this, 500)" ></textarea>
		</p>
		<p style="text-align: right; font-size: 14px;">
			<span id="cnt" >0</span>/500
			<button type="button" id="send" class="btn">Send</button>
		</p>
	</div>
</div>
</div>



