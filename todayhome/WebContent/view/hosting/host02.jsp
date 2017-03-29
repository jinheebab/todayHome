<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js" ></script>
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
.btt{
   border-radius: 10px;
   padding: 1%;
   padding-bottom: 2%;
   padding-left: 2%;
   padding-right: 2%;
   border-style: solid;
   border-width: 2px; 
   border-color: 2F97F2;
   background-color:white;
}

  </style>
</head>
<body>

<div class="row">
	<div class="row">
		<div class="image">
			<img src="/addition.jpg" width="100%" height="80%" />
		</div>
	</div>
	
		    <div class="row" style="margin-left:15%; margin-right:15%; border:1px;">
	 	 		<!-- 메인 사진 --><br/>
	 	 		<h2><span class="glyphicon glyphicon-map-marker"></span>추가 숙소 내부사진을 등록하세요</h2><br/><br/><br/>
	 	 		<h3><span class="glyphicon glyphicon-picture">&nbsp등록된 메인 사진</span></h3><br/>
		       	<div id="mainImage" class="box" align="center"><img src="${picurl}" width="100%" height="50%"></div>
	        </div><hr/>
	        <div class="row" style="margin-left:15%; margin-right:15%">
	        	<h3><span class="glyphicon glyphicon-picture">&nbsp사진 추가하기</span></h3><br/>
	        	<div class="col-md-6" >
	        		<div id="extra1" class="box" align="center"><img src="/cover.jpg" width="100%" height="30%"></div>
	        		파일 주소<input type="text" class="form-control allInput" id="fileObj1" name=fileObj1 readonly="readonly" style="width:90%; height:5%; background-color:white;">
	               	<input class="form-control allInput" type="file" id="file1" style="width:90%; height:5%; background-color:white;">
	               	<button class="btn" id="register1" onclick="javascript:uploadFile1();" style="width:15%; height:5%; background-color:white;">등록</button>
	              	<button class="btn" id="delete1" onclick="javascript:deleteFile1();" style="width:15%; height:5%; background-color:white;">삭제</button>
	        	</div>
	        	<div class="col-md-6" >
	        		<div id="extra2" class="box" align="center"><img src="/cover.jpg" width="100%" height="30%"></div>
	        		파일 주소<input type="text" class="form-control allInput" id="fileObj2" name=fileObj2 readonly="readonly" style="width:90%; height:5%; background-color:white;">
	               	<input class="form-control allInput" type="file" id="file2" style="width:90%; height:5%; background-color:white;">
	               	<button class="btn" id="register2" onclick="javascript:uploadFile2();" style="width:15%; height:5%; background-color:white;">등록</button>
	              	<button class="btn" id="delete2" onclick="javascript:deleteFile2();" style="width:15%; height:5%; background-color:white;">삭제</button>
	        	</div>
	        </div><hr/>
	        <div class="row" style="margin-left:15%; margin-right:15%">
	        	<div class="col-md-6" >
	        		<div id="extra3" class="box" align="center"><img src="/cover.jpg" width="100%" height="30%"></div>
	        		파일 주소<input type="text" class="form-control allInput" id="fileObj3" name=fileObj3 readonly="readonly" style="width:90%; height:5%; background-color:white;">
	               	<input class="form-control allInput" type="file" id="file3" style="width:90%; height:5%; background-color:white;">
	               	<button class="btn" id="register3" onclick="javascript:uploadFile3();" style="width:15%; height:5%; background-color:white;">등록</button>
	              	<button class="btn" id="delete3" onclick="javascript:deleteFile3();" style="width:15%; height:5%; background-color:white;">삭제</button>
	        	</div>
	        	<div class="col-md-6" >
	        		<div id="extra4" class="box" align="center"><img src="/cover.jpg" width="100%" height="30%"></div>
	        		파일 주소<input type="text" class="form-control allInput" id="fileObj4" name=fileObj4 readonly="readonly" style="width:90%; height:5%; background-color:white;">
	               	<input class="form-control allInput" type="file" id="file4" style="width:90%; height:5%; background-color:white;">
	               	<button class="btn" id="register4" onclick="javascript:uploadFile4();" style="width:15%; height:5%; background-color:white;">등록</button>
	              	<button class="btn" id="delete4" onclick="javascript:deleteFile4();" style="width:15%; height:5%; background-color:white;">삭제</button>
	        	</div>
	        </div>
	     <br/>
	     <form action="/view">
	  		<div class="row" align="center"><br/>
				<h3>
					<button class="btt" id="tomain" ><h2><span class="glyphicon glyphicon-off"></span> 홈 화면으로 가기</h2></button>
		      	</h3><br/><br/>
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
</div>


	<script>
		$(document).ready(function(){
		    $("#myBtn").click(function(){
		        $("#myModal").modal();
		    });
		});
	
		// 파일 등록 1
 		function uploadFile1(){
	        var form = $('FILE_FORM')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#file1")[0].files[0]);
	        	$.ajax({
		    		url: '/hosting/upload1',
		            processData: false,
		            contentType: false,
		            data: formData,
		            type: 'POST',
		            success: function(result){
		            	alert('사진 등록 성공');
		            	console.log(result);
	                    $('#extra1').html('<img src="'+result+'" width="100%" height="30%">');
	                    $('#fileObj1').val(result);
	                    $('#register1').attr('disabled', true);
		           	}
	        });
	    }
		// 사진 삭제 1
 		function deleteFile1(){
	        $.ajax({
	    		url: '/hosting/delete1',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(result){
	            	if(result == 1){
		            	alert('사진 삭제 성공');
		            	console.log(result);
	                    $('#extra1').html('<img src="/cover.jpg" width="100%" height="30%">');
	                    $('#fileObj1').val('');
	                    $('#file1').val('');
	                    $('#register1').attr('disabled', false);
	            	}
	            }
	        });
	    }
 		// 파일 등록 2
 		function uploadFile2(){
	        var form = $('FILE_FORM')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#file2")[0].files[0]);
	        $.ajax({
	    		url: '/hosting/upload2',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(result){
	            	alert('사진 등록 성공');
	            	console.log(result);
                    $('#extra2').html('<img src="'+result+'" width="100%" height="30%">');
                    $('#fileObj2').val(result);
                    $('#register2').attr('disabled', true);
	            }
	        });
	    }
		// 사진 삭제 2
 		function deleteFile2(){
	        $.ajax({
	    		url: '/hosting/delete2',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(result){
	            	if(result == 1){
		            	alert('사진 삭제 성공');
		            	console.log(result);
	                    $('#extra2').html('<img src="/cover.jpg" width="100%" height="30%">');
	                    $('#fileObj2').val('');
	                    $('#file2').val('');
	                    $('#register2').attr('disabled', false);
	            	}
	            }
	        });
	    }
 		// 파일 등록 3
 		function uploadFile3(){
	        var form = $('FILE_FORM')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#file3")[0].files[0]);
	        $.ajax({
	    		url: '/hosting/upload3',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(result){
	            	alert('사진 등록 성공');
	            	console.log(result);
                    $('#extra3').html('<img src="'+result+'" width="100%" height="30%">');
                    $('#fileObj3').val(result);
                    $('#register3').attr('disabled', true);
	            }
	        });
	    }
		// 사진 삭제 3
 		function deleteFile3(){
	        $.ajax({
	    		url: '/hosting/delete3',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(result){
	            	if(result == 1){
		            	alert('사진 삭제 성공');
		            	console.log(result);
	                    $('#extra3').html('<img src="/cover.jpg" width="100%" height="30%">');
	                    $('#fileObj3').val('');
	                    $('#file3').val('');
	                    $('#register3').attr('disabled', false);
	            	}
	            }
	        });
	    }
 		// 파일 등록 4
 		function uploadFile4(){
	        var form = $('FILE_FORM')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#file4")[0].files[0]);
	        $.ajax({
	    		url: '/hosting/upload4',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(result){
	            	alert('사진 등록 성공');
	            	console.log(result);
                    $('#extra4').html('<img src="'+result+'" width="100%" height="30%">');
                    $('#fileObj4').val(result);
                    $('#register4').attr('disabled', true);
	            }
	        });
	    }
		// 사진 삭제 4
 		function deleteFile4(){
	        $.ajax({
	    		url: '/hosting/delete4',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(result){
	            	if(result == 1){
		            	alert('사진 삭제 성공');
		            	console.log(result);
	                    $('#extra4').html('<img src="/cover.jpg" width="100%" height="30%">');
	                    $('#fileObj4').val('');
	                    $('#file4').val('');
	                    $('#register4').attr('disabled', false);
	            	}
	            }
	        });
	    }
		
		
		
		
		
		
/* 		function uploadFile1(){
        var form = $('FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("fileObj1", $("#FILE_TAG")[0].files[0]);

        $.ajax({
            url: '/hosting/upload1',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert('사진등록성공');
                        console.log(result);
                        $('#image').html('<img src="'+result+'" width="80%" height="30%">');
                        $('#picurl').val(result);
                    }
            });
    	} */
		

		
	</script>



</body>
</html>
