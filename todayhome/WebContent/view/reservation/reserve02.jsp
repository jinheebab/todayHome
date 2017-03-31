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
	<span id="total" class="label label-danger" name="total"> 총결제금액 : ${totalmoney} 원</span>
	
</h2>
	<form action="/reservation/reserve03" id="form" class="cmxform">
	<font color="blue">호스팅번호</font><input type="text" readonly="readonly" name="hostingnum" value="${hostingnum}"><br/>
	<font color="blue">결제사이름</font><input type="text" readonly="readonly" id="company"  name="company">
	
	
<h2 align="left">결제국가</h2>
<select class="form-control" name="country" id="country">
	<c:forEach var="item" items="${countrylist}">
		<option value="${item }">${item }</option>
	</c:forEach>
</select>

<h2 align="left">결제방법</h2>
<select class="form-control" name="payinfo" id="payinfo"
	onclick="javascript:changeview()">
	<option value="card">신용카드</option>
	<option value="phone">휴대폰결제</option>
	<option value="noaccount">무통장입금</option>
</select>

<div id="card" style="display: none;">
		
		<p>
				<b>카드사</b><br/>
				<select class="form-control" id="creditcard">
					<option value="신한카드">신한카드</option>
					<option value="비씨카드">비씨카드</option>
					<option value="현대카드">현대카드</option>
					<option value="외환카드">외환카드</option>
					<option value="롯데카드">롯데카드</option>
				</select> 
			</p>
		
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
			카드비밀번호<input type="password" placeholder="XXXX" maxlength="4"/>
		</p>
		
		
</div>
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


<div id="phone" style="display: none;">

	<h2>통신사 선택</h2>
	<div class="btn-group" data-toggle="buttons">
	  <label class="btn btn-primary active">
	    <input type="radio" name="phonecompany" value="KT" autocomplete="off" checked> KT
	  </label>
	  <label class="btn btn-primary">
	    <input type="radio" name="phonecompany" value="SKT" autocomplete="off"> SKT
	  </label>
	  <label class="btn btn-primary">
	    <input type="radio" name="phonecompany" value="LGT" autocomplete="off"> LGT
	  </label>
	  
	  <div><input type="text" name="phonenumber" id="phonenumber" placeholder="휴대폰번호를 입력해주세요" maxlength="11">
	  <span id="phonecheck"></span><button type="button" class="btn btn-info" id="pleasenumber">인증번호요청</button></div><br/>
	  
	  <div style="border: 1px solid blue">

	  <h3 align="center"><span id="authnumber"></span></h3>
	  
	  <h2 align="center"><input type="text" style="font-size: medium;" placeholder="인증번호" id="inputnumber"></h2>
	  
	  <h3 align="right"><button type="button" class="btn btn-info" id="check">확인</button></h3>
	  
		
			</div>
		
		</div>
	</div>
	
	
	
	<script>
	
	
	
		$('#pleasenumber').click(function(){
			
			var number = Math.floor(Math.random() * 8999) + 999;

			if($('#phonenumber').val().length < 11){
		
			$('#phonecheck').html("휴대폰 번호 11자리를 입력해주세요");
			
		}else{
								
			$('#authnumber').html(number);
			
			}
			
			
		$('#check').click(function(){
			
			if($('#inputnumber').val() == number){
				alert("인증성공 !");
			}else{
				alert("인증실패 !");
			}
			
			});
		});
		
	</script>


<div id="noaccount" style="display: none;">
<div><input type="text" name="accountnumber" id="accountnumber" placeholder="통장번호를 입력해주세요" maxlength="15"></div>

<input type="text" name="noaccount" id="noaccount" value="무통장" readonly="readonly">

카드비밀번호<input type="password" placeholder="XXXX" maxlength="4"/>

</div>

<p>
			<button type="submit" class="btn btn-primary" id="pay" name="pay">결제</button>
</p>


</form>
<script>

setInterval(company,200);

	function company(){
		
		var payinfo = $('#payinfo').val();
		
		if(payinfo == 'card'){
			
			var company = $('#creditcard').val();
			
			$('#company').val(company);
			
		}else if(payinfo == 'phone'){
			
			var company = $("input[type=radio][name=phonecompany]:checked").val();
			
			$('#company').val(company);
			
		}else{
			
			var company = $('#payinfo').val();
			
			$('#company').val(company);
			
		}
		
	}


	function changeview() {
		
	if($('#payinfo').val() == 'card'){
		$('#card').show();
		$('#phone').hide();
		$('#noaccount').hide();
	}else if($('#payinfo').val() == 'phone'){
		$('#card').hide();
		$('#phone').show();
		$('#noaccount').hide();
	}else{
		$('#card').hide();
		$('#phone').hide();
		$('#noaccount').show();
		}
		
	}
	
</script>





