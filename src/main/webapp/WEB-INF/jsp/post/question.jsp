<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Insert title here</title>
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</head>
<body>
<div class="section mt-5" id = "QuestionForToday" >

    <div class="container row" >
  
	<h1 class ="mt-5 ml-5">오늘의 질문</h1>
	<h4 class ="ml-3 mt-5">${today}</h4>
	<c:choose>
		<c:when test = "${not empty questionList }">
		<c:forEach var="q" items="${questionList}">	
			<h3 class ="mt-5 ml-5">
				<i class="bi bi-pen"></i>
				${q.subject}
				</h3>
				<section class ="mt-5 mb-5 row col-12  ml-4">
					<p class ="col-12">
					<h4> ${q.content}</h4>
					</p>
				
			
				
				
				<div class="input-group mt-4">
				      <input type="text" class="form-control col-8 ml-4" id ="commentInput">
				      <span class="input-group-btn">
					<button class="btn btn-default" type="button" id="commentBtn" data-post-id ="${q.id}">입력</button>
						
				      </span>
				</div>
				</c:forEach>
			</c:when>
			
		</c:choose>
		<div class ="mt-5 row col-12">
		
			<!-- 댓글 -->
			
			
			<c:forEach var="comment" items="${commentList}">	
				<label class ="mb-3 col-3">
					<h5>${comment.user_name}</h5>
				</label>
				<label class ="col-7">
					<h5>${comment.comment}</h5>
				</label>

					<!-- 아이디가 같을 경우 댓글 삭제 기능 추가 -->
					<c:choose>
						<c:when test="${userId eq comment.user_id}">
							<a href ="#"   class ="ml-5 col-1 deleteCommentBtn"  data-comment-id ="${comment.id}">
									<i class="bi bi-trash-fill"></i>
							</a>   	
						</c:when>
					</c:choose>
				
			</c:forEach>
			
			
			<!-- 댓글 -->
			
			
	
		</div>
	
	
		</section>
	
	
	
    <div class="group"  ></div>
  </div>
  
  
  
</div>
</body>
</html>