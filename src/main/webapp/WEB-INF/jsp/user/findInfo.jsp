<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>ID 찾기</title>
</head>

<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<!-- css -->
 <link href="/static/css/findInfo.css" rel="stylesheet">
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">


<body>
<div id = "wrap" class = "row justify-content-center">
<input type = text class = "form-control col-6" placeholder = "이메일을 입력하세요."  id ="emailInput" >
<button type ="button" class = "btn btn-primary" id ="submitBtn">입력</button>
</div>








<script>
$(document).ready(function(){
	
	$("#submitBtn").on("click",function(e){
		e.preventDefault();
		var email = $("#emailInput").val();
		alert(email);
		
		$.ajax({
			type:"get",
			url:"/user/findPw",
			data:{"email":email},
			success:function(data) {
				if(data== "success") {
					location.href="/user/signin_view";
				} else {
					alert("아이디/비밀번호를 확인하세요");
				}
				
			},
			error:function() {
				alert("에러발생");
			}
		});   // ajax end
		
	});	 // submitBtn end
	
});
</script>

</body>

</html>