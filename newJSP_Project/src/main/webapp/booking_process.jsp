<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="sDbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#btn-back').on('click', function () {
        location.href="sBoardList.jsp";
      });
    });
  </script>

</head>
<body>
<%@ include file="header.jsp"%>
<%
  request.setCharacterEncoding("utf-8");

  String bookDate = request.getParameter("bookDate");
  String customerNickname = request.getParameter("customerNickname");
  int stayCost = Integer.parseInt(request.getParameter("stayCost"));
%>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;

  String query = "INSERT INTO book (book_email, book_nickname, book_stay_name, book_cost, book_go_date, book_date) ";
  query += "VALUES (?, ?, ?, ?, ?, now()) ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, customerEmailSession);
    pstmt.setString(2, customerNicknameSession);
    pstmt.setString(3, customerNickname);
    pstmt.setInt(4, stayCost);
    pstmt.setString(5, bookDate);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  } finally {
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
%>

<br>
<br>
<br>
<h2 class="text-center">예약이 완료되었습니다!</h2>
<br><br>

<div class="text-center">
  <button type="button" class="my-3 btn btn-primary mt-4" id="btn-back" style="width: 200px; height: 50px">메인으로</button>
</div>
<br>
<br>
<br>
<br>
<br>
<%@ include file="footer.jsp"%>
</body>
</html>
