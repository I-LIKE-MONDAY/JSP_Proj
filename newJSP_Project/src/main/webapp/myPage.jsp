<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <%@ include file="header.jsp"%>
  <title>마이페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    $(document).ready(function () {
      $('#book-list').on('click', function () {
        const frm = $('#frm')
          frm.submit();
      });
      $('#rv-list').on('click', function () {
        history.back();
      });
      $('#edit-my-info').on('click', function () {
        history.back();
      });
    });
  </script>


  <%
    String a1 = null;
    if (customerEmailSession == null) {
      response.sendRedirect("login.jsp");

    }
    else {
      a1 = customerEmailSession + "님의 마이페이지";
    }
  %>
</head>
<body>

<br>
<%--<h2 class="text-center"><%=a1%></h2>--%>
<%--<h2 class="text-center"><%=customerEmailSession%></h2>--%>
<h2 class="text-center"><%=customerNicknameSession%> 님의 마이페이지</h2>
<br><br>
<div class="container">
  <div class="row-cols-2">
    <div class="col mx-auto">
      <ul class="list-group">
        <button type="button" class="list-group-item d-flex justify-content-between align-items-center" id="book-list" name="bookList">
          예약 내역 확인
          <span class="badge bg-primary rounded-pill">14</span>
        </button>
        <button type="button" class="list-group-item d-flex justify-content-between align-items-center" id="rv-list" name="rvList">
          작성한 리뷰 확인
          <span class="badge bg-primary rounded-pill">2</span>
        </button>
        <button type="button" class="list-group-item d-flex justify-content-between align-items-center" id="edit-my-info" name="editMyInfo">
          내 정보 수정
          <span class="badge bg-primary rounded-pill">1</span>
        </button>
      </ul>
    </div>
  </div>
</div>
<br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>
