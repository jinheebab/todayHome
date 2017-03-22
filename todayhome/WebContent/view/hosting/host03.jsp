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
  <h2>추가사진등록성공</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-default btn-lg" id="myBtn">버튼</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 추가사진</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <div class="form-group">
              
            </div>
           
            
              <button class="btn btn-success btn-block" id="tomain"><span class="glyphicon glyphicon-off"></span> 메인화면으로</button>
              
               <button class="btn btn-success btn-block" id="topicture"><span class="glyphicon glyphicon-off"></span> 사진추가하기</button>
              
              <script>
              
              $(document).ready(function() { 
            	  $("#myBtnn").hide();
            	  $("#myBtn").trigger('click');
            	 
            	  
            	 });
              
              
              
              
              	$('#tomain').click(function(){
              		
              		location.replace('/view');
              		
              	});
              	
				$('#topicture').click(function(){
              		
              		location.replace('/hosting/again');
              		
              	});
              
              </script>
        </div>
        
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
    
    

	$( "#myBtn" ).on( "click", function() {
		 
		 $("#myModal").modal();
		
	});
		$( "#myBtn" ).trigger( "click" );
	
		
		$('#myBtn').hide();
    
    	
   
    
    
    });
</script>

</body>
</html>
