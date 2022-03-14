<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>🍓Mbting - 채팅리스트🍓</title>
<!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- css -->
 	<link href="/static/css/main.css" rel="stylesheet">
<!-- 부트스트랩 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
 	
</head>
<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
<div class="section mt-5">
	<div class="container row" >
		
			<c:forEach var="chat" items="${chatDetail}">
				
				<div class ="col-12 p-4">
				<a href ="/chat" id="link">
					<div id = "roomNum">${chat.chat.id}</div>
					<c:forEach var="user" items="${chat.user}">
						<c:if test = "${userName ne user.user.userName}">
							<h3>${user.user.userName} </h3>
						</c:if>
					</c:forEach>
					</a>
					<hr>
				</div>
					
			</c:forEach>
		
	</div>
</div>	
</body>
<script>
$(document).ready(function(){
	$("#link").on("click",function(){
		let roomNum = $("#roomNum").html();
		alert(roomNum);
		export {roomNum}
	});

});

</script>

</html>