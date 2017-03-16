<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>


<!-- =========================================================== -->

<div align ="right" style="background-color: black;">
	<a href="/join/join"><button type="button" style="border-radius: 0; background-color: black;" class="btn"><font color=white>회원가입</font></button></a>
<button id="myBtn" class="btn" type="button" 
	style="border-radius: 0; background-color: black; "><font color=white>로그인</font></button>
</div>


<!-- Trigger/Open The Modal -->

<!-- The Modal -->
<div id="myModal" class="modal"  >

  <!-- Modal content -->
  <div class="modal-content"  >
  <div style="padding-right: 33%; padding-left: 33%; text-align: center;">
    <span class="close">&times;</span>
    <form action="/view/loginconfirm" >
   	<h3>로그인</h3><br/>
   ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="name"/><br/><br/>
   PASS : <input type="text" name="name"/><br/><br/>
  <input type="checkbox" name="autologin" />자동로그인<br/><br/>
  <button type="submit" class="btn" style="background-color: white; border-style: solid; border-color: orange; border-width: 2px;">로그인</button>
  </form>
  </div>
    </div>
    </div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>



