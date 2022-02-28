<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글 쓰기</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<body>
<div id  ="wrap">
			<c:import url ="/WEB-INF/jsp/include/header.jsp" />
			<section class ="d-flex justify-content-center">
				<div class ="w-75 my-5">
					<h1 class ="text-center">질문 입력</h1>
					<div class ="d-flex mt-5">
						<label class ="mr-2 mt-2">제목:</label>
						<input type ="text" class ="form-control col-11" placeholder = "제목 입력" id ="titleInput">
					</div>
					
					<div class ="d-flex mt-5">
					<label class ="mr-2 mt-2">날짜:</label>	
					<input type ="date" class ="form-control col-11" id ="dateInput">
					</div>
					
					
					
						<textarea class ="form-control mt-5" rows ="5" id="contentInput"></textarea>
						<input type ="file" id ="fileInput">
						<div class ="d-flex justify-content-between mt-5">
							<a href = "/admin/question_view" class ="btn btn-info">목록으로</a>
							<button type ="button" class ="btn btn-success" id ="saveBtn">저장하기</button>
						</div>
				</div>
			</section>
			
		
		</div>
		
		<script>
		$(document).ready(function(){
			$("#saveBtn").on("click",function(){
				var title  = $("#titleInput").val().trim();
				var content  = $("#contentInput").val();
				var date = $("#dateInput").val();
				
				if(!title){
					alert("제목을 입력하세요.");
					return;
				}
				if(!content){
					alert("내용을 입력하세요");
					return;
				}
				
				if(!date){
					alert("날짜를 입력하세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("subject",title);
				formData.append("content",content);
				formData.append("date",date);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type :"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", //  파일 업로드 필수
					processData:false,
					contentType:false,
					success:function(data){
						if(data.result == "success"){
							alert("성공");
							location.href = "/admin/question_view";
						}
						else{
							alert("글쓰기 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
				
			});
			
		});
		</script>

</body>
</html>