<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>🍓Mbting - mypage🍓</title>
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<!-- css -->
<link href="/static/css/smallImg.css" rel="stylesheet">
<link href="/static/css/btn.css" rel="stylesheet">
</head>
<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
<div class="section bg">
  <div class="container">
    <h1>My page</h1>
    <section class ="d-flex mb-5">
    	<c:choose>
    		<c:when test= "${not empty profile }">
    			<a href ="#"><img src = "${profile}" class ="rounded-circle img-responsive" id="smallProfile"></a>
    		</c:when>
    		<c:otherwise>
    			<a href ="#"><i class="bi bi-person-circle myprofile-icon"></i></a>
    		</c:otherwise>
    	</c:choose>
    	
    	<div class ="mt-4 ml-4 col-12">
    	<h3>${userName}</h3>
    	<a href="/user/mypage_edit_view"><button type = "button" class ="btn mt-1">프로필 편집</button></a>
    	</div>
    	
    </section>
   
    
    <c:forEach var="post" items="${postlist}">
    	<c:choose>
    	
	    	<c:when test="${not empty post.subject}">
	    		<div class="col three bg nopad pointer">
			      <div class="imgholder d-flex align-items-center justify-content-center">
			      <p class ="questionText">"${post.subject}"</p>
			      </div>
			      <h1 class="feature">${post.comment}</h1>
				   
			    </div>  
	   		</c:when>
	   		
	   		<c:otherwise>
	   		 	<div class ="container row col-12 justify-content-center p-5 mt-5">
	   		 	<h1 class ="col-12 p-5">아직 작성된 포스트가 없군요  ... 🤔</h1>
	   		 	<a href ="/post/main#QuestionForToday"><button type = "button" class ="btn col-12  p-5 overlay__btn"> <h2 class ="text-white">오늘의 질문 답하러 가기 ❤️</h2></button> </a> 
	   		 	</div>
	   		</c:otherwise>
   		
   		</c:choose>
   		
    </c:forEach>  
    

    
    <div class="group"></div>
  </div>
</div>

<script>


</script>
</body>
</html>