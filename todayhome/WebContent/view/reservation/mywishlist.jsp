<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<html>

<head>
<style type="text/css">

@import url("http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.panel-image {
    position: relative;   
}
.panel-image img.panel-image-preview {
    width: 100%;
	border-radius: 4px 4px 0px 0px;
}

.panel-image label {
    display: block;
    position: absolute;
    top: 0px;
    left: 0px;
    height: 100%;
    width: 100%;
}

.panel-heading ~ .panel-image img.panel-image-preview {
	border-radius: 0px;
}

.panel-body {
   overflow: hidden;
}

.panel-image ~ input[type=checkbox] {
    position:absolute;
    top:- 30px;
    z-index: -1;   
}

.panel-image ~ input[type=checkbox] ~ .panel-body {
	height: 0px;
	padding: 0px;
}

.panel-image ~ input[type=checkbox]:checked ~ .panel-body {
    height: auto;
	padding: 15px;
}

.panel-image ~ .panel-footer a {
    padding: 0px 10px;
	font-size: 1.3em;
	color: rgb(100, 100, 100);
}

</style>

</head>
<body>

<span style="font-weight:bold; font-size:1.5em;">예약한 목록</span>

<div class="container" style="margin-top:10px;">
	
       <c:forEach items="${wishlist}" var="x">
    
    <div class="row form-group">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">${x.TITLE}</h3>
                </div>
                <div class="panel-image hide-panel-body">
                    <img src= "${x.PICURL}" class="panel-image-preview" />
                    <label for="toggle-${x}"></label>
                </div>
                <input type="checkbox" id="toggle-${x}" class="panel-image-toggle">
                <div class="panel-body">
                    ${x.INTRO}
                </div>
                <div class="panel-footer text-center">
                    
                    <a href="/view/detail?num=${x.NUM}"><span class="glyphicon glyphicon-share-alt"></span></a>
                
                </div>
            </div>
        </div>
	</div>
       </c:forEach>
	</div>
	
	
	<span style="font-weight:bold; font-size:1.5em;">MY HOSTINGLIST</span>
	
	
	<div class="container" style="margin-top:10px;">
	
       <c:forEach items="${hostinglist}" var="x">
    
    <div class="row form-group">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">${x.TITLE}</h3>
                </div>
                <div class="panel-image hide-panel-body">
                    <img src="${x.PICURL}" class="panel-image-preview" />
                    <label for="toggle-${x}"></label>
                </div>
                <input type="checkbox" id="toggle-${x}" class="panel-image-toggle">
                <div class="panel-body">
                    ${x.INTRO}
                </div>
                <div class="panel-footer text-center">
                    
                    <a href="/view/detail?num=${x.NUM}"><span class="glyphicon glyphicon-share-alt"></span></a>
                </div>
            </div>
        </div>
	</div>
       </c:forEach>

	
	
	
</div>
</body>
</html>


