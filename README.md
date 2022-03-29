 ![header](https://capsule-render.vercel.app/api?type=waving&color=timeGradient&height=300&section=header&text=Dev.%20최주향&animation=fadeIn&fontSize=90)


# mbting
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)  
![Eclipse](https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

## 🎨 MBTING 

### 🖼 프로젝트 설명
 * 소개팅 어플에 MBTI라는 성격 유형 검사를 접목한 프로젝트
 * 로그인 기반의 SNS 기능 
 
 ### 👩‍🏫 포트폴리오 
 
 [포트폴리오](portfolio.pdf) 
 
 ### 🛠 설계 🛠
  * UI 기획  
    https://ovenapp.io/project/rCTfNumClNAbDwremGYBe2sWkB4z63AE#smugO  
    
  * 데이터 베이스, URL 설계  
https://docs.google.com/spreadsheets/d/15WWveTZaCIsB7vpDN0bKxUib1w3DehJRtV-59e1Dwx0/edit#gid=0 
 
 ### ⛏ 주요 기능 ⛏
 
 -- USER 패키지 --
 
 * 회원가입
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/signup.jsp)
  
   
 * 로그인
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/signin.jsp)

 * ID / PW 찾기
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/findInfo.jsp)


 * 마이 페이지
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/myPage.jsp)


 * 정보 수정
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/editProfile.jsp)
 
 * 프로필 보기
   * package : [com.juhyang.mbting.user.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/user)
   * view : [/webapp/WEB-INF/jsp/user/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/user/seeProfile.jsp)

  -- CHAT 패키지 --

 * 채팅하기
   * package : [com.juhyang.mbting.chat.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/chat)
   * view : [/webapp/WEB-INF/jsp/chat/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/chat/chat.jsp)

  -- POST 패키지 --


 * 댓글 달기
   * package : [com.juhyang.mbting.comment.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/comment)
   * view : [/webapp/WEB-INF/jsp/post/*](https://github.com/say1890/mbting/blob/master/src/main/webapp/WEB-INF/jsp/post/question.jsp)


-- like 패키지 -- 

 * 보낸 좋아요 보기, 받은 좋아요 보기, 좋아요 
   * package : [com.juhyang.mbting.like.*](https://github.com/say1890/mbting/tree/master/src/main/java/com/juhyang/mbting/like)
   * view : [/webapp/WEB-INF/jsp/post/*](https://github.com/say1890/mbting/tree/master/src/main/webapp/WEB-INF/jsp/like)

###  ✨ DEMO ✨

 💎 회원 가입 및 로그인 
 ![user](demogif/user.gif)

 💎 이미지 첨부한 글 쓰기
 ![user](demogif/post.gif)
 
  💎 댓글쓰기
 ![user](demogif/comment.gif)
 
  💎 좋아요
 ![user](demogif/like.gif)
 
### ✏ 외부 라이브러리 라이센스 ✏ 

* Tomcat [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) 
* Mysql [GPLv2 or proprietary](https://www.gnu.org/licenses/gpl-3.0.html)
* Spring framework [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)  
* Mybatis [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
* Bootstrap [MIT License](https://opensource.org/licenses/MIT)
* jQuery [MIT License](https://opensource.org/licenses/MIT)
* 이미지 출처 : [pixabay](https://pixabay.com/ko/)

### 🤔 향후 계획
 * favicon 추가
 * 관리자 페이지 -  사용자 계정 일시 정지 ,영구 정지 기능 추가
 * 오늘의 질문 모아 보기 추가
 * 차단 기능 추가
 * 관리자에게 메시지 보내는 기능 추가
 * 하트 추가 ( 주화 같은 개념 )
 * 추천 알고리즘 수정



###   📂 폴더 구조
📦main
 ┣ 📂java
 ┃ ┗ 📂com
 ┃ ┃ ┗ 📂juhyang
 ┃ ┃ ┃ ┗ 📂mbting
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AdminBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜AdminRestController.java
 ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatDAO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatDetail.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatOriginal.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Chat.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRepository.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatRestController.java
 ┃ ┃ ┃ ┃ ┣ 📂comment
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CommentBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CommentDAO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Server_Comment.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜User_Comment.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CommentController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜CommentRestController.java
 ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┣ 📜EncryptUtils.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FileManagerService.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜PermissionInterceptor.java
 ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┣ 📜DatabaseConfig.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜WebMVCConfig.java
 ┃ ┃ ┃ ┃ ┣ 📂like
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LikeBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LikeDAO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Like.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜LikeController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜LikeRestController.java
 ┃ ┃ ┃ ┃ ┣ 📂post
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PostBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PostDAO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Post.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PostForMyPage.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜PostController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜PostRestController.java
 ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bo
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserBO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserDAO.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜User.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCharacter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserDetail.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserRestController.java
 ┃ ┃ ┃ ┃ ┗ 📜MbtingApplication.java
 ┣ 📂resources
 ┃ ┣ 📂mappers
 ┃ ┃ ┣ 📜ChatMapper.xml
 ┃ ┃ ┣ 📜CommentMapper.xml
 ┃ ┃ ┣ 📜LikeMapper.xml
 ┃ ┃ ┣ 📜PostMapper.xml
 ┃ ┃ ┗ 📜UserMapper.xml
 ┃ ┣ 📂static
 ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┣ 📜btn.css
 ┃ ┃ ┃ ┣ 📜chat.css
 ┃ ┃ ┃ ┣ 📜chattingList.css
 ┃ ┃ ┃ ┣ 📜findInfo.css
 ┃ ┃ ┃ ┣ 📜heart.css
 ┃ ┃ ┃ ┣ 📜join.css
 ┃ ┃ ┃ ┣ 📜main.css
 ┃ ┃ ┃ ┣ 📜question.css
 ┃ ┃ ┃ ┣ 📜smallImg.css
 ┃ ┃ ┃ ┣ 📜style.css
 ┃ ┃ ┃ ┣ 📜swiper.css
 ┃ ┃ ┃ ┣ 📜test.css
 ┃ ┃ ┃ ┣ 📜typing.css
 ┃ ┃ ┃ ┗ 📜welcome.css
 ┃ ┃ ┣ 📂image
 ┃ ┃ ┃ ┗ 📜noprofile.png
 ┃ ┃ ┗ 📂js
 ┃ ┃ ┃ ┣ 📜chat.js
 ┃ ┃ ┃ ┣ 📜header.js
 ┃ ┃ ┃ ┣ 📜rotatingText.js
 ┃ ┃ ┃ ┣ 📜swiper.js
 ┃ ┃ ┃ ┗ 📜test.js
 ┃ ┣ 📂templates
 ┃ ┣ 📜application.yml
 ┃ ┗ 📜logback-spring.xml
 ┗ 📂webapp
 ┃ ┗ 📂WEB-INF
 ┃ ┃ ┗ 📂jsp
 ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┣ 📜addPost.jsp
 ┃ ┃ ┃ ┃ ┣ 📜PostDetail.jsp
 ┃ ┃ ┃ ┃ ┗ 📜question.jsp
 ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┣ 📜chat.jsp
 ┃ ┃ ┃ ┃ ┗ 📜ChattingList.jsp
 ┃ ┃ ┃ ┣ 📂include
 ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┗ 📜header.jsp
 ┃ ┃ ┃ ┣ 📂like
 ┃ ┃ ┃ ┃ ┣ 📜likedList.jsp
 ┃ ┃ ┃ ┃ ┣ 📜likeList.jsp
 ┃ ┃ ┃ ┃ ┗ 📜seeLike.jsp
 ┃ ┃ ┃ ┣ 📂post
 ┃ ┃ ┃ ┃ ┣ 📜main.jsp
 ┃ ┃ ┃ ┃ ┣ 📜mbti.jsp
 ┃ ┃ ┃ ┃ ┣ 📜question.jsp
 ┃ ┃ ┃ ┃ ┗ 📜recommend.jsp
 ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┣ 📜editProfile.jsp
 ┃ ┃ ┃ ┃ ┣ 📜findInfo.jsp
 ┃ ┃ ┃ ┃ ┣ 📜myPage.jsp
 ┃ ┃ ┃ ┃ ┣ 📜seeProfile.jsp
 ┃ ┃ ┃ ┃ ┣ 📜signin.jsp
 ┃ ┃ ┃ ┃ ┗ 📜signup.jsp




![hyamming's GitHub stats](https://github-readme-stats.vercel.app/api?username=say1890&show_icons=true&theme=radical)
