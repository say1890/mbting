<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">오늘의 MBTING</h1>
      <div class ="d-flex justify-content-center ">
      
      <i class="bi bi-caret-left-fill display-3 text-white arrow mx-5"></i>
	      <div id="profile-box" class ="col-6 bg-white justify-content-center">
	   			<c:forEach var="user" items="${userList}">	
		      		<div id = "mbti" class=" bg-white mt-3 text-center">
		      			${user.user.mbti}
		      		</div>
		      		<!--  추천 상대 프로필 이미지 -->
		      		<img id ="recommended-profile-image" 
		      			 class="mt-3  mx-auto mt-4"
		      			 src ="https://file.mk.co.kr/meet/neds/2021/07/image_readtop_2021_701158_16268346804724209.jpg">
		      		<h4 id ="recommended-profile-name" class ="mt-1">${user.user.userName}(${user.user.ageForProfile})</h4>
		      		<div id="recommended-profile-introduce" class="mx-auto mt-4 mb-5">
		      			<p class = "recommended-profile-introduce-font">#${user.merit}  #${user.character}   #${user.hobby} </p>
		      			<p class ="recommended-profile-introduce-font ">❝${user.user.introduce}❞</p>
		      		</div>
		      		<hr class ="mt-5">
		      		<div class ="d-flex justify-content-around">
			      		<a href ="#">
			      			<i class="bi bi-suit-heart-fill menu-icon text-danger"></i>
			      		</a>
			      		<a href ="#">
			      			<i class="bi bi-trash-fill menu-icon text-dark "></i>
			      		</a>
			      		
		      		</div>
	      		</c:forEach>
	      		
	      </div>
	      <i class="bi bi-caret-right-fill display-3 text-white arrow mx-5"></i>
      </div>
     
    </div>
  </div>
</body>
</html>