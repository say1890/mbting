<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>🍓Mbting - 프로필 보기🍓</title>
</head>
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<!-- css -->
<link href="/static/css/smallImg.css" rel="stylesheet">

<body>
<c:import url ="/WEB-INF/jsp/include/header.jsp" />
<div class="section bg">
  <div class="container">
    <section class ="d-flex mb-1 align-items-center">
    
    


    	<c:choose>
    		<c:when test= "${not empty userdetail.user.profile }">
    			<a href ="#"><img src = "${userdetail.user.profile}" class ="rounded-circle img-responsive" id="smallProfile"></a>
    		</c:when>
    		<c:otherwise>
    			<i class="bi bi-person-circle myprofile-icon"></i>
    		</c:otherwise>
    	</c:choose>
    	
    	<div class ="mt-2  ml-2 col-12 row">
    	<h3 class = "col-4">${userdetail.user.userName}</h3>
    	<h4 class = "col-6  mt-2">❝ ${userdetail.user.introduce} ❞</h4>
    	</div>
    	
    </section>
    <hr>
    <div class ="mt-5  col-10">
	    <div class ="p-5">
	    <h3 class ="mb-5">제 이상형은요...💭</h3>
	    
	    <c:if test="${not empty userdetail.userCharacter.yourCharacter }">
	    <h3 class ="ml-4 mt-5 mb-2">성격🤸🏻‍♀️</h3>
	    <hr>
	   	<p class = "introduceText" >${userdetail.userCharacter.yourCharacter}</p>
	    </c:if>
	    
	   	<c:if test="${not empty userdetail.userCharacter.yourMerit}">
	    <h3 class ="ml-4 mt-5 mb-2">장점👍</h3>
	    <hr>
	   	<p class = "introduceText" >${userdetail.userCharacter.yourMerit}</p>
	    </c:if>
	    
	    
	    <c:if test="${not empty userdetail.userCharacter.yourHobby}">
	    <h3 class ="ml-4 mt-5 mb-2">취미🤼‍♀️</h3>
	    <hr>
	   	<p class = "introduceText" >${userdetail.userCharacter.yourHobby}</p>
	    </c:if>
    </div>
    
    
    <div class ="p-5">
	    <h3 class ="mb-5 mt-5">나는 이런 사람이에요🙋‍♂️</h3>
	    <c:if test="${not empty userdetail.userCharacter.myCharacter }">
	    <h3 class ="ml-4 mt-5 mb-2">성격</h3>
	   		<p class = "introduceText" >${userdetail.userCharacter.myCharacter}</p>
	    </c:if>
	    
	   	<c:if test="${not empty userdetail.userCharacter.myMerit}">
	    <h3 class ="ml-4 mt-5 mb-2">장점👍</h3>
	    <hr>
	   		<p class = "introduceText" >${userdetail.userCharacter.myMerit}</p>
	    </c:if>
	    
	    
	    <c:if test="${not empty userdetail.userCharacter.myHobby}">
	    
	    <h3 class ="ml-4 mt-5 mb-2">취미🎤</h3>
	    <hr>
	   		<p class = "introduceText" >${userdetail.userCharacter.myHobby}</p>
	    
	    </c:if>
   </div>

    </div>
    </div>
</div>	


</body>
</html>