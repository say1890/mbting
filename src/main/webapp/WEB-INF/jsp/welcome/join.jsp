<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap -->
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!-- css -->
		<link href="/static/css/join.css" rel="stylesheet">


<title>회원가입</title>
</head>
<body>

	<div class ="container">
		<header>
			<div class="text">
			 
			  <p>
			    <span class="word wisteria">INFP</span>
			    <span class="word belize">ESTJ</span>
			    <span class="word pomegranate">ENTP</span>
			    <span class="word green">ISTJ</span>
			    <span class="word midnight">ESFJ</span>
			  </p>
			  <h3><p>가 당신을 기다려요 :)</p></h3>
			</div>
		</header>
		<section class = "mt-5">
		  <div class="search col-8 d-flex align-items-center justify-content-center">
		 	<div class="input-group">
				<label>아이디:</label>
				<input type = "text" placeholder="ID를 입력하세요." class = "input-text form-control">
				<div class="input-group-append">
					<button type ="button" id= "checkDuplicate" class ="btn">중복 확인</button>
				</div>
			</div>
		</div>
			
			<br>
			<label class="mt-3">비밀번호: </label><input type = "password" id = "password" placeholder = "비밀번호를 입력하세요." class ="input-text form-control" >
			 <br>
			 <label class="mt-3">비밀번호 확인 : </label>
			  <input type = "password" id ="passwordCheck" placeholder = "비밀번호를 입력하세요."  class = "input-text form-control">
				<small id = "checkPwInput" class= "d-none">비밀번호가 틀립니다.</small>
			 <br>
			 <label class="mt-3">이메일 :</label> 
			  <input type="email" id="email" size="30" required  class = "input-text form-control">
		</section>
	</div>

</body>
<script>
$(document).ready(function() {
	
	
	  $("#password").on("input", function() {
          var pw = $(this).val();
          var checkPw =$("#passwordCheck").val();
          if(pw==checkPw) {
              $("#checkPwInput").removeClass("d-none");
          } else {
              $("#checkPwInput").addClass("d-none");
          }
      });
	  
	  var words = document.getElementsByClassName('word');
	  var wordArray = [];
	  var currentWord = 0;

	  words[currentWord].style.opacity = 1;
	  for (var i = 0; i < words.length; i++) {
	    splitLetters(words[i]);
	  }

	  function changeWord() {
	    var cw = wordArray[currentWord];
	    var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
	    for (var i = 0; i < cw.length; i++) {
	      animateLetterOut(cw, i);
	    }
	    
	    for (var i = 0; i < nw.length; i++) {
	      nw[i].className = 'letter behind';
	      nw[0].parentElement.style.opacity = 1;
	      animateLetterIn(nw, i);
	    }
	    
	    currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
	  }

	  function animateLetterOut(cw, i) {
	    setTimeout(function() {
	  		cw[i].className = 'letter out';
	    }, i*80);
	  }

	  function animateLetterIn(nw, i) {
	    setTimeout(function() {
	  		nw[i].className = 'letter in';
	    }, 340+(i*80));
	  }

	  function splitLetters(word) {
	    var content = word.innerHTML;
	    word.innerHTML = '';
	    var letters = [];
	    for (var i = 0; i < content.length; i++) {
	      var letter = document.createElement('span');
	      letter.className = 'letter';
	      letter.innerHTML = content.charAt(i);
	      word.appendChild(letter);
	      letters.push(letter);
	    }
	    
	    wordArray.push(letters);
	  }

	  changeWord();
	  setInterval(changeWord, 4000);


	
});

</script>


</html>