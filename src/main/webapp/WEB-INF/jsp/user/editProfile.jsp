<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>πMbting - νμ μ λ³΄ μμ π</title>
<!-- λΆνΈμ€νΈλ© -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>


<!-- css -->
<link href="/static/css/btn.css" rel="stylesheet"> 	
<link href="/static/css/welcome.css" rel="stylesheet"> 	
<link href="/static/css/smallImg.css" rel="stylesheet"> 	
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 	
	
</head>
<body>
<c:import url ="/WEB-INF/jsp/include/header.jsp" />
<div class="section bg">

<c:if test ="${firstconnection eq 'yes'}">
  	<div id = "welcome">
  		<div class = "h1"><h1>νμν©λλ€ <strong>${userName}λ :)</strong></h1></div>
  	</div>
  </c:if>
  <div class="container">
  
  
    <h1>λλ μ΄λ° μ¬λμ΄μμ</h1>
    
    <section class ="d-flex mb-5 ml-5">
    
    <!-- νλ‘ν μ¬μ§ μμ­ -->
    	<a href ="#" id = "profileUpdateBtn">
    	<c:choose>
    		<c:when test = "${empty profile}">
    			<i class="bi bi-person-circle myprofile-icon" id = "basicIcon"></i>
    			<img src = "#" id="smallProfile" class ="d-none rounded-circle img-responsive">
    		</c:when>
    		<c:otherwise>
    		<div class = "dropdown">
    			<img src = "${profile}" id="smallProfile" class ="rounded-circle img-responsive">
	    	 <div class="dropdown-menu dropdown-menu-sm" id="context-menu">
	    		<a class="dropdown-item"  href = "#">νλ‘ν μ¬μ§ μ­μ </a>
	    	 </div>
    		</div>
    		</c:otherwise>
    	</c:choose>
    	</a>
    	<input type ="file" id ="fileInput" class ="d-none">
    	
    	
    	<div class ="mt-5 ml-4 col-12">
    	<h3 class ="ml-3">${userName}</h3> 
    	<div class ="mt-3 mb-1 col-12">
    	<div class="alert alert-info text-sm">
    	<svg class="smallSvg mt-1" aria-hidden="true" focusable="false" data-prefix="fa" data-icon="info-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg>
    	λΉλ°λ²νΈ λ³κ²½μ μνλ κ²½μ°μλ§ μλ λΉλ°λ²νΈ νλλ₯Ό μλ ₯νμΈμ.
    	</div>
    	
    		<div>
	    		<label class ="mr-4 col-2 mb-2 mt-2 ">λΉλ°λ²νΈ</label>
	    			<input type ="password" class ="col-8 form-control"  id = "password" maxlength="32">
	    		<small id = "pwInput" class= "d-none">γγ</small>
    		</div>
    		
    		<label class ="mr-4 col-2 mb-2 mt-2 ">λΉλ°λ²νΈ νμΈ</label>
    			<input type ="password" class ="col-8 form-control"  id = "passwordCheck" maxlength="32">	
    		<label class ="mr-4 col-2 mb-2 mt-2 ">λ³λͺ</label>
    			<input type ="text" class ="col-8 form-control" value ="${userName}" id = "userNameInput" maxlength="10">
    			
			<label class ="mr-4 col-3 mt-2">νμ€μκ°</label>
				<input type ="text" class ="col-8 form-control" value ="${introduce}" id = "introduceInput" maxlength="50">
			
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
			
			
			<!-- μμ μ μ₯μ /μ·¨λ―Έ/μ±κ²© -->
			<c:choose>
					<c:when test= "${not empty SelectedOptions}">	
			<div>
				<label class ="mr-4 col-8 mt-2">μ₯μ </label>
				
				<div id="MyMerit" class =" col-10 mt-3 mb-3">
				
					
					<c:forEach var="m" items="${merit}">
						<c:forEach var="s" items="${SelectedOptions}">
							<c:choose>
								<c:when test = "${fn:contains(s.myMerit,m)}">
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${m}</button>
								</c:when>
								<c:otherwise>
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${m}</button>	
								</c:otherwise>
							</c:choose>
						</c:forEach>	
						</c:forEach>
					
				

				</div>	
			</div>
				
			<div>
				<label class ="mr-4 col-8 mt-2">μ·¨λ―Έ</label>
			
				<div id="MyHobby" class =" col-10 mt-3 mb-3">
				
				<c:forEach var="hobby" items="${hobby}">	
						<c:forEach var="selected" items="${SelectedOptions}">
							<c:choose>
								<c:when test = "${fn:contains(selected.myHobby,hobby)}">
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${hobby}</button>
								</c:when>
								<c:otherwise>
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${hobby}</button>	
								</c:otherwise>
							</c:choose>
						</c:forEach>	
				</c:forEach>
				
				
			
				</div>
			</div>	
				
			<div>
				<label class ="mr-4 col-8 mt-2">μ±κ²©</label>
				
				<div id="MyCharacter" class =" col-10 mt-3 mb-3">
				<c:forEach var="character" items="${character}">	
						<c:forEach var="selected" items="${SelectedOptions}">
							<c:choose>
								<c:when test = "${fn:contains(selected.myCharacter,character)}">
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${character}</button>
								</c:when>
								<c:otherwise>
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${character}</button>	
								</c:otherwise>
							</c:choose>
						</c:forEach>	
				</c:forEach>
	
				</div>
			</div>
			</c:when>
			<c:otherwise>
			
			<label class ="mr-4 col-8 mt-2">μ₯μ </label>
				
				<div id="MyMerit" class ="col-10 mt-3 mb-3">
					<c:forEach var="m" items="${merit}">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${m}</button>
					</c:forEach>
				</div>
				
			<label class ="mr-4 col-8 mt-2">μ·¨λ―Έ</label>	
				<div id="MyHobby" class ="col-10 mt-3 mb-3">
					<c:forEach var="h" items="${hobby}">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${h}</button>
					</c:forEach>
				</div>
			<label class ="mr-4 col-8 mt-2">μ±κ²©</label>		
				<div id="MyCharacter" class ="col-10 mt-3 mb-3">
					<c:forEach var="c" items="${character}">
					<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${c}</button>
					</c:forEach>
				</div>
			
			</c:otherwise>
	</c:choose>
	
	
		
			
			
			<h1 class ="ml-5 mt-5 mb-5">β€οΈ μ΄λ° λΆμ΄ μ’μμ</h1>
			
			<c:if test = "${not empty  SelectedOptions}">
			
			<!-- μ΄μνμ μ₯μ /μ·¨λ―Έ/μ±κ²©  -->
			<!-- μ₯μ  -->
			
				<div>
					<label class ="mr-4 col-8 mt-2">μ₯μ </label>
					
					<div id="YourMerit" class =" col-10 mt-3 mb-3">
					<c:forEach var="merit" items="${merit}">	
						<c:forEach var="selected" items="${SelectedOptions}">
							<c:choose>
								<c:when test = "${fn:contains(selected.yourMerit,merit)}">
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${merit}</button>
								</c:when>
								<c:otherwise>
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${merit}</button>	
								</c:otherwise>
							</c:choose>
						</c:forEach>	
				</c:forEach>
					</div>
				</div>
		
			
			
		
				<div>
					<label class ="mr-4 col-8 mt-2">μ·¨λ―Έ</label>
					
					<div id="YourHobby" class =" col-10 mt-3 mb-3">
					<c:forEach var="hobby" items="${hobby}">	
						<c:forEach var="selected" items="${SelectedOptions}">
							<c:choose>
								<c:when test = "${fn:contains(selected.yourHobby,hobby)}">
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${hobby}</button>
								</c:when>
								<c:otherwise>
									<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${hobby}</button>	
								</c:otherwise>
							</c:choose>
						</c:forEach>	
				</c:forEach>
					</div>
				</div>	
				
			
			
				<div>
					<label class ="mr-4 col-8 mt-2">μ±κ²©</label>
					
					<div id="YourCharacter" class =" col-10 mt-3 mb-3">
					<c:forEach var="character" items="${character}">	
							<c:forEach var="selected" items="${SelectedOptions}">
								<c:choose>
									<c:when test = "${fn:contains(selected.yourCharacter,character)}">
										<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${character}</button>
									</c:when>
									<c:otherwise>
										<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${character}</button>	
									</c:otherwise>
								</c:choose>
							</c:forEach>	
					</c:forEach>					
					</div>
				</div>
				

				
						
				
		
		
			<label class ="mr-4 col-8 mt-2">λμ΄</label>
			<div id="age" class =" col-10 mt-3 mb-3 mt-3 mb-3">
			<c:forEach var="age" items="${age}">
			
						<c:forEach var="selected" items="${SelectedOptions}">
								<c:choose>
									<c:when test = "${fn:contains(selected.age,age)}">
										<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3 selectedBtn' >${age}</button>
									</c:when>
									<c:otherwise>
										<button type ='button'  class ='btn ml-2 mb-1 txtbtn col-3' >${age}</button>	
									</c:otherwise>
								</c:choose>
						</c:forEach>



			
				</c:forEach>
			</div>	
			</c:if>
			<c:if test = "${empty  SelectedOptions}">
				<h2 class ="mr-5">μ΄ λΆλΆμ μ λ³΄ μ μ₯ ν μμ  κ°λ₯ν©λλ€ :)</h2>
			</c:if>	
		<button type ="button" class ="overlay__btn btn col-8 mt-5 " id ="saveBtn"> 
		
		<b class ="text-white">μ μ₯νκΈ°</b> 
		<span class="overlay__btn-emoji ">π¨</span>
			</button>
	
				
    	</div>
    	</div>
    </section>

    
    <div class="group"></div>
  </div>
</div>
<script>
$(document).ready(function(){
	 //λΉλ°λ²νΈ μ²΄ν¬
	 var pwCheck = true;
	
	 $("#password").on("propertychange change keyup paste input",(function(){
		 var password = $("#password").val();
		 var passwordCheck = $("#passwordCheck").val();
		
		 $("#pwInput").removeClass("d-none");

		 if(password.length<=6){
			 $("#pwInput").text("λΉλ°λ²νΈλ 7μ μ΄μμ΄ λΌμΌ ν©λλ€.");
			 pwCheck = false;
		 }
		 
		 if(password.length>=7 && password != passwordCheck){
			 $("#pwInput").text("λΉλ°λ²νΈκ° κ°μ§ μμ΅λλ€.");
		 }
		 if(password.length>=7 && !passwordCheck){
			 $("#pwInput").text("λΉλ°λ²νΈλ₯Ό νμΈν΄μ£ΌμΈμ.");
		 }
		 if(password.length>=7 &&password!=passwordCheck) {
			 $("#pwInput").text("λΉλ°λ²νΈκ° κ°μ§ μμ΅λλ€.");
         }
		 
		 if(password.length>=7 && password == passwordCheck){
			 $("#pwInput").addClass("d-none");
			 pwCheck=true;
		 }
		 
		 if(password.length==0 && passwordCheck.length==0){
			 pwCheck=true;
		 }

		
	 }));
	 
	 
	 $("#passwordCheck").on("propertychange change keyup paste input",function(){
		 var password = $("#password").val();
		 var passwordCheck = $("#passwordCheck").val();
		 if(password.length>=7 &&password==passwordCheck) {
			 $("#pwInput").text("λΉλ°λ²νΈκ° κ°μ΅λλ€.");
			 pwCheck = true;
         }
		 if(password.length>=7 &&password!=passwordCheck){
			 $("#pwInput").text("λΉλ°λ²νΈκ° λ€λ¦λλ€");
			 pwCheck = false;
         }
	 });

	 
	
	if($("#welcome").length){
		
		$(".container").hide();
		$("#welcome").animate({opacity:'0'}
		,6000,function(){
			$(".container").show();	
		});
	}
	
	$('.dropdown-item').on("click",function(){
		$("#smallProfile").replaceWith('<i class="bi bi-person-circle myprofile-icon" id = "basicIcon"></i>');
		$("#saveBtn").click();
	});
	
	$('.dropdown').on('contextmenu', function(e) {
		  var top = e.pageY-240;
		  var left = e.pageX-120;
		  $("#context-menu").css({
		    display: "block",
		    top: top,
		    left: left
		  }).addClass("show");
		  return false; //blocks default Webbrowser right click menu
		}).on("click", function() {
		  $("#context-menu").removeClass("show").hide();
		  
		  $.ajax({
				 type: 'get',
	             url: "/user/deleteProfile",
	 			success:function(data){
	 			}, error:function(e){
	 				alert("μ¬μ§ μ­μ  μ€ν¨");
	 			}
	           	 	
			});
		 
		});

		$("#context-menu a").on("click", function() {
		  $(this).parent().removeClass("show").hide();
		});
	
	
	
	
	
	$("#profileUpdateBtn").on("click", function() {
	
			$("#fileInput").click();

	});
	
	
	
	 $("#fileInput").on("change", function() {
        	setImageFromFile(this, "#smallProfile");
 			$("#smallProfile").removeClass("d-none");
 			$("#basicIcon").addClass("d-none");
		});
         
        function setImageFromFile(input, expression) {
        	    if (input.files && input.files[0]) {
        	        var reader = new FileReader();
        	        reader.onload = function (e) {
        	            $(expression).attr('src', e.target.result);
        	        }
        	        reader.readAsDataURL(input.files[0]);
        	    }
        }
	
	
	
	
	
	
	$("#saveBtn").on("click",function(){
		
	
		/* λ κ΄λ ¨ */
		let password = $("#password").val();
		
		if(pwCheck == false){
			alert("λΉλ°λ²νΈλ₯Ό νμΈν΄μ£ΌμΈμ.");
			$("#password").focus();
		}
		
		
		
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


		/* μλ κ΄λ ¨ */
		
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
		
		let ageArr=[];
		$("#age").children('.selectedBtn').each(function(index){
			ageArr.push($(this).text());
		})
		

		let formData = new FormData();
		
		formData.append("userName", userName);
		formData.append("introduce", introduce);
		formData.append("mbti", mbti);
		
		
		
		formData.append("myMeritArr",myMeritArr);
		for(var i=0; i<myMeritArr.length;i++){
			 formData.append('myMeritArr[]', myMeritArr[i]);
		}
		
		formData.append("myHobbyArr",myHobbyArr);
		for(var i=0; i<myHobbyArr.length;i++){
			 formData.append('myHobbyArr[]', myHobbyArr[i]);
		}
		
		
		formData.append("myCharacterArr",myCharacterArr);
		for(var i=0; i<myCharacterArr.length;i++){
			 formData.append('myCharacterArr[]', myCharacterArr[i]);
		}
		
		formData.append("yourMeritArr",yourMeritArr); 
		for(var i=0; i<yourMeritArr.length;i++){
			 formData.append('yourMeritArr[]', yourMeritArr[i]);
		}
		
		
		formData.append("yourHobbyArr",yourHobbyArr);
		for(var i=0; i<yourHobbyArr.length;i++){
			 formData.append('yourHobbyArr[]', yourHobbyArr[i]);
		}
		
		formData.append("yourCharacterArr",yourCharacterArr);
		for(var i=0; i<yourCharacterArr.length;i++){
			 formData.append('yourCharacterArr[]', yourCharacterArr[i]);
		}
		
		
		formData.append("ageArr",ageArr);
		for(var i=0; i<ageArr.length;i++){
			 formData.append('ageArr[]', ageArr[i]);
		}
		
		
		formData.append("file", $("#fileInput")[0].files[0]);
		formData.append("password",password);
		$.ajax({
			
			
			 type: 'post',
             url: "/user/editProfile",
             data:formData,
             enctype:"mutipart/form-data",  // νμΌ μλ‘λ νμ
			 processData:false, // νμΌ μλ‘λ νμ
			 contentType:false, // νμΌ μλ‘λ νμ
 			success:function(data){
 				location.reload();
 		
 			}, error:function(e){
 				alert("μ λ³΄ μμ  μ€ν¨");
 			}
           	 	
		});
	});
	
	

		    	
		    	
	});
	

	
	
	
	
	$(".txtbtn").on("click",function(){
		let text = $(this).text();
		
		let  myClass = $(this).closest("div").attr('id');


	    if ($(this).hasClass("selectedBtn")) { 
	    	$(this).removeClass("selectedBtn");
	    	       }
	    else{
	    	$(this).addClass("selectedBtn");
	    }
	});
	
	
	
	
	

</script>
</body>
</html>