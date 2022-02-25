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


<!-- css -->
 	<link href="/static/css/addbox.css" rel="stylesheet">
 	<link href="/static/css/btn.css" rel="stylesheet">
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
    			<input type ="text" class ="col-8 form-control" placeholder ="${userName}">
    		
			<label class ="mr-4 col-3 mt-2">한줄소개</label>
				<input type ="text" class ="col-8 form-control" placeholder ="${introduce}">
			
			<label class ="mr-4 col-3 mt-2">MBTI</label>
				<select class="col-8 form-control" name ="mbti">
					  
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
				<button class ="btn my">+</button>
				<div id="meritBoxWrap" class ="boxWrap col-10 mt-3 mb-3">
				</div>	
			</div>
				
			<div>
				<label class ="mr-4 col-8 mt-2">취미</label>
				<button class ="btn my">+</button>
				<div id="hobbyBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
			</div>	
				
			<div>
				<label class ="mr-4 col-8 mt-2">성격</label>
				<button class ="btn my">+</button>
				<div id="characterBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
			</div>
			
		
			
			
			<h1 class ="ml-5 mt-5 mb-5">❤️ 이런 분이 좋아요</h1>
			
			<!-- 이상형의 장점/취미/성격  -->
			<!-- 장점 -->
			
				<div>
					<label class ="mr-4 col-8 mt-2">장점</label>
					<button class ="btn your" >+</button>
					<div id="meritBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
				</div>
		
			
			
		
				<div>
					<label class ="mr-4 col-8 mt-2">취미</label>
					<button class ="btn your" >+</button>
					<div id="hobbyBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
				</div>	
				
			
			
				<div>
					<label class ="mr-4 col-8 mt-2">성격</label>
					<button class ="btn your">+</button>
					<div id="characterBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
				</div>
				
				
				<div>
					<label class ="mr-4 col-8 mt-2">기피형</label>
					<button class ="btn your" id ="characterPlusBtn">+</button>
					<div id="HateBoxWrap" class ="boxWrap col-10 mt-3 mb-3"></div>
				</div>
		
		
			<label class ="mr-4 col-8 mt-2">나이</label>
			<div id="ageWrap" class ="boxWrap col-10 mt-3 mb-3 mt-3 mb-3">
				<button type ='button'  class ='btn ml-2 mb-1 agebtn col-3' >연상</button>
				<button type ='button'  class ='btn ml-2 mb-1 agebtn col-3' >연하</button>
				<button type ='button'  class ='btn ml-2 mb-1 agebtn col-3' >동갑</button>
			</div>	
				
		<button type ="button" class ="overlay__btn btn col-10 mt-5 "> 
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
	
	$(".my").on("click",function(){
		  let one=1;
		  let boxWrap = $(this).parent().children('.boxWrap');
		  let btn = boxWrap.children('.btn');
		  let btnLength =btn.length;
		  boxWrap.append(`<input type ='text'  maxlength = '8' class ='btn ml-2 mb-1 addbtn col-3' id = '${one}'>`);
		
		    	if(btn.length>=5){
		    		 $(this).attr('disabled', true);
		    	}
	});
	
	$(".your").on("click",function(){
		  let boxWrap = $(this).parent().children('.boxWrap');
		  let btn = boxWrap.children('.btn');
		  boxWrap.append("<input type ='text'  maxlength='8' class ='btn ml-2 mb-1 addbtn col-3'>"+"</button>");
		
		    	if(btn.length>=5){
		    		 $(this).attr('disabled', true);
		    	}
	});
	
	
	
	
	
	
	
	
	$(".agebtn").on("click",function(){
		let age = $(this).text();
	    if ($(this).hasClass("addbtn")) { 
	    	$(this).removeClass("addbtn");
	    	       }
	    else{
	    	$(this).addClass("addbtn");
	    }


	})
	
	
	
});
</script>
</body>
</html>