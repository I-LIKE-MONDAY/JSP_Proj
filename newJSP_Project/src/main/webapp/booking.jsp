<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    function getFormatDate(date){
      var year = date.getFullYear();              //yyyy
      var month = (1 + date.getMonth());          //M
      month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
      var day = date.getDate();                   //d
      day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
      return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
    }

    $(document).ready(function () {
      $('#btn-end').on('click', function () {
        const frm = $('#frm');
        let today = new Date();
        let offerdate = document.getElementById("book-date").value;
        let minDate = getFormatDate(today);

        if ($('#book-date').val() == '') {
          alert('날짜를 선택해주세요');
        }
        else if(offerdate < minDate) {
          alert('오늘 날짜 이전 날짜는 선택하실 수 없습니다.');
        }
        else {
          frm.submit();
        }
      });

      $('#btn-back').on('click', function () {
        history.back();
      });
    });
  </script>
</head>
<body>
<%@ include file="sDbconn.jsp"%>
<%@ include file="header.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  String boardIdx = request.getParameter("boardIdx");
  String customerNickname = request.getParameter("customerNickname");
  int stayCost = 0;
  String stayOption = "";
  String stayContents = request.getParameter("stayContents");
  int hitCnt = 0;
  String boardCreateDt = "";

%>

<%
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;

  try {
    conn = DriverManager.getConnection(url, uid, upw);

    String sql = "SELECT board_idx, customer_nickname, stay_contents, stay_cost, stay_option, board_create_dt, hit_cnt FROM board WHERE board_idx = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, boardIdx);
    rs = pstmt.executeQuery();

    if (rs.next()) {
      boardIdx = rs.getString("board_idx");
      customerNickname = rs.getString("customer_nickname");
      stayContents = rs.getString("stay_contents");
      stayCost = rs.getInt("stay_cost");
      stayOption = rs.getString("stay_option");
      boardCreateDt = rs.getString("board_create_dt");
      hitCnt = rs.getInt("hit_cnt");

    }
  }
  catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (rs != null) {
      rs.close();
    }
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
%>





<h2 class="text-center">예약</h2>
<hr>
<form action="booking_process.jsp" method="post" id="frm">
<div class="container mt-5 mx-auto">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <div>
        <fieldset>
          <label class="form-label" for="customerNickname">숙소명</label>
          <input class="form-control" type="text" id="customerNickname" name="customerNickname" value="<%=customerNickname%>" placeholder="숙소명" readonly>
        </fieldset>
      </div>
      <div class="form-group">
        <label class="col-form-label mt-4" for="book-date">예약 날짜 선택</label>
        <input type="date" class="form-control" id="book-date" name="bookDate" placeholder="Default input" id="inputDefault">
      </div>
      <div class="form-group">
        <label class="col-form-label mt-3" for="book-date">예약자 닉네임</label>
        <input type="text" class="form-control" placeholder="예약자 닉네임" value="<%=customerNicknameSession%>" readonly>
      </div>
      <div class="form-group">
        <label class="col-form-label mt-3" for="book-cost">결제 금액(V.A.T 포함)</label>
        <input type="text" class="form-control" id="book-cost" name="stayCost" placeholder="결제 예정 금액" value="<%=Math.round(stayCost * 1.1)%>" readonly>
      </div>
      <div class="d-grid">
        <button type="button" class="form-floating my-3 btn btn-primary mt-4" id="btn-end">예약완료</button>
      </div>
      <div class="d-grid">
        <button type="button" class="form-floating my-3 btn btn-light" id="btn-back">돌아가기</button>
      </div>
    </div>
  </div>
  <br>
  <br>
  <br>
</div>
</form>
</body>
</html>
