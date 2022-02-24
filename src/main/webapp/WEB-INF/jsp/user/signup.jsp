<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css link -->

<link href="/static/css/test.css" rel="stylesheet"/>

<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>




</head>
<body>
<!-- Canvas -->
<canvas class="orb-canvas"></canvas>
<!-- Overlay -->
<div class="overlay">
  <!-- Overlay inner wrapper -->
  <div class="overlay__inner">
    <!-- Title -->
    
      <div class="overlay__title">
      		<p>
			    <span class="word wisteria">INFP</span>
			    <span class="word belize">ESTJ</span>
			    <span class="word pomegranate ">ENTP</span>
			    <span class="word green">ISTJ</span>
			    <span class="word midnight">ESFJ</span>
			  </p>
	
       <h3 class ="mt-4"><p>가 당신을 기다려요 :)</p></h3>
      </div>
 
    <!-- Description -->
    
		<section class = "mt-5">
		  
		 	<div class="input-group">
				<input type = "text" placeholder="ID를 입력하세요." class = "input-text form-control" id= "inputId">
				<div id="nameCheckInfo" class="text-info d-none mt-2 ml-2"></div>
			</div>
		 
			

			<input type = "password" id = "password" placeholder = "비밀번호 입력" class ="input-text form-control mt-3" >
				<small id = "pwInput" class= "d-none">ㅎㅎ</small>
			<input type = "password" id ="passwordCheck" placeholder = "비밀번호 확인"  class = "input-text form-control mt-3">
			
			<input type = "text" id ="userName" placeholder = "별명" class = "input-text form-control mt-3">
			
			<input type ="date" id="birthday" class = "form-control mt-3" name ="bday"
			data-bs-toggle="tooltip" data-placement="right" title="생년월일"
			 min = "1980-01-01" max="2003-01-01">
			
			
			<label><input type ="radio" name = "sex" value ="남" >남</label>
			<label><input type = "radio" name ="sex" value ="여" >여</label>
			<select class="form-control" name ="mbti">
				<option value="none">당신의 MBTI는?</option>
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
			<input type="email" id="email" size="30" required  placeholder = "이메일을 입력하세요." class = "input-text form-control mt-3">
			
			
		</section>
    <!-- Buttons -->
    <div class="overlay__btns">

      <button class="overlay__btn overlay__btn--colors mt-3" id = "joinBtn">
        <span>회원가입</span>
        <span class="overlay__btn-emoji ">🎨</span>
      </button>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){

	 //비밀번호 체크
	 var pwCheck = false;
	 
	 //id 중복 확인
	 var isDuplication = false;
	 var checkId = false;
	 
	 $('[data-bs-toggle="tooltip"]').tooltip();


	 
	 
	 $("#password").on("propertychange change keyup paste input",(function(){
		 var password = $("#password").val();
		 var passwordCheck = $("#passwordCheck").val();
		
		 $("#pwInput").removeClass("d-none");

		 if(password.length<=6){
			 $("#pwInput").text("비밀번호는 7자 이상이 돼야 합니다.");
		 }
		 if(password.length>=7 && password == passwordCheck){
			 $("#pwInput").addClass("d-none");
		 }
		 if(password.length>=7 && password != passwordCheck){
			 $("#pwInput").text("비밀번호가 같지 않습니다.");
		 }
		 if(password.length>=7 && (passwordCheck == null || passwordCheck == "" )){
			 $("#pwInput").text("비밀번호를 확인해주세요.");
		 }
		 if(password.length>=7 &&password!=passwordCheck) {
			 $("#pwInput").text("비밀번호가 같지 않습니다.");
         }

		
	 }));
	 
	 
	 $("#passwordCheck").on("propertychange change keyup paste input",function(){
		 var password = $("#password").val();
		 var passwordCheck = $("#passwordCheck").val();
		 if(password.length>=7 &&password==passwordCheck) {
			 $("#pwInput").text("비밀번호가 같습니다.");
			 pwCheck = true;
         }
		 if(password.length>=7 &&password!=passwordCheck){
			 $("#pwInput").text("비밀번호가 틀립니다");
			 pwCheck = false;
         }
	 });

	
	
	function validateEmail(email) {
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test(email);
		}
	
	 var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	 

	
	 $("#inputId").focusout(function(){ 
		$("#nameCheckInfo").removeClass("d-none");
		var loginId = $("#inputId").val();
		
		if(loginId.length<=4){
			$("#nameCheckInfo").text("ID는 5자 이상으로 입력해주세요.");
			return;
		}
		if(loginId.length>=5){
			$("#nameCheckInfo").addClass("d-none");
		}
		
		
		
		
		$.ajax({
			url: "/user/checkId",
			type:"post",
			data:{"loginId":loginId},
			success:function(data){
				alert(data.result);
				if(data.result) {
					$("#nameCheckInfo").removeClass("d-none");
					$("#nameCheckInfo").text("중복되었습니다.");	
					isDuplication = true;
					
				} else {
					$("#nameCheckInfo").removeClass("d-none");
					 $("#nameCheckInfo").text("사용 가능합니다.");
					isDuplication = false;
					checkId = true;
					
				}
				
			}, error:function(e){
				alert("error" + e);
			}
			
		});
			
	 });
	 
	 
	 
	 
	$("#joinBtn").on("click",function(){
		
		var loginId = $("#inputId").val();
		var password =$("#password").val();
		var userName =$("#userName").val();
		var sex = $('input[name=sex]:radio:checked').val();
		var mbti = $('select[name=mbti]').val();
		var email = $("#email").val();
		var birthday =$("#birthday").val();
		alert(birthday);
		alert(typeof birthday);
		if(!loginId) {
			alert("아이디를 입력하세요.");
			return;
		}
		if(!password) {
			alert("비밀번호를 입력하세요. ");
			return;
		}
		
		if(!birthday){
			alert("생년월일을 입력해주세요.");
			return;
		}
		
		if(!checkId){
			alert("id를 확인해주세요. ");
			return;
		}
		
		if(typeof sex == undefined){
			alert("성별을 선택하세요. ");
		}
		
		
		
		if(mbti == "none"){
			alert("mbti를 선택해주세요.");
			return;
		}
		
		if(!email) {
			alert("이메일을 입력하세요.");
			return;
		}
		
		 if(regEmail.test(email)){
			
			 } else{     
			 alert("이메일이 유효하지 않습니다.");
			 }
			
			
		 	if(isDuplication) {
				alert("아이디가 중복되었습니다.");
				return;
			}
			if(pwCheck == false){
				alert("비밀번호를 다시 확인해주세요.");
			}
		 
		$.ajax({
			type:"post",
			url:"/user/signup",
			data:{"loginId":loginId, 
				"password":password,
				"userName":userName,
				"birthday":birthday,
				"sex":sex,
				"mbti":mbti,
				"email":email
				},
			success:function(data){
				alert(data.result);
				location.href = "/user/signin_view"
			}, error:function(e){
				alert("error" + e);
			}
			
		});
	})
	
});

</script>
<!-- js -->
<script type="module" src ="/static/js/test.js"></script>
<script type="module" src ="/static/js/rotatingText.js"></script>
</body>

</html>