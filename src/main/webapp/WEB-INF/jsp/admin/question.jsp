<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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


<meta charset="UTF-8">
<title>관리자-addPost</title>

</head>
<body>
  <c:import url="/WEB-INF/jsp/include/header.jsp" />

  <div class="slider mt-5">
    <div class="container slidercontent">
      <div id="wrap">

        <section class="d-flex justify-content-center">
          <div class="w-100 ">
            <h1>오늘의 질문</h1>
            <table class="table">
              <thead>
                <tr>
                  <th>NO.</th>
                  <th>제목</th>
                  <th>시간</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="post" items="${postList}">

                  <tr>
                    <td>${post.id}</td>
                    <td><a href="/admin/detail_view?postId=${post.id}">${post.subject}</a></td>
                    <td><fmt:formatDate value="${post.createdAt}"
                        pattern="yyyy년 MM월 dd일 h시 mm분" /></td>
                  </tr>

                </c:forEach>
              </tbody>
            </table>

            <div class="d-flex justify-content-end p-5">
              <a href="/admin/add_post_view" class="btn btn-info">글쓰기</a>
            </div>


          </div>
        </section>

      </div>

    </div>
  </div>


  <c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>