<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 현재 내가 열고 있는 파일 명 표시해주기 위해 getServletPath() 사용
  String fileName = request.getServletPath(); // <- /sBoardDetail.jsp
  fileName = fileName.substring(1); // 슬래쉬(/) 제거

  String sBoardTitle = "";

  switch (fileName) {
    case "sBoardList.jsp":
      sBoardTitle = "게시판 목록 페이지1";
      break;

    case "sBoardDetail.jsp":
      sBoardTitle = "상세 글 확인 페이지";
      break;

    case "sBoardWrite.jsp":
      sBoardTitle = "글 등록 페이지";
      break;

    case "sBoardUpdate.jsp":
      sBoardTitle = "글 수정 페이지";
      break;

    case "sBoardDelete.jsp":
      sBoardTitle = "글 삭제 페이지";
      break;
  }
%>
<!DOCTYPE html>
<html>
<header class="container mt-3 bg-light">
  <div class="container">
    <ul class="list-unstyled list-group list-group-horizontal justify-content-end">
      <li class="me-4 mt-4"><a class="text-decoration-none text-black-50" href="join.jsp">로그인</a></li>
      <li class="me-4 mt-4"><a class="text-decoration-none text-black-50" href="join.jsp">회원가입</a></li>
      <li class="me-3 mt-4"><a class="text-decoration-none text-black-50" href="join.jsp">마이페이지</a></li>
    </ul>
  </div>
  <div class="">
    <img src = "images/main2.png" class ="img-fluid mx-auto d-block" width="1200" height="300"/>
  </div>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="sBoardList.jsp">메인
              <span class="visually-hidden">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="join2.jsp">랭킹</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">이벤트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">리뷰</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">지역별</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">서울</a>
              <a class="dropdown-item" href="#">경기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">부산</a>
              <a class="dropdown-item" href="#">창원</a>
            </div>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-sm-2" type="text" placeholder="Search">
          <button class="btn btn-secondary my-2 my-sm-0 text-nowrap" type="submit">검색</button>
        </form>
      </div>
    </div>
  </nav>
</header>

</html>