<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div class ="row justify-content-center ">
		   	<div class="swiper">
		   	 <!-- Additional required wrapper -->
	  			<div class="swiper-wrapper">	
			  
			       <!-- Slides -->
			       <c:forEach var="user" items="${likeList}">	
			       <div class="swiper-slide">
				      <div id="profile-box" class ="bg-white  mx-auto">
				     	
					   			
						      		<div id = "mbti" class=" bg-white mt-3 text-center">
						      			${user.user.mbti}
						      		</div>
						      		<!--  추천 상대 프로필 이미지 -->
						      		<c:choose>
							      		<c:when test = "${not empty user.user.profile}">
							      			<a href = "/user/see_profile?userId=${user.user.id}">
							      				<img id ="recommended-profile-image"  class="mt-3  mx-auto mt-4" src ="${user.user.profile}">
							      			</a>
							      		</c:when>
							      		<c:otherwise>
							      			<a href = "/user/see_profile?userId=${user.user.id}">
							      			<img id ="recommended-profile-image"  class="mt-3  mx-auto mt-4" src ="/static/image/noprofile.png">
							      			</a>
							      		</c:otherwise>
	
						      		</c:choose>
						      		<!--  추천 상대 프로필 이미지 끝 -->
						      		<h4 id ="recommended-profile-name" class ="mt-1">${user.user.userName}(${user.user.ageForProfile})</h4>
						      		<div id="recommended-profile-introduce" class="mx-auto mt-4 mb-5">
						      			<p class = "recommended-profile-introduce-font">
							      			
							      			<c:if test="${not empty user.merit}">
							      			#${user.merit}
							      			
							      			</c:if>
							      			<c:if test="${not empty user.character}">
							      			#${user.character}  
							      			</c:if>
						      			 	<c:if test="${not empty user.hobby}">
						      				#${user.hobby} 
						      				</c:if>
						      			</p>
						      			<p class ="recommended-profile-introduce-font ">
							      			<c:if test="${not empty user.user.introduce}">
							      			❝${user.user.introduce}❞
							      			</c:if>
						      			</p>
						      		</div>
						      		<hr class ="mt-5">
						      		<div class ="d-flex justify-content-around">
						      			<!-- 좋아요 -->
						      			
						      			<c:choose>
						      			
							      			<c:when test="${user.like}">
									      		<a href ="#">
									      			<i class="bi bi-suit-heart-fill menu-icon text-danger likedBtn" data-your-id="${user.user.id}"></i>
									      		</a>
								      		</c:when>
								      		<c:otherwise>
									      		<a href ="#">
									      			<i class="bi bi-suit-heart menu-icon text-danger likeBtn" data-your-id="${user.user.id}"></i>
									      		</a>
								      		</c:otherwise>
								      		
							      		</c:choose>
							      		<!-- 좋아요  끝-->
							      		<a href ="#">
							      			<i class="bi bi-trash-fill menu-icon text-dark "></i>
							      		</a>
							      		
						      		</div>
						  </div>  		<!-- profile box 끝 -->
						</div> <!-- 프로필 한 개 끝 -->
						  
				      </c:forEach>

		      	</div> <!--  slider wrapper 끝 -->
		     
		      <div class="swiper-button-prev mb-5"></div>
 			  <div class="swiper-button-next mb-5"></div>
			      	
		    
			      	</div> <!-- swiper 끝 -->

			      </div>
 <script type="module" src ="/static/js/swiper.js"></script>
 <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>			   
<script>

  $(document).ready(function(){
	
	  $(".likeBtn").on("click",function(e){
		  alert();
		  e.preventDefault();
		  let matchedPersonId = $(this).data("your-id");
		  alert(matchedPersonId);
		  
		  
		  $.ajax({
				type:"get",
				url:"/user/like",
				data:{"receiver":matchedPersonId},
				success:function(data) {
						location.reload();
						alert("좋아요 성공");
					}
				, error:function() {
					alert("좋아요 실패!!");
				}
				
			});
		  
	  });
	  
  });
  			      
</script>			      	
</body>
</html>