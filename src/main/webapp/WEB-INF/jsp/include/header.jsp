<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- css -->
 	<link href="/static/css/main.css" rel="stylesheet">
<!--  부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	 
 
 

</head>
<body>
<div class="hold">
  <div class="header">
    <div class="container">
      <div id="logo">MBTING</div>
      <ul class="nav" id ="main-menu">
        <li>
         <!-- 좋아요 -->
	        <a href="#">
	        	<i class="bi bi-suit-heart menu-icon"></i>
	        	<!-- <i class="bi bi-suit-heart-fill"></i> -->
	        </a>
        </li>
        
         <!-- 홈 화면 -->
        <li>
	        <a href="/post/main">
	        	<i class="bi bi-house-door-fill menu-icon"></i>
	        </a>
        </li>
         <!-- 오늘의 질문 -->
        <li>
	        <a href="#QuestionForToday">
	        	<i class="bi bi-question-circle-fill menu-icon"></i>
	        </a>
        </li>
        
        <!-- 마이페이지 -->
        <li>
	        <a href="/user/mypage_view">
	        	<i class="bi bi-person-fill menu-icon"></i>
	        </a>
        </li>
      
        	${userName} 님 
        	<a href ="/user/sign_out" class ="ml-3">로그아웃</a>
   
        
      </ul>
    </div>
  </div>
</div>









<script type="module" src ="/static/js/header.js"></script>
</body>
</html>