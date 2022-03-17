<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/static/css/main.css" />
<link rel="stylesheet" href="/static/css/smallImg.css" />
<meta charset="UTF-8">
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
	<div class="mt-5">

		<h1 class="hero">보낸 좋아요</h1>
		<c:forEach var="user" items="${likedList}">
			<div class="d-flex">
				<div class="col-3">
					<!--  추천 상대 프로필 이미지 -->
					<c:choose>
						<c:when test="${not empty user.user.profile}">
							<a href="/user/see_profile?userId=${user.user.id}"> <img
								id="smallProfile"
								class="mt-3  mx-auto mt-4 rounded-circle img-responsive"
								src="${user.user.profile}">
							</a>
						</c:when>
						<c:otherwise>
							<a href="/user/see_profile?userId=${user.user.id}"> <img
								id="smallProfile"
								class="mt-3  mx-auto mt-4  rounded-circle img-responsive"
								src="/static/image/noprofile.png">
							</a>
						</c:otherwise>

					</c:choose>
					<!--  추천 상대 프로필 이미지 끝 -->




					<h4 id="recommended-profile-name" class="mt-1 text-white">${user.user.userName}(${user.user.ageForProfile})</h4>
					<div class="text-white mt-1 text-center introduceText">${user.user.mbti}</div>



				</div>
				<div class="text-white mx-auto my-auto col-9">
					<c:if test="${not empty user.user.introduce}">
						<h3>❝${user.user.introduce}❞</h3>
					</c:if>
				</div>



			</div>
			<hr class="mt-5">

		</c:forEach>
		<c:if test = "${empty likedList}">
			<div>
			<p class ="text-white mt-5 mb-5 p-5">.　　　　　　　　　　 ✦ 　　　　   　 　　　˚　　　　　　　　　　　　　　*　　　　　　   　　　　　　　　　　　　　　　.　　　　　　　　　　　　　　. 　　 　　　　　　　 ✦ 　　　　　　　　　　 　 ‍ ‍ ‍ ‍ 　　　　 　　　　　　　　　　　　,　　   　

.　　　　　　　　　　　　　.　　　ﾟ　  　　　.　　　　　　　　　　　　　.

　　　　　　,　　　　　　　.　　　　　　    　　　　 　　　　　　　　　　　　　　　　　　 ☀️ 　　　　　　　　　　　　　　    　      　　　　　        　　　　*　　　　　　　　　. 　　　　　　　　　　.　　　　　　　　　　　　　. 　　　　　　　　　　　　　　　　       　   　　　　 　　　　　　　　　　　　　　　　       　   　　　　　　　　　　　　　　　　       　    ✦ 　   　　　,　　　　　　　　　*　　    🚀 　　　　 　　,　　　 ‍ ‍ ‍ ‍ 　 　　　　　　　　　　　　.　　　　　 　　 　　　.　　　　　　　　　　　　　 　           　　　　　　　　　　　　　　　　　　　˚　　　 　   　　　　,　　　　　　　　　　　       　    　　　　　　　　　　　　　　　　.　　　  　　    　　　　　 　　　　　.　　　　　　　　　　　　　.　　　　　　　　　　　　　　　* 　　   　　　　　 ✦ 　　　　　　　         　        　　　　 　　 　　　　　　　 　　　　　.　　　　　　　　　　　　　　　　　　.　　　　　    　　. 　 　　　　　.　　　　 🌕 　　　　　   　　　　　.　　　　　　　　　　　.　　　　　　　　　　   　

　˚　　　　　　　　　　　　　　　　　　　　　ﾟ　　　　　.　　　　　　　　　　　　　　　. 　　 　 🌎 ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ,　 　　　　　　　　　　　　　　* .　　　　　 　　　　　　　　　　　　　　.　　　　　　　　　　 ✦ 　　　　   　 　　　˚　　　　　　　　　　　　　　*　　　　　　   　　　　　　　　　　　　　　　.　　　　　　　　　　　　　　.
			</p>
			<a href = "/post/main">
				<button type= "button" class ="btn">좋아요 누르러 가기❤️</button>
			</a>
			</div>
		</c:if>
		
	</div>

	<script type="module" src="/static/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>


</script>


</body>
</html>