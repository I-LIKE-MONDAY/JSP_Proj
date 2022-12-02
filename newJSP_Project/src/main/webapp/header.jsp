<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String customerEmailSession = (String)session.getAttribute("customer_email");
  String customerNicknameSession = (String)session.getAttribute("customer_nickname");
  String customerComYn = (String)session.getAttribute("com_yn");
%>
<!DOCTYPE html>
<html>
<script>
  $(document).ready(function () {
    $('#my-page').on('click', function () {
      let myPageSession = '<%=customerEmailSession%>';
      if (myPageSession == null) {
        alert('로그인 후 마이페이지 이용 가능');
      }
    });
  });
</script>

<header class="bg-light">
  <div class="container">
    <ul class="list-unstyled list-group list-group-horizontal justify-content-end">
      <%
        String userEmail = null;
        if (customerEmailSession != null) {
          userEmail = customerEmailSession;
        }
      %>
      <%
        if(userEmail == null){
      %>
      <li class="me-4 mt-4"><a class="text-decoration-none text-black-50" href="login.jsp" id="login-str">로그인</a></li>
      <li class="me-4 mt-4"><a class="text-decoration-none text-black-50" href="join.jsp">회원가입</a></li>
      <%
      } else {
      %>
      <li class="me-3 mt-4"><a class="text-decoration-none text-black-50" href="logout.jsp">로그아웃</a></li>
      <li class="me-4 mt-4"><a class="text-decoration-none text-black-50" href="join.jsp">회원가입</a></li>
      <%
        }
      %>
      <li class="me-3 mt-4"><a class="text-decoration-none text-black-50" id = "my-page" href="myPage.jsp">마이페이지</a></li>
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
              <a class="dropdown-item" onclick="">서울</a>
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