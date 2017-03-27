<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  .image {
	position:relative;
	floatLleft;	
}
.image .text{
	position:absolute;
	top:50%;
	left:5%;
	width:700px;
	font-size: 25px;
	font-family:"Sans-Serif";
}
  </style>
</head>
<body>

<div class="row">
	<div class="row">
		<div class="image">
			<img src="/addition.jpg" width="100%" height="80%" />
			<br/><br/>
		</div>
	</div>
	
	<form action="/hosting/host04">
  		호스팅번호<input type="text" id="hostingnum" name="hostingnum" readonly="readonly" value="${hostingNumber}"/>
		TYPE<input type="text" id="type" name="type" readonly="readonly" value="hosting"/>
		파일이름<input type="text" id="filename" name="filename" readonly="readonly"/>
		파일사이즈<input type="text" id="filesize" name="filesize" readonly="readonly"/>
		파일링크<input type="text" id="filelink" name="filelink" readonly="readonly"/>
		아이디<input type="text" id="id" name="id" readonly="readonly" value="${sessionScope.auth}"/>
	
	
		<div class="row">
			 <div class="col-md-6" style="margin-left:5%; margin-right:-14%">
				<h2><span class="glyphicon glyphicon-map-marker"></span>추가 숙소 내부사진을 등록하세요</h2><br/>
				<h3 align="center">추가 사진 등록</h3>
		        <input type="file" id="fileObj" name="file">
		      	<div align="center">
		       		<button type="submit" class="form-control" id="register" style="background-color:white; width:20%; height:10%">추가 사진 등록</button><br/>
		       	</div>
	        </div><br/>
	        <div class="col-md-6" align="center">
		       	<br/><br/>
		       	<h3>
		       		<a class="ui-shadow ui-btn ui-corner-all" href="/view/"><span class="glyphicon glyphicon-off"></span>&nbsp홈 화면으로 가기</a>
		       	</h3>
	       	</div>
		</div>
	</form>
	
	<div class="container">
	  <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
			    <!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding:35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-lock"></span> 호스팅정보</h4>
					</div>
					<button class="btn btn-success btn-block" id="tomain"><span class="glyphicon glyphicon-off"></span> 메인화면으로</button>
					<script>
						$('#tomain').click(function(){
							location.replace('/view');
						});
					</script>
				</div>   
			</div>
		</div>
	</div> 
	 
	<script>
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("#myModal").modal();
	    });
	});
	</script>
	
	
	<script>
		function uploadFile(){
	        var form = $('FILE_FORM')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
	        $.ajax({
	    		url: '/hosting/upload2',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(result){
	            	alert('사진등록성공');
	                console.log(result);
	                $('#filename').val(result.filename);
	                $('#filesize').val(result.filesize);
	                $('#fileaddress').val(result.fileaddress);
	                $('#filelink').val(result.filelink);
	                $('#id').val(result.id);
	            }
	        });
	    }
		</script>

</div>
</body>
</html>
