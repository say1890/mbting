<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>🍓Mbting - 회원 정보 수정🍓</title>
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>


<!-- css -->
 	<link href="/static/css/addbox.css" rel="stylesheet">
 	<link href="/static/css/btn.css" rel="stylesheet">
 	
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 	
	
</head>
<body>
<c:import url ="/WEB-INF/jsp/include/header.jsp" />
<div class="section bg">
  <div class="container">
    <h1>나는 이런 사람이예요</h1>
    <section class ="d-flex mb-5 ml-5">
    	<a href ="/user/mypage_edit_view"><i class="bi bi-person-circle myprofile-icon"></i></a>
    	<div class ="mt-5 ml-4 col-12">
    	<h3 class ="ml-3">${userName}</h3>
    	<div class ="mt-3 mb-1 col-12">
    		<label class ="mr-4 col-2 mb-2">별명</label>
    			<input type ="text" class ="col-8 form-control" placeholder ="${userName}" id = "userNameInput" maxlength="10">
    			
			<label class ="mr-4 col-3 mt-2">한줄소개</label>
				<input type ="text" class ="col-8 form-control" placeholder ="${introduce}" id = "introduceInput" maxlength="50">
			
			<label class ="mr-4 col-3 mt-2">MBTI</label>
				<select class="col-8 form-control" name ="mbti" id = "mbtiInput">
					  
					<option value="${mbti}">${mbti}</option>
					<option value ="ISTJ">ISTJ</option>
					<option value ="ISFJ">ISFJ</option>
					<option value ="INFJ">INFJ</option>
					<option value ="INTJ">INTJ</option>
					
					<option value ="ISTP">ISTP</option>
					<option value ="ISFP">ISFP</option>
					<option value ="INFP">INFP</option>
					<option value ="INTP">INTP</option>
					
					<option value ="ESTP">ESTP</option>
					<option value ="ESFP">ESFP</option>
					<option value ="ENFP">ENFP</option>
					<option value ="ENTP">ENTP</option>
					
					<option value ="ESTJ">ESTJ</option>
					<option value ="ESFJ">ESFJ</option>
					<option value ="ENFJ">ENFJ</option>
					<option value ="ENTJ">ENTJ</option>
			</select>
			
			
			<!-- 자신의 장점/취미/성격 -->
			<div>
				<label class ="mr-4 col-8 mt-2">장점</label>
				
				<div id="MyMerit" class =" col-10 mt-3 mb-3">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >예쁜 눈</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >오똑한 코</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >섹시한 두뇌</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >머릿결</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >꿀같은 목소리</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >큰 키</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >애교쟁이</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >듬직한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >날씬한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >웃는게 예쁜</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >노래를 잘하는</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >패셔니스타</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >웃긴</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >좋은 향기가 나는</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >꿀피부</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >겉쌍</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >속쌍</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >무쌍</button>
				</div>	
			</div>
				
			<div>
				<label class ="mr-4 col-8 mt-2">취미</label>
			
				<div id="MyHobby" class =" col-10 mt-3 mb-3">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >산책</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >악기 연주</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >운동</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >쇼핑</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >악기 연주</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >음악 감상</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >그림 그리기</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >노래 부르기</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >여행 가기</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >요리</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >사진 찍기</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >독서</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >넷플릭스</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >언어 공부</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >자격증 따기</button>
			
				</div>
			</div>	
				
			<div>
				<label class ="mr-4 col-8 mt-2">성격</label>
				
				<div id="MyCharacter" class =" col-10 mt-3 mb-3">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >감성적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >내성적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >외향적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >열정적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >섬세한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >배려깊은</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >센스있는</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >눈치있는</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >신중한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >현실적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >당당한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >적극적인</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >솔직한</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >4차원</button>
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >귀여운</button>
	
				</div>
			</div>
			
		
			
			
			<h1 class ="ml-5 mt-5 mb-5">❤️ 이런 분이 좋아요</h1>
			
			<!-- 이상형의 장점/취미/성격  -->
			<!-- 장점 -->
			
				<div>
					<label class ="mr-4 col-8 mt-2">장점</label>
					
					<div id="YourMerit" class =" col-10 mt-3 mb-3">
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >예쁜 눈</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >오똑한 코</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >섹시한 두뇌</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >머릿결</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >꿀같은 목소리</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >큰 키</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >애교쟁이</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >듬직한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >날씬한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >웃는게 예쁜</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >노래를 잘하는</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >패셔니스타</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >웃긴</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >좋은 향기가 나는</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >꿀피부</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >겉쌍</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >속쌍</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >무쌍</button>
					</div>
				</div>
		
			
			
		
				<div>
					<label class ="mr-4 col-8 mt-2">취미</label>
					
					<div id="YourHobby" class =" col-10 mt-3 mb-3">
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >산책</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >악기 연주</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >운동</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >쇼핑</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >악기 연주</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >음악 감상</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >그림 그리기</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >노래 부르기</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >여행 가기</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >요리</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >사진 찍기</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >독서</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >넷플릭스</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >언어 공부</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >자격증 따기</button>
					</div>
				</div>	
				
			
			
				<div>
					<label class ="mr-4 col-8 mt-2">성격</label>
					
					<div id="YourCharacter" class =" col-10 mt-3 mb-3">
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >감성적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >내성적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >외향적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >열정적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >섬세한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >배려깊은</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >센스있는</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >눈치있는</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >신중한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >현실적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >당당한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >적극적인</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >솔직한</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >4차원</button>
						<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >귀여운</button>
					</div>
				</div>
				
				
		
		
			<label class ="mr-4 col-8 mt-2">나이</label>
			<div id="age" class =" col-10 mt-3 mb-3 mt-3 mb-3">
				<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >연상</button>
				<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >연하</button>
				<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >동갑</button>
			</div>	
				
		<button type ="button" class ="overlay__btn btn col-10 mt-5 " id ="saveBtn"> 
		
		<b class ="text-white">저장하기</b> 
		<span class="overlay__btn-emoji ">🎨</span>
			</button>
	
				
    	</div>
    	</div>
    </section>

    
    <div class="group"></div>
  </div>
</div>
<script>
$(document).ready(function(){
	
	$("#saveBtn").on("click",function(){
		
	
		/* 나 관련 */
		let userName = $("#userNameInput").val();
		let introduce = $("#introduceInput").val();
		let mbti = $("#mbtiInput").val();
		

		let myMeritArr=[];
		
		$("#MyMerit").children('.selectedBtn').each(function(index){
			myMeritArr.push($(this).text());
		})
		
		let myHobbyArr=[];
		
		$("#MyHobby").children('.selectedBtn').each(function(index){
			myHobbyArr.push($(this).text());
		})
		
		let myCharacterArr=[];
		
		$("#MyCharacter").children('.selectedBtn').each(function(index){
			myCharacterArr.push($(this).text());
		})


		/* 상대 관련 */
		
		let yourMeritArr=[];
		
		$("#YourMerit").children('.selectedBtn').each(function(index){
			yourMeritArr.push($(this).text());
		})
		
		
		let yourHobbyArr=[];
		
		$("#YourHobby").children('.selectedBtn').each(function(index){
			yourHobbyArr.push($(this).text());
		})
		

		let yourCharacterArr=[];
		
		$("#YourCharacter").children('.selectedBtn').each(function(index){
			yourCharacterArr.push($(this).text());
		})
		
		let age = $("#age").children('.selectedBtn').text();
		
		
		
		
		$.ajax({
			
			
			 type: 'post',
             url: "/user/editProfile",
             data:{
            	 
            	"userName" : userName,
            	"introduce" : introduce,
            	"mbti" : mbti,
 				"myMeritArr":myMeritArr,
 				"myHobbyArr":myHobbyArr,
 				"myCharacterArr":myCharacterArr,
 				"yourMeritArr":yourMeritArr, 
 				"yourHobbyArr":yourHobbyArr,
 				"yourCharacterArr":yourCharacterArr,
 				"age":age
 				},
 			success:function(data){
 		
 			}, error:function(e){
 				alert("error" + e);
 			}
           	 	
		});
	});
	
	

		    	
		    	
	});
	

	
	
	
	
	$(".txtbtn").on("click",function(){
		let text = $(this).text();
		alert(text);
		let  myClass = $(this).closest("div").attr('id');
		alert(myClass);

	    if ($(this).hasClass("selectedBtn")) { 
	    	$(this).removeClass("selectedBtn");
	    	       }
	    else{
	    	$(this).addClass("selectedBtn");
	    }
	})
	
	
	
	
	

</script>
</body>
</html>