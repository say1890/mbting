<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- slider -->
	<link rel="stylesheet"  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<link rel="stylesheet"  href="/static/css/swiper.css"/>
<!-- heart css -->	
	<link rel="stylesheet"  href="/static/css/heart.css"/>

</head>
<body>
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">오늘의 MBTING</h1> 

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
						      			<div>이런 부분이 나랑 찰떡🍓</div>
						      			<p class = "recommended-profile-introduce-font">
							      			<hr>
							      			<c:if test="${not empty user.merit}">
							      			 <div class ="col-12">
							      			 💪
							      			 <c:set var = "arr1" value = "${fn:replace(user.merit, '[','')}"/>
							      			 <c:set var = "arr2" value = "${fn:replace(arr1, ']','')}"/>
							      				<c:forEach var = "merit" items = "${arr2}">
							      					#${fn:replace(merit,' ','')}
							      				</c:forEach>
							      			 </div>
							      			</c:if>
							      			
							      			<c:if test="${not empty user.character}">
							      			 <div class ="col-12">
							      			  🎨
							      			  <c:set var = "arr1" value = "${fn:replace(user.character, '[','')}"/>
							      			 <c:set var = "arr2" value = "${fn:replace(arr1, ']','')}"/>
							      			 <c:forEach var = "character" items = "${arr2} ">
							      			 	#${fn:replace(character,' ','')}
							      			 </c:forEach>
							      			 
							      			 </div> 
							      			</c:if>
						      			 	<c:if test="${not empty user.hobby}">
						      				<div class ="col-12">🤹🏻‍
						      				<c:set var = "arr1" value = "${fn:replace(user.hobby, '[','')}"/>
							      			 <c:set var = "arr2" value = "${fn:replace(arr1, ']','')}"/>
							      			 <c:forEach var = "hobby" items = "${arr2} ">
							      			 	#${fn:replace(hobby,' ','')}
							      			 </c:forEach>
						      				
						      				</div>
						      				</c:if>
						      			</p>
						      			<p class ="recommended-profile-introduce-font mt-3">
							      			<c:if test="${not empty user.user.introduce}">
							      				<c:choose>
							      					<c:when test = "${fn:length(user.user.introduce)gt 35}">
														❝${fn:substring(user.user.introduce, 0, 34)} ... ❞
							      					</c:when>
							      					<c:otherwise>
							      						❝${user.user.introduce}❞
							      					</c:otherwise>
							      				</c:choose>
							      				
							      				
							      			</c:if>
						      			</p>
						      		</div>
						      		<hr class ="col-9 mt-6">
						      		<div class ="d-flex justify-content-around mt-3">
						      		
						      			<!-- 좋아요 -->
						      			
						      			<c:choose>
						      			
							      			<c:when test="${user.like}">
									      					<div class="heart clickedheart"></div>			      
								      		</c:when>
								      		<c:otherwise>
								      		<div class="heart" data-your-id="${user.user.id}"></div>
									      			
								      		</c:otherwise>
								      		
							      		</c:choose>
							      		<!-- 좋아요  끝-->
							      		
							      		<!-- 싫어요 -->
							      		<a href ="#">
							      			<i class="bi bi-trash-fill menu-icon text-dark dislikeBtn" data-your-id="${user.user.id}"></i>
							      		</a>
							      		<!-- 싫어요 끝 -->
							      		
						      		</div>
						  </div>  		<!-- profile box 끝 -->
						</div> <!-- 프로필 한 개 끝 -->
						<div class="swiper-scrollbar"></div>  
				      </c:forEach>
				 
		      	</div> <!--  slider wrapper 끝 -->


		     <c:if test ="${userList.size()>1}">
		       <div class="swiper-button-prev mb-5"></div>
 			  <div class="swiper-button-next mb-5"></div>

		     </c:if>
		    
			      	 
		    
			      	</div> <!-- swiper 끝 -->

			      </c:when>
			     <c:otherwise>
		     		<div class ="row justify-content-center mt-5 col-12">
			      		<h1 class ="text-white mt-5 col-12"> 회원 정보를 더 입력하고 추천을 받아보세요 :)</h1>
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
	
	  $(".heart").on("click", function(e){
		  e.preventDefault();
		  let matchedPersonId = $(this).data("your-id");
		  $(this).addClass('clickedheart');
		  
		  $.ajax({
				type:"get",
				url:"/like",
				data:{"receiver":matchedPersonId},
				success:function(data) {
	
					}
					
				, error:function() {
					alert("좋아요 실패!!");
				}
				
			});
	  });
	  
	  
	  $(".likeBtn").on("click",function(e){
		  e.preventDefault();
		  let matchedPersonId = $(this).data("your-id");

		  $.ajax({
				type:"get",
				url:"/like",
				data:{"receiver":matchedPersonId},
				success:function(data) {
					$(".likeBtn").removeClass("bi-suit-heart");
					$(".likeBtn").addClass("bi-suit-heart-fill");
					
					}
					
				, error:function() {
					alert("좋아요 실패!!");
				}
				
			});
		  
	  });
	  
	  // 싫어요 
	  $(".dislikeBtn").on("click",function(e){
		  e.preventDefault();
		  let matchedPersonId = $(this).data("your-id");
		 $("#profile-box").addClass("d-none");
		  $.ajax({
				type:"get",
				url:"/dislike",
				data:{"receiver":matchedPersonId},
				success:function(data) {
						alert("싫어요 성공");
					}
					
				, error:function() {
					alert("싫어요 실패!!");
				}
				
			});
	  });
	  
  });
  
  </script>
 
</body>
</html>