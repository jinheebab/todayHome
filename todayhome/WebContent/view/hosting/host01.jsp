<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>호스팅 1단계</h2>
  <p>${id} 님 안녕하세요. 호스팅 등록을 도와드리겠습니다.</p>
  <dl class="dropdown"> 
  
    <dt>
      <span class="hida1">방유형</span>    
      <p class="multiSel1"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="select01">
            <ul>
                <li>
                    <input type="button" value="AllRoom" />집전체</li>
                <li>
                    <input type="button" value="OneRoom" />개인실</li>
                <li>
                    <input type="button" value="ManyRoom" />다인실</li>
                
            </ul>
        </div>
    </dd>
    
    <dt>
      <span class="hida2">인원수</span>    
      <p class="multiSel2"></p>  
    </a>
    </dt>
  
		    <dd>
		        <div class="select01">
		            <ul>
		               <c:forEach var="item" items="${cnt}" begin=1 end=16 step=1 varStatus="status">
								 <li>
                    				<input type="button" value="${cnt}room" />${cnt}인실</li>
						</c:forEach>
		
					</ul>
		                
		        </div>
		    </dd>
		  <button>계속</button>
		</dl>
		</div>
		
		           
		                

</body>
</html>
