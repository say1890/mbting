<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>🍓Mbting - 채팅리스트🍓</title>
<!-- font -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">

<!-- css -->
<link href="/static/css/main.css" rel="stylesheet">
<link href="/static/css/chattingList.css" rel="stylesheet">
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div class="section mt-5">
		<div class="container row">

			<c:forEach var="chat" items="${chatDetail}">
				<button class="col-11 btn ml-2" data-room-num ="${chat.chat.id}">
				<div class="p-1 d-flex">
					
						<div id="roomNum">${chat.chat.id}</div> 
						<c:forEach var="user" items="${chat.user}">
							
							<!--  사용자가 남자일때 -->
							<c:if test="${userName ne user.user.userName and sex ne '여'}">
								<div class="col-2">
									<c:if test="${empty user.user.profile}">
										<i class="bi bi-person-circle myprofile-icon womanProfile"></i>
										
									</c:if>
										
									<c:if test="${not empty user.user.profile}">
										<img src="${user.user.profile}" class="rounded-circle img-responsive womanProfile" id="smallProfile">
										
									</c:if>
									
									<!-- 사용자 프로필 전달용-->
									<div class ="d-none">
									<c:if test = "${empty profile}">
										<i class="bi bi-person-circle myprofile-icon manProfile"></i>
									</c:if>
									
									<c:if test = "${not empty profile}">
										<img src="${profile}" class="rounded-circle img-responsive manProfile" id="smallProfile">
									</c:if>
									
									</div>

								</div>
													
								<div class = "col-6 my-auto">
									<h3 id = "womanName">${user.user.userName}</h3>
									<h3 id = "manName" class="d-none">${userName}</h3>
								</div>
							</c:if>
							
							<!-- 사용자가 여자일 때 -->
							<c:if test="${userName ne user.user.userName and sex ne '남'}">
								<div class="col-2">
									<c:if test="${empty user.user.profile}">
										<i class="bi bi-person-circle myprofile-icon manProfile"></i>
									</c:if>
										
									<c:if test="${not empty user.user.profile}">
										<img src="${user.user.profile}" class="rounded-circle img-responsive manProfile" id="smallProfile">
										
									</c:if>
									
									<!-- 사용자 프로필 전달용-->
									<div class ="d-none">
									<c:if test = "${empty profile}">
										<i class="bi bi-person-circle myprofile-icon womanProfile"></i>
									</c:if>
									
									<c:if test = "${not empty profile}">
										<img src="${profile}" class="rounded-circle img-responsive womanProfile" id="smallProfile">
									</c:if>
									
									</div>

								</div>
													
								<div class = "col-6 my-auto">
									<h3 id = "manName">${user.user.userName}</h3>
									<h3 id = "womanName" class="d-none">${userName}</h3>
								</div>
							</c:if>
							
							
							
							
							
							
							
							
						</c:forEach>
				</div>
				</button>

			</c:forEach>

		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$(".btn").on("click",function(){
		let roomNum = $(this).data("room-num");
		let manName = $("#manName").text();
		let womanName = $("#womanName").text();
		let manProfile = $(".manProfile").attr("src");
		let womanProfile = $(".womanProfile").attr("src");
		

		
		alert(roomNum);
		
		$.ajax({
			type:"post",
			url:"/addChatData",
			data:{
			"roomNum":roomNum,
			"manName":manName,
			"womanName":womanName,
			"manProfile":manProfile,
			"womanProfile":womanProfile
			},
			success:function(data) {
				location.href= "/chat?roomNum="+ roomNum;
				},
			error:function() {
				alert("에러발생");
			}
		});
	});

});

</script>

</html>