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
  <div class="row-2">
    <ul class="list-unstyled list-group list-group-horizontal justify-content-end">
      <li class="ms-4 mb-3"><a class="text-decoration-none text-black-50" href="join.jsp">랭킹</a></li>
      <li class="ms-4 mb-3"><a class="text-decoration-none text-black-50" href="join.jsp">이벤트</a></li>
      <li class="ms-4 mb-3 me-5"><a class="text-decoration-none text-black-50" href="join.jsp">리뷰</a></li>
      <li><select class="form-select justify-content-start">
        <option selected>지역별로 보기</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="부산">부산</option>
      </select></li>
    </ul>
  </div>
</header>
</html>