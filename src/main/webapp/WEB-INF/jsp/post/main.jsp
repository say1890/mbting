<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">오늘의 MBTING</h1>
      <div class ="d-flex justify-content-center ">
	      <div id="profile-box" class ="col-5 bg-white justify-content-center">
	   
	      		<div id = "mbti" class=" bg-white mt-3 text-center">
	      			INTP
	      		</div>
	      		<!--  추천 상대 프로필 이미지 -->
	      		<img id ="recommended-profile-image" 
	      			 class="mt-3  mx-auto mt-4"
	      			 src ="https://file.mk.co.kr/meet/neds/2021/07/image_readtop_2021_701158_16268346804724209.jpg">
	      		<h4 id ="recommended-profile-name" class ="mt-1">멍멍이(24)</h4>
	      		<div id="recommended-profile-introduce" class="mx-auto mt-4">
	      		연상이 좋아요zzzzzzzzzzzzzzzz
	      		흡연합니다.
	      		</div>
	      		<hr>
	      		<div class ="d-flex justify-content-around">
		      		<a href ="#">
		      			<i class="bi bi-suit-heart-fill menu-icon text-danger"></i>
		      		</a>
		      		<a href ="#">
		      			<i class="bi bi-trash-fill menu-icon text-dark"></i>
		      		</a>
		      		
	      		</div>
	      </div>
      </div>
      <!-- <div class="call"><span>Wow</span></div> -->
    </div>
  </div>
</div>
<div class="section">
  <div class="container row">
  
	<h1>오늘의 질문</h1>
	<h4 class ="ml-3">${today}</h4>
	<c:forEach var="q" items="${questionList}">	
		<h3 class ="mt-5">
			<i class="bi bi-pen"></i>
			${q.subject}
			</h3>
			<section class ="mt-5 mb-5 row">
			<h4 class ="col-12">
			${q.content}
			</h4>
	
		
		
		<div class="input-group mt-4">
		      <input type="text" class="form-control col-8 ml-4" id ="commentInput">
		      <span class="input-group-btn">
			<button class="btn btn-default" type="button" id="commentBtn" data-post-id ="${q.id}">입력</button>
				
		      </span>
		 </div>
	</c:forEach>
	<div class ="ml-4 mt-5 row">
		<div class ="col-12">
		<label class ="mb-3"><h5>서강준</h5></label>
		<label class ="ml-4">
		<h5>
		깻잎절임을 못 떼는 내 친구를 위해 깻잎지를 눌러주는 나의 연인부터 주시죠 ㅠㅠ
		</h5>
		
		</label>
		</div>
		
		

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
	
	
	
});

</script>


</body>
</html>