<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍓Mbting - 회원 정보 수정🍓</title>
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>


</head>
<body>
<c:import url ="/WEB-INF/jsp/include/header.jsp" />
<div class="section bg">
  <div class="container">
    <h1>프로필 변경하기</h1>
    <section class ="d-flex mb-5">
    	<a href ="/user/mypage_edit_view"><i class="bi bi-person-circle myprofile-icon"></i></a>
    	<div class ="mt-5 ml-4 col-12">
    	<h3>최주향</h3>
    	<div class ="mt-3 mb-1 col-5">
    		<label class ="mr-4 col-2">별명</label><input type ="text" class ="col-8">
			<label class ="mr-4 col-3">한줄소개</label><input type ="text" class ="col-8">

    	</div>
    	</div>
    </section>
   

    
    <div class="group"></div>
  </div>
</div>
</body>
</html>