<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>
  <title>🍓Mbting - 채팅🍓</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
  <link rel="stylesheet" type="text/css" href="static/css/chat.css">
</head>

<body>
  <div class="container-fluid">

    <div class="row">

      <div class="col-sm-12">
	  <div id = "roomNum" class ="d-none">${chat.id}</div>



        <div id="user_chat_data" class="user_chat_data">
          <div class="profile_name">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <c:choose>
            	<c:when test = "${sex eq '남'}">
            		<c:if test="${not empty chat.womanProfile}">
            			<img src="${chat.womanProfile}" class="mr-3 rounded-circle img-responsive" id="smallProfile"> &nbsp;&nbsp;
            		</c:if>
            		<c:if test ="${empty chat.womanProfile}">
            			<i class="bi bi-person-circle myprofile-icon"></i>
            		</c:if>
            		
            	</c:when>
            </c:choose>
            <img src="./img/profile.png" class="mr-3 rounded-circle"> &nbsp;&nbsp;
            <c:choose>
            <c:when test = "${sex eq '남'}">
            	<span id="username">${chat.womanName}</span>
            </c:when>
            <c:otherwise>
            	<span id="username">${chat.manName}</span>
            </c:otherwise>
            	 
            </c:choose>
           
          </div>

          <div class="container-fluid chat_section" id="chat-box">

          </div>

          <div class="type_msg">
            <div class="input_msg_write">
              <input id="chat-outgoing-msg" type="text" class="write_msg" placeholder="Type a message" />
              <button id="chat-outgoing-button" class="msg_send_btn" type="button"><i class="fa fa-paper-plane"
                  aria-hidden="true"></i></button>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>


  </div>

  </div>
<script type="module" src="static/js/chat.js"></script>

  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
    crossorigin="anonymous"></script>
</body>


</html>