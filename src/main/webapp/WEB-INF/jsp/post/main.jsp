<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>



<title>🍓Mbting - main🍓</title>
</head>


<body>

<c:choose>
<c:when test = "${userLoginId eq 'admin' }">
	<c:import url ="/WEB-INF/jsp/admin/include/header.jsp" />
</c:when>

<c:otherwise>
	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
</c:otherwise>
</c:choose>



<div class="section">
<!-- 이성 추천란 -->
		
			<c:import url ="/WEB-INF/jsp/post/recommend.jsp" />


	
</div>
<div class="section mt-5" id = "QuestionForToday">

    <div class="container row" >
  
	<h1 class ="mt-5">오늘의 질문</h1>
	<h4 class ="ml-3 mt-5">${today}</h4>
	<c:choose>
		<c:when test = "${not empty questionList }">
		<c:forEach var="q" items="${questionList}">	
			<h3 class ="mt-5 ml-5">
				<i class="bi bi-pen"></i>
				${q.subject}
				</h3>
				<section class ="mt-5 mb-5 row col-12">
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
	
	
	
    <div class="group"></div>
  </div>
  
  
  
</div>
<div class="section bg">
  <div class="container">
    <h1>Wow wow</h1>
    <h2>Wow wow wow!</h2>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>
<div class="section">
  <div class="container">
    <h1>Wow? Wow wow wow wow!</h1>
    <h2>Wow</h2>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
  </div>
</div>



<div class="section bg">
  <div class="container">
    <h1>Wow</h1>
    <h2>Wow wow wow wow</h2>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow</span><span class="side"> - Wow wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow wow</span><span class="side"> - Wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow wow</span><span class="side"> - Wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow</span><span class="side"> - Wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>




<div class="section">
  <div class="container">
    <div class="col two">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>

<div class="section">
  <div class="container">
    <h1 class="reset">Terrible.</h1>
  </div>
</div>


<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

<script>
$(document).ready(function(){
	
	$("#commentBtn").on("click",function(){
		let comment = $("#commentInput").val();
		let postId = $(this).data("post-id");
		$.ajax({
			type:"get",
			url:"/comment/addComment",
			data:{
			"comment":comment,
			"postId":postId
			},
			success:function(data) {
				if(data.result == "success") {
					location.reload();
				} else {
					alert("댓글 달기 실패");
				}
				
			},
			error:function() {
				alert("에러발생");
			}
		});
		
	});
	
	$(".deleteCommentBtn").on("click", function(e){
		
		e.preventDefault();
		let CommentId = $(this).data("comment-id");
		$.ajax({
			type:"get",
			url:"/comment/deleteComment", 
			data:{"CommentId":CommentId},
			success:function(data) {
				if(data.result=="success") {
					alert("삭제 성공");
					location.reload();
				} else {
					alert("삭제 실패");
				}
			},
			error:function() {
				alert("에러발생");
			}
			
		}); // ajax end
	});
	
	
});

</script>


</body>
</html>