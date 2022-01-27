<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<!-- js -->
<script type="module" src ="/static/js/test.js"></script>
<script type="module" src ="/static/js/rotatingText.js"></script>

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
	
       <h3><p>가 당신을 기다려요 :)</p></h3>
      </div>
 
    <!-- Description -->
    
		<section class = "mt-5">
		  
		 	<div class="input-group">
				<input type = "text" placeholder="ID를 입력하세요." class = "input-text form-control" id= "inputId">
				<div id="nameCheckInfo" class="text-info d-none mt-2 ml-2"></div>
			</div>
		 
			

			<input type = "password" id = "password" placeholder = "비밀번호 입력" class ="input-text form-control mt-3" >
			<input type = "password" id ="passwordCheck" placeholder = "비밀번호 확인"  class = "input-text form-control mt-3">
				<small id = "checkPwInput" class= "d-none">비밀번호가 틀립니다.</small>
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
	
	function validateEmail(email) {
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test(email);
		}
	
	 var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	 
	 //중복 확인
	 var isDuplication = false;
	 var isCheckDuplication = false;
	
	 $("#inputId").focusout(function(){
		var loginId = $("#inputId").val();
		
		
		$.ajax({
			url: "/checkId",
			type:"get",
			data:{"loginId":loginId},
			success:function(data){
				$("#nameCheckInfo").removeClass("d-none");
				if(data.is_duplication) {
					$("#nameCheckInfo").text("중복되었습니다.");
					isDuplication = true;
				} else {
					$("#nameCheckInfo").text("사용가능합니다.");
					isDuplication = false;
				}
				isCheckDuplication = true;
			}, error:function(e){
				alert("error" + e);
			}
			
		});
			
	 });
	 
	 
	 
	 
	$("#joinBtn").on("click",function(){
		
		var loginId = $("#inputId").val();
		var password =$("#password").val();
		var email = $("#email").val();
		
		
		if(loginId == null || loginId == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		
		if(password == null || password == "") {
			alert("비밀번호를 입력하세요. ");
			return;
		}
		
		if(email== null || email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		 if(regEmail.test(email)){
			
			 } else{     
			 alert("이메일이 유효하지 않습니다.");
			 }
		 
		 if(!isCheckDuplication) {
				alert("이름 중복 검사를 해주세요.");
				return ;
			}
			
			
			if(isDuplication) {
				alert("이름이 중복되었습니다.");
				return;
			}
		 
		$.ajax({
			type:"post",
			url:"/sign_up",
			data:{"loginId":loginId, 
				"password":password,
				"email":email
				},
			success:function(data){
				alert(data.result);
				//location.href = ""
			}, error:function(e){
				alert("error" + e);
			}
			
		});
	})
	
})

</script>

</body>

</html>