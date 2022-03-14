<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- slider -->
<link rel="stylesheet"  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<link rel="stylesheet"  href="/static/css/swiper.css"/>
</head>
<body>
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">오늘의 MBTING❤️</h1>

      <div class ="row justify-content-center ">
       <c:choose>
		   <c:when test ="${not empty userList}">
		   	<div class="swiper">
		   	 <!-- Additional required wrapper -->
	  			<div class="swiper-wrapper">	
			  
			       <!-- Slides -->
			       <c:forEach var="user" items="${userList}">	
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

			      </c:when>
			     <c:otherwise>
		     		<div class ="row justify-content-center mt-5">
			      		<h1 class ="text-white mt-5"> 회원 정보를 더 입력하고 추천을 받아보세요 :)</h1>
			      		<a href ="/user/mypage_edit_view"><button class ="btn col-12 mt-5">정보 입력하러 가기</button></a>
		      		</div>
	     		</c:otherwise>
	     		</c:choose>
			      </div>	  
		      	
	 
	    

      </div>
     
    </div>
  </div>
  
  
 
  <script type="module" src ="/static/js/swiper.js"></script>
  <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  <script>
  $(document).ready(function(){
	
	  $(".likeBtn").on("click",function(e){
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