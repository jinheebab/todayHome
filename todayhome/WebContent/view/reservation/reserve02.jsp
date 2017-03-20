<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>


<h2 align="center">
	<span id="total" class="label label-danger" name="total"> 결제금액 </span>
</h2>
<h2 align="left">결제국가</h2>
<select class="form-control" name="country" id="country">
	<c:forEach var="item" items="${countrylist}">
		<option value="${item }">${item }</option>
	</c:forEach>
</select>

<h2 align="left">결제방법</h2>
<select class="form-control" name="payway" id="payway"
	onclick="javascript:changeview()">
	<option value="card">신용카드</option>
	<option value="phone">휴대폰결제</option>
	<option value="cacao">카카오페이</option>
</select>

<div id="card" style="display: none;">
	<form action="/reservation/reserve03" id="form" class="cmxform"
		method="post">
		<p>
			<label for="card">카드번호 </label> <input id="card" name="card"
				type="text" required />
		</p>
		<p>
			<label for="month">유효기간 </label> <input id="month" name="month"
				type="text" required placeholder="MM" /> <input id="year"
				name="year" type="text" required placeholder="YYYY" />
		</p>
		<p>
			<button type="submit" class="btn btn-primary" id="pay" name="pay">결제</button>
		</p>
	</form>
	<script>
		$("form").validate({
			rules : {
				card : {
					required : true,
					minlength : 12,
					maxlength : 12,
					digits : true
				},
				month : {
					required : true,
					minlength : 2,
					maxlength : 2,
					digits : true
				},
				year : {
					required : true,
					minlength : 4,
					maxlength : 4,
					digits : true
				}
			},
			messages : {
				card : "카드번호 12자리를 입력해주세요",
				month : "숫자 2자리를 입력해주세요",
				year : "숫자 4자리를 입력해주세요"
			}
		});
	</script>
</div>

<div id="phone" style="display: none;">휴대폰</div>

<div id="cacao" style="display: none;">카카오</div>

<script>
	function changeview() {
		
		if($('#payway').val() == 'card'){
		$('#card').show();
		$('#phone').hide();
		$('#cacao').hide();
	}else if($('#payway').val() == 'phone'){
		$('#card').hide();
		$('#phone').show();
		$('#cacao').hide();
	}else{
		$('#card').hide();
		$('#phone').hide();
		$('#cacao').show();
		}
		
	}
	
</script>





