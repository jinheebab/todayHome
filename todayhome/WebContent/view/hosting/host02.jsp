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
  </style>
</head>
<body>

<div class="container">
  <h2>호스팅정보보기</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-default btn-lg" id="myBtn">호스팅정보</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 호스팅정보</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 제목</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.title}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 숙소유형</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.htype}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 방유형</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.rtype}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 방개수</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.roomcnt}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 수용인원</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.membercnt}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 침대개수</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.bedcnt}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 욕실개수</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.bathcnt}" readonly="readonly">
              
               <label for="usrname"><span class="glyphicon glyphicon-user"></span> 국가</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.country}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 도시</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.city}" readonly="readonly">
              
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 하위주소</label>
              <input type="text" class="form-control" id="usrname" value="${hostinginfo.location}" readonly="readonly">
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
</script>

<form action="/hosting/host04">


호스팅번호<input type="text" id="hostingnum" name="hostingnum" readonly="readonly" value="${hostingNumber}"/>

TYPE<input type="text" id="type" name="type" readonly="readonly" value="hosting"/>

파일이름<input type="text" id="filename" name="filename" readonly="readonly"/>

파일사이즈<input type="text" id="filesize" name="filesize" readonly="readonly"/>

파일링크<input type="text" id="filelink" name="filelink" readonly="readonly"/>

아이디<input type="text" id="id" name="id" readonly="readonly" value="${sessionScope.auth}"/>

 <div style="height: auto; width: 100%; border:1px solid black;">
	 
	 <h2 align="center">추가사진등록</h2>
	 
	 
            <input type="file" id="FILE_TAG" >
            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">등록</a>
        
        파일주소<input type="text" id="fileaddress" name=fileaddress readonly="readonly"/>
        
        

</div>

  

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
	
	 <button type="submit" class="btn btn-success" id="register">등록</button>
</form>
</body>
</html>
