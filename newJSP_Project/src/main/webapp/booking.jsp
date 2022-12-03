<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <%--  달력 제작 필요한 제이쿼리 링크 --%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script>
    function input(){
      let date1 = document.querySelector("#book-date").value;

    }
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

<form action="booking_process.jsp" method="post" id="frm">
  <label for="customerNickname">숙소명:</label>
  <%--  <input type="text" name="customerNickname" id="customerNickname"  value="<%=customerNickname%>">--%>
  <h2>1박 금액 : <%=stayCost%></h2>
  <p>최종 결제 금액 (V.A.T 포함) : <%=stayCost * 1.1%>원</p>
  <p>예약일자 지정: <input type="date" id="book-date" name="bookDate"></p>
  <button class="btn btn-primary" type="submit">예약완료</button>
</form>
<h2 class="text-center">예약</h2>

<hr>
<div class="container mt-5 mx-auto">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <div>
        <fieldset>
          <label class="form-label" for="customerNickname">숙소명</label>
          <input class="form-control" type="text" id="customerNickname" value="<%=customerNickname%>" placeholder="숙소명" readonly>
        </fieldset>
      </div>
      <div class="form-group">
        <fieldset>
          <label class="form-label mt-4" for="readOnlyInput">Readonly input</label>
          <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
        </fieldset>
      </div>
      <div class="form-group has-success">
        <label class="form-label mt-4" for="inputValid">Valid input</label>
        <input type="text" value="correct value" class="form-control is-valid" id="inputValid">
        <div class="valid-feedback">Success! You've done it.</div>
      </div>
      <div class="form-group has-danger">
        <label class="form-label mt-4" for="inputInvalid">Invalid input</label>
        <input type="text" value="wrong value" class="form-control is-invalid" id="inputInvalid">
        <div class="invalid-feedback">Sorry, that username's taken. Try another?</div>
      </div>
      <div class="form-group">
        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">Large input</label>
        <input class="form-control form-control-lg" type="text" placeholder=".form-control-lg" id="inputLarge">
      </div>
      <div class="form-group">
        <label class="col-form-label mt-4" for="inputDefault">Default input</label>
        <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
      </div>
      <div class="form-group">
        <label class="col-form-label col-form-label-sm mt-4" for="inputSmall">Small input</label>
        <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" id="inputSmall">
      </div>
      <div class="form-group">
        <label class="form-label mt-4">Input addons</label>
        <div class="form-group">
          <div class="input-group mb-3">
            <span class="input-group-text">$</span>
            <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
            <span class="input-group-text">.00</span>
          </div>
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
            <button class="btn btn-primary" type="button" id="button-addon2">Button</button>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="form-label mt-4">Floating labels</label>
        <div class="form-floating mb-3">
          <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
          <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
          <label for="floatingPassword">Password</label>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
