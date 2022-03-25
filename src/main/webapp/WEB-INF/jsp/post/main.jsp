<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>



<title>🍓Mbting🍓</title>
</head>


<body>

	<c:if test ="${firstconnection eq 'yes' and userId ne 1} ">
		<c:redirect url="/user/mypage_edit_view"/>
		<!-- <c:remove var = "firstconnection" scope="page"/> -->
	</c:if>

	<c:import url ="/WEB-INF/jsp/include/header.jsp" />




<div class="section">
<!-- 이성 추천 -->

<c:import url ="/WEB-INF/jsp/post/recommend.jsp" />


</div>
<c:import url ="/WEB-INF/jsp/post/question.jsp" />
<c:import url ="/WEB-INF/jsp/post/mbti.jsp" />








<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

<script>
$(document).ready(function(){
	
	$("#commentBtn").on("click",function(){
		let comment = $("#commentInput").val();
		let postId = $(this).data("post-id");
		$.ajax({
			type:"get",
			url:"/comment/addComment",
			data:{
			"comment":comment,
			"postId":postId
			},
			success:function(data) {
				if(data.result == "success") {
					location.reload();
				} else {
					alert("댓글 달기 실패");
				}
				
			},
			error:function() {
				alert("에러발생");
			}
		});
		
	});
	
	$(".deleteCommentBtn").on("click", function(e){
		
		e.preventDefault();
		let CommentId = $(this).data("comment-id");
		$.ajax({
			type:"get",
			url:"/comment/deleteComment", 
			data:{"CommentId":CommentId},
			success:function(data) {
				if(data.result=="success") {
					alert("삭제 성공");
					location.reload();
				} else {
					alert("삭제 실패");
				}
			},
			error:function() {
				alert("에러발생");
			}
			
		}); // ajax end
	});
	
	
});

</script>


</body>
</html>